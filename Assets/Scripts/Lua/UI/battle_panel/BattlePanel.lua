local BattlePanel = Class("BattlePanel")
BattlePanel.PrefabName = "battle_panel"
function BattlePanel:OnCreate(gameObject, data)
    self.gameObject = gameObject
    self.transform = gameObject.transform
    self.rockerBG = self.transform:Find("rocker/bg").gameObject
    self.rockerCenter = self.transform:Find("rocker/center").gameObject
    self.input = Vector2.zero
    self.isDraging = false
    self:AddListeners()
end

function BattlePanel:AddListeners()
    CSForLuaInterface.AddUIEvent(self.rockerBG, UIEventTrigger.EventType.OnPointerDown, function(pointerEventData)
        self.isDraging = true
        print("BattlePanel:OnPointerDown")
        self:UpdateInput(pointerEventData)
    end)
    CSForLuaInterface.AddUIEvent(self.rockerBG, UIEventTrigger.EventType.OnDrag, function(pointerEventData)
        self:OnRockerDrag(pointerEventData)
    end)
    CSForLuaInterface.AddUIEvent(self.rockerBG, UIEventTrigger.EventType.OnPointerUp, function(pointerEventData)
        self.isDraging = false
        print("BattlePanel:OnPointerUp")
        self.input = Vector2.zero
        self.rockerCenter.transform.localPosition = Vector3.zero
        -- self:UpdateInput(pointerEventData)
    end)
end

function BattlePanel:RemoveListeners()
    CSForLuaInterface.RemoveUIEvent(self.rockerBG, UIEventTrigger.EventType.OnDrag, self.OnRockerDrag)
end

function BattlePanel:Update(deltaTime)
    if self.isDraging then
        EventManager.SendEvent(EventId.GetInputMove, self.input)
    end
end

function BattlePanel:OnRockerDrag(pointerEventData)
    print("BattlePanel:OnRockerDrag")
    self:UpdateInput(pointerEventData)
    local pos = Vector3(pointerEventData.position.x, pointerEventData.position.y, 0)
    -- local screenPos = Vector2(pos.x, pos.y)
    -- local uiPos = RectTransformUtility.ScreenPointToWorldPointInRectangle(self.rockerBG.transform, screenPos, Camera.main, Vector3.zero)
    -- self.rockerCenter.transform.position = Vector3(pos.x, pos.y, 0)
end

function BattlePanel:UpdateInput(pointerEventData)
    local p1 = Vector2(self.rockerBG.transform.position.x, self.rockerBG.transform.position.y)
    local p2 = Vector2(pointerEventData.position.x, pointerEventData.position.y)
    local dir = p2 - p1
    self.input = dir.normalized
    self.rockerCenter.transform.localPosition = Vector3(self.input.x, self.input.y, 0) * Mathf.Min(dir.magnitude, 150)
end