package ext.data {
import ext.config.datafield;

/**
 * This class encapsulates the field definition information specified in the field definition objects passed to <a href="output/Ext.data.Record.html#Ext.data.Record-create">Ext.data.Record.create</a>.
 <p>Developers do not need to instantiate this class. Instances are created by <a href="Ext.data.Record.create.html">Ext.data.Record.create</a> and cached in the <a href="output/Ext.data.Record.html#Ext.data.Record-fields">fields</a> property of the created Record constructor's <b>prototype.</b></p>
 *
 * <p>Copyright &#169; 2011 Sencha Inc.</p>
 *

 * <p>This component is created by the xtype 'datafield' / the EXML element &lt;datafield>.</p>
 * @see ext.config.datafield
 * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/DataField.html#cls-Ext.data.Field Ext JS source
 */
public class Field {

  /**
   * Create a new Field.
   *
   * @param config The config object
   * @see ext.config.datafield
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/DataField.html#method-Ext.data.Field-constructor Ext JS source
   */
  public function Field(config:datafield = null) {
    super();
  }

  /**
   Used for validating a <a href="Ext.data.Record.html">record</a>, defaults to <code>true</code>. An empty value here will cause <a href="Ext.data.Record.html">Ext.data.Record</a>.<a href="output/Ext.data.Record.html#Ext.data.Record-isValid">isValid</a> to evaluate to <code>false</code>.
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get allowBlank():Boolean;

  /**
   (Optional) Used when converting received data into a Date when the <a href="output/Ext.data.Field.html#Ext.data.Field-type">type</a> is specified as <code>"date"</code>.
   <p>A format string for the <a href="output/Date.html#Date-parseDate">Date.parseDate</a> function, or "timestamp" if the value provided by the Reader is a UNIX timestamp, or "time" if the value provided by the Reader is a javascript millisecond timestamp. See <a href="Date.html">Date</a></p>
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get dateFormat():String;

  /**
   The default value used <b>when a Record is being created by a <a href="Ext.data.Reader.html">Reader</a></b> when the item referenced by the <code><a href="output/Ext.data.Field.html#Ext.data.Field-mapping">mapping</a></code> does not exist in the data object (i.e. undefined). (defaults to "")
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get defaultValue():*;

  /**
   (Optional) A path expression for use by the <a href="Ext.data.DataReader.html">Ext.data.DataReader</a> implementation that is creating the <a href="Ext.data.Record.html">Record</a> to extract the Field value from the data object. If the path expression is the same as the field name, the mapping may be omitted.
   <p>The form of the mapping expression depends on the Reader being used.</p><div class="mdetail-params"><ul><li><a href="Ext.data.JsonReader.html">Ext.data.JsonReader</a><div class="sub-desc">The mapping is a string containing the javascript expression to reference the data from an element of the data item's <a href="output/Ext.data.JsonReader.html#Ext.data.JsonReader-root">root</a> Array. Defaults to the field name.</div></li><li><a href="Ext.data.XmlReader.html">Ext.data.XmlReader</a><div class="sub-desc">The mapping is an <a href="Ext.DomQuery.html">Ext.DomQuery</a> path to the data item relative to the DOM element that represents the <a href="output/Ext.data.XmlReader.html#Ext.data.XmlReader-record">record</a>. Defaults to the field name.</div></li><li><a href="Ext.data.ArrayReader.html">Ext.data.ArrayReader</a><div class="sub-desc">The mapping is a number indicating the Array index of the field's value. Defaults to the field specification's Array position.</div></li></ul></div><p>If a more complex value extraction strategy is required, then configure the Field with a <a href="output/Ext.data.Field.html#Ext.data.Field-convert">convert</a> function. This is passed the whole row object, and may interrogate it in whatever way is necessary in order to return the desired data.</p>
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get mapping():*;

  /**
   The name by which the field is referenced within the Record. This is referenced by, for example, the <code>dataIndex</code> property in column definition objects passed to <a href="Ext.grid.ColumnModel.html">Ext.grid.ColumnModel</a>. <p>Note: In the simplest case, if no properties other than <code>name</code> are required, a field definition may consist of just a String for the field name.</p>
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get name():String;

  /**
   Initial direction to sort (<code>"ASC"</code> or <code>"DESC"</code>). Defaults to <code>"ASC"</code>.
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get sortDir():String;

  /**
   The data type for automatic conversion from received data to the <i>stored</i> value if <code><a href="output/Ext.data.Field.html#Ext.data.Field-convert">convert</a></code> has not been specified. This may be specified as a string value. Possible values are <div class="mdetail-params"><ul><li>auto (Default, implies no conversion)</li><li>string</li><li>int</li><li>float</li><li>boolean</li><li>date</li></ul></div><p>This may also be specified by referencing a member of the <a href="Ext.data.Types.html">Ext.data.Types</a> class.</p><p>Developers may create their own application-specific data types by defining new members of the <a href="Ext.data.Types.html">Ext.data.Types</a> class.</p>
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get type():*;

  /**
   (Optional) Use when converting received data into a Number type (either int or float). If the value cannot be parsed, null will be used if useNull is true, otherwise the value will be 0. Defaults to <tt>false</tt>

   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get useNull():Boolean;

}
}
    