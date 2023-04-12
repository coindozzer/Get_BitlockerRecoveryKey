#
# Enter a PC name and get the Bit-Locker recovery key
#

#enter pc between ""
$computerName = ""

#Get AD Computer Objects 
$computer = Get-ADComputer -Identity $ComputerName

#Get recoveryinformation
$recoveryInformation = Get-ADObject -Filter 'objectClass -eq "msFVE-RecoveryInformation"' -SearchBase $computer.DistinguishedName -Properties *

#write every BIT-Locker RecoveryKey that is found to the item in the terminal # its not always the newst
foreach ($item in $recoveryInformation) {
    $item.createTimeStamp
    $item.'msFVE-RecoveryPassword'
}
