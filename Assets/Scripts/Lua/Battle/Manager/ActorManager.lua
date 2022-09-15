local ActorManager = ClassStatic("ActorManager")
local this = ActorManager
function ActorManager.Init()
    this.actorDic = {}
    this.delList = {}
end

function ActorManager.CreateActor(playerData, actorType)
    local actor
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Actor)
    if actorType == ActorConst.ActorType.Player then
        actor = ActorPlayer.New(id, playerData)
    end
    this.actorDic[id] = actor
    return actor
end

function ActorManager.RemoveActor(id)
    table.insert(this.delList, id)
end

function ActorManager.Update(deltaTime)
    for i = #this.delList, 1, -1 do
        local delId = this.delList[i]
        if this.actorDic[delId] then
            table.remove(this.actorDic, delId)
        end
    end

    for k, v in pairs(this.actorDic) do
        local actor = v
        actor:Update(deltaTime)
    end
end

function ActorManager.Close()
    this.actorDic = nil
end
