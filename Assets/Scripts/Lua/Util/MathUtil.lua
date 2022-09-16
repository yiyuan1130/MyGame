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