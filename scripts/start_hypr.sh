#!/bin/bash

# Special script for running Hyprland in a VM.
# I'm just tired of rewriting this every single time.

export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER_ALLOW_SOFTWARE=1
exec Hyprland
