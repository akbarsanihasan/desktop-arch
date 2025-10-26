export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

export GDK_BACKEND="wayland,x11,*"
export SDL_VIDEODRIVER="wayland,x11"
export CLUTTER_BACKEND="wayland,x11"
export _JAVA_AWT_WM_NONREPARENTING=1

export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME=gtk3
export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export GTK_USE_PORTAL=1
export GDK_DEBUG=portals

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULES="wayland;fcitx;ibus"

export MOZ_ENABLE_WAYLAND=1

export ELECTRON_OZONE_PLATFORM_HINT=auto

export CALIBRE_USE_SYSTEM_THEME=true
