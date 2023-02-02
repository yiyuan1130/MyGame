local skill_template1 = {
    SkillBehaviour = "",
    Name = "skill_template1",
    Duration = 5,
    Timer = {
        {
            Time = 1,
            Actions = {
                CreateEffect = {
                    EffectName = "skill_effect_test",
                    Position = {0, 0, 0},
                },
                ApplyModifier = {
                    Target = "AOE",
                    Rang = {
                        RangeType = "Circle",
                        Radius = 5,
                    },
                    ActorType = "Stake",
                    ModifierName = "add_knock_back"
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
        add_knock_back = {
            OnEventCreated = {
                {
                    KnockBack = {},
                },
            },
        },
    },
}

return skill_template1