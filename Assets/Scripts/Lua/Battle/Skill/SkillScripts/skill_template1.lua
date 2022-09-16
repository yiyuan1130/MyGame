local skill_template1 = {
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
}

return skill_template1