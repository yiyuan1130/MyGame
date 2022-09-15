local BattleSceneManager = ClassStatic("BattleSceneManager")
local this = BattleSceneManager
function BattleSceneManager.Init()
    this.instance = BattleScene
    this.instance.OnLoad()
end

function BattleSceneManager.Update(deltaTime)
    this.TestInput()
    this.instance.Update(deltaTime)
end

function BattleSceneManager.Close()
end

--- 
function BattleSceneManager.TestInput()
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