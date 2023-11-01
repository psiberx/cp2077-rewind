module NightCityRewind

public class ActivityRequest {
    private let m_type: CName;
    private let m_districts: array<gamedataDistrict>;
    private let m_cooldown: Float;

    public func GetType() -> CName {
        return this.m_type;
    }

    public func GetDistricts() -> array<gamedataDistrict> {
        return this.m_districts;
    }

    public func GetCooldown() -> Float {
        return this.m_cooldown;
    }

    public func OfType(type: CName) -> wref<ActivityRequest> {
        this.m_type = type;
        return this;
    }

    public func InDistrict(district: gamedataDistrict) -> wref<ActivityRequest> {
        ArrayPush(this.m_districts, district);
        return this;
    }

    public func CooledDownFor(seconds: Float) -> wref<ActivityRequest> {
        this.m_cooldown = seconds;
        return this;
    }

    public static func Create() -> ref<ActivityRequest> {
        return new ActivityRequest();
    }
}
