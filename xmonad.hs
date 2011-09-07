import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal = "urxvtc"
myWorkspaces = ["Don't","Panic!","::k6b::",".42.","5","6","7","8","9"]
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Keepassx"       --> doFloat
    , className =? "Google-chrome"  --> doShift "Panic!"
    ]
myLayoutHook = avoidStruts (Mirror tall ||| tall ||| Full)
    where
        tall = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 2/100
--xmobar config
myLogHook h = dynamicLogWithPP xmobarPP
            { ppHidden = xmobarColor "grey" ""
            , ppOutput = hPutStrLn h
            , ppTitle = xmobarColor "green" ""-- . shorten 50
            }
myStatusBar = "xmobar"
myStartupHook :: X ()
myStartupHook = do
            spawn "xmobar ~/.xmobarrc2"

main = do 
    din <- spawnPipe myStatusBar
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = myLayoutHook 
        , logHook = myLogHook din
        , startupHook = myStartupHook
        , terminal = myTerminal
        , workspaces = myWorkspaces
        , modMask = mod4Mask
        } `additionalKeys`
        [ ((0, xK_Print),       spawn "'scrot' -e 'mv $f ~/pictures/screenshots'")
        , ((mod4Mask, xK_g),    spawn "google-chrome")
        , ((mod4Mask, xK_F11),  spawn "sudo /sbin/reboot")
        , ((mod4Mask, xK_F12),  spawn "sudo /sbin/shutdown -h now")
        , ((mod4Mask, xK_p),    spawn "dmenu_run -nb black -nf white")
        , ((mod4Mask, xK_Up),   spawn "amixer -q set Master 2dB+")
        , ((mod4Mask, xK_Down), spawn "amixer -q set Master 1dB-")
        , ((mod4Mask, xK_M),    spawn "amixer -q set Master toggle")
        ]
