using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class BattleRendererManager
{
    private static Dictionary<int, IRenderer> renderersDic;
    private static List<int> delList;
    public static void Init()
    {
        renderersDic = new Dictionary<int, IRenderer>();
        delList = new List<int>();
    }

    public static IRenderer CreateRenderer(int id)
    {
        IRenderer renderer = new BattleRenderer() as IRenderer;
        renderersDic.Add(id, renderer);
        return renderer;
    }

    public static void RemoveRenderer(int id)
    {
        delList.Add(id);
    }

    public static void Update()
    {
        foreach (var item in renderersDic)
        {
            IRenderer renderer = item.Value;
            renderer.Update();
        }

        for (int i = delList.Count - 1; i >= 0; i--)
        {
            int id = delList[i];
            if (renderersDic.ContainsKey(id))
            {
                renderersDic.Remove(id);
            }
        }
        delList.Clear();
    }
}
