# Get all PnP devices and filter by FriendlyName for touchscreen
$touchscreen = Get-PnpDevice | Where-Object { $_.FriendlyName -like "*touch screen*" }

if ($touchscreen) {
    # Check the current state of the device (enabled or disabled)
    if ($touchscreen.Status -eq "OK") {
        # Device is enabled, so disable it
        Disable-PnpDevice -InstanceId $touchscreen.InstanceId -Confirm:$false
        Write-Host "Touchscreen Disabled."
    } else {
        # Device is disabled, so enable it
        Enable-PnpDevice -InstanceId $touchscreen.InstanceId -Confirm:$false
        Write-Host "Touchscreen Enabled."
    }
} else {
    Write-Host "Touchscreen not found."
}
