function player_icon {
    local player
    player=$(playerctl metadata --format '{{ playerName }}' 2>/dev/null)

    if [ -z "$player" ];
    then
        echo "Nothing"
        return 0
    fi

    case $player in
        "TelegramDesktop")
                echo ""
                ;;
        "spotify")
                echo ""
                ;;
        firefox)
                echo ""
                ;;
        *)
                echo "󰝚 "
                ;;
    esac
}

PLAYER_ICON=$( player_icon )
if [ "$PLAYER_ICON" != "Nothing" ]
then
    TITLE=$(playerctl metadata --format '{{ title }}')
    ARTIST=$(playerctl metadata --format '{{ artist }}')
    printf "$TITLE    $PLAYER_ICON    $ARTIST"
else
    printf "No music play"
fi