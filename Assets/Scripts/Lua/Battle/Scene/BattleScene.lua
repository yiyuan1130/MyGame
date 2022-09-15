local BattleScene = Class("BattleScene")
local this = BattleScene
function BattleScene.OnLoad()
    local playerData = {}
    ActorManager.CreateActor(playerData, ActorConst.ActorType.Player)

end

function BattleScene.Update(deltaTime)
    
end