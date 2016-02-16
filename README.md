# PsCaffeinate
PsCaffeinate is a PowerShell utility to temporarily disable display sleep.

*Installation*

1. Download this repository (PsCaffeinate).
2. Move the repo into your Modules directory. This is any location in `$env:PSModulePath`.

_Hint : Add `caffeinate` as an alias to use this like the Mac version._ 

*Usage*

    Start-Caffeinate [[-timeout] <Int32>] [[-duration] <Int32>] [<CommonParameters>]`

You may need to adjust the timeout depending on the time it takes for your display to go to sleep. In general, timeout (default is 30 seconds) should be less than the time it takes for your display to sleep.

The duration allows you to set how long Start-Caffeinate will run.

For more help, use the help command:

    Get-Help Start-Caffeinate

Or:

    Start-Caffeinate -?



