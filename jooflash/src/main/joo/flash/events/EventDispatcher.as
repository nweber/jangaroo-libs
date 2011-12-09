package flash.events {

/**
 * [broadcast event] Dispatched when the Flash Player or AIR application gains operating system focus and becomes active. This event is a broadcast event, which means that it is dispatched by all EventDispatcher objects with a listener registered for this event. For more information about broadcast events, see the DisplayObject class.
 * @eventType flash.events.Event.ACTIVATE
 */
[Event(name="activate", type="flash.events.Event")]
/**
 * [broadcast event] Dispatched when the Flash Player or AIR application operating loses system focus and is becoming inactive. This event is a broadcast event, which means that it is dispatched by all EventDispatcher objects with a listener registered for this event. For more information about broadcast events, see the DisplayObject class.
 * @eventType flash.events.Event.DEACTIVATE
 */
[Event(name="deactivate", type="flash.events.Event")]

/**
 * The EventDispatcher class is the base class for all classes that dispatch events. The EventDispatcher class implements the IEventDispatcher interface and is the base class for the DisplayObject class. The EventDispatcher class allows any object on the display list to be an event target and as such, to use the methods of the IEventDispatcher interface.
 * <p>Event targets are an important part of the Flash<sup>®</sup> Player and Adobe<sup>®</sup> AIR<sup>®</sup> event model. The event target serves as the focal point for how events flow through the display list hierarchy. When an event such as a mouse click or a keypress occurs, Flash Player or the AIR application dispatches an event object into the event flow from the root of the display list. The event object then makes its way through the display list until it reaches the event target, at which point it begins its return trip through the display list. This round-trip journey to the event target is conceptually divided into three phases: the capture phase comprises the journey from the root to the last node before the event target's node, the target phase comprises only the event target node, and the bubbling phase comprises any subsequent nodes encountered on the return trip to the root of the display list.</p>
 * <p>In general, the easiest way for a user-defined class to gain event dispatching capabilities is to extend EventDispatcher. If this is impossible (that is, if the class is already extending another class), you can instead implement the IEventDispatcher interface, create an EventDispatcher member, and write simple hooks to route calls into the aggregated EventDispatcher.</p>
 * <p><a href="http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/EventDispatcher.html#includeExamplesSummary">View the examples</a></p>
 */
public class EventDispatcher implements IEventDispatcher {
  /**
   * Aggregates an instance of the EventDispatcher class.
   * <p>The EventDispatcher class is generally used as a base class, which means that most developers do not need to use this constructor function. However, advanced developers who are implementing the IEventDispatcher interface need to use this constructor. If you are unable to extend the EventDispatcher class and must instead implement the IEventDispatcher interface, use this constructor to aggregate an instance of the EventDispatcher class.</p>
   * @param target The target object for events dispatched to the EventDispatcher object. This parameter is used when the EventDispatcher instance is aggregated by a class that implements IEventDispatcher; it is necessary so that the containing object can be the target for events. Do not use this parameter in simple cases in which a class extends EventDispatcher.
   *
   */
  public function EventDispatcher(target:IEventDispatcher = null) {
    this.target = target;
    this.captureListeners = {};
    this.listeners = {};
  }

  /**
   * Registers an event listener object with an EventDispatcher object so that the listener receives notification of an event. You can register event listeners on all nodes in the display list for a specific type of event, phase, and priority.
   * <p>After you successfully register an event listener, you cannot change its priority through additional calls to <code>addEventListener()</code>. To change a listener's priority, you must first call <code>removeListener()</code>. Then you can register the listener again with the new priority level.</p>
   * <p>Keep in mind that after the listener is registered, subsequent calls to <code>addEventListener()</code> with a different <code>type</code> or <code>useCapture</code> value result in the creation of a separate listener registration. For example, if you first register a listener with <code>useCapture</code> set to <code>true</code>, it listens only during the capture phase. If you call <code>addEventListener()</code> again using the same listener object, but with <code>useCapture</code> set to <code>false</code>, you have two separate listeners: one that listens during the capture phase and another that listens during the target and bubbling phases.</p>
   * <p>You cannot register an event listener for only the target phase or the bubbling phase. Those phases are coupled during registration because bubbling applies only to the ancestors of the target node.</p>
   * <p>If you no longer need an event listener, remove it by calling <code>removeEventListener()</code>, or memory problems could result. Event listeners are not automatically removed from memory because the garbage collector does not remove the listener as long as the dispatching object exists (unless the <code>useWeakReference</code> parameter is set to <code>true</code>).</p>
   * <p>Copying an EventDispatcher instance does not copy the event listeners attached to it. (If your newly created node needs an event listener, you must attach the listener after creating the node.) However, if you move an EventDispatcher instance, the event listeners attached to it move along with it.</p>
   * <p>If the event listener is being registered on a node while an event is being processed on this node, the event listener is not triggered during the current phase but can be triggered during a later phase in the event flow, such as the bubbling phase.</p>
   * <p>If an event listener is removed from a node while an event is being processed on the node, it is still triggered by the current actions. After it is removed, the event listener is never invoked again (unless registered again for future processing).</p>
   * @param type The type of event.
   * @param listener The listener function that processes the event. This function must accept an Event object as its only parameter and must return nothing, as this example shows:
   * <listing>
   * function(evt:Event):void</listing>
   * <p>The function can have any name.</p>
   * @param useCapture Determines whether the listener works in the capture phase or the target and bubbling phases. If <code>useCapture</code> is set to <code>true</code>, the listener processes the event only during the capture phase and not in the target or bubbling phase. If <code>useCapture</code> is <code>false</code>, the listener processes the event only during the target or bubbling phase. To listen for the event in all three phases, call <code>addEventListener</code> twice, once with <code>useCapture</code> set to <code>true</code>, then again with <code>useCapture</code> set to <code>false</code>.
   * @param priority The priority level of the event listener. The priority is designated by a signed 32-bit integer. The higher the number, the higher the priority. All listeners with priority <i>n</i> are processed before listeners of priority <i>n</i>-1. If two or more listeners share the same priority, they are processed in the order in which they were added. The default priority is 0.
   * @param useWeakReference Determines whether the reference to the listener is strong or weak. A strong reference (the default) prevents your listener from being garbage-collected. A weak reference does not.
   * <p>Class-level member functions are not subject to garbage collection, so you can set <code>useWeakReference</code> to <code>true</code> for class-level member functions without subjecting them to garbage collection. If you set <code>useWeakReference</code> to <code>true</code> for a listener that is a nested inner function, the function will be garbage-collected and no longer persistent. If you create references to the inner function (save it in another variable) then it is not garbage-collected and stays persistent.</p>
   *
   * @throws ArgumentError The <code>listener</code> specified is not a function.
   *
   * @see http://help.adobe.com/en_US/as3/dev/WS5b3ccc516d4fbf351e63e3d118a9b90204-7e54.html Event listeners
   *
   */
  public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
    var listenersByType:Object = useCapture ? this.captureListeners : this.listeners;
    
	var eventObj:Object = {};
	eventObj.type = type;
	eventObj.method = listener;
	eventObj.useCapture = useCapture;
	eventObj.priority = priority;
	eventObj.useWeakReference = useWeakReference;
	
	if (!(type in listenersByType)) {
      listenersByType[type] = [ eventObj ];
    } else {
      listenersByType[type].push(eventObj);
    }
	listenersByType[type].sort(eventCompare);
  }

  /**
   * Dispatches an event into the event flow. The event target is the EventDispatcher object upon which the <code>dispatchEvent()</code> method is called.
   * @param event The Event object that is dispatched into the event flow. If the event is being redispatched, a clone of the event is created automatically. After an event is dispatched, its <code>target</code> property cannot be changed, so you must create a new copy of the event for redispatching to work.
   *
   * @return A value of <code>true</code> if the event was successfully dispatched. A value of <code>false</code> indicates failure or that <code>preventDefault()</code> was called on the event.
   *
   * @throws Error The event dispatch recursion limit has been reached.
   *
   */
  public function dispatchEvent(event:Event):Boolean {
	  event.withTarget(this.target || this);
	  
	  var ancestors:Array = createAncestorChain();
	  
	  // Capture from the top down.
	  event.eventPhase = EventPhase.CAPTURING_PHASE;
	  internalHandleCapture(event, ancestors);
	  
	  // Be sure we're allowed to continue.
	  if (!event.isPropagationStopped() ) {
		  // Handle it here, at the target.
		  event.eventPhase = EventPhase.AT_TARGET;
		  var listeners:Array = this.listeners[event.type];
		  if (listeners) {
			  processListeners(event, listeners);
		  }
	  }
	  
	  // Be sure we're allowed to continue.
	  if (!event.isPropagationStopped() ) {
		  // Bubble it back up the display chain.
		  event.eventPhase = EventPhase.BUBBLING_PHASE;
		  internalHandleBubble(event, ancestors);
	  }
	  
	  return !event.isDefaultPrevented();
  }

  /**
   * Checks whether the EventDispatcher object has any listeners registered for a specific type of event. This allows you to determine where an EventDispatcher object has altered handling of an event type in the event flow hierarchy. To determine whether a specific event type actually triggers an event listener, use <code>willTrigger()</code>.
   * <p>The difference between <code>hasEventListener()</code> and <code>willTrigger()</code> is that <code>hasEventListener()</code> examines only the object to which it belongs, whereas <code>willTrigger()</code> examines the entire event flow for the event specified by the <code>type</code> parameter.</p>
   * <p>When <code>hasEventListener()</code> is called from a LoaderInfo object, only the listeners that the caller can access are considered.</p>
   * @param type The type of event.
   *
   * @return A value of <code>true</code> if a listener of the specified type is registered; <code>false</code> otherwise.
   *
   * @see #willTrigger()
   *
   */
  public function hasEventListener(type:String):Boolean {
    return this.listeners[type] || this.captureListeners[type];
  }

  /**
   * Removes a listener from the EventDispatcher object. If there is no matching listener registered with the EventDispatcher object, a call to this method has no effect.
   * @param type The type of event.
   * @param listener The listener object to remove.
   * @param useCapture Specifies whether the listener was registered for the capture phase or the target and bubbling phases. If the listener was registered for both the capture phase and the target and bubbling phases, two calls to <code>removeEventListener()</code> are required to remove both, one call with <code>useCapture()</code> set to <code>true</code>, and another call with <code>useCapture()</code> set to <code>false</code>.
   *
   * @see http://help.adobe.com/en_US/as3/dev/WS5b3ccc516d4fbf351e63e3d118a9b90204-7e54.html Event listeners
   *
   */
  public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
    var listenersByType:Object = useCapture ? this.captureListeners : this.listeners;
    var listeners:Array = listenersByType[type];
    if (listeners) {
      for (var i:int = 0; i < listeners.length; ++i) {
        if (listeners[i].method == listener) {
          if (listeners.length == 1) {
            delete listenersByType[type];
          } else {
            listeners.splice(i, 1);
          }
          return;
        }
      }
    }
  }

  /**
   * Checks whether an event listener is registered with this EventDispatcher object or any of its ancestors for the specified event type. This method returns <code>true</code> if an event listener is triggered during any phase of the event flow when an event of the specified type is dispatched to this EventDispatcher object or any of its descendants.
   * <p>The difference between the <code>hasEventListener()</code> and the <code>willTrigger()</code> methods is that <code>hasEventListener()</code> examines only the object to which it belongs, whereas the <code>willTrigger()</code> method examines the entire event flow for the event specified by the <code>type</code> parameter.</p>
   * <p>When <code>willTrigger()</code> is called from a LoaderInfo object, only the listeners that the caller can access are considered.</p>
   * @param type The type of event.
   *
   * @return A value of <code>true</code> if a listener of the specified type will be triggered; <code>false</code> otherwise.
   *
   */
  public function willTrigger(type:String):Boolean {
    return this.hasEventListener(type);
  }

  public function toString():String {
    return ["EventDispatcher[target=",this.target,"]"].join("");
  }
  
  // Move to a proper namespace (event_internal maybe) when namespaces are implemented.
  public function processCapture(event:Event):void {
	  event.withCurrentTarget(this.target || this);
	  
	  var listeners:Array = this.captureListeners[event.type];
	  if (listeners) {
		  processListeners(event, listeners);
	  }
  }
  
  // Move to a proper namespace (event_internal maybe) when namespaces are implemented.
  public function processBubble(event:Event):void {
	  event.withCurrentTarget(this.target || this);
	  
	  var listeners:Array = this.listeners[event.type];
	  if (listeners) {
		  processListeners(event, listeners);
	  }
  }
  
  // Internal Methods
  
  private function eventCompare(item1:Object, item2:Object):int {
	if (item1.priority > item2.priority) {
	  return -1;
	}
	else if(item1.priority < item2.priority) {
	  return 1;
	}
	else {
	  return 0;
	}
  }

  internal function createAncestorChain():Array {
	  return null;
  }
  
  private function internalHandleCapture(event:Event, ancestors:Array):void {
	if (!ancestors || ancestors.length <= 0) {
		return;
	}
	
	// Start at the top of the chain and go down.
	var i:int = ancestors.length - 1;
	var d:EventDispatcher;
	for (i; i >= 0; i--) {
		d = ancestors[i];
		d.processCapture(event);
		if (event.isPropagationStopped()) {
			break;
		}
	}
  }
  
  private function internalHandleBubble(event:Event, ancestors:Array):void {
	  if (!ancestors || ancestors.length <= 0) {
		  return;
	  }
	  
	  // Start at the top of the chain and go down.
	  var i:int = 0;
	  var d:EventDispatcher;
	  for (i; i < ancestors.length; i++) {
		  d = ancestors[i];
	  	  d.processBubble(event);
		  if (event.isPropagationStopped()) {
			  break;
		  }
	  }
  }
  
  private function processListeners(event:Event, listeners:Array):void {
	  for (var i:int = 0; i < listeners.length; ++i) {
		  if (listeners[i].method(event) === false) {
			  event.stopPropagation();
			  event.preventDefault();
		  }
		  if (event.isImmediatePropagationStopped()) {
			  break;
		  }
	  }
  }
  
  // Variables
  
  private var captureListeners:Object/*<String,Array>*/;
  private var listeners:Object/*<String,Array>*/;
  private var target:IEventDispatcher;
}
}
