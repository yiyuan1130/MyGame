local SkillConst = Const("SkillConst")
SkillConst.SkillBehaviour = { -- 技能类型
    NoTarget = "NoTarget", -- 按下技能按钮直接释放
    UnitTarget = "UnitTarget", -- 选中一个目标施放
}
SkillConst.TargetType = { -- 技能筛选Target类型
    Caster = "Caster", -- 施法者
    Target = "Target", -- 目标
    AOE = "AOE", -- 范围
}

SkillConst.SkillEvents = {}

SkillConst.SkillType = { -- 技能分类
    Attack = "Attack",
    Skill1 = "Skill1",
    Skill2 = "Skill2",
    Skill3 = "Skill3",
}

SkillConst.AOERangeType = {
    Circle = "Circle",
}