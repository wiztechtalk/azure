Connect-AzAccount -UseDeviceAuthentication

#Default Resource parameters
$myRGname = "mypsRG1"
$myLocation = "EastUS"
$myVNETname = "mypsVNET10-1"

#Linux VM parameters
$LinuxVMSize = "Standard_B1ls"
$LinuxImage = "UbuntuLTS"

#Windows VM parameters
$WinVMSize = "Standard_B1s"
$WinImage = "WindowsServer2019Datacenter"

#Required Tag parameters
$myTag = New-AzTag -Name "Department" -Value "IT"

#Create the Resource Group
New-AzResourceGroup -Name $myRGname `
                    -Location $myLocation

#Create the Subnets
$mySubnet1 = New-AzVirtualNetworkSubnetConfig -Name "mypsSubnet0" `
                                            -AddressPrefix "10.1.0.0/24"

$mySubnet2 = New-AzVirtualNetworkSubnetConfig -Name "mypsSubnet1" `
                                            -AddressPrefix "10.1.1.0/24"

#Create the VNet
New-AzVirtualNetwork -Name $myVNETname `
                    -Location $myLocation `
                    -ResourceGroupName $myRGname `
                    -AddressPrefix "10.1.0.0/16" `
                    -Subnet $mySubnet1,$mySubnet2

# Create the VM
New-AzVM -Name "mypsVM1" `
        -ResourceGroupName $myRGname `
        -Location $myLocation `
        -VirtualNetworkName $myVNETname `
        -SubnetName "mypsSubnet1" `
        -Image $WinImage `
        -Size $WinVMSize

#New-AzVM -Name "test" -Location $myLocation -ResourceGroupName $myRGname

# Clean up the resources
Remove-AzResourceGroup $myRGname -Force -Verbose
