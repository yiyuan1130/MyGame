-- 按下按钮直接释放
--[[
    desc:
    在角色正前方直接释放 矩形伤害
]]
local skill_template_notarget = {
    SkillBehaviour = "NoTarget",
    Name = "skill_template_notarget",
    Duration = 5,
    Timer = {
        -- {
        --     Time = 1,
        --     Actions = {
        --         AttachEffect = {
        --             EffectName = "skill_effect_test",
        --             Position = {0, 0, 0},
        --         },
        --     },
        -- },
        {
            Time = 3,
            Actions = {
                ApplyModifier = {
                    Target = "Caster",
                    ModifierName = "create_effect_buff",
                },
            },
        },
    },
    Modifiers = {
        create_effect_buff = {
            Duration = 2,
            OnCreated = {
                AttachEffect = {
                    Duration = 0.5,
                    EffectName = "skill_effect_test",
                    Position = {0, 0, 0},
                },
            },
            Timer = {
                {
                    Time = 1,
                    Actions = {
                        AttachEffect = {
                            Duration = 0.5,
                            EffectName = "skill_effect_test",
                            Position = {0, 0, 5},
                        },
                    },
                },
            },
        },
    },
}

return skill_template_notarget