package ext {
import ext.util.TaskRunner;

/**
 * A static <a href="Ext.util.TaskRunner.html">Ext.util.TaskRunner</a> instance that can be used to start and stop arbitrary tasks. See <a href="Ext.util.TaskRunner.html">Ext.util.TaskRunner</a> for supported methods and task config properties. <pre><code>// Start a simple clock task that updates a div once per second
 var task = {
 run: function(){
 Ext.fly('clock').update(new Date().format('g:i:s A'));
 },
 interval: 1000 //1 second
 }
 Ext.TaskMgr.start(task);
 </code></pre><p>See the <a href="output/Ext.TaskMgr.html#Ext.TaskMgr-start">start</a> method for details about how to configure a task object.</p>
 *
 * <p>Copyright &#169; 2011 Sencha Inc.</p>
 *

 * <p>This class defines the type of the singleton TaskMgr.</p>
 * @see ext.#TaskMgr ext.TaskMgr
 * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/TaskMgr.html#cls-Ext.TaskMgr Ext JS source
 */
public class TaskMgrClass extends TaskRunner {

  /**
   * @private
   *
   */
  public function TaskMgrClass() {
    super(undefined);
  }

}
}
    