local BattleCommondManager = ClassStatic("BattleCommondManager")
local this = BattleCommondManager
function BattleCommondManager.Init()
    print("BattleCommondManager init")
end

function BattleCommondManager.AddBattleRendererCommond_ActorCreate(data)
    local commondType = BattleCommondType.ActorCreate
    local data = data
    CSBattleRendererManager.AddBattleCommond(commondType, data)
end

function BattleCommondManager.AddBattleRendererCommond_ActorMove(targetPos, targetAngle)
    
end