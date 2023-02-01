using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public static class BattleCommondManager
{
    private const int BattleCommond_ActorCreate = 1;
    private const int BattleCommond_ActorMove = 2;


    private static Dictionary<int, Action<LuaTable>> battleCommondActionDict;
    static Dictionary<int, List<LuaTable>> rendererCommondList;

    public static void Init()
    {
        rendererCommondList = new Dictionary<int, List<LuaTable>>();
    }

    static void GenerateBattleCommondActions()
    {
        battleCommondActionDict = new Dictionary<int, Action<LuaTable>>();
        battleCommondActionDict.Add(BattleCommond_ActorCreate, ActionActorCreate);
        battleCommondActionDict.Add(BattleCommond_ActorMove, ActionActorMove);
    }


    public static void Update()
    {
        foreach (var item in rendererCommondList)
        {
            int commondType = item.Key;
            if (battleCommondActionDict.ContainsKey(commondType))
            {
                Action<LuaTable> commondAction = battleCommondActionDict[commondType];
                List<LuaTable> commondParamList = item.Value;
                for (int i = commondParamList.Count - 1; i >= 0; i--)
                {
                    LuaTable commondParam = commondParamList[i];
                    commondAction.Invoke(commondParam);
                    commondParamList.RemoveAt(i);
                }
            }
        }
    }


    public static void AddBattleCommond(int commondType, LuaTable luaTable)
    {
        if (!rendererCommondList.ContainsKey(commondType))
        {
            rendererCommondList.Add(commondType, new List<LuaTable>());
        }
        rendererCommondList[commondType].Add(luaTable);
    }


    public static void ActionActorCreate(LuaTable luaTable)
    {
        int id = luaTable.Get<int>("id");
        string modelName = luaTable.Get<string>("name");
        float x = luaTable.Get<float>("x");
        float y = luaTable.Get<float>("y");
        float z = luaTable.Get<float>("z");
        float angle = luaTable.Get<float>("angle");
        float scale = luaTable.Get<float>("scale");
        ActorRenderer renderer = BattleRendererManager.CreateRenderer(id) as ActorRenderer;
        renderer.Init(id, modelName, new Vector3(x, y, z), Vector3.one * scale, angle);
    }

    public static void ActionActorDestroy(LuaTable luaTable)
    {
        int id = luaTable.Get<int>("id");
        BattleRendererManager.RemoveRenderer(id);
    }

    public static void ActionActorMove(LuaTable luaTable)
    {
        int id = luaTable.Get<int>("id");
    }
}
