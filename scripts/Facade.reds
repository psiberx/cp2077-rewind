import NightCityRewind.*

public abstract class NightCityRewind {
    public static func Version() -> String = "0.5.0"

    public static func Activate(game: GameInstance, name: CName) {
        ActivityManager.GetInstance(game).StartActivity(name);
    }

    public static func ActivateAll(game: GameInstance) -> wref<ActivityRequest> {
        return ActivityManager.GetInstance(game).QueueRequest();
    }
}
