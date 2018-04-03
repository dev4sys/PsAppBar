$observableCollection = [System.Collections.ObjectModel.ObservableCollection[Object]]::new()

# Row 1
$objArray = New-Object PSObject
$objArray | Add-Member -type NoteProperty -name ComputerName -value "Computer_03"
$objArray | Add-Member -type NoteProperty -name IP_Adress -value "192.168.0.0"
$objArray | Add-Member -type NoteProperty -name Domain -value "Domain0"
$objArray | Add-Member -type NoteProperty -name Patch -value $true
$objArray | Add-Member -type NoteProperty -name optional -value "gogo"
$observableCollection.Add($objArray) | Out-Null

# Row 3
$objArray = New-Object PSObject
$objArray | Add-Member -type NoteProperty -name ComputerName -value "Computer_10"
$objArray | Add-Member -type NoteProperty -name IP_Adress -value "192.168.1.1"
$objArray | Add-Member -type NoteProperty -name Domain -value "Domain2"
$objArray | Add-Member -type NoteProperty -name Patch -value $true
$objArray | Add-Member -type NoteProperty -name optional -value "gaga"
$observableCollection.Add($objArray) | Out-Null

# Row 2         
$objArray = New-Object PSObject
$objArray | Add-Member -type NoteProperty -name ComputerName -value "Computer_32"
$objArray | Add-Member -type NoteProperty -name IP_Adress -value "192.168.2.0"
$objArray | Add-Member -type NoteProperty -name Domain -value "Domain3"
$objArray | Add-Member -type NoteProperty -name Patch -value $false
$objArray | Add-Member -type NoteProperty -name optional -value "gigi"
$observableCollection.Add($objArray) | Out-Null






