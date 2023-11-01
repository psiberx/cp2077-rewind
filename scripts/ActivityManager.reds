module NightCityRewind

public class ActivityManager extends ScriptableSystem {
    private let m_openWorldSystem: wref<OpenWorldSystem>;
    private let m_delaySystem: wref<DelaySystem>;

    private let m_pendingRequestTick: DelayID;

    private func OnAttach() {
        this.m_openWorldSystem = GameInstance.GetOpenWorldSystem();
        this.m_delaySystem = GameInstance.GetDelaySystem(this.GetGameInstance());
    }

    private func OnDetach() {
        this.m_delaySystem.CancelCallback(this.m_pendingRequestTick);
    }

    public func StartActivity(name: CName) {
        let result = this.m_openWorldSystem.StartActivity(name);

        switch (result) {
            case OpenWorldActivityResult.OK:
                ModLog(n"NightCityRewind", "Activity started");
                break;
            case OpenWorldActivityResult.NotFound:
                ModLog(n"NightCityRewind", "Activity not found");
                break;
            case OpenWorldActivityResult.NotFinished:
                ModLog(n"NightCityRewind", "Cannot restart activity because it's not finished yet");
                break;
            case OpenWorldActivityResult.StillSpawned:
                ModLog(n"NightCityRewind", "Cannot restart activity while near it, move at least 100m away");
                break;
        }
    }

    public func StartActivities(request: ref<ActivityRequest>) {
        let n = this.m_openWorldSystem.StartActivities(
            new OpenWorldActivityRequest(
                request.GetType(),
                request.GetDistricts(),
                request.GetCooldown()
            )
        );

        if n == 1 {
            ModLog(n"NightCityRewind", "Started 1 activity");
        } else if n > 1 {
            ModLog(n"NightCityRewind", s"Started \(n) activities");
        } else {
            ModLog(n"NightCityRewind", "No matching or available activities");
        }
    }

    public func QueueRequest() -> ref<ActivityRequest> {
        let request = ActivityRequest.Create();
        let callback = NextTickRequestCallback.Create(this, request);

        this.m_pendingRequestTick = this.m_delaySystem.DelayCallback(callback, 1.0 / 30.0, false);

        return request;
    }

    public static func GetInstance(game: GameInstance) -> ref<ActivityManager> {
        return GameInstance.GetScriptableSystemsContainer(game)
            .Get(n"NightCityRewind.ActivityManager") as ActivityManager;
    }
}

class NextTickRequestCallback extends DelayCallback {
    private let m_manager: wref<ActivityManager>;
    private let m_request: ref<ActivityRequest>;

    public func Call() {
        if IsDefined(this.m_manager) {
            this.m_manager.StartActivities(this.m_request);
        }
    }

    public static func Create(manager: ref<ActivityManager>, request: ref<ActivityRequest>) -> ref<NextTickRequestCallback> {
        let self = new NextTickRequestCallback();
        self.m_manager = manager;
        self.m_request = request;

        return self;
    }
}
