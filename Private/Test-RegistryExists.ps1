function Test-RegistryExist {
	param (
		[parameter(Mandatory=$False)]	
			[string] $ComputerName,
		[parameter(Mandatory=$False)]
			[string] $LogFile = '' ,
		[parameter(Mandatory=$True)]
			[string] $KeyName,
		[parameter(Mandatory=$False)]
			[string] $AccessType = 'LocalMachine'
	)
	Write-Log -Message "function... Test-RegistryExists ****" -LogFile $logfile
	Write-Log -Message "computer... $ComputerName" -LogFile $logfile
	Write-Log -Message "accesstype. $AccessType" -LogFile $logfile
	Write-Log -Message "keyname.... $KeyName" -LogFile $logfile
	try {
		$Reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($AccessType, $ComputerName)
		$RegKey = $Reg.OpenSubKey($KeyName)
		$result = ($RegKey -ne $null)
	}
	catch {
		$result = "ERROR: Unknown"
		$Error.Clear()
	}
	Write-Output $result
}