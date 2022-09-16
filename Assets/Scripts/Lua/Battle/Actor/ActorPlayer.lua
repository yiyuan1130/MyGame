local ActorPlayer, base = Class("ActorPlayer", ActorBase)
function ActorPlayer:OnCreate(id, data)
    base.OnCreate(self, id, data)
    self.position = Vector3(0, 0, 0)
    self.angle = 0
    self.speed = 2
    self.gameObject = ResourcesManager.Load("player", ResourceConst.ResType.Actor)
    self.gameObject.name = "Actor" .. self.id

    EventManager.AddListener(EventId.GetInputMove, self, self.OnGetInpuMove)
end

function ActorPlayer:OnGetInpuMove(vector2)
    -- print("ActorPlayer:OnGetInpuMove ==> ", vector2.x, vector2.y)
    local moveDir = Vector3(vector2.x, 0, vector2.y).normalized
    self.position = self.position + moveDir * self.speed * Time.deltaTime
    self.angle = MathUtil.VectorToAngle(moveDir)
end

function ActorPlayer:Update(deltaTime)
    base.Update(self, deltaTime)
    self:SetPosition()
    self:SetAngle()
end

function ActorPlayer:SetPosition()
    self.gameObject.transform.position = self.position
end
function ActorPlayer:SetAngle()
    self.gameObject.transform.rotation = Quaternion.Euler(0, self.angle, 0)
end

function ActorPlayer:Close()
    base.Close(self)
    ResourcesManager.Catch(self.gameObject, ResourceConst.ResType.Actor)
end