#########################################################################
# Author:  Kevin RAHETILAHY                                             #   
# Blog: dev4sys.blogspot.fr                                             #
#########################################################################

#########################################################################
#                        Add shared_assemblies                          #
#########################################################################

[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\System.Windows.Interactivity.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')      | out-null  
[System.Reflection.Assembly]::LoadFrom('assembly\WpfAppBar.dll')      | out-null  

#########################################################################
#                        Load Main Panel                                #
#########################################################################

$Global:pathPanel= split-path -parent $MyInvocation.MyCommand.Definition
function LoadXaml ($filename){
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}
$XamlMainWindow=LoadXaml($pathPanel+"\Main.xaml")
$reader = (New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form = [Windows.Markup.XamlReader]::Load($reader)


#########################################################################
#                   Initialize default control                          #
#########################################################################

$Explorerbtn = $Form.findName("Explorerbtn")
$ConfigPanelBtn = $Form.findName("ConfigPanelBtn")
$CloseBtn = $Form.findName("CloseBtn")
$UndockBtn = $Form.findName("UndockBtn")

#########################################################################
#                  Load external Scripts                                #
#########################################################################
$ScriptPath = $pathPanel +"\scripts"
."$ScriptPath\shortcut.ps1"  


#########################################################################
#                        Event                                          #
#########################################################################

$ConfigPanelBtn.add_Click({
    control.exe
})

$Explorerbtn.add_Click({
    explorer.exe
})

$CloseBtn.add_Click({
    $Form.close()
})

$UndockBtn.add_Click({
    $toNothing = [WpfAppBar.ABEdge]::None
    [WpfAppBar.AppBarFunctions]::SetAppBar($Form, $toNothing)

})

#########################################################################
#                        Show Dialog                                    #
#########################################################################


[System.Windows.RoutedEventHandler]$delegateWindow = {
    Write-Host "Window Loaded"
    $topScreen = [WpfAppBar.ABEdge]::Top
    [WpfAppBar.AppBarFunctions]::SetAppBar($Form, $topScreen)
}

$Form.AddHandler([System.Windows.Window]::LoadedEvent, $delegateWindow)



# align to top screen 
$Form.Left = ([System.Windows.SystemParameters]::PrimaryScreenWidth - $Form.Width)/2
$Form.ShowDialog() | Out-Null
  
