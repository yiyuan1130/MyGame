local SkillManager = ClassStatic("SkillManager")
local this = SkillManager
function SkillManager.Init()
    this.scriptDict = {}
    this.skillDict = {}
    this.delList = {}
end

function SkillManager.CreateSkill(skillScript, data)
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Skill)
    local scriptPath = string.format("Battle/Skill/SkillScripts/%s", skillScript)
    if not this.scriptDict[skillScript] then
        local skillScript = require(scriptPath)
        this.scriptDict[skillScript] = skillScript
    end
    local skill = Skill.New(id, skillScript, data)
    this.skillDict[id] = skill
end

function SkillManager.RemoveSkill(id)
    table.insert(this.delList, id)
end

function SkillManager.Update(delteTime)
    for i = #this.delList, 1, -1 do
        local id = this.delList[i]
        table.remove(this.delList, i)
        this.skillDict[id] = nil
    end
    for id, skill in pairs(this.skillDict) do
        skill:Update(delteTime)
    end
end

function SkillManager.Close()
    this.skillDict = nil
    this.scriptDict = nil
    this.delList = nil
end