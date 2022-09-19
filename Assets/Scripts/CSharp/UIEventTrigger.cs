using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class UIEventTrigger : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler,
    IBeginDragHandler, IDragHandler, IEndDragHandler, IDropHandler
{
    public enum EventType {
        OnPointerEnter = 1,
        OnPointerExit = 2,
        OnPointerDown = 3,
        OnPointerUp = 4,
        OnPointerClick = 5,
        OnBeginDrag = 6,
        OnDrag = 7,
        OnEndDrag = 8,
        OnDrop = 9,
    };

    List<Action<PointerEventData>> onPointerEnterActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onPointerExitActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onPointerDownActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onPointerUpActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onPointerClickActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onBeginDragActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onDragActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onEndDragActionsList = new List<Action<PointerEventData>>();
    List<Action<PointerEventData>> onDropActionsList = new List<Action<PointerEventData>>();
    

    public void OnBeginDrag(PointerEventData eventData)
    {
        for (int i = 0; i < onBeginDragActionsList.Count; i++)
        {
            Action<PointerEventData> action = onBeginDragActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnDrag(PointerEventData eventData)
    {
        for (int i = 0; i < onDragActionsList.Count; i++)
        {
            Action<PointerEventData> action = onDragActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnDrop(PointerEventData eventData)
    {
        for (int i = 0; i < onDropActionsList.Count; i++)
        {
            Action<PointerEventData> action = onDropActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        for (int i = 0; i < onEndDragActionsList.Count; i++)
        {
            Action<PointerEventData> action = onEndDragActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        for (int i = 0; i < onPointerClickActionsList.Count; i++)
        {
            Action<PointerEventData> action = onPointerClickActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        for (int i = 0; i < onPointerDownActionsList.Count; i++)
        {
            Action<PointerEventData> action = onPointerDownActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        for (int i = 0; i < onPointerEnterActionsList.Count; i++)
        {
            Action<PointerEventData> action = onPointerEnterActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        for (int i = 0; i < onPointerExitActionsList.Count; i++)
        {
            Action<PointerEventData> action = onPointerExitActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        for (int i = 0; i < onPointerUpActionsList.Count; i++)
        {
            Action<PointerEventData> action = onPointerUpActionsList[i];
            action.Invoke(eventData);
        }
    }

    public void AddListerner(EventType type, Action<PointerEventData> action) {
        switch (type)
        {
            case EventType.OnPointerEnter:
                onPointerEnterActionsList.Add(action);
                break;
            case EventType.OnPointerExit:
                onPointerExitActionsList.Add(action);
                break;
            case EventType.OnPointerDown:
                onPointerDownActionsList.Add(action);
                break;
            case EventType.OnPointerUp:
                onPointerUpActionsList.Add(action);
                break;
            case EventType.OnPointerClick:
                onPointerClickActionsList.Add(action);
                break;
            case EventType.OnBeginDrag:
                onBeginDragActionsList.Add(action);
                break;
            case EventType.OnDrag:
                onDragActionsList.Add(action);
                break;
            case EventType.OnEndDrag:
                onEndDragActionsList.Add(action);
                break;
            case EventType.OnDrop:
                onDropActionsList.Add(action);
                break;
            default:
                break;
        }
    }

    public void RemoveListener(EventType type, Action<PointerEventData> action){
        switch (type)
        {
            case EventType.OnPointerEnter:
                onPointerEnterActionsList.Remove(action);
                break;
            case EventType.OnPointerExit:
                onPointerExitActionsList.Remove(action);
                break;
            case EventType.OnPointerDown:
                onPointerDownActionsList.Remove(action);
                break;
            case EventType.OnPointerUp:
                onPointerUpActionsList.Remove(action);
                break;
            case EventType.OnPointerClick:
                onPointerClickActionsList.Remove(action);
                break;
            case EventType.OnBeginDrag:
                onBeginDragActionsList.Remove(action);
                break;
            case EventType.OnDrag:
                onDragActionsList.Remove(action);
                break;
            case EventType.OnEndDrag:
                onEndDragActionsList.Remove(action);
                break;
            case EventType.OnDrop:
                onDropActionsList.Remove(action);
                break;
            default:
                break;
        }
    }
}
