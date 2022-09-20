-- 按下按钮直接释放
--[[
    desc:
    在角色正前方直接释放 矩形伤害
]]
local skill_template_notarget = {
    SkillBehaviour = "",
    Name = "skill_template_notarget",
    Duration = 5,
    Timer = {
        {
            Time = 1,
            Actions = {
                CreateEffect = {
                    EffectName = "skill_effect_test",
                    Position = {0, 0, 0},
                },
            },
        },
        {
            Time = 4,
            Actions = {
                CreateEffect = {
                    EffectName = "skill_effect_test",
                    Position = {5, 5, 5},
                },
            },
        },
    },
    Modifier = {
        create_effect_buff = {

        },
    },
}

return skill_template_notarget