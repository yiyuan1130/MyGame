local Skill = Class("Skill", SkillBase)
function Skill:OnCreate(...)
    self.name = ...
    print("Skill OnCreate ==> ", ...)
end

function Skill:Close()
end
