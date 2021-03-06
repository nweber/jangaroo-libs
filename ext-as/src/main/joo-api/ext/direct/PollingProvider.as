package ext.direct {
/**
 * Fired immediately before a poll takes place, an event handler can return false in order to cancel the poll.
 * Listeners will be called with the following arguments:
 * <ul>

 *       <li>
 *           <code>:ext.direct.PollingProvider</code>

 *       </li>

 * </ul>
 */
[Event(name="beforepoll")]

/**
 * This event has not yet been implemented.
 * Listeners will be called with the following arguments:
 * <ul>

 *       <li>
 *           <code>:ext.direct.PollingProvider</code>

 *       </li>

 * </ul>
 */
[Event(name="poll")]


/**
 * Provides for repetitive polling of the server at distinct <a href="output/Ext.direct.PollingProvider.html#Ext.direct.PollingProvider-interval">intervals</a>. The initial request for data originates from the client, and then is responded to by the server.
 <p>All configurations for the PollingProvider should be generated by the server-side API portion of the Ext.Direct stack.</p><p>An instance of PollingProvider may be created directly via the new keyword or by simply specifying <tt>type = 'polling'</tt>. For example:</p><pre><code>var pollA = new Ext.direct.PollingProvider({
 type:'polling',
 url: 'php/pollA.php',
 });
 Ext.Direct.addProvider(pollA);
 pollA.disconnect();

 Ext.Direct.addProvider(
 {
 type:'polling',
 url: 'php/pollB.php',
 id: 'pollB-provider'
 }
 );
 var pollB = Ext.Direct.getProvider('pollB-provider');
 </code></pre>
 *
 * <p>Copyright &#169; 2011 Sencha Inc.</p>
 *

 * @see ext.config.pollingprovider
 * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/PollingProvider.html#cls-Ext.direct.PollingProvider Ext JS source
 */
public class PollingProvider extends JsonProvider {

  /**
   *
   *
   * @see ext.config.pollingprovider
   */
  public function PollingProvider() {
    super();
  }

  /**
   An object containing properties which are to be sent as parameters on every polling request
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get baseParams():Object;

  /**
   How often to poll the server-side in milliseconds (defaults to <tt>3000</tt> - every 3 seconds).
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get interval():Number;

  /**
   The url which the PollingProvider should contact with each request. This can also be an imported Ext.Direct method which will accept the baseParams as its only argument.
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get url():*;

  /**
   * Connect to the server-side and begin the polling process. To handle each response subscribe to the data event.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/PollingProvider.html#method-Ext.direct.PollingProvider-connect Ext JS source
   */
  override public native function connect():void;

  /**
   * Disconnect from the server-side and stop the polling process. The disconnect event will be fired on a successful disconnect.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/PollingProvider.html#method-Ext.direct.PollingProvider-disconnect Ext JS source
   */
  override public native function disconnect():void;

}
}
    