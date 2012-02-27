import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.Grid
import XMonad.Prompt
import XMonad.Prompt.Man
import System.IO

myModMask = mod4Mask 
myTerminal = "urxvtc" --my preferred terminal
myWorkspaces = ["Don't","Panic!","::k6b::",".42.","5","6","7","8","9"] --list of tag names
myManageHook = composeAll
    [ className =? "vlc"                                --> doFloat --float vlc
    , className =? "Gimp"                               --> doShift ".42." --move gimp to window
    , className =? "Keepassx"                           --> doCenterFloat --float keepassx
    , className =? "Firefox"                            --> doShift "Panic!" --move firefox to window
    , className =? "Pidgin"	                  			--> doShift ".42." --move Pidgin to window
    --Float firefox windows
    , title	=? "autologin"				--> doShift "Don't"
    , title     =? "Firefox Preferences"                --> doCenterFloat
    , title     =? "Session Manager - Mozilla Firefox"  --> doCenterFloat
    , title     =? "Firefox Add-on Updates"             --> doCenterFloat
    , title     =? "Add-ons"                            --> doCenterFloat
    , title     =? "Clear Private Data"                 --> doCenterFloat
    , title     =? "Close Firefox"                      --> doCenterFloat
    , title     =? "Downloads"                          --> doCenterFloat
    , title     =? "About Mozilla Firefox"              --> doCenterFloat
    , title     =? "Options for Menu Editor"            --> doCenterFloat
    , title     =? "Full Server Headers"                --> doCenterFloat
    --Float pidgin windows
    , className =? "feh"                                --> doCenterFloat --center and float feh
    ]

myLayoutHook = onWorkspace ".42." imLayout $ onWorkspace "Don't" terminalLayout $ onWorkspace "Panic!" webLayout $ standardLayout --per workspace layouts
    where
        standardLayout = avoidStruts ( Mirror tall ||| tall ||| Grid ||| Full ) --layout to use on every other workspace
            where
                tall = Tall nmaster delta ratio --define tall layout sizes
                nmaster = 1 --number of windows in master pane
                ratio = 1/2 --ratio of master pane size
                delta = 2/100

        imLayout = avoidStruts $ reflectHoriz $ withIM ratio rosters chatLayout where --layout for gimp
		chatLayout	= Grid
		ratio		= 1/6
		rosters		= pidginRoster
		pidginRoster	= And (ClassName "Pidgin") (Role "buddy_list")

        terminalLayout = avoidStruts $ Grid --layout for terminal windows

        webLayout = avoidStruts $ Mirror tall --layout for browser and terminal window
            where
                tall = Tall nmaster delta ratio --define tall layout sizes 
                nmaster = 1 --number of windows in master pane1
                ratio = 3/4 --ratio of master pane size 
                delta = 2/100

--xmobar config
myLogHook h = dynamicLogWithPP xmobarPP
            { ppHidden = xmobarColor "grey" "" --tag color
            , ppOutput = hPutStrLn h           --tag list and window title
            , ppTitle = xmobarColor "green" "" --window title color
            }

myStatusBar = "xmobar" --define first xmobar

main = do 
    spawn "~/scripts/startup.sh" --startup script
    din <- spawnPipe myStatusBar --start first xmobar
    spawn "xmobar ~/.xmobarrc2"  --start second xmobar 
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = myLayoutHook 
        , logHook = myLogHook din
        , terminal = myTerminal
        , workspaces = myWorkspaces
        , modMask = myModMask
        } `additionalKeys`
        [ ((mod4Mask, xK_f),    spawn "firefox") --start firefox
        , ((mod4Mask .|. shiftMask, xK_F8),  spawn "sudo /usr/sbin/pm-suspend") --suspend
        , ((mod4Mask .|. shiftMask, xK_F9),  spawn "sudo /sbin/reboot") --reboot
        , ((mod4Mask .|. shiftMask, xK_F10),  spawn "sudo /sbin/shutdown -h now") --shutdown
        , ((mod4Mask, xK_p),    spawn "dmenu_run -nb black -nf white") --call dmenu
        , ((mod4Mask .|. shiftMask, xK_h), spawn "feh --scale ~/pictures/Xmbindings.png") --keymask dialog
        , ((mod4Mask, xK_F1),   manPrompt defaultXPConfig) --man prompt
        , ((mod4Mask .|. shiftMask, xK_p),       spawn "'scrot' -e 'mv $f ~/pictures/screenshots'") --take screenshot
        , ((mod4Mask, xK_Up),    spawn "amixer -q set Master 2dB+") --raise sound
        , ((mod4Mask, xK_Down),     spawn "amixer -q set Master 1dB-") --lower sound
        , ((mod4Mask .|. shiftMask, xK_m),     spawn "amixer -q set Master toggle") --mute sound
    	, ((mod4Mask .|. shiftMask, xK_l),	spawn "xscreensaver-command -lock") --lock desktop
        ]
