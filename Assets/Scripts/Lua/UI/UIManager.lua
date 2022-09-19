local UIManager = ClassStatic("UIManager")
local this = UIManager
function UIManager.Init()
    this.curShowPanel = nil
    this.windowStack = {}
end

function UIManager.Update(deltaTime)
    this.curShowPanel:Update(deltaTime)
    
end

function UIManager.ShowPanel(panelCls, data)
    if (not this.curShowPanel) or (this.curShowPanel and this.curShowPanel ~= panelCls) then
        if this.curShowPanel then
            this.ClosePanel(this.curShowPanel)
        end
        local gameObject = UIManager.GetPanelRoot(panelCls)
        local panelInstance = panelCls.New(gameObject, data)
        this.curShowPanel = panelInstance
        return panelInstance
    end

    return nil
end
function UIManager.ClosePanel(panelCls)
    if panelCls == this.curShowPanel then
        this.curShowPanel = panelCls
        this.curShowPanel:Close()
    end
end
function UIManager.GetPanelRoot(panelCls)
    local gameObject = GameObject.Find(panelCls.PrefabName)
    return gameObject
end

function UIManager.GetWindowRoot(windowCls)
    local gameObject = GameObject.Find(windowCls.PrefabName)
    return gameObject
end

function UIManager.ShowWindow(windowCls, data)
    local gameObject this.GetWindowRoot(windowCls)
    local windowInstance = windowCls.New(gameObject, data)
    table.insert(this.windowStack, 1, windowInstance)
end
function UIManager.CloseWindow()
    if #this.windowStack > 0 then
        local windowCls = this.windowStack[#this.windowStack]
        windowCls:Close()
        table.remove(this.windowStack, #this.windowStack)
    end 
end

function UIManager.Close()
end