local SkillUtil = ClassStatic("SkillUtil")

function SkillUtil.DoActions(instance, actions)
    if not actions then
        return
    end
    for actionName, actionData in pairs(actions) do
        local funName = "Action" .. actionName
        local func = instance[funName]
        if func then
            func(instance, actionData)
        end
    end
end

function SkillUtil.GetActionTargets(caster, target)
    local targetList = {}
    if target == SkillConst.TargetType.Caster then
        table.insert(targetList, caster)
    end
    return targetList
end