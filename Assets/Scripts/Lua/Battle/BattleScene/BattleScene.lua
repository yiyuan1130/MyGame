local BattleScene = Class("BattleScene")
local this = BattleScene
function BattleScene.OnLoad()
    local playerData = {
        skill_script = "circle_aoe_skill",
    }
    local actor = ActorManager.CreateActor(playerData, ActorConst.ActorType.Player)
    local skillCom = actor:GetComponent(ActorSkillComponent)
    for skillId, skill in pairs(skillCom.skillDic) do
        skillCom:CastSkill(skillId)
        break
    end
end

function BattleScene.Update(deltaTime)
    
end