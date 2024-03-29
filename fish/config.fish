if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x ALL_PROXY http://127.0.0.1:7890
    set -x GTK_IM_MODULE fcitx
    set -x QT_IM_MODULE fcitx
    set -x XMODIFIERS "@im=fcitx"
    set -x SDL_IM_MODULE fcitx
    set -x GLFW_IM_MODULE fcitx
end
