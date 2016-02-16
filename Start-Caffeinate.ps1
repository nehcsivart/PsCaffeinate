<#
  .SYNOPSIS
  Prevents the display from going to sleep.
  .PARAMETER timeout
  Specify the number of seconds to wait before sending a keystroke.
  This value should be less than the timeout for screen sleep.
  .PARAMETER second
  Specify the number of seconds to be active.
  If no values are provided, the function will be active indefinitely. 
  .DESCRIPTION
  Prevents the display from going to sleep.

  User should specify $timeout, which should be less than display sleep time.
  See Parameters for default $timeout value.

  User can specify Verbose to display information.

  This script can be limited to run only for a finite time using the $duration parameter.
  The $duration parameter should be more than $timeout.

  This Script was created by Travis Chen.
  This Script was inspired by Dmitry Sotnikov's blog.
  See Related Links.
  .EXAMPLE
  Start-Caffeinate
  Do an indefinite caffeination using the default $timeout value.
  .EXAMPLE
  Start-Caffeinate -Verbose -timeout 60
  Do an indefinite caffeination using a $timeout value of 60 seconds.
  Also prints out processing information.
  .EXAMPLE
  Start-Caffeinate -timeout 120 -duration 240
  Do a finite caffeination using a timeout value of 2 minutes.
  Runs for 4 minutes and quits.
  .LINK
  https://dmitrysotnikov.wordpress.com/2009/06/29/prevent-desktop-lock-or-screensaver-with-powershell/
#>
function Start-Caffeinate {
  param(
    [Parameter(Mandatory = $false, Position = 1)]
    [System.Int32]
    $timeout = 30 ,
    [Parameter(Mandatory = $false, Position = 1)]
    [System.Int32]
    $duration = -1
  )

  $ts = New-Object -ComObject "WScript.Shell"
  $passedTime = 0

  if( $duration -lt 1 ) {
    Write-Verbose "Starting Infinite Caffeination"
    Write-Verbose "timeout : $timeout s"
    while( $true ) {
      Start-Sleep -Seconds $timeout
      $passedTime += $timeout
      Write-Verbose "Caffeinated for $passedTime seconds"
      $ts.SendKeys("{CAPSLOCK}{CAPSLOCK}")
    }
  } else {
    Write-Verbose "Starting Finite Caffeination"
    Write-Verbose "timeout : $timeout s"
    if( $duration -lt $timeout ) { 
      Start-Sleep -Seconds $duration
    } else { 
      for( $i = 0; $i -lt $duration; $i += $timeout ) {
        Start-Sleep -Seconds $timeout
        $passedTime += $timeout
        Write-Verbose "Caffeinated for $passedTime seconds"
        $ts.SendKeys("{CAPSLOCK}{CAPSLOCK}")
      }
    }
  }
}
