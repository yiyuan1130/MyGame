local skill_template_demo_knockback = {
    SkillBehaviour = "",
    Name = "skill_template_demo_knockback",
    Duration = 5,
    Timer = {
        {
            Time = 0.2,
            Actions = {
                -- CreateEffect = {
                --     EffectName = "skill_effect_test",
                --     Position = {0, 0, 0},
                -- },
                ApplyModifier = {
                    Target = "AOE",
                    Range = {
                        RangeType = "Circle",
                        Radius = 5,
                    },
                    ActorType = "Stake",
                    ModifierName = "add_knock_back"
                },
            },
        },
    },
    Modifiers = {
        add_knock_back = {
            OnCreated = {
                KnockBack = {},
            },
        },
    },
}

return skill_template_demo_knockback