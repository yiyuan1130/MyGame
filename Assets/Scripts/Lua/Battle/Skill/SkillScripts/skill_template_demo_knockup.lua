local skill_template_demo_knockup = {
    SkillBehaviour = "",
    Name = "skill_template_demo_knockup",
    Duration = 0.1,
    Timer = {
        {
            Time = 0.05,
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
                    ModifierName = "add_knock_up"
                },
            },
        },
    },
    Modifiers = {
        add_knock_up = {
            OnCreated = {
                KnockUp = {},
            },
        },
    },
}

return skill_template_demo_knockup