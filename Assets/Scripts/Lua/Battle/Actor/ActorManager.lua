local ActorManager = ClassStatic("ActorManager")
local this = ActorManager
function ActorManager.Init()
    this.controllerPlayer = nil
    this.actorDic = {}
    this.delList = {}
    this.AddEvent()
end

function ActorManager.AddEvent()
    EventManager.AddListener(EventId.GetInputMove, this, this.OnGetInpuMove)
    EventManager.AddListener(EventId.GetCastSkill, this, this.OnGetCastSkill)
end

function ActorManager.RemoveEvent()
    EventManager.RemoveListener(EventId.GetInputMove, this, this.OnGetInpuMove)
    EventManager.RemoveListener(EventId.GetCastSkill, this, this.OnGetCastSkill)
end

function ActorManager.OnGetInpuMove(this, rockerVec)
    local rockerMoveCom = this.controllerPlayer:GetComponent(ActorRockerMoveComponent)
    rockerMoveCom:AddMove(rockerVec)
end
function ActorManager.OnGetCastSkill(this, skillType)
    local skillComponent = this.controllerPlayer:GetComponent(ActorSkillComponent)
    skillComponent:CastSkill(skillType)
end

function ActorManager.CreateActor(playerData, actorType)
    local actor
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Actor)
    if actorType == ActorConst.ActorType.Player then
        actor = PlayerActor.New(id, playerData, actorType)
        if playerData.isController then
            this.controllerPlayer = actor
        end
    elseif actorType == ActorConst.ActorType.Stake then
        actor = StakeActor.New(id, playerData, actorType)
    end
    this.actorDic[id] = actor
    return actor
end

function ActorManager.RemoveActor(id)
    local actor = this.actorDic[id]
    if actor then
        table.insert(this.delList, id)
        actor.Close()
    end
end

function ActorManager.Update(deltaTime)
    if #this.delList > 0 then
        for i = #this.delList, 1, -1 do
            local delId = this.delList[i]
            if this.actorDic[delId] then
                table.remove(this.actorDic, delId)
            end
        end
    end

    for k, v in pairs(this.actorDic) do
        local actor = v
        actor:Update(deltaTime)
    end
end

function ActorManager.GetActors()
    return this.actorDic
end

function ActorManager.Close()
    this.actorDic = nil
end
