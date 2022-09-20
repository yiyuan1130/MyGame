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
    local skill1 = SkillManager.CreateSkill("skill_template_notarget", SkillConst.SkillType.Skill1, {})
    self.skillDic[skill1.id] = skill1
    self.skill1 = skill1

    local skill2 = SkillManager.CreateSkill("skill_template_notarget", SkillConst.SkillType.Skill2, {})
    self.skillDic[skill2.id] = skill2
    self.skill2 = skill2

    local skill3 = SkillManager.CreateSkill("skill_template_notarget", SkillConst.SkillType.Skill3, {})
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
    print("ActorSkillComponent:CastSkill ==> ", skillType)
    local skill = nil
    if skillType == SkillConst.SkillType.Skill1 then
        skill = self.skill1
    elseif skillType == SkillConst.SkillType.Skill1 then
        skill = self.skill2
    elseif skillType == SkillConst.SkillType.Skill1 then
        skill = self.skill3
    end
    if skill then
        skill:Cast()
    end
end

function ActorSkillComponent:Close()
    self.skillDic = nil
end