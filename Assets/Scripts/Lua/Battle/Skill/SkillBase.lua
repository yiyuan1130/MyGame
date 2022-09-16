local SkillBase = Class("SkillBase")
function SkillBase:OnCreate(id, skillScript, data)
    self.id = id
    self.skillScript = skillScript
    self.data = data
end

function SkillBase:ToCast()
    
end

function SkillBase:Update(deltaTime)
    
end