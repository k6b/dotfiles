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
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
myStatusBar = "xmobar"
--dzen2 config
--myLogHook h = dynamicLogWithPP $ defaultPP
--            { ppCurrent = dzenColor "#222222" "white"
--            , ppLayout = dzenColor "lightblue" "#222222"
--            , ppTitle = dzenColor "green" "" . dzenEscape 
--            , ppOutput = hPutStrLn h
--            }
--myStatusBar = "dzen2 -fn '-*-dina-*-r-*-*-14-*-*-*-*-*-*-*' -bg '#222222' -fg '#777777' -h 16 -w 800''"

main = do 
    din <- spawnPipe myStatusBar
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = myLayoutHook 
        , logHook = myLogHook din
        , terminal = myTerminal
        , workspaces = myWorkspaces
        , modMask = mod4Mask
        } `additionalKeys`
        [ ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s $f mv ~/pictures/screenshots")
        , ((0, xK_Print), spawn "scrot $f mv ~/pictures/screenshots")
        ]


