local ModifierManager = ClassStatic("ModifierManager")
local this = ModifierManager
function ModifierManager.Init()
    this.modifierDic = {}
    this.delList = {}
end

function ModifierManager.CreateModifier(data)
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Modifier)
    local modifier = Modifier.New(id, data)
    this.modifierDic[id] = modifier
end

function ModifierManager.RemoveModifier(id)
    local modifier = this.modifierDic[id]
    if modifier then
        table.insert(this.delList, id)
        modifier:Close()
    end
end

function ModifierManager.Update(deltaTime)
    if #this.delList > 0 then
        for i = #this.delList, 1, -1 do
            local id = this.delList[i]
            this.modifierDic[id] = nil
            table.remove(this.delList, i)
        end
    end

    for id, modifier in pairs(this.modifierDic) do
        modifier:Update(deltaTime)
    end
end

function ModifierManager.Close()
    this.modifierDic = nil
    this.delList = nil
end