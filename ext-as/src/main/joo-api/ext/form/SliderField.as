package ext.form {
import ext.Element;
import ext.config.sliderfield;

/**
 * Wraps a <a href="Ext.slider.MultiSlider.html">Slider</a> so it can be used as a form field.
 *
 * <p>Copyright &#169; 2011 Sencha Inc.</p>
 *

 * <p>This component is created by the xtype 'sliderfield' / the EXML element &lt;sliderfield>.</p>
 * @see ext.config.sliderfield
 * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#cls-Ext.form.SliderField Ext JS source
 */
public class SliderField extends Field {

  /**
   * Creates a new SliderField
   *
   * @param config Configuration options. Note that you can pass in any slider configuration options, as well as as any field configuration options.
   * @see ext.config.sliderfield
   */
  public function SliderField(config:sliderfield) {
    super(null);
  }

  /**
   True to use an Ext.slider.Tip to display tips for the value. Defaults to <tt>true</tt>.
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/ Ext JS source
   */
  public native function get useTips():Boolean;

  /**
   * If a side icon is shown, do alignment to the slider
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-alignErrorIcon Ext JS source
   */
  override protected native function alignErrorIcon():void;

  /**
   * Ensure the slider is destroyed when the field is destroyed.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-beforeDestroy Ext JS source
   */
  override protected native function beforeDestroy():void;

  /**
   * Gets the current value for this field.
   *
   * @return The current value.
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-getValue Ext JS source
   */
  override public native function getValue():*;

  /**
   * Initialize the component.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-initComponent Ext JS source
   */
  override protected native function initComponent():void;

  /**
   * Initialize any events for this class.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-initEvents Ext JS source
   */
  override protected native function initEvents():void;

  /**
   * Utility method to set the value of the field when the slider changes.
   *
   * @param slider The slider object.
   * @param v The new value.
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-onChange Ext JS source
   */
  public native function onChange(slider:Object, v:Object):void;

  /**
   * Disable the slider when the field is disabled.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-onDisable Ext JS source
   */
  override protected native function onDisable():void;

  /**
   * Enable the slider when the field is enabled.
   *
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-onEnable Ext JS source
   */
  override protected native function onEnable():void;

  /**
   * Set up the hidden field
   *
   * @param ct container
   * @param position reference child element
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-onRender Ext JS source
   */
  override protected native function onRender(ct:Element, position:Element):void;

  /**
   * Ensure that the slider size is set automatically when the field resizes.
   *
   * @param adjWidth The box-adjusted width that was set
   * @param adjHeight The box-adjusted height that was set
   * @param rawWidth The width that was originally specified
   * @param rawHeight The height that was originally specified
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-onResize Ext JS source
   */
  override protected native function onResize(adjWidth:Number, adjHeight:Number, rawWidth:Number, rawHeight:Number):void;

  /**
   * Sets the maximum field value.
   *
   * @param v The new maximum value.
   * @return this
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-setMaxValue Ext JS source
   */
  public native function setMaxValue(v:Number):SliderField;

  /**
   * Sets the minimum field value.
   *
   * @param v The new minimum value.
   * @return this
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-setMinValue Ext JS source
   */
  public native function setMinValue(v:Number):SliderField;

  /**
   * Sets the value for this field.
   *
   * @param value The value to set
   * @param flag a boolean flag used by some subclasses
   * @return this
   * @see http://dev.sencha.com/deploy/ext-3.3.1/docs/source/SliderField.html#method-Ext.form.SliderField-setValue Ext JS source
   */
  override public native function setValue(value:*, flag:Boolean = false):Field;

}
}
    