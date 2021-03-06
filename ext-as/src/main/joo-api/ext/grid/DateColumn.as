package ext.grid {

import ext.config.datecolumn;

/**
 * A Column definition class which renders a passed date according to the default locale, or a configured <a href="output/Ext.grid.DateColumn.html#Ext.grid.DateColumn-format">format</a>. See the <a href="output/Ext.grid.Column.html#Ext.grid.Column-xtype">xtype</a> config option of <a href="Ext.grid.Column.html">Ext.grid.Column</a> for more details.

 *
 * <p>Copyright &#169; 2011 Sencha Inc.</p>
 *

 * <p>This component is created by the xtype 'datecolumn' / the EXML element &lt;datecolumn>.</p>
 * @see ext.config.datecolumn
 * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/Column.html#cls-Ext.grid.DateColumn Ext JS source
 */
public class DateColumn extends Column {

  /**
   * Create a new DateColumn.
   *
   * @param config The config object
   * @see ext.config.datecolumn
   */
  public function DateColumn(config:datecolumn = null) {
    super(config);
  }

  /**
   A formatting string as used by <a href="output/Date.html#Date-format">Date.format</a> to format a Date for this Column (defaults to <tt>'m/d/Y'</tt>).
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get format():String;

}
}
    