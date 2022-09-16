local BattleSceneManager = ClassStatic("BattleSceneManager")
local this = BattleSceneManager
function BattleSceneManager.Init()
    this.instance = BattleScene
    this.instance.OnLoad()
end

function BattleSceneManager.Update(deltaTime)
    -- this.TestKeyboardInput()
    this.TestMouseInput()
    this.instance.Update(deltaTime)
end

function BattleSceneManager.Close()
end

--- 
local isMouseInput = false
local startMousePos
function BattleSceneManager.TestMouseInput()
    if Input.GetMouseButtonDown(0) then
        isMouseInput = true
        startMousePos = Vector2(Input.mousePosition.x, Input.mousePosition.y)
    end
    if Input.GetMouseButtonUp(0) then
        isMouseInput = false
    end
    if isMouseInput then
        if Input.GetMouseButton(0) then
            local curPos = Vector2(Input.mousePosition.x, Input.mousePosition.y)
            local vec = curPos - startMousePos
            EventManager.SendEvent(EventId.GetInputMove, vec)
        end
    end
end
function BattleSceneManager.TestKeyboardInput()
    -- 技能
    if Input.GetKeyDown(KeyCode.J) then -- 普攻
        
    end
    if Input.GetKeyDown(KeyCode.J) then -- 技能1
        
    end
    if Input.GetKeyDown(KeyCode.J) then -- 技能2
        
    end
    -- 移动
    if Input.GetKey(KeyCode.W) then
        if Input.GetKey(KeyCode.A) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(-1, 1))
        elseif Input.GetKey(KeyCode.D) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(1, 1))
        else
            EventManager.SendEvent(EventId.GetInputMove, Vector2(0, 1))
        end
        return
    end

    if Input.GetKey(KeyCode.A) then
        if Input.GetKey(KeyCode.W) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(-1, 1))
        elseif Input.GetKey(KeyCode.S) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(-1, -1))
        else
            EventManager.SendEvent(EventId.GetInputMove, Vector2(-1, 0))
        end
        return
    end

    if Input.GetKey(KeyCode.S) then
        if Input.GetKey(KeyCode.A) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(-1, -1))
        elseif Input.GetKey(KeyCode.D) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(1, -1))
        else
            EventManager.SendEvent(EventId.GetInputMove, Vector2(0, -1))
        end
        return
    end

    if Input.GetKey(KeyCode.D) then
        if Input.GetKey(KeyCode.W) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(1, 1))
        elseif Input.GetKey(KeyCode.S) then
            EventManager.SendEvent(EventId.GetInputMove, Vector2(1, -1))
        else
            EventManager.SendEvent(EventId.GetInputMove, Vector2(1, 0))
        end
        return
    end
end