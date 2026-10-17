package funkin.util.macro;

#if macro
import haxe.macro.Context;
#end

/**
 * Macros de inicializacion para haxeui.
 *
 * Con los editores activos en movil, el compilador entra en el bucle
 * "Loop in class building prevent compiler termination" al tipar
 * `HorizontalContinuousLayout` (subclase) antes de que `HorizontalLayout` termine
 * de construirse. Cargar las capas (layouts) en orden de herencia evita el bucle.
 */
class HaxeUIMacro
{
  #if macro
  /**
   * Orden de herencia: Layout > DefaultLayout > HorizontalLayout > HorizontalContinuousLayout.
   */
  static final LAYOUT_MODULES:Array<String> = [
    'haxe.ui.layouts.Layout',
    'haxe.ui.layouts.DefaultLayout',
    'haxe.ui.layouts.HorizontalLayout',
    'haxe.ui.layouts.HorizontalContinuousLayout'
  ];

  /**
   * Carga las capas ahora mismo (solo seguro si los defines de flixel ya existen).
   */
  public static function preloadLayouts():Void
  {
    for (module in LAYOUT_MODULES) Context.getModule(module);
  }

  /**
   * Carga las capas cuando todos los macros de inicializacion ya se ejecutaron,
   * para que los defines de flixel (FLX_MOUSE, etc.) existan antes de parsear flixel.
   */
  public static function preloadLayoutsDeferred():Void
  {
    Context.onAfterInitMacros(preloadLayouts);
  }
  #end
}
