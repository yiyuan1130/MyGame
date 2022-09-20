local SkillManager = ClassStatic("SkillManager")
local this = SkillManager
function SkillManager.Init()
    this.scriptDic = {}
    this.skillDic = {}
    this.delList = {}
end

function SkillManager.CreateSkill(skillScript, skillType, data)
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Skill)
    local skillTemplate
    if not this.scriptDic[skillScript] then
        local scriptPath = string.format("Battle/Skill/SkillScripts/%s", skillScript)
        skillTemplate = require(scriptPath)
        this.scriptDic[skillScript] = skillTemplate
    else
        skillTemplate = this.scriptDic[skillScript]
    end
    data.template = skillTemplate
    local skill = Skill.New(id, data, skillType)
    this.skillDic[id] = skill
    return skill
end

function SkillManager.RemoveSkill(id)
    local skill = this.skillDic[id]
    if skill then
        table.insert(this.delList, id)
        skill.Close()
    end
end

function SkillManager.Update(deltaTime)
    if #this.delList > 0 then
        for i = #this.delList, 1, -1 do
            local id = this.delList[i]
            table.remove(this.delList, i)
            this.skillDic[id] = nil
        end
    end
    for id, skill in pairs(this.skillDic) do
        skill:Update(deltaTime)
    end
end

function SkillManager.Close()
    this.skillDic = nil
    this.scriptDic = nil
    this.delList = nil
end