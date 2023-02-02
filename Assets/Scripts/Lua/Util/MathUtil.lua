local MathUtil = ClassStatic("MathUtil")
local this = MathUtil

function MathUtil.VectorToAngle(vector3)
    local angle = Mathf.Atan2(vector3.z, vector3.x) * Mathf.Rad2Deg
    if angle < 0 then
        angle = angle + 360
    end
    angle = 90 - angle
    if angle < 0 then
        angle = angle + 360
    end
    return angle
end

function MathUtil.AngleOfTwoVector(vector1, vector2)
    local dir = vector2 - vector1
    return MathUtil.VectorToAngle(dir)
end

function MathUtil.AngleToVector(angle)
    local deg = Mathf.Rad2Deg * angle
    local x = Mathf.Sin(deg)
    local z = Mathf.Cos(deg)
    return Vector3(x, 0, z)
end