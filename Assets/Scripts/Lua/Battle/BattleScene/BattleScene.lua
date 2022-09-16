local BattleScene = Class("BattleScene")
local this = BattleScene
function BattleScene.OnLoad()
    local playerData = {
        skill_script = "circle_aoe_skill",
    }
    ActorManager.CreateActor(playerData, ActorConst.ActorType.Player)

end

function BattleScene.Update(deltaTime)
    
end