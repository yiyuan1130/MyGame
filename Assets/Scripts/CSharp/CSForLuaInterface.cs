using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public static class CSForLuaInterface
{
    #region UI
    public static void AddUIEvent(GameObject gameObject, UIEventTrigger.EventType eventType, XLua.LuaFunction luaFunction) {
        UIEventTrigger uiET = gameObject.GetComponent<UIEventTrigger>();
        if (!uiET) {
            uiET = gameObject.AddComponent<UIEventTrigger>();
        }
        Action<PointerEventData> action = new Action<PointerEventData>((PointerEventData ped) => {
            luaFunction.Call(ped);
        });
        uiET.AddListerner(eventType, action);
    }
    public static void RemoveUIEvent(GameObject gameObject, UIEventTrigger.EventType eventType, XLua.LuaFunction luaFunction)
    {
        UIEventTrigger uiET = gameObject.GetComponent<UIEventTrigger>();
        if (!uiET)
        {
            uiET = gameObject.AddComponent<UIEventTrigger>();
        }
        Action<PointerEventData> action = new Action<PointerEventData>((PointerEventData ped) => {
            luaFunction.Call(ped);
        });
        uiET.RemoveListener(eventType, action);
    }
    #endregion
}
