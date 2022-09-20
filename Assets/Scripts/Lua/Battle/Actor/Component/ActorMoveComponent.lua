local ActorMoveComponent, base = Class("ActorMoveComponent", BaseComponent)
ActorMoveComponent.Name = "ActorMoveComponent"

function ActorMoveComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.actor = actor
    self.transform = self.actor.gameObject.transform
    self.moveSpeed = self.actor.speed
    self.position = self.actor.position
    self.angle = self.actor.angle

    self.moveList = {}
end

function ActorMoveComponent:Update(deltaTime)
    base.Update(self, deltaTime)
    -- local moveVec = Vector3.zero
    -- if #self.moveList > 0 then
    --     for i = #self.moveList, 1, -1 do
    --         moveVec = moveVec + self.moveList[i]
    --         table.remove(self.moveList, i)
    --     end
    -- end
    -- self.position = self.position + moveVec
    -- self.transform.position = self.position
    -- self.transform.rotation = Quaternion.Euler(0, self.angle, 0)
end

function ActorMoveComponent:AddMove(moveVector)
    -- table.insert(self.moveList, moveVector)
    self.position = self.position + moveVector
    self.transform.position = self.position
end

function ActorMoveComponent:ChangeAngle(angle)
    self.angle = angle
    self.transform.rotation = Quaternion.Euler(0, self.angle, 0)
end

function ActorMoveComponent:Close()
end