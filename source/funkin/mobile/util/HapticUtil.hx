package funkin.mobile.util;

import funkin.util.HapticUtil as BaseHapticUtil;

/**
 * Efectos hapticos cortos para los menus moviles.
 *
 * Es una capa fina sobre `funkin.util.HapticUtil`, que ya se encarga de comprobar
 * si hay hapticos disponibles, respetar las preferencias del jugador y llamar a
 * `extension.haptics.Haptic`.
 */
class HapticUtil
{
  /**
   * Toque ligero (navegar, pulsar un boton).
   */
  public static function tap():Void
  {
    BaseHapticUtil.vibrate(0, 0.01, 0.3, 0.4);
  }

  /**
   * Seleccion (confirmar una opcion).
   */
  public static function select():Void
  {
    BaseHapticUtil.vibrate(0, 0.015, 0.5, 0.5);
  }

  /**
   * Accion completada con exito.
   */
  public static function success():Void
  {
    BaseHapticUtil.vibrate(0, 0.025, 0.8, 0.6);
  }

  /**
   * Aviso o accion destructiva (dos pulsos cortos).
   */
  public static function warning():Void
  {
    BaseHapticUtil.vibrate(0.04, 0.12, 0.7, 0.5);
  }
}
