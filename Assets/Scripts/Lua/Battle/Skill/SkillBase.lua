local SkillBase = Class("SkillBase")
function SkillBase:OnCreate(...)
    print("SkillBase OnCreate ==> ", ...)
end

function SkillBase:ToCast()
    print("skill.cast", self.name)
end