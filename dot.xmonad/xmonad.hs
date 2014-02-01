import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.Script
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.CustomKeys
import XMonad.Layout
import XMonad.Layout.Spiral
import XMonad.Layout.MultiColumns

import XMonad.StackSet as W



myLayout = avoidStruts $ 
        multiCol [master] aux delta ratio
        ||| spiral (5/7)
        ||| tiled
        ||| Full
    where
        tiled = Tall master delta ratio
        master = 1
        aux = 2
        ratio = 1/2
        delta = 2/100


main = do
        xmproc <- spawnPipe "/usr/bin/xmobar /home/nathan/.xmobar/xmobar.rc"
        xmonad $ defaultConfig
                { manageHook = manageDocks <+> manageHook defaultConfig
                , startupHook = spawn "/home/nathan/.xmonad/startup.rc"
                , layoutHook = myLayout
                , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
                , terminal = "terminator"
                } `additionalKeys`
                [ ((0, 0x1008ff11), spawn "pactl set-sink-volume @DEFAULT_SINK@ -- -1dB")
                , ((0, 0x1008ff13), spawn "pactl set-sink-volume @DEFAULT_SINK@ +1dB")
                , ((0, 0x1008ff03), spawn "xbacklight - 15")
                , ((0, 0x1008ff02), spawn "xbacklight + 15")
                , ((0, 0x1008ff1d), spawn "xcalc")
                ]
