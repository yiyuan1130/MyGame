local StakeActor, base = Class("StakeActor", BaseActor)
function StakeActor:OnCreate(id, data, playerType)
    base.OnCreate(self, id, data)
    self.position = Vector3(0, 0, 0)
    self.angle = 180
    self.speed = 2
    self.playerType = playerType
    self.isController = data.isController
    self.gameObject = ResourcesManager.Load("monster", ResourceConst.ResType.Actor)
    self.gameObject.name = "Actor" .. self.id

    self:AddComponents()
end

function StakeActor:AddComponents()
    self.moveCom = self:AddComponent(ActorMoveComponent)
    self:AddComponent(ActorKnockUpComponent)
    self:AddComponent(ActorKnockBackComponent)
    self:AddComponent(ActorKnockDownComponent)
end

-- function StakeActor:OnGetInpuMove(vector2)
--     -- print("StakeActor:OnGetInpuMove ==> ", vector2.x, vector2.y)
--     local moveDir = Vector3(vector2.x, 0, vector2.y).normalized
--     self.position = self.position + moveDir * self.speed * Time.deltaTime
--     self.angle = MathUtil.VectorToAngle(moveDir)
-- end

function StakeActor:Update(deltaTime)
    base.Update(self, deltaTime)
end

function StakeActor:GetPosition()
    return self.moveCom.position
end
function StakeActor:GetAngle()
    return self.moveCom.angle
end

function StakeActor:Close()
    base.Close(self)
    ResourcesManager.Catch(self.gameObject, ResourceConst.ResType.Actor)
end