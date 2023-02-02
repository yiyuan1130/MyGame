local PlayerActor, base = Class("PlayerActor", BaseActor)
function PlayerActor:OnCreate(id, data, actorType)
    base.OnCreate(self, id, data)
    self.position = Vector3(0, 0, 0)
    self.angle = 0
    self.speed = 2
    self.actorType = actorType
    self.isController = data.isController
    self.gameObject = ResourcesManager.Load("player", ResourceConst.ResType.Actor)
    self.gameObject.name = "Actor" .. self.id

    EventManager.AddListener(EventId.GetInputMove, self, self.OnGetInpuMove)

    self:AddComponents()
end

function PlayerActor:AddComponents()
    self.moveCom = self:AddComponent(ActorMoveComponent)
    self:AddComponent(ActorRockerMoveComponent)
    self:AddComponent(ActorSkillComponent)
end

function PlayerActor:OnGetInpuMove(vector2)
    -- print("PlayerActor:OnGetInpuMove ==> ", vector2.x, vector2.y)
    local moveDir = Vector3(vector2.x, 0, vector2.y).normalized
    self.position = self.position + moveDir * self.speed * Time.deltaTime
    self.angle = MathUtil.VectorToAngle(moveDir)
end

function PlayerActor:Update(deltaTime)
    base.Update(self, deltaTime)
end

function PlayerActor:GetPosition()
    return self.moveCom.position
end
function PlayerActor:GetAngle()
    return self.moveCom.angle
end

function PlayerActor:Close()
    base.Close(self)
    ResourcesManager.Catch(self.gameObject, ResourceConst.ResType.Actor)
end