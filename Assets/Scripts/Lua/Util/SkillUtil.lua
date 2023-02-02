local SkillUtil = ClassStatic("SkillUtil")

function SkillUtil.DoActions(instance, actions)
    if not actions then
        return
    end
    for actionName, actionData in pairs(actions) do
        local funName = "Action" .. actionName
        print(funName)
        local func = instance[funName]
        if func then
            func(instance, actionData)
        end
    end
end

function SkillUtil.GetTargetsByRange(range, caster)
    local ret = {}
    local rangeType = range.RangeType
    if rangeType == SkillConst.AOERangeType.Circle then
        local actorDic = ActorManager.GetActors()
        for id, actor in pairs(actorDic) do
            if actor.id ~= caster and actor:GetActorType() == range.ActorType then
                table.insert(ret, actor)
            end
        end
    end
    return ret
end

function SkillUtil.GetActionTargets(caster, data)
    local targetList = {}
    if data.Target == SkillConst.TargetType.Caster then
        table.insert(targetList, caster)
    elseif data.Target == SkillConst.TargetType.AOE then
        targetList = SkillUtil.GetTargetsByRange(data.Range, caster)
    end
    return targetList
end