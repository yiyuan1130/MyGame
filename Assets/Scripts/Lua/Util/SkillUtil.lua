local SkillUtil = ClassStatic("SkillUtil")

function SkillUtil.DoActions(instance, actions)
    for actionName, actionData in pairs(actions) do
        local funName = "Action" .. actionName
        local func = instance[funName]
        if func then
            func(instance, actionData)
        end
    end
end