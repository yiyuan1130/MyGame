local InstanceIdManager = ClassStatic("InstanceIdManager")
InstanceIdManager.IDType = {
    Actor = 0, -- [00000001,10000000)
    Skill = 1, -- [10000001,20000000)
    Modifier = 2,  -- [20000001,30000000)
    Effect = 3, -- [30000001,40000000)
}
local this = InstanceIdManager
function InstanceIdManager.Init()
    this.instanceIdMap = {}
end

function InstanceIdManager.GetIdByType(type)
    if not this.instanceIdMap[type] then
        this.instanceIdMap[type] = 0
    end
    this.instanceIdMap[type] = this.instanceIdMap[type] + 1
    if this.instanceIdMap[type] > 10000000 then
        this.instanceIdMap[type] = 1
    end
    return this.instanceIdMap[type] + type * 10000000
end

function InstanceIdManager.Close()
    this.instanceIdMap = nil
end