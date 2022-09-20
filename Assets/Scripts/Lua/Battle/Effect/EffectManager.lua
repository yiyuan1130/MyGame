local EffectManager = ClassStatic("EffectManager")
local this = EffectManager
function EffectManager.Init()
    this.effectDic = {}
    this.delList = {}
end

function EffectManager.CreateEffect(data)
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Effect)
    local effect = Effect.New(id, data)
    this.effectDic[id] = effect
    return effect
end

function EffectManager.RemoveEffect(effectId)
    local effect = this.effectDic[effectId]
    if effect then
        table.insert(this.delList, effectId)
        effect:Close()
    end
end

function EffectManager.Update(deltaTime)
    for i = #this.delList, 1, -1 do
        local id = this.delList[i]
        this.effectDic[id] = nil
        table.remove(this.delList, i)
    end
    for id, effect in pairs(this.effectDic) do
        effect:Update(deltaTime)
    end
end

function EffectManager.Close()
end