local ActorSkillComponent, base = Class("ActorSkillComponent", BaseComponent)
ActorSkillComponent.Name = "ActorSkillComponent"

function ActorSkillComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.skillDic = {}
    self.skill1 = nil
    self.skill2 = nil
    self.skill3 = nil
    self:CreateSkills()
end

function ActorSkillComponent:CreateSkills()
    local skill1 = SkillManager.CreateSkill("skill_template_demo_knockback", SkillConst.SkillType.Skill1, {caster = self.actor})
    self.skillDic[skill1.id] = skill1
    self.skill1 = skill1

    local skill2 = SkillManager.CreateSkill("skill_template_demo_knockup", SkillConst.SkillType.Skill2, {caster = self.actor})
    self.skillDic[skill2.id] = skill2
    self.skill2 = skill2

    local skill3 = SkillManager.CreateSkill("skill_template_demo_knockback", SkillConst.SkillType.Skill3, {caster = self.actor})
    self.skillDic[skill3.id] = skill3
    self.skill3 = skill3
end

function ActorSkillComponent:GetSkill1()
    return self.skill1
end

function ActorSkillComponent:GetSkill2()
    return self.skill2
end

function ActorSkillComponent:GetSkill3()
    return self.skill3
end

function ActorSkillComponent:CastSkill(skillType)
    local skill = nil
    if skillType == SkillConst.SkillType.Skill1 then
        skill = self:GetSkill1()
    elseif skillType == SkillConst.SkillType.Skill2 then
        skill = self:GetSkill2()
    elseif skillType == SkillConst.SkillType.Skill3 then
        skill = self:GetSkill3()
    end
    if skill then
        skill:Cast()
    end
end

function ActorSkillComponent:Close()
    self.skillDic = nil
end