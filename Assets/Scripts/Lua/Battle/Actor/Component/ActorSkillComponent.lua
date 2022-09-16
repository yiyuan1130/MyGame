local ActorSkillComponent, base = Class("ActorSkillComponent", BaseComponent)
ActorSkillComponent.Name = "ActorSkillComponent"

function ActorSkillComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.skillDic = {}
    local skill = SkillManager.CreateSkill("skill_template1", {})
    self.skillDic[skill.id] = skill
end

function ActorSkillComponent:CastSkill(skillId)
    local skill = self.skillDic[skillId]
    if skill then
        skill:Cast()
    end
end

function ActorSkillComponent:Close()
    self.skillDic = nil
end