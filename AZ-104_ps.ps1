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
$WinImage = "WindowsServer2019Datacenter"Connect-AzAccount -UseDeviceAuthentication

#Default Resource parameters
<<<<<<< HEAD
$myRGname = Read-host -Prompt "Enter the Resource Group" # "mypsRG2"
$myLocation = Read-host -Prompt "Enter the Location (e.g. eastus)" # "EastUS"
$myVNETname = Read-host -Prompt "Enter the VNet Name" # "mypsVNET10-1"

$VMtype = Read-host -Prompt "Select OS type: (1=Linux or 2=Windows) Default=2 "

if($VMtype = 1){
        #Linux VM parameters
        $VMSize = "Standard_B1ls"
        $Image = "UbuntuLTS"
        } 
else {
        #Windows VM parameters
        $VMSize = "Standard_B1s"
        $Image = "WindowsServer2019Datacenter"
        }
=======
$myRGname = "mypsRG1"
$myLocation = "EastUS"
$myVNETname = "mypsVNET10-1"

#Linux VM parameters
$LinuxVMSize = "Standard_B1ls"
$LinuxImage = "UbuntuLTS"

#Windows VM parameters
$WinVMSize = "Standard_B1s"
$WinImage = "WindowsServer2019Datacenter"
>>>>>>> 6623cb1a9d14b9ee7e6cc6521d4c6acd2460d829

#Required Tag parameters
$myTag = New-AzTag -Name "Department" -Value "IT"

#Create the Resource Group
New-AzResourceGroup -Name $myRGname `
<<<<<<< HEAD
                    -Location $myLocation `
                    -Force
=======
                    -Location $myLocation
>>>>>>> 6623cb1a9d14b9ee7e6cc6521d4c6acd2460d829

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
<<<<<<< HEAD
                    -Subnet $mySubnet1,$mySubnet2 `
                    -Force
=======
                    -Subnet $mySubnet1,$mySubnet2
>>>>>>> 6623cb1a9d14b9ee7e6cc6521d4c6acd2460d829

# Create the VM
New-AzVM -Name "mypsVM1" `
        -ResourceGroupName $myRGname `
        -Location $myLocation `
        -VirtualNetworkName $myVNETname `
        -SubnetName "mypsSubnet1" `
<<<<<<< HEAD
        -Image $Image `
        -Size $VMSize `
        -AsJob -Confirm

Get-Job -Newest

#New-AzVM -Name "test" -Location $myLocation -ResourceGroupName $myRGname

# Clean up the resource
Remove-AzResourceGroup $myRGname -Force -Verbose

#Creating a template
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$storageAccountName = Read-Host -Prompt "Enter the storage account name"

# Create the storage account.
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
  -Name $storageAccountName `
  -Location $location `
  -SkuName "Standard_LRS"

# Retrieve the context.
$ctx = $storageAccount.Context
=======
        -Image $WinImage `
        -Size $WinVMSize

#New-AzVM -Name "test" -Location $myLocation -ResourceGroupName $myRGname

# Clean up the resources
Remove-AzResourceGroup $myRGname -Force -Verbose
>>>>>>> 6623cb1a9d14b9ee7e6cc6521d4c6acd2460d829


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
