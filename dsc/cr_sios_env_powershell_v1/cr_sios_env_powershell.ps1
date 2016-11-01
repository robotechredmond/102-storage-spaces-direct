param( [string]$script_param_configpath,
       [string]$script_param_logintype,
       [int]$script_param_verbosemode )


#################################################################################
# global variables
#################################################################################


[string]${global:subscriptionname}            = ''
[string]${global:testconfigfile}              = "azure_fs_ha_test_config.txt"
[string]${global:localtempdir}                = ''

[string]${global:testOSimage}                 = ''
[string]${global:testOSimagetype}             = ''
[string]${global:testprefix}                  = ''
[string]${global:testregion}                  = '' 

[string]${global:testavset}                   = ''
[string]${global:teststorageaccount}          = ''
[string]${global:teststorageaccountlabel}     = ''
[string]${global:teststoragecontainer}        = ''

[string]${global:testvmdcname}                = ''
[string]${global:testvmdcaddr}                = ''
[string]${global:testvmdcsize}                = ''
[string]${global:testvmdccloudservice}        = ''

[string]${global:testvmcl1name}               = ''
[string]${global:testvmcl1addr}               = ''
[string]${global:testvmclsize}                = ''
[string]${global:testvmcl2name}               = ''
[string]${global:testvmcl2addr}               = ''
[string]${global:testvmclcloudservice}        = ''

[string]${global:testvnet}                    = ''
[string]${global:testvnetconfig}              = ''

[string]${global:testdcsetupscript}           = ''
[string]${global:testdcsetupscriptname}       = ''
[string]${global:testdcsetupstartscript}      = ''
[string]${global:testdcsetupstartscriptname}  = ''

[string]${global:testdcsetupscript2}          = ''
[string]${global:testdcsetupscriptname2}      = ''
[string]${global:testdcsetupstartscript2}     = ''
[string]${global:testdcsetupstartscriptname2} = ''

[string]${global:testdcsetupscript3}          = ''
[string]${global:testdcsetupscriptname3}      = ''
[string]${global:testdcsetupstartscript3}     = ''
[string]${global:testdcsetupstartscriptname3} = ''


[string]${global:testdcsetupscript4}          = ''
[string]${global:testdcsetupscriptname4}      = ''
[string]${global:testdcsetupstartscript4}     = ''
[string]${global:testdcsetupstartscriptname4} = ''

[string]${global:testclnodesetupscript1}          = ''
[string]${global:testclnodesetupscriptname1}      = ''
[string]${global:testclnodesetupstartscript1}     = ''
[string]${global:testclnodesetupstartscriptname1} = ''

[string]${global:testclnodesetupscript2}          = ''
[string]${global:testclnodesetupscriptname2}      = ''  
[string]${global:testclnodesetupstartscript2}     = ''
[string]${global:testclnodesetupstartscriptname2} = ''


[string]${global:testclnodesetupscript3}          = ''
[string]${global:testclnodesetupscriptname3}      = ''
[string]${global:testclnodesetupstartscript3}     = ''
[string]${global:testclnodesetupstartscriptname3} = ''

[string]${global:testclnodesetupscript4}          = ''
[string]${global:testclnodesetupscriptname4}      = ''
[string]${global:testclnodesetupstartscript4}     = ''
[string]${global:testclnodesetupstartscriptname4} = ''

[string]${global:testclnodesetupscript5}          = ''
[string]${global:testclnodesetupscriptname5}      = ''
[string]${global:testclnodesetupstartscript5}     = ''
[string]${global:testclnodesetupstartscriptname5} = ''

[string]${global:testclnodesetupscript6}          = ''
[string]${global:testclnodesetupscriptname6}      = ''
[string]${global:testclnodesetupstartscript6}     = ''
[string]${global:testclnodesetupstartscriptname6} = ''


[string]${global:testclusterquorumfilesharename}  = ''
[string]${global:testclusterquorumfilesharepath}  = ''

[string]${global:testclustername}                 = ''
[string]${global:testclusteraddr}                 = ''
[string]${global:testclusterstorage}              = ''
[string]${global:testclusterfsgroupname}          = ''
[string]${global:testclusterfsgroupaddr}          = ''
[string]${global:testclusterfssharepath}          = ''
[string]${global:testclusterfssharename}          = ''
[string]${global:testilbaddress}                  = ''
[string]${global:testilbprobeport}                = ''

[string]${global:testdomain}                      = ''
[string]${global:testforwarddns}                  = ''

[string]${global:testuser}                        = ''
[string]${global:testpassword}                    = ''

[int]${global:testfailureretries}                 = 0
[int]${global:testfailureretryinterval}           = 0
[int]${global:testcheckinterval}                  = 0

${global:storagecontext} 


#################################################################################
# function to set global variables
#################################################################################

function set_global_variables {

$cmdret = set-variable -name testuser -value ("fstest") -scope global -force
$cmdret = set-variable -name testpassword -value ("Azure4U!!") -scope global -force

$cmdret = set-variable -name localtempdir -value ("C:\Temp\") -scope global -force

$cmdret = set-variable -name testavset  -value ( ${global:testprefix}+"-avset" ) -scope global -force 
$cmdret = set-variable -name teststorageaccount -value (${global:testprefix}+"stac")  -scope global -force
$cmdret = set-variable -name teststorageaccountlabel -value (${global:teststorageaccount}) -scope global -force
$cmdret = set-variable -name teststoragecontainer -value ("scripts") -scope global -force

$cmdret = set-variable -name testvmdcname -value (${global:testprefix}+"-dc") -scope global -force
$cmdret = set-variable -name testvmdcaddr -value ("10.0.0.10") -scope global -force
$cmdret = set-variable -name testvmdcsize -value ("Medium") -scope global -force
$cmdret = set-variable -name testvmdccloudservice -value (${global:testprefix}+"-csdc") -scope global -force

$cmdret = set-variable -name testvmcl1name -value (${global:testprefix}+'-cln1') -scope global -force
$cmdret = set-variable -name testvmcl1addr -value ("10.0.0.12") -scope global -force
$cmdret = set-variable -name testvmclsize -value ("Medium") -scope global -force
$cmdret = set-variable -name testvmcl2name -value (${global:testprefix}+'-cln2') -scope global -force
$cmdret = set-variable -name testvmcl2addr -value ("10.0.0.14") -scope global -force
$cmdret = set-variable -name testvmclcloudservice -value (${global:testprefix}+"-cscl") -scope global -force

$cmdret = set-variable -name testvnetconfig -value ( ${global:localtempdir} + 'vnetconfig.netcfg' ) -scope global -force

$cmdret = set-variable -name testdcsetupscriptname -value ("dcsetup.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupstartscriptname -value ("dcsetupstart.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupscript -value ( ${global:localtempdir} + ${global:testdcsetupscriptname} ) -scope global -force
$cmdret = set-variable -name testdcsetupstartscript -value ( ${global:localtempdir} + ${global:testdcsetupstartscriptname} ) -scope global -force

$cmdret = set-variable -name testdcsetupscriptname2 -value ("dcsetup2.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupstartscriptname2 -value ("dcsetupstart2.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupscript2 -value ( ${global:localtempdir} + ${testdcsetupscriptname2} ) -scope global -force
$cmdret = set-variable -name testdcsetupstartscript2 -value ( ${global:localtempdir} + ${global:testdcsetupstartscriptname2} ) -scope global -force

$cmdret = set-variable -name testdcsetupscriptname3 -value ("dcsetup3.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupstartscriptname3 -value ("dcsetupstart3.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupscript3 -value ( ${global:localtempdir} + ${testdcsetupscriptname3} ) -scope global -force
$cmdret = set-variable -name testdcsetupstartscript3 -value ( ${global:localtempdir} + ${global:testdcsetupstartscriptname3} ) -scope global -force

$cmdret = set-variable -name testdcsetupscriptname4 -value ("dcsetup4.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupstartscriptname4 -value ("dcsetupstart4.ps1") -scope global -force
$cmdret = set-variable -name testdcsetupscript4 -value ( ${global:localtempdir} + ${testdcsetupscriptname4} ) -scope global -force
$cmdret = set-variable -name testdcsetupstartscript4 -value ( ${global:localtempdir} + ${global:testdcsetupstartscriptname4} ) -scope global -force

$cmdret = set-variable -name testclnodesetupscriptname1 -value ("clnodesetup1.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupstartscriptname1 -value ("clnodesetupstart1.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupscript1 -value ( ${global:localtempdir} + ${global:testclnodesetupscriptname1} ) -scope global -force
$cmdret = set-variable -name testclnodesetupstartscript1 -value (${global:localtempdir} + ${global:testclnodesetupstartscriptname1} ) -scope global -force

$cmdret = set-variable -name testclnodesetupscriptname2 -value ("clnodesetup2.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupstartscriptname2 -value ("clnodesetupstart2.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupscript2 -value ( ${global:localtempdir} + ${global:testclnodesetupscriptname2} ) -scope global -force
$cmdret = set-variable -name testclnodesetupstartscript2 -value (${global:localtempdir} + ${global:testclnodesetupstartscriptname2} ) -scope global -force

$cmdret = set-variable -name testclnodesetupscriptname3 -value ("clnodesetup3.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupstartscriptname3 -value ("clnodesetupstart3.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupscript3 -value ( ${global:localtempdir} + ${global:testclnodesetupscriptname3} ) -scope global -force
$cmdret = set-variable -name testclnodesetupstartscript3 -value (${global:localtempdir} + ${global:testclnodesetupstartscriptname3} ) -scope global -force

$cmdret = set-variable -name testclnodesetupscriptname4 -value ("clnodesetup4.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupstartscriptname4 -value ("clnodesetupstart4.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupscript4 -value ( ${global:localtempdir} + ${global:testclnodesetupscriptname4} ) -scope global -force
$cmdret = set-variable -name testclnodesetupstartscript4 -value (${global:localtempdir} + ${global:testclnodesetupstartscriptname4} ) -scope global -force

$cmdret = set-variable -name testclnodesetupscriptname5 -value ("clnodesetup5.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupstartscriptname5 -value ("clnodesetupstart5.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupscript5 -value ( ${global:localtempdir} + ${global:testclnodesetupscriptname5} ) -scope global -force
$cmdret = set-variable -name testclnodesetupstartscript5 -value (${global:localtempdir} + ${global:testclnodesetupstartscriptname5} ) -scope global -force

$cmdret = set-variable -name testclnodesetupscriptname6 -value ("clnodesetup6.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupstartscriptname6 -value ("clnodesetupstart6.ps1") -scope global -force
$cmdret = set-variable -name testclnodesetupscript6 -value ( ${global:localtempdir} + ${global:testclnodesetupscriptname6} ) -scope global -force
$cmdret = set-variable -name testclnodesetupstartscript6 -value (${global:localtempdir} + ${global:testclnodesetupstartscriptname6} ) -scope global -force


$cmdret = set-variable -name testclusterquorumfilesharename -value (${global:testprefix} + "-dcfs") -scope global -force
$cmdret = set-variable -name testclusterquorumfilesharepath -value ("C:\"+ ${global:testclusterquorumfilesharename}) -scope global -force

$cmdret = set-variable -name testclustername -value (${global:testprefix} + "cl") -scope global -force
$cmdret = set-variable -name testclusteraddr -value ('10.0.0.20') -scope global -force
$cmdret = set-variable -name testclusterstorage -value ("DataKeeper Volume S") -scope global -force

$cmdret = set-variable -name testclusterfsgroupname -value (${global:testprefix} + "fsrole") -scope global -force
$cmdret = set-variable -name testclusterfsgroupaddr -value ('10.0.0.100') -scope global -force
$cmdret = set-variable -name testclusterfssharename -value (${global:testprefix} + "_share") -scope global -force
$cmdret = set-variable -name testclusterfssharepath -value ("S:\Shares\" + ${global:testclusterfssharename}) -scope global -force
$cmdret = set-variable -name testilbaddress -value ('10.0.0.99') -scope global -force
$cmdret = set-variable -name testilbprobeport -value ("59999") -scope global -force

$cmdret = set-variable -name testdomain -value (${global:testprefix}+'domain.com') -scope global -force
$cmdret = set-variable -name testforwarddns -value ('8.8.8.8') -scope global -force

$cmdret = set-variable -name testfailureretries -value ( 15 ) -scope global -force
$cmdret = set-variable -name testfailureretryinterval -value ( 120 ) -scope global -force
$cmdret = set-variable -name testcheckinterval -value ( 60 ) -scope global -force
}


#################################################################################
# function to display values of global variables / test objects
#################################################################################

function display_current_namespace {

clear-host
display_text '' 0 1
display_text 'The script will use the following object names :' 0 1
display_text '' 0 1
display_text '' 0 1

$text = 'Azure region                                                  : ' + ${global:testregion}
display_text $text 0 1

$text = 'Azure subscription                                            : ' + ${global:subscriptionname}
display_text $text 0 1

$text = 'Prefix for the test objects                                   : ' + ${global:testprefix} 
display_text $text 0 1

$text = 'Azure OS image used for test VMs                              : ' + ${global:testOSimage}
display_text $text 0 1

$text = 'Azure OS image type for test VMs                              : ' + ${global:testOSimagetype} 
display_text $text 0 1

$text = 'Config file for main PS script                                : ' + ${global:testconfigfile}
display_text $text 0 1

$text = 'Local temp dir used for PS scripts and network config file    : ' + ${global:localtempdir}
display_text $text 0 1

display_text '' 0 1


$text = 'Vnet                                                          : ' + ${global:testvnet}
display_text $text 0 1

$text = 'Local temp vnet config file to create/update Azure vnet       : ' + ${global:testvnetconfig}
display_text $text 0 1

$text = 'Storage account                                               : ' + ${global:teststorageaccount}
display_text $text 0 1

$text = 'Storage container for PS scripts ( custom script extension )  : ' + ${global:teststoragecontainer}
display_text $text 0 1

$text = 'Cloud service for domain controller VM                        : ' + ${global:testvmdccloudservice}
display_text $text 0 1

$text = 'Domain controller VM                                          : ' + ${global:testvmdcname}
display_text $text 0 1

$text = 'Internal ip address of domain controller VM                   : ' + ${global:testvmdcaddr}
display_text $text 0 1

$text = 'Intstance size of domain controller VM                        : ' + ${global:testvmdcsize}
display_text $text 0 1

$text = 'Cloud service for two cluster node VMs                        : ' + ${global:testvmclcloudservice}
display_text $text 0 1

$text = 'First cluster node VM                                         : ' + ${global:testvmcl1name} 
display_text $text 0 1

$text = 'Internal ip address of first cluster node VM                  : ' + ${global:testvmcl1addr}
display_text $text 0 1

$text = 'Second cluster node VM                                        : ' + ${global:testvmcl2name} 
display_text $text 0 1

$text = 'Internal ip address of second cluster node VM                 : ' + ${global:testvmcl2addr} 
display_text $text 0 1

$text = 'Intstance size of cluster node VMs                            : ' + ${global:testvmclsize} 
display_text $text 0 1


$text = 'Domain                                                        : ' + ${global:testdomain}
display_text $text 0 1

$text = 'Cluster                                                       : ' + ${global:testclustername}
display_text $text 0 1

$text = 'Internal ip address of cluster                                : ' + ${global:testclusteraddr}
display_text $text 0 1

$text = 'Name of cluster storage created by SIOS Datakeeper            : ' + ${global:testclusterstorage}
display_text $text 0 1

$text = 'Cluster quorum file share ( on domain controller VM )         : ' + ${global:testclusterquorumfilesharename}
display_text $text 0 1

$text = 'Path of cluster quorum file share ( on domain controller VM ) : ' + ${global:testclusterquorumfilesharepath}
display_text $text 0 1

$text = 'Name of cluster file server role                              : ' + ${global:testclusterfsgroupname}
display_text $text 0 1

$text = 'Internal ip address of cluster file server role               : ' + ${global:testclusterfsgroupaddr}
display_text $text 0 1

$text = 'Name of file share to test high availability                  : ' + ${global:testclusterfssharename}
display_text $text 0 1

$text = 'Path of file share to test high availability                  : ' + ${global:testclusterfssharepath}
display_text $text 0 1

$text = 'Internal ip address of internal load balancer                 : ' + ${global:testilbaddress}
display_text $text 0 1

$text = 'Internal load balancer probe port                             : ' + ${global:testilbprobeport}
display_text $text 0 1

$text = 'Command failure retries                                       : ' + ${global:testfailureretries} 
display_text $text 0 1

$text = 'Command failure retry interval in secs                        : ' + ${global:testfailureretryinterval} 
display_text $text 0 1

$text = 'Check interval in secs ( e.g. while waiting for VM status )   : ' + ${global:testcheckinterval}  
display_text $text 0 1



display_text '' 0 1
display_text 'Local path of PS scripts used for custom script extension to set up VMs.' 0 1
display_text 'These scripts will be uploaded to the Azure storage container : ' 0 1
display_text '' 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupscript}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupstartscript}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupscript2}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupstartscriptname2}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupscript3}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupstartscriptname3}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupscript4}
display_text $text 0 1

$text = 'PS script for domain controller VM setup : ' + ${global:testdcsetupstartscriptname4}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupscript1}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupstartscript1}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupscript2}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupstartscript2}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupscript3}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupstartscript3}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupscript4} 
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupstartscript4}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupscript5} 
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupstartscript5}
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupscript6} 
display_text $text 0 1

$text = 'PS script for cluster node VM setup      : ' + ${global:testclnodesetupstartscript6}
display_text $text 0 1
}


#################################################################################
# function to set subscription and current storage account
#################################################################################

function set_subenv {

$cmdret = select-azuresubscription -subscriptionname ${global:subscriptionname}
$myserviceendpoint = "https://management.core.windows.net"
$cmdret = set-azuresubscription -subscriptionname ${global:subscriptionname} -Currentstorageaccountname ${global:teststorageaccount}  -serviceendpoint $myserviceendpoint
 
}



#################################################################################
# function to display menu items and return the number of the selected item
#################################################################################

function get_menu_selection {
param ( [array]$menu_items,
        [string]$prompt_text,
        [REF]$return_value )

[int]$selection = 0
[boolean]$is_correct_number = $false

display_menu_items $menu_items

do {
   $user_input = read-host $prompt_text
   $cmdret = is_numeric $user_input 1 $menu_items.length ([REF]$is_correct_number)
   
   if( $is_correct_number -eq $true )
       {
       $selection = [int]$user_input
       }
   else 
       {
       $selection = -1
       }

   if ( $selection -eq -1 )
       { display_text "" 0 1
         display_error "Invalid input. Please try again." 
         display_text "" 0 1
         display_menu_items $menu_items }
   } while ( $selection -eq -1 )

$return_value.value = [string]$selection
}



#################################################################################
# function to display menu items and return the selected item string
#################################################################################

function display_menu_from_string {
param ( [string]$menu_items_string,
        [string]$prompt_text,
        [REF]$return_value )

[string]$selection = ''
$menu_item_array = $menu_items_string.split('|')

$cmdret = get_menu_selection $menu_item_array $prompt_text ([REF]$selection)

$return_value.value = $menu_item_array[[int]$selection-1]
}



#################################################################################
# function to allow selection of available subscriptions
#################################################################################

function choose_azure_subscription {
param ( [REF]$return_value )

[string]$snstring = ''
[string]$selected_azure_subscription = ''

clear-host
display_text '' 0 1
display_text 'get list of all available subscriptions' 0 1
display_text '' 0 1

$sns = get-azuresubscription | select subscriptionname

$len = $sns.length-1
for( $i = 0; $i -lt $len;$i++ )
    {
    $snstring += $sns[$i].subscriptionname + '|'
    }
$snstring += $sns[$i].subscriptionname


$prompt_text = "Please enter the number of the Azure subscription you want to use"

$cmdret = display_menu_from_string $snstring $prompt_text ([REF]$selected_azure_subscription)

$return_value.value = $selected_azure_subscription
}


#################################################################################
# function to allow selection of available Azure regions
#################################################################################

function choose_azure_location {
param ( [REF]$return_value )

[string]$locationstring = ''
[string]$selected_azure_region = ''

clear-host
display_text '' 0 1
display_text 'get list of all available regions' 0 1
display_text '' 0 1

$locations = get-azurelocation | select name

$len = $locations.length-1
for( $i = 0; $i -lt $len;$i++ )
    {
    $locationstring += $locations[$i].name + '|'
    }
$locationstring += $locations[$i].name

$prompt_text = "Please enter the number of the Azure region you want to use"

$cmdret = display_menu_from_string $locationstring $prompt_text ([REF]$selected_azure_region)

$return_value.value = $selected_azure_region
}


#################################################################################
# function to allow selection of either a private OS image or one of the public
# WS 2012 R2 images
#################################################################################

function choose_os_image {
param ( [REF]$return_value )

[string]$selection = ''

clear-host
display_text '' 0 1

[string]$image_selection_type = 'private OS image|WS2012 R2 OS image from Azure Gallery'
[string]$selected_osimagename = ''
$imagetype_selection = $image_selection_type.split('|')

$prompt_text = "Please enter the number of the OS image type you want to use"
$cmdret = get_menu_selection $imagetype_selection $prompt_text ([REF]$selection)

if( [int]$selection -eq 1 )
    {
    display_text '' 0 1
    display_text 'get list of available private OS images' 0 1
    display_text '' 0 1
    $private_os_images = get-azurevmimage | where-object { $_.category -eq 'user' }

    $len = $private_os_images.length-1
    for( $i = 0; $i -lt $len;$i++ )
        {
        $imagestring += $private_os_images[$i].imagename + '|'
        }
    $imagestring += $private_os_images[$i].imagename

    $prompt_text =  "Please enter the name of the private OS image ( .NET framework 3.5 already installed )"
    $cmdret = display_menu_from_string $imagestring $prompt_text ([REF]$selected_osimagename)

    ${global:testOSimagetype} = 'private'
    }
else
    {
    display_text '' 0 1
    display_text 'get list of available WS 2012 R2 images' 0 1
    display_text '' 0 1

    $ws2012r2_images = get-azurevmimage | where-object { $_.ImageFamily -like '*2012*R2*' -and $_.PublisherName -eq 'Microsoft Windows Server Group' }

    $len = $ws2012r2_images.length-1
    for( $i = 0; $i -lt $len;$i++ )
        {
        $imagestring += $ws2012r2_images[$i].imagename + '|'
        }
    $imagestring += $ws2012r2_images[$i].imagename

    $prompt_text = "Please enter the number of the Azure Gallery WS2012 R2 image you want to use"
    $cmdret = display_menu_from_string $imagestring $prompt_text ([REF]$selected_osimagename)
    
    ${global:testOSimagetype} = 'public'
    }

$return_value.value = $selected_osimagename
}


#################################################################################
# function to get all vnet names in form of a pipe-separated string
#################################################################################

function get_all_vnet_names  {
param (  [REF]$return_value )

[string]$all_vnets = $null
[int]$i

$xmlschema="http://schemas.microsoft.com/ServiceHosting/2011/07/NetworkConfiguration"
$vnetconfig = get-AzureVNetConfig
[xml]$vnetconfigxml = $vnetconfig.xmlconfiguration

$ns = new-object Xml.XmlNamespaceManager $vnetconfigxml.NameTable
$cmdret = $ns.AddNamespace("vnetns", $xmlschema)

$currvnets = $vnetconfigxml.SelectNodes("//vnetns:VirtualNetworkSite", $ns)

for( $i=0;$i -lt $currvnets.count; $i++ )
    {
     $all_vnets += [string]$currvnets[$i].name

     if( $i -lt $currvnets.count-1 )
      {
      $all_vnets += '|'
      }
    }

$return_value.value = $all_vnets
}



#################################################################################
# function to allow selection of either creating a new vnet or using an existing 
# one where the name might not follow the test prefix naming convention
#################################################################################

function choose_vnet {
param ( [string]$curr_testprefix,
        [REF]$return_value )

[string]$selection = ''
[string]$existing_vnets = ''
[string]$selected_vnetname = ''
[boolean]$affgrp_exists = $false

clear-host
display_text '' 0 1

[string]$vnet_selection_type = 'new Vnet|reuse existing Vnet'

$vnettype_selection = $vnet_selection_type.split('|')

$prompt_text = "Please enter the number of the test vnet name type you want to use"
$cmdret = get_menu_selection $vnettype_selection $prompt_text ([REF]$selection)

if( [int]$selection -eq 1 )
    {
    display_text '' 0 1
    if( $curr_testprefix )
        {
        display_text '' 0 1  
        $text =  'Adding "-vnet" to the testprefix "' + $curr_testprefix + '" as the vnet name'
        display_text $text 0 1
        $selected_vnetname = $curr_testprefix + '-vnet'
        $text = 'New vnet name : ' + $selected_vnetname
        display_text $text 0 1
        display_text '' 0 1
        press_any_key
        }
    else
        {
        display_text '' 0 1   
        display_error 'Test prefix not entered yet. Please enter test prefix first' 
        display_text '' 0 1
        press_any_key
        }
    }
else
    {
    display_text '' 0 1
    display_text 'get list of available vnet entries' 0 1
    display_text '' 0 1

    $cmdret = get_all_vnet_names ([REF]$existing_vnets)

    $prompt_text = "Please enter the number of the existing vnet you want to use"
    $cmdret = display_menu_from_string $existing_vnets $prompt_text ( [REF]$selected_vnetname )

    display_text '' 0 1
    display_text 'Check if selected vnet has an associated affinity group' 0 1
    display_text '' 0 1

    $cmdret = vnet_affgrp_exists $selected_vnetname ([REF]$affgrp_exists)
    if( $affgrp_exists -eq $true )
        {
        display_text '' 0 1  
        $text = 'The selected vnet "' + $selected_vnetname + '" has an associated affinity group.'
        display_error $text
        $text = 'This is not allowed for usage of the Azure Internal Load Balancer.'
        display_error $text
        $text = 'Please create a new vnet or change the existing vnet property from "affinity group"'
        display_error $text 
        $text = 'to "location" as described in the blog'
        display_error $text            
        $selected_vnetname = ''
        display_text '' 0 1  
        }
     else
        {
        display_text '' 0 1  
        $text = 'Ok. Selected vnet "' + $selected_vnetname + '" has no associated affinity group. Everything looks fine'
        display_text '' 0 1  
        }
    press_any_key
    }

$return_value.value = $selected_vnetname
}


#################################################################################
# function to display text on the console window
#################################################################################

function display_text {
param ( [string]$text,
        [int]$margin,
        [int]$newline )


    
switch ( $margin ) 
    { 
        1 {  $text = "    " + $text
             if( $newline -eq 1 ) 
                 {write-host $text -foregroundcolor white}
             else
                 {write-host -NoNewLine $text -foregroundcolor white}
             
             }
        2 {  $text = "        " + $text 
             if( $newline -eq 1 ) 
                 {write-host $text -foregroundcolor white}
             else
                 {write-host -NoNewLine $text -foregroundcolor white}
             
             }
        3 {  $text = "            " + $text 
             if( $newline -eq 1 ) 
                 {write-host $text -foregroundcolor white}
             else
                 {write-host -NoNewLine $text -foregroundcolor white}
             
             }
        default { 
                if( $newline -eq 1 ) 
                   {write-host $text -foregroundcolor white}
                else
                   {write-host -NoNewLine $text -foregroundcolor white}   
                
        }
     }
}


#################################################################################
# function to display warning text in yellow
#################################################################################

function display_warning {
param ( [string]$text )

write-host $text -foregroundcolor yellow
}


#################################################################################
# function to display warning text in green
#################################################################################

function display_ok_text_green {
param ( [string]$text )

write-host $text -foregroundcolor green
}


#################################################################################
# function to display error text in red
#################################################################################

function display_error {
param ( [string]$text )

write-host $text -foregroundcolor red
}


#################################################################################
# function to wait for user pressing RETURN
#################################################################################

function press_any_key {
param ( [string]$text ) 

if( $text )
    {
    display_text "" 0 1
    display_text "" 0 1
    display_text $text 0 1
    display_text "" 0 1
    }

display_text "" 0 1
display_text "Press RETURN to continue." 0 1
display_text "" 0 1

$input = read-host 
}


#################################################################################
# function to wait for user entering yes or no
#################################################################################

function user_input_yes_no {
param( [int]$margin,
       [REF]$return_value )

[string]$input

display_text '' $margin 1
display_text 'Enter y ( yes ) or n ( no ) : ' $margin 0

do {
   $input = read-host 
   if( $input -ne 'y' -and $input -ne 'n' )
       {
       display_text 'wrong input. Try again.' $margin 1
       display_text '' $margin 1
       display_text 'Enter y ( yes ) or n ( no ) : ' $margin 0
       }
} while ( $input -ne 'y' -and $input -ne 'n' )

$return_value.value = $input
}


#################################################################################
# function to check if user input string is numeric
#################################################################################

function is_numeric {
param ( [string]$text_input,
        [int]$refvalue1,
        [int]$refvalue2,
        [REF]$return_value )
   
[boolean]$is_number = $false 

$is_number = $text_input -match "^[0-9]+$"

if( $is_number -eq $true )
    {
    [int]$number_input = [int]$text_input
    if( ($number_input -lt $refvalue1) -or ( $number_input -gt $refvalue2 ) )
        { $is_number = $false }
    else
        { $is_number = $true }
    }

$return_value.value = $is_number
}


#################################################################################
# function to check string for special characters
#################################################################################

function is_special_characters {
param ( [string]$text_input,
        [REF]$return_value )
   
[boolean]$does_match = $false 
[boolean]$is_special = $false

$does_match = $text_input -match "^[a-zA-Z0-9]+$"

if( $does_match -eq $false )
    {
    $is_special = $true 
    }

$return_value.value = $is_special
}



#################################################################################
# function to display an array of strings in form of a menu list. The function
# will put increasing numbers in front of every string
#################################################################################

function display_menu_items {
param ( [array]$menu_items )

$num_items = $menu_items.length

for ( $i=1; $i -le $num_items; $i++ )
    {
    $text = $i.tostring() + " - " + $menu_items[$i-1]
    display_text $text 0 1
    }

display_text "" 0 1
}



#################################################################################
# function to display the main menu of the script. It will display the menu and
# add an "Exit" item at the end. Then it will wait for user input to select
# one of the menu items. Selection works via the numbers which are automatically
# put in front of every menu item
#################################################################################

function display_main_menu {
param ( [string]$menu_items,
        [REF]$return_value )

[string]$selection = ''

$menu_items = $menu_items + ",EXIT"

[Array]$single_menu_items = $menu_items.split(",");

clear-host
display_text "" 0 1

$prompt_text = "Please enter the number of your selection"
$cmdret = get_menu_selection $single_menu_items $prompt_text ([REF]$selection)

$return_value.value = $selection
}


#################################################################################
# function to create the storage context for the current storage account used
# for the test setup
#################################################################################

function storage_context {

$stac_key = Get-AzureStorageKey -StorageAccountName ${global:teststorageaccount}
$new_stac_context = New-AzureStorageContext -StorageAccountName ${global:teststorageaccount} -StorageAccountKey $stac_key.primary

${global:storagecontext} = $new_stac_context
}


#################################################################################
# function to check if the test storage container exists to which the PS scripts
# will be uploaded used by the Azure VM custom script extension
#################################################################################

function container_exists {
param ( [REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

$cmdret = storage_context
$container = Get-AzureStorageContainer -name  ${global:teststoragecontainer} -context ${global:storagecontext}

if( $container )
    { $exists = $true }
else
    { $exists = $false }

$ErrorActionPreference="Stop"

$return_value.value = $exists
}


#################################################################################
# function to check if the temp directory exists which will be used to generate
# the PS scripts for usgae by the Azure custum script extension
#################################################################################
function tempdir_exists {
param ( [REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

if( Test-Path ${global:localtempdir}  )
    { $exists = $true }

$ErrorActionPreference="Stop"

$return_value.value = $exists
}



#################################################################################
# function to check if a PS script exists in the test storage container
#################################################################################

function psscript_exists {
param ( [string]$scriptname,
        [REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

$cmdret = storage_context
$ps_script = Get-AzureStorageBlob -Container ${global:teststoragecontainer} -context ${global:storagecontext} | Where-Object {$_.Name -eq $scriptname}
if ( $ps_script ) 
    {  $exists = $true }
else
    {  $exists = $false }

$ErrorActionPreference="Stop"

$return_value.value = $exists
}




#################################################################################
# function to check if the standard "vhds" container exists. This will be used 
# for cleanup tasks
#################################################################################

function vhds_container_exists {
param ( [REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

$cmdret = storage_context
$container = Get-AzureStorageContainer -context ${global:storagecontext} | Where-Object { $_.Name -eq 'vhds' }

if( $container )
    { $exists = $true }

$ErrorActionPreference="Stop"

$return_value.value = $exists
}


#################################################################################
# function to check if the test storage account exists
#################################################################################

function storage_account_exists {
param ( [REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

$staccount = get-azurestorageaccount | Where-Object { $_.storageaccountname -eq ${global:teststorageaccount} }

if( $staccount )
    { $exists = $true }

$ErrorActionPreference="Stop"

$return_value.value = $exists 
}


#################################################################################
# function to check if the test OS image exists
#################################################################################

function osimage_exists {
param ( [string]$imgname,
        [REF]$return_value )

[boolean]$image_exists = $false

$osimage = Get-AzureVMImage | where-object { $_.ImageName -eq $imgname  } 

if( $osimage )
    { $image_exists = $true }

$return_value.value = $image_exists
}


#################################################################################
# function to check if subscription exists
#################################################################################

function subscription_exists {
param ( [string]$subname,
        [REF]$return_value )

[boolean]$sub_exists = $false

$sns = get-azuresubscription | select subscriptionname

foreach ( $single_sub in $sns )
    {
    if( $single_sub.subscriptionname -eq $subname )
        { $sub_exists = $true }
    }

$return_value.value = $sub_exists
}


#################################################################################
# function to check if Azure location exists
#################################################################################

function location_exists {
param ( [string]$locname,
        [REF]$return_value )

[boolean]$loc_exists = $false

$locations = get-azurelocation | select name

foreach ( $single_loc in $locations )
    {
    if( $single_loc.name -eq $locname )
        { $loc_exists = $true }
    }

$return_value.value = $loc_exists
}

#################################################################################
# function to check if a VM exists within a specific cloud service
#################################################################################

function virtual_machine_exists {
param(
[string]$servicename,
[string]$vmname,
[REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

$vm = get-azurevm | where-object { ($_.ServiceName -eq $servicename) -and ($_.Name -eq $vmname ) }

if( $vm )
    { 
    $exists = $true 
    }

$ErrorActionPreference="Stop"

$return_value.value = $exists
}


#################################################################################
# function to check if there is any virtual network
#################################################################################

function any_vnet_exists  {
param ( [REF]$return_value )

[boolean]$exists = $false

$xmlschema="http://schemas.microsoft.com/ServiceHosting/2011/07/NetworkConfiguration"
$vnetconfig = get-AzureVNetConfig
[xml]$vnetconfigxml = $vnetconfig.xmlconfiguration

$ns = new-object Xml.XmlNamespaceManager $vnetconfigxml.NameTable
$cmdret = $ns.AddNamespace("vnetns", $xmlschema)

$currvnets = $vnetconfigxml.SelectNodes("//vnetns:VirtualNetworkSite", $ns)

if( $currvnets )
    {
    $exists = $true
    }

$return_value.value = $exists
}


#################################################################################
# function to check if the test vnet exists
#################################################################################

function vnet_exists  {
param ([REF]$return_value )

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"

$test_vnet = Get-AzureVNetSite -VNetName ${global:testvnet}

if( $test_vnet )
    { $exists = $true }
else
    { $exists = $false }

$ErrorActionPreference="Stop"

$return_value.value = $exists
}


#################################################################################
# function to check if the test vnet has the test DC VM as the DNS entry
#################################################################################

function vnet_dns_entry_exists  {
param ( [REF]$return_value )

[boolean]$vnetexists = $false
[boolean]$dnsexists  = $false

$cmdret = vnet_exists ([REF]$vnetexists)

if( $vnetexists -eq $true )
    {
    $test_vnet = Get-AzureVNetSite -VNetName ${global:testvnet}
    if(  $test_vnet.dnsservers )
        {
        $dnsexists = $true
        }
    }

$return_value.value = $dnsexists
}


#################################################################################
# function to check if the test vnet has an associated affinity group.
# This is not supported for usage of ILB
#################################################################################

function vnet_affgrp_exists  {
param ( [string]$vnetname,
        [REF]$return_value )

[boolean]$vnetexists = $false
[boolean]$affgrpexists  = $false

$cmdret = vnet_exists ([REF]$vnetexists)

if( $vnetexists -eq $true )
    {
    $test_vnet = Get-AzureVNetSite -VNetName $vnetname
    if(  $test_vnet.AffinityGroup )
        {
        $affgrpexists = $true
        }
    }

$return_value.value = $affgrpexists
}


#################################################################################
# function to check if test objects already exist
#################################################################################

function testobjects_exist {
param ( [REF]$return_value )

$exists        = $false
$vnetexists    = $false
$objects_found = $false

clear-host
display_warning "Check for existing objects with the same name which the test setup is supposed to use"
display_text "" 0 1


$cmdret = vnet_exists ([REF]$vnetexists)

display_text "Check DNS entry in vnet" 0 1
if( $vnetexists -eq $true )
    {
    $cmdret = vnet_dns_entry_exists ([REF]$exists)
    if ( $exists -eq $true )
        {  $text = 'Found DNS entry "' + ${global:testvmdcname} + '" in vnet "' + ${global:testvnet} + '"'
           display_text $text 1 1       
           $objects_found = $true }
    else
        { 
        $text = 'No DNS entry found in vnet "' + ${global:testvnet} + '"'
        display_text $text 1 1
        }
    }
else
    {
    $text = 'No Vnet "' + ${global:testvnet} + '" found. No need to look for DNS entry'
    display_text $text 1 1
    }

display_text "Check domain controller VM" 0 1
$cmdret = virtual_machine_exists ${global:testvmdccloudservice} ${global:testvmdcname} ([REF]$exists)
if( $exists -eq $true )
    {  $text = 'Found VM "' + ${global:testvmdcname} + '"'
       display_text $text 1 1
       $objects_found = $true }
else
    {
    $text = 'No domain controller VM "' +  ${global:testvmdcname} + '" found'
    display_text $text 1 1
    }

display_text "Check cluster node 1" 0 1
$cmdret = virtual_machine_exists ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$exists)
if( $exists -eq $true )
    {  $text = 'Found VM "' + ${global:testvmcl1name} + '"'
       display_text $text 1 1
       $objects_found = $true }
else
    {
    $text = 'No cluster node 1 VM "' +  ${global:testvmcl1name} + '" found'
    display_text $text 1 1
    }

display_text "Check cluster node 2" 0 1
$cmdret = virtual_machine_exists ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$exists)
if( $exists -eq $true )
    {  $text = 'Found VM "' + ${global:testvmcl2name} + '"'
       display_text $text 1 1
       $objects_found = $true }
else
    {
    $text = 'No cluster node 2 VM "' +  ${global:testvmcl2name} + '" found'
    display_text $text 1 1
    }


$return_value.value = $objects_found
}


#################################################################################
# function to show currently existing test objects 
#################################################################################

function show_existing_testobjects {


[boolean]$exists               = $false
[boolean]$dnsexists            = $false
[boolean]$containerexists      = $false
[boolean]$storageaccountexists = $false


display_text '' 0 1
display_text 'Check existing test objects on Azure according to the current namespace setting' 0 1
display_text '' 0 1


display_text 'check vnet' 0 1
$cmdret = vnet_exists ([REF]$exists)
if( $exists -eq $false )
    {
    $text = 'Vnet "' + ${global:testvnet} + '" ' 
    display_text $text 1 0
    display_warning 'does not exist'
    }
else
    {
    $text = 'Vnet "' + ${global:testvnet} + '" ' 
    display_text $text 1 0
    display_ok_text_green 'found'

    display_text 'Check DNS entry in vnet' 0 1
    $cmdret = vnet_dns_entry_exists ([REF]$dnsexists)
    if ( $dnsexists -eq $false )
        {  
        $text = 'DNS entry "' + ${global:testvmdcname} + '" '
        display_text $text 1 0 
        display_warning 'does not exist'     
        }
    else
        {  
        $text = 'DNS entry "' + ${global:testvmdcname} + '" '
        display_text $text 1 0 
        display_ok_text_green 'found'     
        }
    }

display_text 'check storage account' 0 1
$cmdret = storage_account_exists ([REF]$exists)
if ( $exists -eq $false )
    {
    $text = 'Storage account "' + ${global:teststorageaccount}  + '" '
    display_text $text 1 0
    display_warning 'does not exist'  
    }
else
    {
    $text = 'Storage account "' + ${global:teststorageaccount}  + '" '
    $storageaccountexists = $true
    display_text $text 1 0
    display_ok_text_green 'found' 

    display_text 'check storage container' 0 1
    $cmdret = container_exists ([REF]$exists)
    if(  $exists -eq $false )
        {
        $text = 'Storage container "' + ${global:teststoragecontainer}  + '" '
        display_text $text 1 0
        display_warning 'does not exist' 
        }
    else
        {
        $text = 'Storage container "' + ${global:teststoragecontainer}  + '" '
        $containerexists = $true
        display_text $text 1 0
        display_ok_text_green 'found' 
        }
    }


display_text 'check OS image' 0 1
$cmdret = osimage_exists  ${global:testOSimage} ([REF]$exists)
if ( $exists -eq $false )
    {
    $text = 'OS image "' + ${global:testOSimage}  + '" '
    display_text $text 1 0
    display_warning 'does not exist' 
    }
else
    {
    $text = 'OS image "' + ${global:testOSimage}  + '" '
    display_text $text 1 0
    display_ok_text_green 'found' 
    }


display_text "Check domain controller VM" 0 1
$cmdret = virtual_machine_exists ${global:testvmdccloudservice} ${global:testvmdcname} ([REF]$exists)
if( $exists -eq $false)
    {  
    $text = 'Domain controller VM "' + ${global:testvmdcname} + '" in cloudservice "' + ${global:testvmdccloudservice} + '" '
    display_text $text 1 0
    display_warning 'does not exist' 
    }
else
    {
    $text = 'Domain controller VM "' +  ${global:testvmdcname} + '" in cloudservice "' + ${global:testvmdccloudservice} + '" '
    display_text $text 1 0
    display_ok_text_green 'found'
    }

display_text 'Check cluster node 1' 0 1
$cmdret = virtual_machine_exists ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$exists)
if( $exists -eq $false )
    {  
    $text = 'Cluster node 1 VM "' + ${global:testvmcl1name} + '" in cloudservice "' + ${global:testvmclcloudservice} + '" '
    display_text $text 1 0
    display_warning 'does not exist' 
    }
else
    {
    $text = 'Cluster node 1 VM "' +  ${global:testvmcl1name} + '" in cloudservice "' + ${global:testvmclcloudservice} + '" '
    display_text $text 1 0
    display_ok_text_green 'found' 
    }


display_text 'Check cluster node 2' 0 1
$cmdret = virtual_machine_exists ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$exists)
if( $exists -eq $false )
    {  
    $text = 'Cluster node 1 VM "' + ${global:testvmcl2name} + '" in cloudservice "' + ${global:testvmclcloudservice} + '" '
    display_text $text 1 0
    display_warning 'does not exist' 
    }
else
    {
    $text = 'Cluster node 1 VM "' +  ${global:testvmcl2name} + '" in cloudservice "' + ${global:testvmclcloudservice} + '" '
    display_text $text 1 0
    display_ok_text_green 'found' 
    }

if( $storageaccountexists -eq $true ) 
    {
    display_text '' 0 1
    $text = 'Check container "vhds" in storage account "' + ${global:teststorageaccount} + '"'
    display_text $text 0 1
    $cmdret = vhds_container_exists ([REF]$exists)
    if( $exists -eq $true )
        {
        display_text '' 1 1
        display_text 'Check Azure disks which have vhd files in the "vhds" container' 1 1

        $medialocation = 'https://' + ${global:teststorageaccount} + '.blob.core.windows.net/vhds/*'
        $azuredisks = get-azuredisk | where-object { $_.MediaLink -like $medialocation }

        if( $azuredisks )
        {
        foreach( $singledisk in $azuredisks )
            {
            $text = 'Disk "' + $singledisk.diskname  + '" '
            display_text $text 2 0
            display_ok_text_green 'found'
            if( $singledisk.attachedto.rolename )
                {
                #$text = ' Disk "' + $singledisk.diskname  + '" is attached to VM "' + $singledisk.attachedto.rolename + '"'
                $text = 'Disk is attached to VM "' + $singledisk.attachedto.rolename + '" '
                display_text $text 3 1
                }
            else
                {
                #$text = ' Disk "' + $singledisk.diskname  + '" is not attached to any VM'
                $text = ' Disk is not attached to any VM'
                display_text $text 3 1
                }
            }
         }
        else
           {
           display_text '' 2 0
           display_warning 'No suitable Azure disks found' 
           }


        display_text '' 1 1
        display_text 'Check blob objects in the "vhds" container' 1 1
        $cmdret = storage_context
        $blobs = Get-AzureStorageBlob -Container 'vhds' -context ${global:storagecontext}

        if( $blobs )
           {
            foreach( $singleblob in $blobs )
               {
               $text = 'Blob "' + $singleblob.name + '" '
               display_text $text 2 0
               display_ok_text_green 'found in container "vhds"'
               }
           }
       else
           {
           display_text '' 2 0
           $text = 'No blob objects found in container vhds'
           display_warning $text
           }
        }
    else
        {
        $text = 'Container "vhds" not found. No disk or blob objects exist in storage account "' + ${global:teststorageaccount} + '"'
        display_text '' 2 0
        display_warning $text 
        }
    }

if( $containerexists  )
    {
    display_text '' 0 1
    $text = 'Check objects in storage container "' + ${global:teststoragecontainer} + '"'
    display_text $text 0 1
    $cmdret = storage_context
    $blobs = Get-AzureStorageBlob -Container ${global:teststoragecontainer} -context ${global:storagecontext}
    if( $blobs )
        {
        foreach( $singleblob in $blobs )
            {
            $text = 'Blob "' + $singleblob.name + '" '
            display_text $text 2 0 
            $text = 'found in container "' + ${global:teststoragecontainer} + '"'
            display_ok_text_green $text
            }
        }
    else
        {
        display_text '' 2 0
        $text = 'No blob objects found in container "' + ${global:teststoragecontainer} + '"'
        display_warning $text 
        }
    }

}


#################################################################################
# function to verify if values stored in the local script config file are
# still valid
#################################################################################
function verify_stored_config_values {
param ( [REF]$return_value )

[boolean]$verification  = $true
[boolean]$exists        = $false
[boolean]$prefix_ok     = $false


display_text '' 0 1
display_text 'Validate script configfile content' 0 1

display_text '' 0 1
display_text 'Validate 1 of 5 : Azure subscription'
$cmdret = subscription_exists  ${global:subscriptionname} ([REF]$exists)
if ( $exists -eq $false )
    { 
    display_text '' 0 1
    $text = 'Azure subscription "' + ${global:subscriptionname} + '" stored in the local script config file is not valid'
    display_error $text
    ${global:subscriptionname} = ''
    $verification = $false 
    }

display_text '' 0 1
display_text 'Validate 2 of 5 : test prefix'
$cmdret = check_testprefix ${global:testprefix} ([REF]$prefix_ok)
if( $prefix_ok -eq $false )
    { 
    display_text '' 0 1
    $text = 'Test prefix "' + ${global:testprefix} + '" stored in the local script config file is not valid'
    display_error $text
    ${global:testprefix} = ''
    $verification = $false 
    }

display_text '' 0 1
display_text 'Validate 3 of 5 : test OS image'
$cmdret = osimage_exists  ${global:testOSimage} ([REF]$exists)
if ( $exists -eq $false )
    { 
    display_text '' 0 1
    $text = 'Test OS image "' + ${global:testOSimage} + '" stored in the local script config file is not valid'
    display_error $text
    ${global:testOSimage} = ''
    $verification = $false 
    }


display_text '' 0 1
display_text 'Validate 4 of 5 : OS image type'
if ( (${global:testOSimagetype} -ne 'public') -and (${global:testOSimagetype} -ne 'private')  )
    { 
    display_text '' 0 1
    $text = 'Test OS image type "' + ${global:testOSimagetype} + '" stored in the local script config file is not valid.'
    display_error $text
    display_error 'Set OS image name to "NULL". Please select new OS image which automatically correct the image type.'
    ${global:testOSimage} = ''
    $verification = $false 
    }

display_text '' 0 1
display_text 'Validate 5 of 5 : Azure region'
$cmdret = location_exists  ${global:testregion} ([REF]$exists)
if ( $exists -eq $false )
    { 
    display_text '' 0 1
    $text = 'Test Azure location "' + ${global:testregion} + '" stored in the local script config file is not valid'
    display_error $text
    ${global:testregion} = ''
    $verification = $false 
    }


if( $verification -eq $false )
    {
    display_text '' 0 1
    display_text '' 0 1
    display_error 'One or more values found in the local script config file are not or no longer valid.'
    display_error 'These values will be set to NULL. Please update the config file using menu item 1'
    display_text '' 0 1

    $config_text = ${global:subscriptionname} + '|' + ${global:testprefix} + '|' + ${global:testvnet}  + '|' + 
                   ${global:testOSimage} + '|' + ${global:testOSimagetype} + '|' + ${global:testregion}
    out-file -filepath $configfile -inputobject $config_text -force

    press_any_key
    }

$return_value.value = $verification
}


#################################################################################
# function to read the local script config file
#################################################################################

function read_config_file {
param ( [string]$configfile,
        [string]$validationflag,
        [REF]$return_value )

[boolean]$configfile_exists = $false
[boolean]$verify_content    = $false
[Array]$config_items

if( Test-Path $configfile )
   {
   $lines=Get-Content $configfile

   $config_items = $lines.split('|')

   if( $config_items.length -ne 6 )
       {
        clear-host
        display_text "" 0 1
        $text = "Config file " + $configfile + ' - wrong content. Expect 6 entries separated by pipe "|"'
        display_error $text 0
        press_any_key
       }
    else
       {
           ${global:subscriptionname} = $config_items[0]
           ${global:testprefix}       = $config_items[1]
           ${global:testvnet}         = $config_items[2]
           ${global:testOSimage}      = $config_items[3]
           ${global:testOSimagetype}  = $config_items[4]
           ${global:testregion}       = $config_items[5]
           if( $validationflag -eq 'validate' )
               {
               $cmdret = verify_stored_config_values ([REF]$verify_content)
               if( $verify_content -eq $true )
                   {  
                   $configfile_exists = $true 
                   $cmdret = set_global_variables
                   }
               }
           else
               {
               $configfile_exists = $true 
               $cmdret = set_global_variables               
               }
       }
   }
else
   {
   clear-host
   display_text "" 0 1
   $text = "Config file " + $configfile + " not found in current directory. Missing information about Azure Images and test namespace"
   display_warning $text 
   display_text "" 0 1
   display_text 'Use option 1 in main menu to create the config file' 0 1
   
   press_any_key 
   }

$return_value.value = $configfile_exists
}


#################################################################################
# function to verify user input for testprefix
#################################################################################

function check_testprefix {
param ( [string]$prefix,
        [REF]$return_value )

[boolean]$check_result = $true
[boolean]$is_first_char_numeric = $false
[boolean]$special_characters = $false


if( $prefix.length -gt 5 )
    {
    display_text '' 1 1
    display_error 'Testprefix cannot have more than 5 characters' 
    display_text '' 1 1
    $check_result = $false
    }

if( $prefix.length -gt 0 -and $prefix.length -le 5 )
    {
    $cmdret = is_special_characters $prefix ([REF]$special_characters)
    if( $special_characters -eq $true )
        {
        display_text '' 1 1
        display_error 'No special characters allowed for testprefix -> just "a-z" "A-Z" and "0-9"' 
        display_text '' 1 1
        $check_result = $false   
        }
    }


if( $prefix.length -gt 0 -and $prefix.length -le 5 )
    {
    $cmdret = is_numeric $prefix[0] 1 9 ([REF]$is_first_char_numeric)
    if( $is_first_char_numeric -eq $true )
        {
        display_text '' 1 1
        display_error 'First character of the testprefix name should not be numeric' 
        display_text '' 1 1
        $check_result = $false        
        }
    }

if( $check_result -eq $false )
    {
    press_any_key
    }

$return_value.value = $check_result
}


#################################################################################
# function to edit the local script config file content
#################################################################################

function edit_config_file_items {
param ( [string] $configfile,
        [array] $configvalues,
        [REF]$return_value )

[boolean]$newvalues = $false

[string]$selection   = ''
[string]$config_text = ''
[boolean]$prefix_ok   = $false

[string]$v1 = 'Subscription             : '
[string]$v2 = 'Test Namespace Prefix    : '
[string]$v3 = 'Test vnet                : '
[string]$v4 = 'Test OS image name       : '
[string]$v5 = 'Azure region             : '
[string]$v6 = 'Save and create objects if not existent'
[string]$v7 = 'Back to main menu without saving'

[Array]$config_items = @($v1,$v2,$v3,$v4,$v5,$v6,$v7)
[string]$config_text

[string]$subscription_name = ''
[string]$testprefix = ''
[string]$testvnet = ''
[string]$testosimagename = ''
[string]$testregion = ''

if( $configvalues.length -eq 5 )
{
$subscription_name = $configvalues[0]
$testprefix =        $configvalues[1]
$testvnet   =        $configvalues[2]
$testosimagename =   $configvalues[3]
$testregion      =   $configvalues[4]
}

$config_items[0] = $v1+$subscription_name
$config_items[1] = $v2+$testprefix
$config_items[2] = $v3+$testvnet
$config_items[3] = $v4+$testosimagename
$config_items[4] = $v5+$testregion


do {

clear-host
display_text '' 0 1
display_text 'Specify the following parameters for the test environment.' 0 1
display_text 'There must be a value for every item before you can exit the menu.' 0 1
display_text '' 0 1

$prompt_text = "Please enter the number of your selection"
$cmdret = get_menu_selection $config_items $prompt_text ([REF]$selection)

switch ( [int]$selection ) 
    { 
        1 {  clear-host
             display_text '' 1 0
             $cmdret = choose_azure_subscription ([REF]$subscription_name)
             $config_items[0] = $v1 + $subscription_name
          }
        2 {
             display_text '' 0 1
             do {
                 display_text 'Please enter the test namespace prefix : ' 0 0
                 $testprefix = read-host 
                 $cmdret = check_testprefix $testprefix ([REF]$prefix_ok)
                } while ( $prefix_ok -ne $true )

             $config_items[1] = $v2 + $testprefix
          }
        3 {
             display_text '' 1 0
             $cmdret = choose_vnet $testprefix ([REF]$testvnet)
             $config_items[2] = $v3 + $testvnet
          }
        4 {
             $cmdret = choose_os_image ([REF]$testosimagename)
             $config_items[3] = $v4 + $testosimagename
          }
        5 {
             $cmdret = choose_azure_location ([REF]$testregion)
             $config_items[4] = $v5 + $testregion
          }
        6 {}
        7 {}
        default { display_text 'should not happen' 0 1 }
    }
} while ( ([int]$selection -ne 6 -and [int]$selection -ne 7) -or !$subscription_name -or !$testprefix -or !$testvnet -or !$testosimagename -or !$testregion )


if( [int]$selection -eq 6 )
    {
    $config_text = $subscription_name + '|' + $testprefix + '|' + $testvnet + '|' + $testosimagename + '|' + ${global:testOSimagetype} + '|' + $testregion
    out-file -filepath $configfile -inputobject $config_text -force
    $newvalues = $true
    }
if( [int]$selection -eq 7 )
    {
    $newvalues = $false
    }

$return_value.value = $newvalues
}



#################################################################################
# function to decide for update or create the local script config file
#################################################################################

function update_config_file {
param ( [string] $configfile,
        [REF]$return_value )

[boolean]$newvalues_written = $false

[Array]$config_items_exist = @('','','','','','')
[Array]$config_items_new   = @('','','','','')

if( Test-Path $configfile )
   {
   $lines=Get-Content $configfile

   $config_items_exist = $lines.split('|')

   if( $config_items_exist.length -ne 6 )
       {
       clear-host
       display_text '' 0 1
       display_text 'number of entries in config file not correct. Probably corrupted.' 0 1
       display_text 'Please enter new values.' 0 1
       press_any_key
       edit_config_file_items $configfile $config_items_new ([REF]$newvalues_written)
       }
   else
       {
       $config_items_new[0] = $config_items_exist[0]
       $config_items_new[1] = $config_items_exist[1]
       $config_items_new[2] = $config_items_exist[2]
       $config_items_new[3] = $config_items_exist[3]
       $config_items_new[4] = $config_items_exist[5]

##  the OS image type is stored in the script config file but won't be displayed in the menu
       ${global:testOSimagetype} = $config_items_exist[4]

       edit_config_file_items $configfile $config_items_new ([REF]$newvalues_written)
       }
   }
else
   { edit_config_file_items $configfile $config_items_new ([REF]$newvalues_written) }

$return_value.value = $newvalues_written
}


#################################################################################
# function to check if a VM is in running mode : if not - wait until it's
# running
#################################################################################

function wait_for_vm_status_running {
param(
[string]$clservicename,
[string]$vmname,
[int]$margin,
[REF]$return_value )


[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"
$currstatus = get-azurevm -servicename $clservicename -name $vmname
$ErrorActionPreference="Stop"

if( !$currstatus )
    {
    display_text '' $margin 0
    display_error 'Failure ! VM does not exist. Please restart script, do cleanup and try again'
    exit
    }
else
    {
    $exists = $true
    }

$text = 'Waiting until VM "' + $vmname + '" has status "Running". Check interval ' + [string]${global:testcheckinterval} + ' secs'
display_text $text $margin 1

display_text '' $margin 0
do {
display_text '.' 0 0
start-sleep -s ${global:testcheckinterval}
$currstatus = get-azurevm -servicename $clservicename -name $vmname
} until ( ($currstatus.PowerState -eq 'Started') -and ($currstatus.Status -eq 'ReadyRole') -and ($currstatus.operationstatus -eq 'OK') )
display_text '' $margin 1

$return_value.value = $exists
}


#################################################################################
# function to check if a VM is stopped : if not - wait until it's
# stopped
#################################################################################

function wait_for_vm_status_stopped {
param(
[string]$clservicename,
[string]$vmname,
[int]$margin )


$text = 'Waiting until VM "' + $vmname + '" has status "Stopped". Check interval ' + [string]${global:testcheckinterval} + ' secs'
display_text $text $margin 1

display_text "" $margin 0
do {
display_text "." 0 0
start-sleep -s ${global:testcheckinterval}
$currstatus = get-azurevm -servicename $clservicename -name $vmname
} until ( ($currstatus.PowerState -eq 'Stopped') -and ($currstatus.Status -eq 'StoppedVM') -and ($currstatus.operationstatus -eq 'OK') )
display_text "" $margin 1
}


#################################################################################
# function to check if a VM still exists. If the name is still existing wait
# until it's gone. Used for cleanup tasks
#################################################################################

function wait_for_vm_status_deleted {
param(
[string]$clservicename,
[string]$vmname,
[int]$margin )

$text = 'Waiting until VM "' + $vmname + '" is deleted. Check interval ' + [string]${global:testcheckinterval} + ' secs'
display_text $text $margin 1

display_text "" $margin 0
do {
display_text "." 0 0
start-sleep -s ${global:testcheckinterval}
$vm = Get-AzureVM | Where-Object { ($_.Servicename -eq $clservicename ) -and ( $_.Name -eq $vmname ) }
} until ( !$vm )

display_text '' $margin 1
display_text '' $margin 0
display_ok_text_green 'VM successfully deleted'
display_text '' $margin 1
}


#################################################################################
# function to delete disks from a specific VM in a specific cloud service
#################################################################################

function delete_disk {
param(
[string]$servicename,
[string]$vmname )

$text = 'Try to delete disks which belong to VM "' + $vmname + '" in cloud service "' + $servicename + '"'
display_text $text 1 1

$disk = Get-AzureDisk | Where-Object {$_.DiskName -like "*$servicename*$vmname*" } 


$ErrorActionPreference="SilentlyContinue"

if( $disk )
    {
    $disk | ForEach-Object { 
        $text = 'Name of disk which will be deleted : "' + $_.diskname + '" '
        display_text $text 1 0
        $cmdret = Remove-azuredisk -diskname $_.diskname -DeleteVHD 
        
        $check_disk_deletion = Get-AzureDisk | Where-Object { $_.DiskName -eq $disk.diskname } 
        if( $check_disk_deletion )
            {
            display_error 'failed'

            $text = 'Will retry ' +  [string]${global:testfailureretries}  + ' times every ' + ${global:testfailureretryinterval} + ' secs'
            display_text $text 2 1
            for( $i=1; $i -le ${global:testfailureretries}; $i++ )
                {
                start-sleep -s ${global:testfailureretryinterval} 
                $text = [string]$i + '. try' 
                display_text $text 2 1
                $cmdret = Remove-azuredisk -diskname $_.diskname -DeleteVHD 
                $retry_check = Get-AzureDisk | Where-Object { $_.DiskName -eq $disk.diskname } 
                if( !$retry_check )
                    {  break }
                }

             if( !$retry_check )
                {
                display_text 'Disk successfully deleted' 2 1
                }
             else
                {
                display_text '' 2 0
                display_error 'Disk could not be deleted. This will prevent deletion of the storage account.'
                display_text '' 2 0
                display_error 'Please cleanup manually via the portal'
                }
            }
        else
            {
            display_ok_text_green 'succeeded' 
            }
        }
    }
else
    {
    display_text 'No disks found. Nothing to delete' 1 1   
    }

$ErrorActionPreference="Stop"
}


#################################################################################
# function to delete different test objects :
#     - private OS image
#     - disks from capture task when the private OS image was created
#     - disk status files. In case of a private OS image this only works
#       when the private image was created in the test storage account
#################################################################################

function delete_misc_storage_objects {

[boolean]$vhds_exists = $false



$ErrorActionPreference="SilentlyContinue"


if( ${global:testOSimagetype} -eq 'private' )
    {
    $text = 'Try to delete private OS image "' + ${global:testOSimage} + '"'
    display_text $text 1 1

    $test_osimage = get-azurevmimage | where-object { $_.ImageName -eq ${global:testOSimage}   }
    if( $test_osimage )
        {
        $cmdret = Remove-AzureVMImage -ImageName ${global:testOSimage} -DeleteVHD
        }
    else
        { display_text 'Image not found. Nothing to delete.' 1 1 }
    }
else 
    {
    display_text 'No private OS image was used. Nothing to delete' 1 1
    }

if( ${global:testOSimagetype} -eq 'private' )
    {
    $text = 'Try to delete disk leftover from VM capture to create private OS image' 
    display_text $text 1 1

    $medialocation = 'https://' + ${global:teststorageaccount} + '.blob.core.windows.net/vhds/*'
    $test_capturedisk = get-azuredisk | where-object { $_.MediaLink -like $medialocation }

    if( $test_capturedisk )
        {
        $cmdret = Remove-AzureDisk -DiskName $test_capturedisk.diskname -DeleteVHD
        }
    else
        { display_text 'Disk not found. Nothing to delete.' 1 1 }
    }

$text = 'Try to delete status files in storage account'
display_text $text 1 1

$cmdret = vhds_container_exists ([REF]$vhds_exists)
if( $vhds_exists -eq $true )
    {
    $cmdret = storage_context
    $blobs_to_delete = Get-AzureStorageBlob -Container 'vhds' -context ${global:storagecontext} 

    if( $blobs_to_delete )
        {
        foreach ( $singleblob in $blobs_to_delete )
            {  
            display_text 'Try to delete blob "' +  $singleblob.name + '"' 1 1
            $singleblob | Remove-AzureStorageBlob
            }

        $cmdret = Get-AzureStorageBlob -Container 'vhds' -context ${global:storagecontext}
        if( $cmdret ) 
            {
            display_error 'Failure ! Could not delete all blobs in container "vhds" ! Please cleanup manually !'
            exit
            }
        else
            {
            display_text '' 1 0
            display_ok_text_green 'All blobs in container "vhds" successfully deleted'
            }
        }
    else
        {
        display_text 'No blobs found in container "vhds". Nothing to delete' 1 1
        }
    }
else
    {
    display_text 'Storage container "vhds" not found. Nothing to delete.' 1 1
    }

$ErrorActionPreference="Stop"
}


#################################################################################
# function to delete a specific PS script which was created by the script for
# usage by the custom script extension:
#     - first delete the PS script in the storage container
#     - second delete the PS script in the local temp directory from which it
#       was uploaded
#################################################################################

function delete_psscripts {
param(
[string]$localpath,
[string]$scriptname )

[boolean]$stac_exists     = $false
[boolean]$cont_exists     = $false
[boolean]$psscript_exists = $false
[boolean]$delete_check    = $false

$text = 'Try to delete PS script "' + $scriptname + '" in storage account "' + ${global:teststorageaccount} + '" container "' +  ${global:teststoragecontainer} + '" '
display_text $text 1 0

$cmdret = storage_account_exists ([REF]$stac_exists)
$cmdret = container_exists ([REF]$cont_exists)



if( $stac_exists -eq $true )
    {
    if( $cont_exists -eq $true )
        {
        $cmdret = psscript_exists $scriptname ([REF]$psscript_exists)
        if ( $psscript_exists ) 
            {
            $cmdret = storage_context

            $ErrorActionPreference="SilentlyContinue"
            $cmdret = Remove-AzureStorageBlob -Blob $scriptname -Container ${global:teststoragecontainer} -context ${global:storagecontext}
            $cmdret = psscript_exists $scriptname ([REF]$delete_check)   
        
            if( !$delete_check )
                {
                display_ok_text_green 'successfully deleted'
                }
            else
                {
                display_text '' 1 1
                display_text '' 1 0
                display_error 'Failure ! PS script could not be deleted. Please cleanup manually via the Azure portal'
                }
            }
        else
            {
            display_text '' 1 1
            display_text 'PS script not found. Nothing to delete' 1 1
            }
        }
    else
        {
        display_text '' 1 1
        display_text 'Container not found. No PS scripts to delete' 1 1
        }
    }
else
    {
    display_text '' 1 1
    display_text 'Storage account not found. No PS scripts to delete' 1 1
    }

$ErrorActionPreference="SilentlyContinue"
if( Test-Path $localpath )
    {
    $text = 'Try to delete local PS script "' + $localpath + '" ' 
    display_text $text 1 0
    $cmdret = remove-item $localpath

    if( !(Test-Path $localpath) )
        {
        display_ok_text_green ' successfully deleted'
        }
    else
        {
        display_error 'Failure ! Local PS script could not be deleted. Please cleanup manually'
        }
    }
else
    {
    $text = 'No local psscript "' + $localpath + '" found. Nothing to delete'
    display_text $text 1 1
    }

$ErrorActionPreference="Stop"
}


#################################################################################
# function to delete a specific test VM
#################################################################################

function delete_vm {
param(
[string]$servicename,
[string]$vmname )

[boolean]$exists       = $false
[boolean]$check_delete = $false

$cmdret = virtual_machine_exists $servicename $vmname ([REF]$exists)

if( $exists -eq $true )
    {
    $text = 'Try to delete VM "' + $vmname + '" in cloud service "' + $servicename + '"'
    display_text $text 1 1

    $cmdret = Remove-AzureVM -ServiceName $servicename -Name $vmname 
    wait_for_vm_status_deleted $servicename $vmname 1
    }
else
    {
    $text = 'VM "' + $vmname + '" not found. Nothing to delete'
    display_text $text 1 1
    }
}


#################################################################################
# function to delete a specific cloud service
#################################################################################

function delete_service {
param(
[string]$servicename )

$text = 'Try to delete cloud service "' + $servicename + '" '
display_text $text 1 0


$ErrorActionPreference="SilentlyContinue"

$service = get-azureservice | where-object { $_.servicename -eq $servicename }
if ( $service ) 
    {
    $cmdret = Remove-AzureService -ServiceName $servicename -force

    $check_delete = get-azureservice | where-object { $_.servicename -eq $servicename }
    if( !$check_delete )
        {
        display_ok_text_green ' successfully deleted'
        }
    else
        {
        display_text '' 0 1
        display_error 'Failure ! Service could not be deleted ! Please cleanup manually. Restart script and try again'
        exit
        }
    }
else
    {
    display_text '' 0 1
    display_text 'Service not found. Nothing to delete' 1 1
    }

$ErrorActionPreference="Stop"
}


#################################################################################
# function to delete the local network config file which used to update the
# Azure vnet configuration
#################################################################################

function delete_network_config_file {

$ErrorActionPreference="SilentlyContinue" 

if( Test-Path ${global:testvnetconfig} )
    {
    $cmdret = remove-item ${global:testvnetconfig}

    if( !(Test-Path ${global:testvnetconfig}) )
        {
        display_text '' 1 0
        $text = 'Temp network config file "' + ${global:testvnetconfig} + '" successfully deleted'
        display_ok_text_green $text
        }
    else
        {
        display_text '' 1 0
        $text = 'Temp network config file "' + ${global:testvnetconfig} + '" could not be deleted.'     
        display_error $text
        display_text '' 1 0
        display_error 'Please cleanup manually'           
        }
    }
else
    { display_text 'Temp network config file not found. Nothing to delete' 0 1 }

$ErrorActionPreference="Stop" 
}


#################################################################################
# function to cleanup AD entries on the domain controller VM
#     - it creates a PS script which removes the test cluster and uploads it
#       to the test storage account script container
#     - then it uses the custom script extension to call the script on the
#       first cluster node 
#     - the cmdlet to remove the cluster will do some AD cleanup on the
#       domain controller VM. This kind of AD cleanup cannot easily be done
#       on the domain controller VM directly because of permission issues
#################################################################################

function cleanup_cluster_ad {
param(
[string]$servicename,
[string]$vmname )

display_text "" 0 1
display_text 'create PS Script to cleanup AD entries on domain controller VM via "remove-cluster"' 1 1

create_clnodesetup_script_06  ${global:testclnodesetupscript6}

$text = 'Use custom script extension to execute AD cleanup' 
display_text $text 1 1 
update_custom_script_extension ${global:testclnodesetupscriptname6} ${global:testclnodesetupstartscriptname6} $servicename $vmname
wait_for_vm_status_stopped $servicename $vmname 1
}


#################################################################################
# function to cleanup the whole test environment. There are two modes :
#    - default leaves the storage account, private OS image and vnet and affinity
#      group as well as some objects within the storage account ( e.g. status files )
#    - mode "full" tries to remove everything which was created by the script
#
#################################################################################

function testcleanup {
param ( [string]$mode )

[boolean]$storageaccountexists = $false
[boolean]$staccdelcheck = $false
[boolean]$vnetexists = $false
[string]$answer = ''

display_text '' 0 1
display_text 'The following objects will be deleted : ' 0 1
display_text '' 0 1

$text = 'VM  : "' + ${global:testvmcl1name} + '" in cloud service : "' + ${global:testvmclcloudservice} + '"'
display_text $text 1 1

$text = 'VM  : "' + ${global:testvmcl2name} + '" in cloud service : "' + ${global:testvmclcloudservice} + '"'
display_text $text 1 1

$text = 'VM  : "' + ${global:testvmdcname} + '" in cloud service : "' + ${global:testvmdccloudservice} + '"'
display_text $text 1 1

$text = 'All disks which belong to the VMs above'
display_text $text 1 1

$text = 'Cloud service : "' + ${global:testvmdccloudservice} + '"'
display_text $text 1 1

$text = 'Cloud service : "' + ${global:testvmclcloudservice} + '"'
display_text $text 1 1

$text = 'All PS scripts and temp files used to set up the test environment'
display_text $text 1 1

if( $mode -eq 'full' )
    {
    $text = 'Storage account : "' + ${global:teststorageaccount} + '"'
    display_text $text 1 1

    $text = 'Vnet : "' + ${global:testvnet} + '"'
    display_text $text 1 1

    if( ${global:testOSimagetype} -eq 'private' )
        {
        $text = 'Private OS image : "' + ${global:testOSimage} + '"'
        display_text $text 1 1
        }
    }

display_text '' 0 1
display_text 'Are you sure you want to delete these objects ?' 0 1
display_text '' 0 1
$cmdret = user_input_yes_no 0 ([REF]$answer)

if( $answer -eq 'y' )
{

display_text '' 0 1
display_text '' 0 1
display_warning 'Test Cleanup will start. This takes some minutes. Please wait.' 
display_text '' 0 1

$cmdret = storage_account_exists ([REF]$storageaccountexists)

display_text '' 0 1
$text = 'Try to delete VMs ' 
display_text $text 0 1
display_text '' 0 1

delete_vm ${global:testvmclcloudservice} ${global:testvmcl1name}
delete_vm ${global:testvmclcloudservice} ${global:testvmcl2name}
delete_vm ${global:testvmdccloudservice} ${global:testvmdcname}

if ($storageaccountexists)
    {
    display_text '' 0 1
    $text = 'Try to delete VM disks'
    display_text $text 0 1
    display_text '' 0 1

    delete_disk ${global:testvmclcloudservice} ${global:testvmcl1name}
    delete_disk ${global:testvmclcloudservice} ${global:testvmcl2name}
    delete_disk ${global:testvmdccloudservice} ${global:testvmdcname}
    }

display_text '' 0 1
$text = 'Try to delete services '
display_text $text 0 1
display_text '' 0 1

delete_service ${global:testvmclcloudservice}
delete_service ${global:testvmdccloudservice}

display_text '' 0 1
$text = 'Try to remove DNS entries from network configuration' 
display_text $text 0 1
display_text '' 0 1
$cmdret = delete_vnetdns ${global:testvnet} ${global:testvmdcname} ${global:testvnetconfig}

display_text '' 0 1
$text = 'Try to delete Powershell scripts ' 
display_text $text 0 1
display_text '' 0 1

delete_psscripts ${global:testdcsetupscript}           ${global:testdcsetupscriptname}
delete_psscripts ${global:testdcsetupstartscript}      ${global:testdcsetupstartscriptname}
delete_psscripts ${global:testdcsetupscript2}          ${global:testdcsetupscriptname2}
delete_psscripts ${global:testdcsetupstartscript2}     ${global:testdcsetupstartscriptname2}
delete_psscripts ${global:testdcsetupscript3}          ${global:testdcsetupscriptname3}
delete_psscripts ${global:testdcsetupstartscript3}     ${global:testdcsetupstartscriptname3}
delete_psscripts ${global:testdcsetupscript4}          ${global:testdcsetupscriptname4}
delete_psscripts ${global:testdcsetupstartscript4}     ${global:testdcsetupstartscriptname4}

delete_psscripts ${global:testclnodesetupscript1}      ${global:testclnodesetupscriptname1}
delete_psscripts ${global:testclnodesetupstartscript1} ${global:testclnodesetupstartscriptname1}
delete_psscripts ${global:testclnodesetupscript2}      ${global:testclnodesetupscriptname2}
delete_psscripts ${global:testclnodesetupstartscript2} ${global:testclnodesetupstartscriptname2}
delete_psscripts ${global:testclnodesetupscript3}      ${global:testclnodesetupscriptname3}
delete_psscripts ${global:testclnodesetupstartscript3} ${global:testclnodesetupstartscriptname3}
delete_psscripts ${global:testclnodesetupscript4}      ${global:testclnodesetupscriptname4}
delete_psscripts ${global:testclnodesetupstartscript4} ${global:testclnodesetupstartscriptname4}
delete_psscripts ${global:testclnodesetupscript5}      ${global:testclnodesetupscriptname5}
delete_psscripts ${global:testclnodesetupstartscript5} ${global:testclnodesetupstartscriptname5}
delete_psscripts ${global:testclnodesetupscript6}      ${global:testclnodesetupscriptname6}
delete_psscripts ${global:testclnodesetupstartscript6} ${global:testclnodesetupstartscriptname6}


display_text '' 0 1
$text = 'Try to delete network config file ' 
display_text $text 0 1
display_text '' 0 1

$cmdret = delete_network_config_file


if( $mode -eq 'full' )
    {
    if ( $storageaccountexists)
        {
        display_text '' 0 1
        $text = 'Try to delete remaining objects in storage account' 
        display_text $text 0 1
        display_text '' 0 1

        delete_misc_storage_objects

        display_text '' 0 1
        $text = 'Try to delete storage account ' 
        display_text $text 0 1
        display_text '' 0 1

        $ErrorActionPreference="SilentlyContinue"        
        $cmdret = Remove-AzureStorageAccount -StorageAccountName ${global:teststorageaccount} 
        $ErrorActionPreference="Stop"

        $cmdret = storage_account_exists ([REF]$staccdelcheck)
        if( $staccdelcheck -eq $true )
            {
            display_error 'Failure ! Could not delete storage account ! Please cleanup manually !'
            exit
            }
        else
            {
            display_ok_text_green 'Storage account successfully deleted'
            }
        }

    display_text '' 0 1
    $text = 'Try to delete vnet' 
    display_text $text 0 1
    display_text '' 0 1

    $cmdret = vnet_exists ([REF]$vnetexists)
    if( $vnetexists -eq $true )
        { $cmdret = delete_vnet ${global:testvnet} ${global:testvnetconfig} }
    else
        { display_text 'vnet not found. Nothing to delete' 0 1 }
    }
}
else
    {
    display_text '' 0 1   
    display_text 'Answer = "n". Nothing was deleted' 0 1
    display_text '' 0 1  
    }
}


#################################################################################
# function to cleanup just the two cluster node VMs 
#################################################################################

function testcleanup_clnodes {

[string]$answer = ''

display_text '' 0 1
display_text 'The following objects will be deleted : ' 0 1
display_text '' 0 1

$text = 'VM  : "' + ${global:testvmcl1name} + '" in cloud service : "' + ${global:testvmclcloudservice} + '"'
display_text $text 1 1

$text = 'VM  : "' + ${global:testvmcl2name} + '" in cloud service : "' + ${global:testvmclcloudservice} + '"'
display_text $text 1 1

$text = 'All disks which belong to the VMs above'
display_text $text 1 1

$text = 'Cloud service : "' + ${global:testvmclcloudservice} + '"'
display_text $text 1 1

$text = 'All PS scripts used to set up the two cluster nodes'
display_text $text 1 1

$text = 'All objects ( AD/DNS/file share ) on domain controller VM "' + ${global:testvmdcname} + '" related to the cluster'
display_text $text 1 1

display_text '' 0 1
display_text 'Are you sure you want to delete these objects ?' 0 1
display_text '' 0 1

$cmdret = user_input_yes_no 0 ([REF]$answer)

if( $answer -eq 'y' )
{

display_text '' 0 1
display_text '' 0 1
display_text 'Cleanup will start. This takes some minutes. Please wait.' 0 1
display_text '' 0 1


display_text 'Create PS scripts to do cleanup on domain controller VM' 0 1
display_text '' 0 1
create_dcsetup_script4  ${global:testdcsetupscript4}
create_clnodesetup_script_06  ${global:testclnodesetupscript6}

display_text '' 0 1
$text = 'AD cleanup'
display_text $text 0 1
display_text '' 0 1
cleanup_cluster_ad ${global:testvmclcloudservice} ${global:testvmcl1name}

display_text '' 0 1
$text = 'Try to delete VMs ' 
display_text $text 0 1
display_text '' 0 1

delete_vm ${global:testvmclcloudservice} ${global:testvmcl1name}
delete_vm ${global:testvmclcloudservice} ${global:testvmcl2name}

display_text '' 0 1
$text = 'Try to delete disks ' 
display_text $text 0 1
display_text '' 0 1

delete_disk ${global:testvmclcloudservice} ${global:testvmcl1name}
delete_disk ${global:testvmclcloudservice} ${global:testvmcl2name}

display_text '' 0 1
$text = 'Try to delete services ' 
display_text $text 0 1
display_text '' 0 1

delete_service ${global:testvmclcloudservice}


display_text '' 0 1
$text = 'Try to delete quorum file share on domain controller '
display_text $text 0 1
display_text '' 0 1

delete_dc_cl_quorum_share


display_text '' 0 1
$text = 'Try to delete Powershell scripts ' 
display_text $text 0 1
display_text '' 0 1


delete_psscripts ${global:testclnodesetupscript1}      ${global:testclnodesetupscriptname1}
delete_psscripts ${global:testclnodesetupstartscript1} ${global:testclnodesetupstartscriptname1}
delete_psscripts ${global:testclnodesetupscript2}      ${global:testclnodesetupscriptname2}
delete_psscripts ${global:testclnodesetupstartscript2} ${global:testclnodesetupstartscriptname2}
delete_psscripts ${global:testclnodesetupscript3}      ${global:testclnodesetupscriptname3}
delete_psscripts ${global:testclnodesetupstartscript3} ${global:testclnodesetupstartscriptname3}
delete_psscripts ${global:testclnodesetupscript4}      ${global:testclnodesetupscriptname4}
delete_psscripts ${global:testclnodesetupstartscript4} ${global:testclnodesetupstartscriptname4}
delete_psscripts ${global:testclnodesetupscript5}      ${global:testclnodesetupscriptname5}
delete_psscripts ${global:testclnodesetupstartscript5} ${global:testclnodesetupstartscriptname5}
delete_psscripts ${global:testclnodesetupscript6}      ${global:testclnodesetupscriptname6}
delete_psscripts ${global:testclnodesetupstartscript6} ${global:testclnodesetupstartscriptname6}

delete_psscripts ${global:testdcsetupscript3}     ${global:testdcsetupstartscript3}
delete_psscripts ${global:testdcsetupscript4}     ${global:testdcsetupstartscript4}

}
else
    {
    display_text '' 0 1   
    display_text 'Answer = "n". Nothing was deleted' 0 1
    display_text '' 0 1  
    }
}


#################################################################################
# function to cleanup just the domain controller VM
#################################################################################

function testcleanup_domain_controller {

[string]$answer = ''

display_text '' 0 1
display_text 'The following objects will be deleted : ' 0 1
display_text '' 0 1

$text = 'VM  : "' + ${global:testvmdcname} + '" in cloud service : "' + ${global:testvmdccloudservice} + '"'
display_text $text 1 1

$text = 'All disks which belong to VM : "' + ${global:testvmdcname} + '"'
display_text $text 1 1

$text = 'Cloud service : "' + ${global:testvmdccloudservice} + '"'
display_text $text 1 1

$text = 'DNS entry : "' + ${global:testvmdcname} + '" in vnet : "' + ${global:testvnet} + '"'
display_text $text 1 1

$text = 'Two PS scripts used to create the domain controller VM'
display_text $text 1 1

display_text '' 0 1
display_text 'Are you sure you want to delete these objects ?' 0 1
display_text '' 0 1

$cmdret = user_input_yes_no 0 ([REF]$answer)

if( $answer -eq 'y' )
{
display_text '' 0 1
display_text '' 0 1
display_text "Cleanup will start. This takes some minutes. Please wait." 0 1
display_text '' 0 1

display_text '' 0 1
$text = 'Try to delete VM '
display_text $text 0 1
display_text '' 0 1

delete_vm ${global:testvmdccloudservice} ${global:testvmdcname}

display_text '' 0 1
$text = 'Try to delete disks ' 
display_text $text 0 1
display_text '' 0 1

delete_disk ${global:testvmdccloudservice} ${global:testvmdcname}

display_text '' 0 1
$text = 'Try to delete service ' 
display_text $text 0 1
display_text '' 0 1

delete_service ${global:testvmdccloudservice}

display_text '' 0 1
$text = 'Try to remove DNS entries from network configuration'
display_text $text 0 1
display_text '' 0 1
$cmdret = delete_vnetdns ${global:testvnet} ${global:testvmdcname} ${global:testvnetconfig}

display_text '' 0 1
$text = 'Try to delete Powershell scripts '
display_text $text 0 1
display_text '' 0 1

delete_psscripts ${global:testdcsetupscript}      ${global:testdcsetupstartscript}
delete_psscripts ${global:testdcsetupscript2}     ${global:testdcsetupstartscript2}
}
else
    {
    display_text "" 0 1   
    display_text 'Answer = "n". Nothing was deleted' 0 1
    display_text "" 0 1  
    }

}


#################################################################################
# function to write a line into a local file. This is used when creating the
# PS scripts used by the custom script extension
#################################################################################

function cr_psscriptline {
param(
[string]$path,
[string]$line,
[string]$mode )

if( $mode -eq 'force' )
    { out-file -filepath $path -inputobject $line -force }
else
    { out-file -filepath $path -inputobject $line -append }
}


#################################################################################
# function to write secure password creation into a PS script.
# The secure password will not be created in the main script :
#    - the test password will be written in clear text into a local PS script
#    - the the PS code will be written to create a secure password 
#    - this secure password will then be used for certain tasks
#    - these tasks will be executed via the custom script extension inside
#      the test VMs on Azure
#################################################################################

function write_sec_pwd_in_script {
param(
[string]$path,
[string]$mode )

if( $mode -eq 'force' )
    { $wmode = 'force' }
else
    { $wmode = 'append' }

$setpassword = '$testpassword="'+ ${global:testpassword} + '"'
cr_psscriptline $path $setpassword $wmode
cr_psscriptline $path '$secure_string_pwd = convertto-securestring $testpassword -asplaintext -force' 'append'

}


#################################################################################
# function to upload a PS script to the test storage account script container.
# It's a PS script which was created before.
#################################################################################

function upload_ps_script {
param ( [string] $path,
        [string] $scriptname )

[boolean]$psscript_exists = $false


$text = 'Upload PS script "' + $path + '" to storage account "' + ${global:teststorageaccount} + '" container "' + ${global:teststoragecontainer} + '" '
display_text $text 1 0

$cmdret = storage_context

$ErrorActionPreference="SilentlyContinue"

$cmdret = Set-AzureStorageBlobContent -Blob $scriptname -Container ${global:teststoragecontainer} -context ${global:storagecontext} -File $path -force
$cmdret = psscript_exists $scriptname ([REF]$psscript_exists)

if( $psscript_exists )
    {
    display_ok_text_green 'successfully uploaded'   
    }
else
    {
    display_text '' 0 1
    display_error 'Failure ! PS script not found ! Upload failed !'
    display_error 'Restart script, cleanup and try again.'
    exit
    }

$ErrorActionPreference="Stop"
}


#################################################################################
# function to create start scripts. The basic design which was used for the
# test script works like this :
#    - the custom script extension will call a start script
#    - the start script will then start the PS script which will cover certain
#      tasks ( e.g. Windows feature installation, domain join ...... )
#    - this means that there will be always a couple of PS scripts - one
#      as the start script and the other one to start certain tasks
#    - the start script is necessary in some cases to handle authentication
#      inside the Azure VMs
#    - this approach is the same for all PS scripts which are used even if
#      the start script authentication isn't necessary
#    - the custom script extension calls the PS scripts asynchronously. So
#      how to synchronize the tasks with the main script which runs locally ?
#    - instead of working via some kind of status file or whatever the 
#      start script simply does a shutdown of the Azure VM. The main script
#      waits until the VM stopped and re-starts it again.
#      Doesn't sound very elegant or efficient or fast but it's robust and
#      works
#################################################################################

function create_credential_startup_script {
param(
[string]$path,
[string]$scriptname,
[string]$startupscriptname,
[string]$mode,
[string]$auth,
[string]$shutdown )


$text = 'Create start script "' + $path + '" which will invoke script "' + $scriptname + '"'
display_text $text 1 1

write_sec_pwd_in_script $path 'force'
if( $mode -eq "local" ) {
    $command = '$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\' + ${global:testuser} + '", $secure_string_pwd)'
    }
else
    {
    $command = '$credential = New-Object System.Management.Automation.PSCredential("' + ${global:testdomain} + '\' + ${global:testuser} + '", $secure_string_pwd)'
    }
cr_psscriptline $path $command 'append'
$command = '$command = $file = $PSScriptRoot + "\' + $scriptname + '"'
cr_psscriptline $path $command 'append'
cr_psscriptline $path 'Enable-PSRemoting –force' 'append'
if( $auth -eq 'credssp' )
    {
    cr_psscriptline $path 'Invoke-Command -FilePath $command -Authentication credssp -Credential $credential -ComputerName $env:COMPUTERNAME' 'append'
    }
else
    {
    cr_psscriptline $path 'Invoke-Command -FilePath $command -Credential $credential -ComputerName $env:COMPUTERNAME' 'append'
    }

cr_psscriptline $path 'Disable-PSRemoting -Force' 'append'

if( $shutdown -eq "shutdown" )
    {
    cr_psscriptline $path 'stop-computer -force -confirm:$false'
    }

$cmdret = upload_ps_script $path $startupscriptname
}


#################################################################################
# function to create a PS script which configures the DC VM
#     - via the custom script extension it will install Windows features to
#       set up the domain controller + some additional settings
#################################################################################

function create_dcsetup_script {
param(
[string]$path )

create_credential_startup_script ${global:testdcsetupstartscript} ${global:testdcsetupscriptname} ${global:testdcsetupstartscriptname} "local" "default" "shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'


cr_psscriptline $path '$cmdret = Install-WindowsFeature -name FS-FileServer,AD-Domain-Services,DNS –IncludeManagementTools -WarningAction silentlyContinue' 'append'

cr_psscriptline $path 'Add-DnsServerForwarder -IPAddress 8.8.8.8' 'append'

cr_psscriptline $path 'Get-NetFirewallProfile | Set-NetFirewallProfile –Enabled False -Confirm:$false' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0 -Confirm:$false -WarningAction silentlyContinue' 'append'
cr_psscriptline $path '$AdminKey = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}”' 'append'
cr_psscriptline $path '$UserKey = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}”' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path $AdminKey -Name “IsInstalled” -Value 0' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path $UserKey -Name “IsInstalled” -Value 0' 'append'

cr_psscriptline $path 'Enable-WSManCredSSP -Role Server -force' 'append'
cr_psscriptline $path 'Enable-WSManCredSSP -Role Client -force –DelegateComputer *' 'append'
cr_psscriptline $path '$regpath = "HKLM:Software\Policies\Microsoft\Windows\CredentialsDelegation"' 'append'
cr_psscriptline $path '$regpathnew = "HKLM:Software\Policies\Microsoft\Windows\CredentialsDelegation\AllowFreshCredentialsWhenNTLMOnly"' 'append'

cr_psscriptline $path 'Set-ItemProperty -Path $regpath -Name AllowFreshCredentialsWhenNTLMOnly -Value 1 -Type DWord' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path $regpath -Name ConcatenateDefaults_AllowFreshNTLMOnly -Value 1 -Type DWord' 'append'
cr_psscriptline $path 'New-Item -Path $regpath -Name "AllowFreshCredentialsWhenNTLMOnly"' 'append'
cr_psscriptline $path 'New-ItemProperty -Path $regpathnew -Name "1" -Value "wsman/*" -Type String' 'append'


$cmdret = upload_ps_script $path ${global:testdcsetupscriptname}
}


#################################################################################
# function to create a PS script which configures the DC VM
#     - via the custom script extension it will install the test domain
#################################################################################

function create_dcsetup_script2 {
param(
[string]$path )

create_credential_startup_script ${global:testdcsetupstartscript2} ${global:testdcsetupscriptname2} ${global:testdcsetupstartscriptname2} "local" "default" "shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'append'
cr_psscriptline $path '$cmdret = Import-Module ADDSDeployment' 'append'

$setpassword = '$testpassword="'+ ${global:testpassword} + '"'
cr_psscriptline $path $setpassword 'append'
cr_psscriptline $path '$secure_string_pwd = convertto-securestring $testpassword -asplaintext -force' 'append'
$settestdomain = '$testdomain="'+ ${global:testdomain} + '"'
cr_psscriptline $path  $settestdomain 'append'
cr_psscriptline $path '$cmdret = Install-ADDSForest -DomainName $testdomain -NoRebootOnCompletion -SafeModeAdministratorPassword $secure_string_pwd -force -WarningAction silentlyContinue' 'append'

$cmdret = upload_ps_script $path ${global:testdcsetupscriptname2}
}


#################################################################################
# function to create a PS script which configures the DC VM
#     - via the custom script extension it will create a share which will be
#       used by the cluster as a file share witness
#################################################################################

function create_dcsetup_script3 {
param(
[string]$path )

create_credential_startup_script ${global:testdcsetupstartscript3} ${global:testdcsetupscriptname3} ${global:testdcsetupstartscriptname3} "domain" "default" "no shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'append'
cr_psscriptline $path '$cmdret = Import-Module ADDSDeployment' 'append'

$command = 'md -Path "' + $testclusterquorumfilesharepath + '"'
cr_psscriptline $path $command 'append'
$command = '$cmdret = new-smbshare -name "' + ${global:testclusterquorumfilesharename} +'" -path "' + ${global:testclusterquorumfilesharepath} +'" -cachingmode "none" -changeaccess "' + ${global:testdomain} + '\' + ${global:testclustername} +'$"'
cr_psscriptline $path $command 'append'
$command = '$cmdret = Set-SmbPathAcl -ShareName "' + ${global:testclusterquorumfilesharename} + '"'
cr_psscriptline $path $command 'append'

$cmdret = upload_ps_script $path ${global:testdcsetupscriptname3}
}


#################################################################################
# function to create a PS script which will cleanup the DC VM
#     - via the custom script extension it will delete AD and DNS entries
#       when removing the two cluster node VMs
#################################################################################

function create_dcsetup_script4 {
param( [string]$path )

create_credential_startup_script ${global:testdcsetupstartscript4} ${global:testdcsetupscriptname4} ${global:testdcsetupstartscriptname4} "domain" "credssp" "no shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'append'
cr_psscriptline $path '$cmdret = Import-Module ADDSDeployment' 'append'

$command = '$cmdret = remove-smbshare -name "' + ${global:testclusterquorumfilesharename} + '" -force -confirm:$false'
cr_psscriptline $path $command 'append'


$command = '$cmdret = get-adcomputer "' + ${global:testclusterfsgroupname} + '" | remove-adobject -recursive -confirm:$false'
cr_psscriptline $path $command 'append'
$command = '$cmdret = get-adcomputer "' + ${global:testvmcl1name} + '" | remove-adobject -recursive -confirm:$false'
cr_psscriptline $path $command 'append'
$command = '$cmdret = get-adcomputer "' + ${global:testvmcl2name} + '" | remove-adobject -recursive -confirm:$false'
cr_psscriptline $path $command 'append'

$command = '$cmdret = Remove-DnsServerResourceRecord -ZoneName "' + ${global:testdomain} + '"  -RRType "A" -Name "' + ${global:testclustername} + '" -force -confirm:$false'
cr_psscriptline $path $command 'append'

$command = '$cmdret = Remove-DnsServerResourceRecord -ZoneName "' + ${global:testdomain} + '"  -RRType "A" -Name "' + ${global:testvmcl1name} + '" -force -confirm:$false'
cr_psscriptline $path $command 'append'

$command = '$cmdret = Remove-DnsServerResourceRecord -ZoneName "' + ${global:testdomain} + '"  -RRType "A" -Name "' + ${global:testvmcl2name} + '" -force -confirm:$false'
cr_psscriptline $path $command 'append'

$command = '$cmdret = Remove-item "' + $testclusterquorumfilesharepath + '" -recurse -confirm:$false'
cr_psscriptline $path $command 'append'

$cmdret = upload_ps_script $path ${global:testdcsetupscriptname4}
}


#################################################################################
# function to create a PS script which will configure a cluster node VM
#     - via the custom script extension it will install the cluster feature
#       and depending on the OS image .Net Framework 3.5
#     - then it will turn off several security settings as well as the
#       fire wall to make it easy to install the cluster
#################################################################################

function create_clnodesetup_script_01 {
param(
[string]$path,
[string]$tuser,
[string]$tdnsaddr )


create_credential_startup_script ${global:testclnodesetupstartscript1} ${global:testclnodesetupscriptname1} ${global:testclnodesetupstartscriptname1} "local" "default" "shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$net = get-netadapter | where-object { $_.InterfaceDescription -eq ''Microsoft Hyper-V Network Adapter'' }' 'force'
cr_psscriptline $path '$netidx = $net.ifIndex' 'append'


$setdnsaddr = '$testdnsaddr="'+ ${global:testforwarddns} + '"'
cr_psscriptline $path $setdnsaddr 'append'
cr_psscriptline $path 'Set-DnsClientServerAddress -InterfaceIndex $netidx -ServerAddresses ($testdnsaddr)' 'append'


if( ${global:testOSimagetype}  -eq 'private' )
{
    cr_psscriptline $path '$cmdret = Install-WindowsFeature -name FS-FileServer,Failover-Clustering –IncludeManagementTools -WarningAction silentlyContinue' 'append'
}
else
{
    cr_psscriptline $path '$cmdret = Install-WindowsFeature -name FS-FileServer,Failover-Clustering,Net-Framework-Core –IncludeManagementTools -WarningAction silentlyContinue' 'append'
}

$settestdomainaddr = '$testdomainaddr="'+ $tdnsaddr + '"'
cr_psscriptline $path $settestdomainaddr 'append'
cr_psscriptline $path 'Set-DnsClientServerAddress -InterfaceIndex $netidx -ServerAddresses ($testdomainaddr)' 'append'

cr_psscriptline $path 'Get-NetFirewallProfile | Set-NetFirewallProfile –Enabled False -Confirm:$false' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0 -Confirm:$false -WarningAction silentlyContinue' 'append'
cr_psscriptline $path '$AdminKey = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}”' 'append'
cr_psscriptline $path '$UserKey = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}”' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path $AdminKey -Name “IsInstalled” -Value 0' 'append'
cr_psscriptline $path 'Set-ItemProperty -Path $UserKey -Name “IsInstalled” -Value 0' 'append'

cr_psscriptline $path 'Enable-WSManCredSSP -Role Server -force' 'append'
cr_psscriptline $path 'Enable-WSManCredSSP -Role Client -force –DelegateComputer *' 'append'

$cmdret = upload_ps_script $path ${global:testclnodesetupscriptname1}
}


#################################################################################
# function to create a PS script which will configure a cluster node VM
#     - via the custom script extension it will join the test VM and format
#       the attached data disk + creates a volume S: on it
#     - the newly created volume S: will be used later by SIOS Datakeeper
#       to build a "mirror" which acts as the shared disk for the
#       failover cluster
#################################################################################

function create_clnodesetup_script_02 {
param(
[string]$path,
[string]$tuser )

create_credential_startup_script ${global:testclnodesetupstartscript2} ${global:testclnodesetupscriptname2} ${global:testclnodesetupstartscriptname2} "local" "default" "shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

write_sec_pwd_in_script $path 'force'

$settestuser = '$testuser="'+ ${global:testdomain} + '\' + $tuser + '"'
cr_psscriptline $path $settestuser 'append'

cr_psscriptline $path '$domaincred = New-Object System.Management.Automation.PSCredential( $testuser, $secure_string_pwd )' 'append'

$settestdomain = '$testdomain="'+ ${global:testdomain} + '"'
cr_psscriptline $path $settestdomain 'append'

cr_psscriptline $path 'Add-Computer -Credential $domaincred -DomainName $testdomain -Force -Confirm:$false  -WarningAction silentlyContinue' 'append'
cr_psscriptline $path 'Get-NetFirewallProfile | Set-NetFirewallProfile –Enabled False -Confirm:$false' 'append'

cr_psscriptline $path '$newdisk = get-disk | where-object { $_.FriendlyName -eq ''Microsoft Virtual Disk''}' 'append'
cr_psscriptline $path 'initialize-disk $newdisk.number' 'append'
cr_psscriptline $path 'New-Partition -disknumber $newdisk.number -driveletter S -UseMaximumSize' 'append'
cr_psscriptline $path 'format-volume -driveletter S -filesystem NTFS -NewFileSystemLabel ''SIOS Share'' -Force -Confirm:$false' 'append'

$cmdret = upload_ps_script $path ${global:testclnodesetupscriptname2}
}


#################################################################################
# function to create a PS script which will configure a cluster node
#     - via the custom script extension it will create a cluster using a static
#       IP address without assigning storage
#     - the cluster will be created without storage as this will be added later
#       by using 3rd-party software SIOS Datakeeper
#################################################################################

function create_clnodesetup_script_03 {
param(
[string]$path,
[string]$tuser )

create_credential_startup_script ${global:testclnodesetupstartscript3} ${global:testclnodesetupscriptname3} ${global:testclnodesetupstartscriptname3} "domain" "credssp" "shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

#cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
#cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
#cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'force'
cr_psscriptline $path '$cmdret = Import-module failoverclusters' 'append'

$command = 'New-Cluster –Name ' + ${global:testclustername} + ' -node ' + ${global:testvmcl1name} + ',' + ${global:testvmcl2name} + ' -staticaddress ' + ${global:testclusteraddr} + ' -NoStorage' 
cr_psscriptline $path $command 'append'

$cmdret = upload_ps_script $path ${global:testclnodesetupscriptname3}
}


#################################################################################
# function to create a PS script which will configure a cluster node
#     - via the custom script extension it will move all cluster groups to
#       the first node as this is the node where the PS script will run
#     - then the script will add a file share witness as the cluster quorum.
#       The file share was created on the domain controller VM before
#################################################################################

function create_clnodesetup_script_04 {
param(
[string]$path,
[string]$tuser )

create_credential_startup_script ${global:testclnodesetupstartscript4} ${global:testclnodesetupscriptname4} ${global:testclnodesetupstartscriptname4} "domain" "default" "no shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'append'
cr_psscriptline $path '$cmdret = Import-module failoverclusters' 'append'

$command = 'get-clustergroup | move-clustergroup -node ' + ${global:testvmcl1name}
cr_psscriptline $path $command 'append'

$command = 'Set-ClusterQuorum -Cluster ' + ${global:testclustername} + ' –FileShareWitness \\' + ${global:testvmdcname} + '\' + ${global:testclusterquorumfilesharename}
cr_psscriptline $path $command 'append'


$cmdret = upload_ps_script $path ${global:testclnodesetupscriptname4}
}


#################################################################################
# function to create a PS script which will configure a cluster node
#     - via the custom script extension it will move all cluster groups to
#       the first node as this is the node where the PS script will run
#     - then the script will add a file server role 
#     - afterwards it will replace the IP address of the file server role by
#       the IP address of the Azure Internal Load Balancer which was created
#       before
#     - then it creates a file share on the cluster storage. This is the
#       file share which will be highly avaiable due to the failover cluster
#       and which should be accessible from other VMs
#################################################################################

function create_clnodesetup_script_05 {
param(
[string]$path )

create_credential_startup_script ${global:testclnodesetupstartscript5} ${global:testclnodesetupscriptname5} ${global:testclnodesetupstartscriptname5} "domain" "credssp" "no shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'append'
cr_psscriptline $path '$cmdret = Import-module failoverclusters' 'append'

$command = 'get-clustergroup | move-clustergroup -node ' + ${global:testvmcl1name}
cr_psscriptline $path $command 'force'

$command = 'add-clusterfileserverrole -name ' + ${global:testclusterfsgroupname} + ' -storage "' + ${global:testclusterstorage} + '" -staticaddress ' + ${global:testclusterfsgroupaddr}
cr_psscriptline $path $command 'append'

$setprobeport = '$probeport="'+ ${global:testilbprobeport} + '"'
cr_psscriptline $path $setprobeport 'append'

$setclustergroup = '$fileserverresource = get-clusterresource | Where-Object { ($_.name -like "IP*' + ${global:testclusterfsgroupaddr} + '*" ) }'
cr_psscriptline $path $setclustergroup 'append'

$command = '$fileserverresource | set-clusterparameter -Multiple @{"Address"="' + ${global:testilbaddress} +
           '";"ProbePort"=$ProbePort;"Subnetmask"="255.255.255.255";"Network"="Cluster Network 1";"OverrideAddressMatch"=1;"EnableDhcp"=0}' 
cr_psscriptline $path $command 'append'

$command = 'New-Item "' + ${global:testclusterfssharepath} + '" -type Directory'
cr_psscriptline $path $command 'append'

$command = '$Shares=[WMICLASS]"WIN32_Share"'
cr_psscriptline $path $command 'append'

$command = '$Shares.Create("' + ${global:testclusterfssharepath} + '","' + ${global:testclusterfssharename} + '",0,65535,"desc")'
cr_psscriptline $path $command 'append'

$command = 'Stop-ClusterGroup -Name ' + ${global:testclusterfsgroupname} + ' -Cluster ' + ${global:testclustername}
cr_psscriptline $path $command 'append'

$command = 'Start-ClusterGroup -Name ' + ${global:testclusterfsgroupname} + ' -Cluster ' + ${global:testclustername}
cr_psscriptline $path $command 'append'


$cmdret = upload_ps_script $path ${global:testclnodesetupscriptname5}
}


#################################################################################
# function to create a PS script which will configure a cluster node
#     - via the custom script extension it will first move all cluster groups to
#       the first node as this is the one where the PS script will run
#     - then it will remove the file server role
#     - afterwards it will remove the cluster itself using the "-CleanupAD"
#       option to cleanup AD entries on the domain controller VM
#
# this function will be used for cleanup tasks
#################################################################################

function create_clnodesetup_script_06 {
param( [string]$path )

create_credential_startup_script ${global:testclnodesetupstartscript6} ${global:testclnodesetupscriptname6} ${global:testclnodesetupstartscriptname6} "domain" "credssp" "shutdown"

$text = 'Create script "' + $path + '"'
display_text $text 1 1

cr_psscriptline $path '$Verbosepreference = "SilentlyContinue"' 'force'
cr_psscriptline $path '$WarningPreference = "SilentlyContinue"' 'append'
cr_psscriptline $path '$ProgressPreference= "SilentlyContinue"' 'append'

cr_psscriptline $path '$cmdret = Import-Module ServerManager'  'append'
cr_psscriptline $path '$cmdret = Import-module failoverclusters' 'append'

$command = 'get-clustergroup | move-clustergroup -node ' + ${global:testvmcl1name}
cr_psscriptline $path $command 'append'

$command = 'remove-clustergroup ' + ${global:testclusterfsgroupname} + ' -force -removeresources'
cr_psscriptline $path $command 'append'
$command = 'remove-cluster -cluster ' + ${global:testclustername} + ' -CleanupAD -force'
cr_psscriptline $path $command 'append'


$cmdret = upload_ps_script $path ${global:testclnodesetupscriptname6}
}


#################################################################################
# function to update Azure network config
#
# the function will be called to retry the network config update in order to
# make a DNS entry in the test vnet. The DNS entry corresponds to the name of
# the domain controller VM which was created by the main PS script
#################################################################################

function try_update_network_cr_dns {
param( [string]$tempfile,
       [int]$margin )

$dnsexists  = $false

display_text '' $margin 1
display_error 'Add DNS entry to vnet failed for some reason or is still in progress on the Azure side.' $margin 1
display_error 'Based on lab experience expect at least 4 retries in this situation' 
display_text '' $margin 1
$text = 'Will retry ' +  [string]${global:testfailureretries}  + ' times every ' + ${global:testfailureretryinterval} + ' secs'
display_text $text $margin 1

for( $i=1; $i -le ${global:testfailureretries}; $i++ )
    {
    start-sleep -s ${global:testfailureretryinterval} 
    $text = [string]$i + '. try' 
    display_text $text $margin 1
    $cmdret = set-AzureVNetConfig -configurationpath $tempfile 
    $cmdret = vnet_dns_entry_exists ([REF]$dnsexists)
    if( $dnsexists -eq $true )
        { break }
    }
if( $dnsexists )
    {
    display_text '' $margin 0
    display_ok_text_green 'DNS entry successfully added' 
    }
else
    {
    display_error 'Cannot add DNS entry to vnet. Start script in verbose mode to see error messages' 
    display_error 'or add DNS entry ( name of domain controller VM ) in vnet manually' 
    exit
    }
}


#################################################################################
# function to update Azure network config
#
# the function will be called to retry the network config update in order to
# create the test vnet. 
#################################################################################

function try_update_network_cr_vnet {
param( [string]$tempfile,
       [int]$margin )

[boolean]$vnetexists = $false

display_text '' $margin 1
display_error 'Add vnet failed for some reason or is still in progress on the Azure side' $margin 1
display_text '' $margin 1
$text = 'Will retry ' +  [string]${global:testfailureretries}  + ' times every ' + ${global:testfailureretryinterval} + ' secs'
display_text $text $margin 1

for( $i=1; $i -le ${global:testfailureretries}; $i++ )
    {
    start-sleep -s ${global:testfailureretryinterval} 
    $text = [string]$i + '. try' 
    display_text $text $margin 1
    $cmdret = set-AzureVNetConfig -configurationpath $tempfile 
    $cmdret = vnet_exists ([REF]$vnetexists)
    if( $vnetexists -eq $true )
        { break }
    }
if( $vnetexists )
    {
    display_text '' $ margin 0
    display_ok_text_green 'Vnet successfully added'
    }
else
    {
    display_error 'Cannot add vnet. Start script in verbose mode to see error messages' 
    display_error 'or add vnet manually' 
    exit
    }
}


#################################################################################
# function to update Azure network config
#
# the function will be called to retry the network config update in order to
# remove the DNS entry of the test vnet. It is part of the cleanup process
# which removes the domain controller VM
#################################################################################

function try_update_network_del_dns {
param( [string]$tempfile,
       [int]$margin )

[boolean]$dnsdelete  = $false
[boolean]$dnsexists  = $false

display_text '' $margin 1
display_error 'Remove DNS entry from vnet failed for some reason or is still in progress on the Azure side' $margin 1
display_text '' $margin 1
$text = 'Will retry ' +  [string]${global:testfailureretries}  + ' times every ' + ${global:testfailureretryinterval} + ' secs'
display_text $text $margin 1

for( $i=1; $i -le ${global:testfailureretries}; $i++ )
    {
    start-sleep -s ${global:testfailureretryinterval} 
    $text = [string]$i + '. try' 
    display_text $text $margin 1
    $cmdret = set-AzureVNetConfig -configurationpath $tempfile 
    $cmdret = vnet_dns_entry_exists ([REF]$dnsexists)
    if( $dnsexists -eq $false )
        { $dnsdelete = $true; break }
    }
if( $dnsdelete )
    {
    display_text '' $margin 0
    display_ok_text_green 'DNS entry successfully removed' 
    }
else
    {
    display_error 'Cannot remove DNS entry from vnet. Start script in verbose mode to see error messages' 
    display_error 'or remove DNS entry ( name of domain controller VM ) in vnet manually' 
    exit
    }
}


#################################################################################
# function to update Azure network config
#
# the function will be called to retry the network config update in order to
# remove the test vnet. It is part of the cleanup process which removes the
# test environment
#################################################################################

function try_update_network_del_vnet {
param( [string]$tempfile,
       [int]$margin )

[boolean]$vnetdelete  = $false

display_text '' $margin 1
display_error 'Remove of vnet entry failed for some reason or is still in progress on the Azure side' $margin 1
display_text '' $margin 1
$text = 'Will check ' +  [string]${global:testfailureretries}  + ' times every ' + ${global:testfailureretryinterval} + ' secs'
display_text $text $margin 1

for( $i=1; $i -le ${global:testfailureretries}; $i++ )
    {
    start-sleep -s ${global:testfailureretryinterval} 
    $text = [string]$i + '. try' 
    display_text $text $margin 1
    ##$cmdret = set-AzureVNetConfig -configurationpath $tempfile 
    $cmdret = vnet_exists ([REF]$vnetdelete)
    if( $vnetdelete -eq $false )
        { break }
    }
if( $vnetdelete -eq $false )
    {
    display_text 'Vnet entry successfully removed' $margin 1
    }
else
    {
    display_error 'Cannot remove vnet entry. Start script in verbose mode to see error messages' 
    display_error 'or remove vnet entry manually.' 
    exit
    }
}


#################################################################################
# function to update Azure network config
#
# the function will be called to upload a new network config file to update
# the Azure network config. There are 4 use cases :
#    - add a new DNS entry to the test vnet
#    - add a new vnet as the test vnet
#    - remove the test vnet DNS entry
#    - remove the test vnet
#################################################################################

function try_update_network_config {
param( [string]$tempfile,
       [string]$actiontype,
       [int]$margin )


[boolean]$dnsexists = $false
[boolean]$vnetexists = $false

$dnsdelete  = $false


$ErrorActionPreference="SilentlyContinue"

display_text 'Try to update vnet config' $margin 1
$cmdret = set-AzureVNetConfig -configurationpath $tempfile 


if( $actiontype -eq 'create dns' )
    {
    display_text 'Check if DNS entry was added correctly' $margin 1

    $cmdret = vnet_dns_entry_exists ([REF]$dnsexists)
    if( $dnsexists -eq $false )
        { try_update_network_cr_dns $tempfile $margin }
    else  
        { 
        display_text '' $margin 1
        display_ok_text_green 'DNS entry successfully added' 
        }
    }


if( $actiontype -eq 'create vnet' )
    {
    display_text 'Check if vnet was added correctly' $margin 1

    $cmdret = vnet_exists ([REF]$vnetexists)
    if( $vnetexists -eq $false )
        { try_update_network_cr_vnet $tempfile $margin }
    else
        { 
        display_text '' $margin 0
        display_ok_text_green 'Vnet successfully added'
        }
    }


if( $actiontype -eq 'delete dns' )
    {
    display_text 'Check if DNS entry was removed correctly' $margin 1

    $cmdret = vnet_dns_entry_exists ([REF]$dnsexists)
    if( $dnsexists -eq $true )
        { try_update_network_del_dns $tempfile $margin }
    else
        { 
        display_text '' $margin 0
        display_ok_text_green 'DNS entry successfully removed' 
        }
    }


if( $actiontype -eq 'delete vnet' )
    {
    display_text 'Check if vnet entry was removed correctly' $margin 1

    $cmdret = vnet_exists ([REF]$vnetexists)
    if( $vnetexists -eq $true )
        { try_update_network_del_vnet $tempfile $margin }
    else
        { 
        display_text '' $margin 0
        display_ok_text_green 'Vnet entry successfully removed' 
        }
    }


$ErrorActionPreference="Stop"
}


#################################################################################
# function to update Azure network config
#
# the function will be called to download the Azure network config in form of a
# XML file and edit this file to make a new vnet entry. The updated XML file
# will then be uploaded to Azure via a different function
#################################################################################

function create_vnet { 
param(
[string]$vnetname,
[string]$addressrange,
[string]$tempfile )

$xmlschema="http://schemas.microsoft.com/ServiceHosting/2011/07/NetworkConfiguration"
$vnetconfig = get-AzureVNetConfig
[xml]$vnetconfigxml = $vnetconfig.xmlconfiguration

$vnetsxmlnode = $vnetconfigxml.NetworkConfiguration.VirtualNetworkConfiguration.VirtualNetworkSites


$newVnetNode = $vnetconfigxml.CreateElement("VirtualNetworkSite",$xmlschema)
$cmdret = $newVnetNode.SetAttribute("name",$vnetname)
$cmdret = $newVnetNode.SetAttribute("Location",${global:testregion})

$newVnet = $vnetsxmlnode.appendchild($newVnetNode)

$vnetaddressspace = $vnetconfigxml.CreateElement("AddressSpace",$xmlschema)
$AddressSpace     = $newVnet.appendchild($vnetaddressspace)

$newAddressPrefix = $vnetconfigxml.CreateElement("AddressPrefix",$xmlschema)
$cmdret = $newAddressPrefix.InnerText=$addressrange

$cmdret = $AddressSpace.appendchild($newAddressPrefix)

$vnetsubnets = $vnetconfigxml.CreateElement("Subnets",$xmlschema)
$Subnets     = $newVnet.appendchild($vnetsubnets)

$vsubnet1 = $vnetconfigxml.CreateElement("Subnet",$xmlschema)
$cmdret = $vsubnet1.SetAttribute("name","Subnet-1")
$Subnet1  = $Subnets.appendchild($vsubnet1)

$newAddressPrefix = $vnetconfigxml.CreateElement("AddressPrefix",$xmlschema)
$newAddressPrefix.InnerText="10.0.0.0/23"

$cmdret = $Subnet1.appendchild($newAddressPrefix)


$cmdret = $vnetconfigxml.Save($tempfile)

$text = 'Update the Azure network configuration using "' + $tempfile + '"'
display_text $text 1 1
$cmdret = try_update_network_config $tempfile 'create vnet' 1
}


#################################################################################
# function to update Azure network config
#
# the function will be called to download the Azure network config in form of a
# XML file and edit this file to make a new DNS entry in the test vnet. The updated 
# XML file will then be uploaded to Azure via a different function
#################################################################################

function create_vnetdns { 
param(
[string]$vnetname,
[string]$dnsname,
[string]$tempfile )


$network_update_succeed = $true

$text = 'Try to get current Azure network config' 
display_text $text 1 1

$xmlschema="http://schemas.microsoft.com/ServiceHosting/2011/07/NetworkConfiguration"
$vnetconfig = get-AzureVNetConfig
[xml]$vnetconfigxml = $vnetconfig.xmlconfiguration


$ns = new-object Xml.XmlNamespaceManager $vnetconfigxml.NameTable
$cmdret = $ns.AddNamespace("vnetns", $xmlschema)

$text = 'Try to add the newly created domain controller VM "' + $dnsname + '" as a DNS server to the network DNS server selection list '
display_text $text 1 1

$currdnsservers = $vnetconfigxml.SelectNodes("//vnetns:DnsServers", $ns)
$newdns = $vnetconfigxml.CreateElement("DnsServer",$xmlschema)

$newdnsref = $currdnsservers.appendchild($newdns)
$cmdret = $newdnsref.SetAttribute("name",$dnsname)
$cmdret = $newdnsref.SetAttribute("IPAddress",${global:testvmdcaddr})


$currvnets = $vnetconfigxml.SelectNodes("//vnetns:VirtualNetworkSite", $ns)

foreach ( $vnet in $currvnets )
{
  if ( $vnet.name -eq $vnetname )
     {  $tvnet = $vnet }
}


$vnetdnsserversref = $vnetconfigxml.CreateElement("DnsServersRef",$xmlschema)
$DnsServersRef = $tvnet.appendchild($vnetdnsserversref)

$vnetdnsserverref = $vnetconfigxml.CreateElement("DnsServerRef",$xmlschema)
$DnsServerRef = $DnsServersRef.appendchild($vnetdnsserverref)

$cmdret = $DnsServerRef.SetAttribute("name",$dnsname)

$text = 'Save the new network config file "' + $tempfile + '"'
display_text $text 1 1
$cmdret = $vnetconfigxml.Save($tempfile)

$text = 'Update the Azure network configuration using "' + $tempfile + '"'
display_text $text 1 1

$cmdret = try_update_network_config $tempfile "create dns" 1
}


#################################################################################
# function to update Azure network config
#
# the function will be called to download the Azure network config in form of a
# XML file and edit this file to remove the DNS entry in the test vnet. The updated 
# XML file will then be uploaded to Azure via a different function
#################################################################################

function delete_vnetdns { 
param(
[string]$vnetname,
[string]$dnsname,
[string]$tempfile )

$vnetname = ${global:testvnet} 
$dnsname  = ${global:testvmdcname}
$tempfile = "c:\temp\vnetconfig.netcfg"

[boolean]$vnetexists = $false


$cmdret = vnet_exists ([REF]$vnetexists)

if( $vnetexists -eq $true )
    {
    $text = 'Try to get current Azure network config' 
    display_text $text 1 1

    $xmlschema="http://schemas.microsoft.com/ServiceHosting/2011/07/NetworkConfiguration"
    $vnetconfig = get-AzureVNetConfig
    [xml]$vnetconfigxml = $vnetconfig.xmlconfiguration

    $ns = new-object Xml.XmlNamespaceManager $vnetconfigxml.NameTable
    $cmdret = $ns.AddNamespace("vnetns", $xmlschema)

    $currvnets = $vnetconfigxml.SelectNodes("//vnetns:VirtualNetworkSite", $ns)
    $currdnsservers = $vnetconfigxml.SelectNodes("//vnetns:DnsServer", $ns)

    foreach ( $vnet in $currvnets )
        {
        if ( $vnet.name -eq $vnetname )
            {  $tvnet = $vnet }
        }


    if( $tvnet )
        { 
        if( $tvnet.DnsServersRef )
            {
            $text = 'Delete the DNS entry "' + $dnsname + '" from vnet "' + $vnetname +'"'
            display_text $text 1 1
            $cmdret = $tvnet.DnsServersRef.parentnode.removechild($tvnet.DnsServersRef)
        
            $text = 'Delete the DNS server reference in network configuration' 
            display_text $text 1 1

            foreach ( $dnsref in $currdnsservers )
                {
                if( $dnsref.name -eq $dnsname )
                    {
                    $cmdret = $dnsref.parentnode.removechild($dnsref)
                    }
                }
            $text = 'Save the new network config file "' + $tempfile + '"'
            display_text $text 1 1
            $cmdret = $vnetconfigxml.Save($tempfile)

            $text = 'Update the Azure network configuration using "' + $tempfile + '"'
            display_text $text 1 1

            $cmdret = try_update_network_config $tempfile 'delete dns' 1
            }
         else
            {
            $text = 'No entry found in config file. Nothing to delete.' 
            display_text $text 1 1
            }
         }
    }
else
    {
    $text = 'Vnet not found. No need to look for DNS entry. Nothing to delete.'
    display_text $text 1 1
    }
}


#################################################################################
# function to update Azure network config
#
# the function will be called to download the Azure network config in form of a
# XML file and edit this file to remove the test vnet. The updated 
# XML file will then be uploaded to Azure via a different function
#################################################################################

function delete_vnet { 
param(
[string]$vnetname,
[string]$tempfile )


$text = 'Try to get current Azure network config' 
display_text $text 1 1

$xmlschema='http://schemas.microsoft.com/ServiceHosting/2011/07/NetworkConfiguration'
$vnetconfig = get-AzureVNetConfig
[xml]$vnetconfigxml = $vnetconfig.xmlconfiguration


$ns = new-object Xml.XmlNamespaceManager $vnetconfigxml.NameTable
$cmdret = $ns.AddNamespace("vnetns", $xmlschema)


$currvnets = $vnetconfigxml.SelectNodes('//vnetns:VirtualNetworkSite', $ns)

foreach ( $vnet in $currvnets )
{
  if ( $vnet.name -eq $vnetname )
     {  $tvnet = $vnet }
}


if( $tvnet )
    { 
    $text = 'Delete the vnet entry "' + $vnetname + '"'
    display_text $text 1 1

    
    $cmdret = $tvnet.parentnode.removechild($tvnet)
    $text = 'Save the new network config file : "' + $tempfile + '"'
    display_text $text 1 1
    $cmdret = $vnetconfigxml.Save($tempfile)

    $text = 'Update the Azure network configuration using "' + $tempfile + '"'
    display_text $text 1 1        
    $cmdret = try_update_network_config $tempfile 'delete vnet' 1
    }
else
    {
    display_text 'No vnet entry found. Nothing to delete' 1 1
    }
}


#################################################################################
# function to trigger a PS script inside an Azure VM via the custom script 
# extension feature.
# The PS script was created locally and uploaded to the Azure test storage 
# account test container before
#################################################################################

function update_custom_script_extension {
param(
[string]$scriptname,
[string]$startupscript,
[string]$servicename,
[string]$vmname )

$vm = get-azurevm -servicename $servicename -name $vmname

$cmdret = Set-AzureVMExtension -ExtensionName CustomScriptExtension -publisher "Microsoft.Compute" -version "1.1" -VM $vm
$cmdret = set-azureVMCustomscriptextension -VM $vm -Containername ${global:teststoragecontainer} -filename $scriptname, $startupscript -run $startupscript | Update-AzureVM

}



#################################################################################
# function to create the domain controller VM
# It will create the new VM and then use the custom script extension feature
# to make some configuration changes
#################################################################################

function create_dc_vm {

[boolean]$exists = $false

$newdcvm = new-AzureVMConfig -Name ${global:testvmdcname} -InstanceSize ${global:testvmdcsize} -ImageName ${global:testOSimage} | set-azuresubnet 'Subnet-1' | Set-AzureStaticVNetIP -IPAddress 10.0.0.10
$newdcvm = add-AzureProvisioningConfig -VM $newdcvm -Windows -AdminUsername ${global:testuser} -Password ${global:testpassword}

display_text 'Call new-AzureVM command ' 1 1
$cmdret = new-AzureVM -Servicename ${global:testvmdccloudservice} -VMs $newdcvm -location ${global:testregion} -VnetName ${global:testvnet}
wait_for_vm_status_running ${global:testvmdccloudservice} ${global:testvmdcname} 1 ([REF]$exists)

if( $exists -eq $true )
    {
    display_text '' 1 0
    display_ok_text_green 'VM successfully created'
    }

display_text 'Domain controller is up and running. Use custom script extension to install DNS/AD role.' 1 1
display_text 'This will take several minutes' 1 1
update_custom_script_extension ${global:testdcsetupscriptname} ${global:testdcsetupstartscriptname} ${global:testvmdccloudservice} ${global:testvmdcname}
wait_for_vm_status_stopped ${global:testvmdccloudservice} ${global:testvmdcname} 1

$text = 'Start domain controller VM "' + ${global:testvmdcname} + '"'
display_text $text 1 1
$cmdret = Start-AzureVM -ServiceName ${global:testvmdccloudservice} -Name ${global:testvmdcname}
wait_for_vm_status_running ${global:testvmdccloudservice} ${global:testvmdcname} 1 ([REF]$exists)

display_text 'Domain controller VM was created and is up and running. Now use custom script extension to create domain' 1 1
update_custom_script_extension ${global:testdcsetupscriptname2} ${global:testdcsetupstartscriptname2} ${global:testvmdccloudservice} ${global:testvmdcname}
wait_for_vm_status_stopped ${global:testvmdccloudservice} ${global:testvmdcname} 1

$text = 'Start domain controller VM "' + ${global:testvmdcname} + '"'
display_text $text 1 1
$cmdret = Start-AzureVM -ServiceName ${global:testvmdccloudservice} -Name ${global:testvmdcname}
wait_for_vm_status_running ${global:testvmdccloudservice} ${global:testvmdcname} 1 ([REF]$exists)
}


#################################################################################
# function to create the cluster quorum file share on the domain controller VM
# via the custom script extension feature
#################################################################################

function create_dc_cl_quorum_share {

[boolean]$exists = $false

display_text 'Create cluster quorum file share on domain controller VM and set permissions for cluster' 1 1
update_custom_script_extension ${global:testdcsetupscriptname3} ${global:testdcsetupstartscriptname3} ${global:testvmdccloudservice} ${global:testvmdcname}
wait_for_vm_status_running ${global:testvmdccloudservice} ${global:testvmdcname} 1 ([REF]$exists)

}


#################################################################################
# function to delete the cluster quorum file share on the domain controller VM
# via the custom script extension feature
#################################################################################

function delete_dc_cl_quorum_share {

[boolean]$exists = $false

display_text 'Delete cluster quorum file share on domain controller VM' 1 1
update_custom_script_extension ${global:testdcsetupscriptname4} ${global:testdcsetupstartscriptname4} ${global:testvmdccloudservice} ${global:testvmdcname}
wait_for_vm_status_running ${global:testvmdccloudservice} ${global:testvmdcname} 1 ([REF]$exists)

}


#################################################################################
# function to create a cluster node VM. In this very first step the VM will be 
# created within the test region and test vnet
#################################################################################

function create_clnode_part1 {
param(
[string]$servicename,
[string]$vmname,
[string]$ipaddress )

[boolean]$exists = $false

$newclvm = new-AzureVMConfig -Name $vmname -InstanceSize ${global:testvmclsize} -ImageName ${global:testOSimage} -AvailabilitySetName ${global:testavset} | set-azuresubnet 'Subnet-1' | Set-AzureStaticVNetIP -IPAddress $ipaddress
$newclvm = add-AzureProvisioningConfig -VM $newclvm -Windows -AdminUsername ${global:testuser} -Password ${global:testpassword}

display_text 'Call new-AzureVM command  ' 1 1
$cmdret = new-AzureVM -Servicename $servicename -VMs $newclvm -location ${global:testregion} -vnet ${global:testvnet}
wait_for_vm_status_running $servicename $vmname 1 ([REF]$exists)

if( $exists -eq $true )
    {
    display_text '' 1 0
    display_ok_text_green 'VM successfully created'
    }
}


#################################################################################
# function to configure a cluster node VM
# It adds a 5GB data disk and makes some configuration changes via the custom
# script extension feature and also installs .NET Framework in case of a public
# OS image as well as the failover cluster feature
#################################################################################

function create_clnode_part2 {
param(
[string]$servicename,
[string]$vmname )

[boolean]$exists = $false

display_text 'Add data disk which will act as shared disk for cluster failover' 1 1
$vmcln = get-azurevm -servicename $servicename -name $vmname


$cmdret = Add-AzureDataDisk -CreateNew -DiskSizeInGB 5 -DiskLabel 'SIOS Share' -LUN 0 -VM $vmcln | update-Azurevm
wait_for_vm_status_running $servicename $vmname 1 ([REF]$exists)

display_text 'Use custom script extension to install failover cluster feature as well as .Net Framework 3.5 in case of a public OS image' 1 1
display_text 'and add DNS entry to network interface. This step usually takes 10 minutes or more.' 1 1 
update_custom_script_extension ${global:testclnodesetupscriptname1} ${global:testclnodesetupstartscriptname1} $servicename $vmname
wait_for_vm_status_stopped $servicename $vmname 1

$text = 'Start cluster node VM "' + $vmname + '"'
display_text $text 1 1
$cmdret = Start-AzureVM -ServiceName $servicename -Name $vmname
wait_for_vm_status_running $servicename $vmname 1 ([REF]$exists)
}


#################################################################################
# function to configure a cluster node VM
# It creates a new volume on the attached 5GB data disk and joins the VM to the
# test domain which was created before on the domain controller VM by using
# the custom script extension feature
#################################################################################

function create_clnode_part3 {
param(
[string]$servicename,
[string]$vmname )

[boolean]$exists = $false

display_text 'Use custom script extension to format newly attached data disk and then join the test domain' 1 1 
update_custom_script_extension ${global:testclnodesetupscriptname2} ${global:testclnodesetupstartscriptname2} $servicename $vmname
wait_for_vm_status_stopped $servicename $vmname 1

$text = 'Start cluster node VM "' + $vmname + '"'
display_text $text 1 1
$cmdret = Start-AzureVM -ServiceName $servicename -Name $vmname
wait_for_vm_status_running $servicename $vmname 1  ([REF]$exists)
}


#################################################################################
# function to configure a cluster node VM
# It creates the test cluster using the two cluster node VMs by calling a PS
# script which was created before via the custom script extension feature
#################################################################################

function create_cluster_part1 {
param(
[string]$servicename,
[string]$vmname )

[boolean]$exists = $false

$text = 'Use custom script extension to create cluster "' + ${global:testclustername} + '" on nodes "' + ${global:testvmcl1name} + '","' + ${global:testvmcl2name} + '"'
display_text $text 1 1 
update_custom_script_extension ${global:testclnodesetupscriptname3} ${global:testclnodesetupstartscriptname3} $servicename $vmname
wait_for_vm_status_stopped $servicename $vmname 1

$text = 'Start cluster node VM "' + $vmname + '"'
display_text $text 1 1
$cmdret = Start-AzureVM -ServiceName $servicename -Name $vmname
wait_for_vm_status_running $servicename $vmname 1 ([REF]$exists)
}


#################################################################################
# function to configure a cluster node VM
# It adds a file share witness to the test cluster via the custom script extension
# feature
#################################################################################

function create_cluster_part2 {
param(
[string]$servicename,
[string]$vmname )

[boolean]$exists = $false

$text = 'Use custom script extension to add quorum file share to  cluster "' + ${global:testclustername} + '"'
display_text $text 1 1 
update_custom_script_extension ${global:testclnodesetupscriptname4} ${global:testclnodesetupstartscriptname4} $servicename $vmname
wait_for_vm_status_running $servicename $vmname 1 ([REF]$exists)
}


#################################################################################
# function to configure a cluster node VM
# - it adds an Azure Internal Load Balancer to the cluster cloud service
# - it adds ILB related end points to the cluster VMs
# - it adds file server role and file share to the test cluster via the
#   custom script extension feature
#################################################################################

function create_cluster_part3 {
param(
[string]$servicename,
[string]$vmname )


[boolean]$exists = $false

display_text '' 0 1
display_text 'Step 1 of 3 : create PS Scripts for post SIOS installation processing' 1 1
display_text '' 0 1
create_clnodesetup_script_05  ${global:testclnodesetupscript5}

display_text '' 0 1
$text = 'Step 2 of 3 : Configure Azure internal load balancer for failover cluster'
display_text $text 1 1

$text = 'Add ILB to cloud service "' + $servicename + '" using static IP address "' + ${global:testilbaddress} + '"'
display_text $text 2 1
$cmdret = add-azureInternalLoadBalancer -internalloadbalancername ilbfsha -ServiceName $servicename -Subnetname Subnet-1 -StaticVnetIPaddress ${global:testilbaddress}

$ProbePort = ${global:testilbprobeport}

$text = 'Add endpoints related to load balancer to first cluster node VM "' + ${global:testvmcl1name} + '"'
display_text $text 2 1
$cmdret = Get-AzureVM -ServiceName $servicename -Name ${global:testvmcl1name} | Add-AzureEndpoint -Name "fsep1" -LBSetName "ilbsetfsha" -Protocol tcp -LocalPort 443 -PublicPort 443 -ProbePort $ProbePort -ProbeProtocol tcp -ProbeIntervalInSeconds 10 -InternalLoadBalancerName ilbfsha | Update-AzureVM
$cmdret = Get-AzureVM -ServiceName $servicename -Name ${global:testvmcl1name} | Add-AzureEndpoint -Name "fsep2" -LBSetName "ilbsetfsha2" -Protocol tcp -LocalPort 445 -PublicPort 445 -ProbePort $ProbePort -ProbeProtocol tcp -ProbeIntervalInSeconds 10 -InternalLoadBalancerName ilbfsha | Update-AzureVM

$text = 'Add endpoints related to load balancer to second cluster node VM "' + ${global:testvmcl2name} + '"'
display_text $text 2 1
$cmdret = Get-AzureVM -ServiceName $servicename -Name ${global:testvmcl2name} | Add-AzureEndpoint -Name "fsep1" -LBSetName "ilbsetfsha" -Protocol tcp -LocalPort 443 -PublicPort 443 -ProbePort $ProbePort -ProbeProtocol tcp -ProbeIntervalInSeconds 10 -InternalLoadBalancerName ilbfsha | Update-AzureVM
$cmdret = Get-AzureVM -ServiceName $servicename -Name ${global:testvmcl2name} | Add-AzureEndpoint -Name "fsep2" -LBSetName "ilbsetfsha2" -Protocol tcp -LocalPort 445 -PublicPort 445 -ProbePort $ProbePort -ProbeProtocol tcp -ProbeIntervalInSeconds 10 -InternalLoadBalancerName ilbfsha | Update-AzureVM

display_text '' 0 1
$text = 'Step 3 of 3 : Use custom script extension to add cluster file server role and file share' 
display_text $text 1 1 
update_custom_script_extension ${global:testclnodesetupscriptname5} ${global:testclnodesetupstartscriptname5} $servicename $vmname
wait_for_vm_status_running $servicename $vmname 1 ([REF]$exists)
}


#################################################################################
# function to set up the domain controller VM
# - create corresponding PS scripts to configure the VM via the custom script
#   extension feature
# - create the domain controller VM
# - make the DNS entry in the test vnet using the name of the domain controller
#   VM
#################################################################################

function domain_controller_vm_setup {

[boolean]$osimageexists = $false

display_text '' 0 1
$text = 'Check existence of OS image : "' + ${global:testOSimage} + '"'
display_text $text 0 1

$cmdret = osimage_exists  ${global:testOSimage} ([REF]$osimageexists)

if ( $osimageexists -eq $true )
    {
    display_text '' 0 1
    display_ok_text_green 'OS image found'
    display_text '' 0 1
    display_text 'Domain controller VM setup will start' 0 1
    display_text '' 0 1
    display_text 'Step 1 of 3 : create PS Scripts for creating domain controller VM' 0 1

    create_dcsetup_script ${global:testdcsetupscript}
    create_dcsetup_script2 ${global:testdcsetupscript2}

    display_text '' 0 1
    display_text "Step 2 of 3 : create the domain controller VM" 0 1
    create_dc_vm

    display_text '' 0 1
    display_text 'Step 3 of 3 : add the domain controller VM as DNS entry to the vnet' 0 1
    create_vnetdns ${global:testvnet} ${global:testvmdcname} ${global:testvnetconfig}
    }
 else
    {
    display_text '' 0 1
    $text = 'OS image : "' + ${global:testOSimage} + '" not found. Edit config file or create OS image first'
    display_error $text
    }
}


#################################################################################
# function to set up the cluster node VMs
# - create corresponding PS scripts to configure the VMs via the custom script
#   extension feature
# - create the cluster node VMs and configure them via custom script extension
#   feature
# - create the test cluster including the quorum file share witness
#################################################################################

function cluster_nodes_setup {

display_text "" 0 1
display_text "Step 1 of 6 : create PS Scripts for creating cluster nodes" 0 1

create_dcsetup_script3  ${global:testdcsetupscript3}
create_dcsetup_script4  ${global:testdcsetupscript4}

create_clnodesetup_script_01 ${global:testclnodesetupscript1} ${global:testuser} ${global:testvmdcaddr}
create_clnodesetup_script_02 ${global:testclnodesetupscript2} ${global:testuser} 
create_clnodesetup_script_03 ${global:testclnodesetupscript3} ${global:testuser} 
create_clnodesetup_script_04 ${global:testclnodesetupscript4} ${global:testuser} 

display_text "" 0 1
display_text "Step 2 of 6 : create cluster node 1" 0 1
create_clnode_part1 ${global:testvmclcloudservice} ${global:testvmcl1name} ${global:testvmcl1addr}
create_clnode_part2 ${global:testvmclcloudservice} ${global:testvmcl1name}
create_clnode_part3 ${global:testvmclcloudservice} ${global:testvmcl1name}

display_text "" 0 1
display_text "Step 3 of 6 : create cluster node 2" 0 1
create_clnode_part1 ${global:testvmclcloudservice} ${global:testvmcl2name} ${global:testvmcl2addr}
create_clnode_part2 ${global:testvmclcloudservice} ${global:testvmcl2name}
create_clnode_part3 ${global:testvmclcloudservice} ${global:testvmcl2name}

display_text "" 0 1
display_text "Step 4 of 6 : create a cluster on the two cluster nodes" 0 1
create_cluster_part1 ${global:testvmclcloudservice} ${global:testvmcl1name}

display_text "" 0 1
display_text "Step 5 of 6 : create quorum file share on domain controller VM including cluster permissions" 0 1
create_dc_cl_quorum_share

display_text "" 0 1
display_text "Step 6 of 6 : add quorum file share to cluster" 0 1
create_cluster_part2 ${global:testvmclcloudservice} ${global:testvmcl1name}
}


#################################################################################
# function to create local tempdir used e.g. for generated PS scripts
#################################################################################
function create_local_tempdir {

[boolean]$exists = $false

$ErrorActionPreference="SilentlyContinue"
$cmdret = new-item ${global:localtempdir} -itemtype directory
$ErrorActionPreference="Stop"

$cmdret = tempdir_exists ([REF]$exists)
if ( $exists -eq $true )
    {
    display_text '' 1 0
    $text = 'Local tempdir "' + ${global:localtempdir} + '" created successfully'
    display_ok_text_green $text
    }
else
    {
    display_text '' 1 1
    $text = 'Failure ! Could not create local tempdir "' + ${global:localtempdir} + '"'
    display_error $text
    display_error 'Please create manually or change path in the global variable'
    exit
    }
}


#################################################################################
# function to create the new test storage account as well as the container
# which will keep the PS scripts for usage by the custom script extension feature
#################################################################################

function create_new_storage_account {

[boolean]$containerexists = $false

display_text '' 1 1
$text = 'Try to create storage account : "' + ${global:teststorageaccount} + '"'
display_text $text 1 1
display_text 'This will take several minutes' 1 1

$ErrorActionPreference="SilentlyContinue"


$cmdret = New-AzureStorageAccount -StorageAccountName ${global:teststorageaccount} -Label ${global:teststorageaccountlabel} -location ${global:testregion}
$newstacc = get-azurestorageaccount -storageaccountname ${global:teststorageaccount}

if( $newstacc )
    {
    display_text '' 1 0
    display_ok_text_green 'Storage account created successfully'
    }
else
    {
    display_text '' 1 1
    display_error 'Failure ! Storage account could not be created ! Please restart script, do cleanup and try again'
    press any_key
    exit
    }

display_text '' 1 1
$text = 'Check status of newly created storage account until it is fully available. Check interval ' + [string]${global:testcheckinterval} + ' secs'
display_text $text 1 1
display_text '.' 1 0
do {
    start-sleep -s ${global:testcheckinterval}
    display_text '.' 0 0
    $newstacc = get-azurestorageaccount -storageaccountname ${global:teststorageaccount}
} while ( !($newstacc.storageaccountstatus -eq 'Created') -or !($newstacc.statusofprimary -eq 'Available') -or !($newstacc.statusofsecondary -eq 'Available') )

display_text '' 1 1
    
$cmdret = set_subenv
$cmdret = Set-AzureStorageAccount -StorageAccountName ${global:teststorageaccount} –GeoReplicationEnabled $False 

display_text '' 1 1
$text = 'Storage container with name "' + ${global:teststoragecontainer}  + '" will be created now.'
display_text $text 1 1


$cmdret = storage_context  
$cmdret = New-AzureStorageContainer ${global:teststoragecontainer} -context ${global:storagecontext}
display_text '' 1 1

$cmdret = container_exists ([REF]$containerexists)
if( $containerexists -eq $false )
    {
    display_text '' 1 1
    display_error 'Container creation failed for some reason !'
    display_text '' 1 1
    $text = 'Will retry ' +  [string]${global:testfailureretries}  + ' times every ' + ${global:testfailureretryinterval} + ' secs'
    display_text $text 1 1

    for ( $i=1; $i -le ${global:testfailureretries}; $i++ )
       {
       start-sleep -s ${global:testfailureretryinterval}
       $text = [string]$i + '. try'
       display_text $text 1 1 
       $cmdret = storage_context
       $cmdret = New-AzureStorageContainer ${global:teststoragecontainer} -context ${global:storagecontext}
       $cmdret = container_exists ([REF]$containerexists)
       if( $containerexists -eq $true )
           { break }
       }
    }

$ErrorActionPreference="Stop"

$cmdret = container_exists ([REF]$containerexists)
if( $containerexists -eq $false )
   {
   display_text '' 1 0
   $text = 'Container "' + ${global:teststoragecontainer} + '" could not be created ! Please try to create manually via the Azure portal'
   display_error $text
   press_any_key
   exit
   }
else
   {
   display_text '' 1 0
   display_ok_text_green 'Storage container created successfully'
   }
}



#################################################################################
# function to initialize the test environment
# It will check the existence of some basic test objects and create them in case
# they don't exist yet :
# - test vnet
# - test affinity group
# - test storage account
# - test storage container
#################################################################################

function initialize_test_environment {
param ( [REF]$return_value )

[boolean]$exists = $false
$change_env = $false

display_text "" 0 1
display_warning 'Check existence of four basic prerequisites' 


display_text '' 0 1
display_text 'Check 1 of 4'
$cmdret = tempdir_exists ([REF]$exists)
if(  $exists -eq $false )
    {
    display_text '' 0 1
    $text = 'Local tempdir "' + ${global:localtempdir}  + '" not found. Will be created now.'
    display_text $text 0 1 
  
    create_local_tempdir 

    $change_env = $true
    }
else
    {
    display_text '' 1 1
    $text = 'Local tempdir "' + ${global:localtempdir} + '" found'
    display_ok_text_green $text 
    }


display_text '' 0 1
display_text 'Check 2 of 4'

$cmdret = vnet_exists ([REF]$exists)
if( $exists -eq $false )
    {
    display_text '' 0 1
    $text = 'Vnet "' + ${global:testvnet} + '" not found. Will be created now.'
    display_text $text 0 1
    create_vnet ${global:testvnet} "10.0.0.0/20" ${global:testvnetconfig}
    display_text '' 0 1
    $change_env = $true
    }
else
    {
    display_text '' 0 1
    $text = 'Vnet "' + ${global:testvnet} + '" found'
    display_ok_text_green $text
    }


display_text '' 0 1
display_text 'Check 3 of 4'
$cmdret = storage_account_exists ([REF]$exists)
if ( $exists -eq $false )
    {
    display_text '' 0 1
    $text = 'Storage account "' + ${global:teststorageaccount}  + '" not found. Will be created now.'
    display_text $text 0 1
    display_text '' 0 1

    create_new_storage_account

    $change_env = $true
    }
else
    {
    display_text '' 0 1
    $text = 'Storage account "' + ${global:teststorageaccount}  + '" found'
    display_ok_text_green $text 
    }


display_text '' 0 1
display_text 'Check 4 of 4'
$cmdret = container_exists ([REF]$exists)
if(  $exists -eq $false )
    {
    display_text '' 0 1
    $text = 'Storage container "' + ${global:teststoragecontainer}  + '" not found. Will be created now.'
    display_text $text 0 1
    $cmdret = New-AzureStorageContainer ${global:teststoragecontainer}
    display_text '' 0 1
    $change_env = $true
    }
else
    {
    display_text '' 1 1
    $text = 'Storage container "' + ${global:teststoragecontainer}  + '" found'
    display_ok_text_green $text 
    }

if( $change_env )
    { press_any_key }

$return_value.value = $change_env
}


#################################################################################
# function to check VM existence before setup starts
#################################################################################

function check_vm_existence_before_setup {
param ( [int]$currchecknr,
        [int]$maxchecknr,
        [string]$mode,
        [string]$label,
        [string]$servicename,
        [string]$vmname,
        [REF]$return_value )


[boolean]$exists = $false

$text = 'Check ' + [string]$currchecknr + ' of ' + [string]$maxchecknr + ' : existence of ' + $label + ' - '
display_text $text 0 0 

$cmdret = virtual_machine_exists $servicename $vmname ([REF]$exists)
if( $exists )
    {
    $text = $label + ' "' + $vmname + '" exists'
    if( $mode -eq 'c' )
        {  display_error $text  }
    else
        {  display_ok_text_green $text }
    }
else
    {
    $text = $label + ' "' + $vmname + '" not found'
    if( $mode -eq 'c' )
        {  display_ok_text_green $text  }
    else
        {  display_error $text  }
    }

$return_value.value = $exists
}


#################################################################################
# function to check vnet dns existence before setup starts
#################################################################################

function check_vnet_existence_before_setup {
param ( [int]$currchecknr,
        [int]$maxchecknr,
        [string]$mode,
        [REF]$return_value )


[boolean]$exists = $false

$text = 'Check ' + [string]$currchecknr + ' of ' + [string]$maxchecknr + ' : existence of vnet / dns entry in vnet - '
display_text $text 0 0 


$cmdret = vnet_dns_entry_exists ([REF]$exists)

if( $exists )
    {
    $text = 'DNS entry "' + ${global:testvmdcname} + '" already exists'
    if( $mode -eq 'c' )
        { display_error $text }
    else
        { display_ok_text_green $text }
    }
else
    {
    $text = 'DNS entry "' + ${global:testvmdcname} +  '" not found'
    if( $mode -eq 'c' )
        {  display_ok_text_green $text  }
    else
        { display_error $text }
    }

$return_value.value = $exists
}


#################################################################################
# function to display error text in case local script config file is missing
#################################################################################

function config_file_missing {

display_text '' 0 1
display_error 'No config file found or config file content is not valid.' 
display_error 'Namespace info is missing. Please choose item 1 and create or update config file' 
display_text '' 0 1

press_any_key
}


#################################################################################
# function to check if Azure connection works by trying to get available
# subscription names
#################################################################################

function check_if_Azure_connection_works {
param ( [string]$logintype )

clear-host
display_text '' 0 1
display_text 'Check basic Azure connection by trying to get available Azure subscription names' 0 1
display_text '' 0 1

$ErrorActionPreference="SilentlyContinue"

$sns = get-azuresubscription | select subscriptionname

$ErrorActionPreference="Stop"

if( !$sns )
    {
    display_text '' 0 1
    display_error 'Could not get any available Azure subscription name. Something is wrong.'
    if( $logintype -ne 'azure' )
        {
        display_error 'Script parameter -script_param_logintype = "azure" was not used. This might help.'
        }
    display_error 'Check your Internet and Azure connection'
    press_any_key
    exit
    }
}


#################################################################################
# function to call Azure login dialog
#################################################################################

function azure_login {

$cmdret = add-azureaccount

}


#################################################################################
# function which represents item 1 of the main script menu :
# create/update the script config file
#################################################################################

function action_main_menu_item_1 {
param ( [REF]$return_value )

[boolean]$configupdated     = $false
[boolean]$configfile_exists = $false
[boolean]$basicschange      = $false

update_config_file  ${global:testconfigfile} ([REF]$configupdated)

if( $configupdated -eq $true )
    {  $cmdret = read_config_file ${global:testconfigfile} 'no validate' ([REF]$configfile_exists)  }
else
    {  $cmdret = read_config_file ${global:testconfigfile} 'validate' ([REF]$configfile_exists)  }

if( $configfile_exists )
    {
    $cmdret = set_subenv
    $cmdret = any_vnet_exists ([REF]$anyvnetexists)
    if( $anyvnetexists -eq $false )
        { 
        display_text '' 0 1
        display_error 'No vnet found. Current version of the script requires at least one existing vnet'
        display_error 'Create a dummy vnet' 0 1
        press_any_key
        exit
        }
    if( $configupdated -eq $true )
        { 
        initialize_test_environment ([REF]$basicschange)
        if( $basicschange -eq $false )
            { press_any_key }
        }
    }
else
    {
    display_text '' 0 1
    display_error 'Config file still not existent or invalid content. Please enter new/correct values and save them'
    press_any_key
    }

$return_value.value = $configfile_exists
}


#################################################################################
# function which represents item 3 of the main script menu :
# create domain controller VM
#################################################################################

function action_main_menu_item_3 {

[boolean]$existcln1         = $false
[boolean]$existcln2         = $false
[boolean]$existdc           = $false
[boolean]$existdnsentry     = $false          
[boolean]$basicschange      = $false

clear-host

$cmdret = check_vm_existence_before_setup 1 4 'c' 'cluster node 1 VM' ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$existcln1)
$cmdret = check_vm_existence_before_setup 2 4 'c' 'cluster node 2 VM' ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$existcln2)
$cmdret = check_vm_existence_before_setup 3 4 'c' 'domain controller VM' ${global:testvmdccloudservice} ${global:testvmdcname} ([REF]$existdc)
$cmdret = check_vnet_existence_before_setup 4 4 'c' ([REF]$existdnsentry)

if( !$existcln1 -and !$existcln1 -and !$existdc -and !$existdnsentry )
    {
    display_text '' 0 1
    display_warning 'Test Setup of domain controller VM will start. This takes some time. Please wait.' 
    display_warning 'In the lab test environment using a Medium size VM it usually took 40 minutes.'

    initialize_test_environment ([REF]$basicschange)
    domain_controller_vm_setup
    }
else 
    {
    display_text '' 0 1
    display_error 'Existing objects found. Domain controller VM cannot be created.'
    display_error 'Do cleanup first' 0 1
    if( $existdc )
        { display_error 'Domain controller VM already exists' }
    if( $existdnsentry  )
        { display_error 'Domain entry in Azure network config already exists' }
    if( $existcln1 -or  $existcln2 )
        { display_error 'One or two cluster node VMs already exist' }
    }

press_any_key 
}



#################################################################################
# function which represents item 4 of the main script menu :
# create two cluster node VMs
#################################################################################

function action_main_menu_item_4 {

[boolean]$existcln1         = $false
[boolean]$existcln2         = $false
[boolean]$existdc           = $false
[boolean]$existdnsentry     = $false          
[boolean]$basicschange      = $false

clear-host
display_text '' 0 1
$cmdret = check_vm_existence_before_setup 1 4 'c'  'cluster node 1 VM' ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$existcln1)
$cmdret = check_vm_existence_before_setup 2 4 'c'  'cluster node 2 VM' ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$existcln2)
$cmdret = check_vm_existence_before_setup 3 4 'd'  'domain controller VM' ${global:testvmdccloudservice} ${global:testvmdcname} ([REF]$existdc)
$cmdret = check_vnet_existence_before_setup 4 4 'd' ([REF]$existdnsentry)

if( !$existcln1 -and !$existcln2 -and $existdc -and $existdnsentry )
    {
    display_text '' 0 1
    display_warning 'Test Setup of two cluster node VMs will start. In the lab test environment using Medium size VMs' 
    display_warning 'this usually took about 1 hour.'
    display_text '' 0 1
    cluster_nodes_setup
    }
else
    { 
    display_text '' 0 1
    display_error 'Cluster nodes cannot be created' 0 1
    display_text '' 0 1

    if ( $existcln1 -or $existcln2 )
        {
        display_error 'One or two cluster nodes already exist. Do cleanup first' 0 1
        }
    if ( !$existdc  )
        {
        display_error 'Domain controller VM not found. Create domain controller VM first' 0 1
        }
    if ( !$existdnsentry  )
        {
        display_error 'Domain entry in Azure network not found. Cleanup and create domain controller VM first' 0 1
        }

    }

press_any_key 
}


#################################################################################
# function which represents item 5 of the main script menu :
# complete test setup
#################################################################################

function action_main_menu_item_5 {
   
[boolean]$objectsexist      = $false
[boolean]$basicschange      = $false

$cmdret = testobjects_exist ([REF]$objectsexist)

if( $objectsexist -eq $false )
    {
    display_text '' 0 1
    display_warning 'Complete test setup will start. In the lab test environment using Medium size VMs'
    display_warning 'it usually took about 90 minutes. Please wait.'

    initialize_test_environment ([REF]$basicschange)
    domain_controller_vm_setup
    cluster_nodes_setup         
    }
else
    {
    display_text "" 0 1
    display_error "Objects found ! Please do a cleanup first or use a different namespace/subscription"
    display_text "" 0 1
    }

press_any_key
}


#################################################################################
# function which represents item 6 of the main script menu :
# delete domain controller VM
#################################################################################

function action_main_menu_item_6 {
      
[boolean]$objectsexist      = $false
[boolean]$basicschange      = $false
[boolean]$existcln1         = $false
[boolean]$existcln2         = $false
[boolean]$existdc           = $false   

clear-host
display_text '' 0 1
$cmdret = check_vm_existence_before_setup 1 3 'c' 'cluster node 1 VM' ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$existcln1)
$cmdret = check_vm_existence_before_setup 2 3 'c' 'cluster node 2 VM' ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$existcln2)
$cmdret = check_vm_existence_before_setup 3 3 'd' 'domain controller VM' ${global:testvmdccloudservice} ${global:testvmdcname} ([REF]$existdc)

if( !$existcln1 -and !$existcln2 )
    {
    if( !$existdc )
        {
        display_text '' 0 1
        display_text 'No domain controller VM found. Nothing to delete.' 0 1
        }
    else
        {
        testcleanup_domain_controller
        }
    }
else
    {
    display_text '' 0 1
    display_error 'One or two cluster node VMs found. Domain controller VM cannot be deleted' 0 1
    display_error 'Cleanup cluster nodes first' 0 1
    display_text '' 0 1
    }

press_any_key 
}


#################################################################################
# function which represents item 7 of the main script menu :
# delete two cluster node VMs
#################################################################################

function action_main_menu_item_7 {

[boolean]$existcln1         = $false
[boolean]$existcln2         = $false

clear-host
$cmdret = check_vm_existence_before_setup 1 2 'd' 'cluster node 1 VM' ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$existcln1)
$cmdret = check_vm_existence_before_setup 2 2 'd' 'cluster node 2 VM' ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$existcln2)

if( $existcln1 -or $existcln2 )
    {
    testcleanup_clnodes
    }
else
    {
    display_text "" 0 1
    display_text "No cluster node VMs found. Nothing to delete" 0 1
    display_text "" 0 1
    }

press_any_key 
}


#################################################################################
# function which represents item 9 of the main script menu :
# SIOS post processing
#################################################################################

function action_main_menu_item_9 {

[boolean]$existcln1         = $false
[boolean]$existcln2         = $false
[boolean]$existdc           = $false 
            
clear-host

display_text '' 0 1
$cmdret = check_vm_existence_before_setup 1 3 'd' 'cluster node 1 VM' ${global:testvmclcloudservice} ${global:testvmcl1name} ([REF]$existcln1)
$cmdret = check_vm_existence_before_setup 2 3 'd' 'cluster node 2 VM' ${global:testvmclcloudservice} ${global:testvmcl2name} ([REF]$existcln2)
$cmdret = check_vm_existence_before_setup 3 3 'd' 'domain controller VM' ${global:testvmdccloudservice} ${global:testvmdcname} ([REF]$existdc)

if( $existcln1 -and $existcln2 )
    {
    display_text '' 0 1
    display_warning 'Configure Azure internal load balancer and cluster file server role after SIOS installation.' 
    display_text '' 0 1
    create_cluster_part3  ${global:testvmclcloudservice}  ${global:testvmcl1name}
    }
else
    {
    display_text '' 0 1
    display_text 'No cluster node VMs found. SIOS post processing not possible' 0 1
    display_text 'complete test setup necessary' 0 1
    display_text '' 0 1
    }

press_any_key 
}


#################################################################################
# main start function of the script which displays the main menu
#################################################################################

function main_test_setup {
param ( 
[string]$configpath,
[string]$logintype,
[int]$verbosemode )


[string]$selection          = ''
[boolean]$existcln1         = $false
[boolean]$existcln2         = $false
[boolean]$existdc           = $false
[boolean]$existdnsentry     = $false
[boolean]$configfile_exists = $false
[boolean]$anyvnetexists     = $false
[boolean]$objectsexist      = $false
[boolean]$basicschange      = $false
[boolean]$configupdated     = $false

$cmdret = set-Location -Path $configpath

if( $verbosemode -ne 1 )
    {
    $Verbosepreference = "SilentlyContinue"
    $WarningPreference = "SilentlyContinue"
    $ProgressPreference= "SilentlyContinue"
    }
$ErrorActionPreference= "Stop"
  
if( $logintype -eq 'azure' )
    {
    azure_login
    }

$cmdret = check_if_Azure_connection_works $logintype

$cmdret = read_config_file ${global:testconfigfile} 'validate' ([REF]$configfile_exists )

if( $configfile_exists -eq $true )
    { $cmdret = set_subenv 
      $cmdret = any_vnet_exists ([REF]$anyvnetexists)
      if( $anyvnetexists -eq $false )
          { display_text '' 0 1
            display_error 'no vnet found. Current version of the script requires at least one existing vnet'
            display_text '' 0 1
            display_text 'create a dummy vnet' 0 1
            press_any_key
            exit
           }
     }

[string] $start_menu = "Edit/Create Config File,Show current namespace,Setup of domain controller VM only,Setup of two cluster nodes only," +
                       "Complete Test Setup,Cleanup of domain controller VM only,Cleanup of two cluster nodes only," +
                       "Cleanup of Domain Controller VM and cluster node VMs,Post SIOS Install processing,Full Cleanup including storage account and OS image," +
                       "Show existing test objects on Azure"


do
{
$cmdret = display_main_menu $start_menu ([REF]$selection)

switch ( [int]$selection ) 
    { 
        1 {   action_main_menu_item_1 ([REF]$configfile_exists) }
        2 {
          if ( $configfile_exists -eq $true )
              {
              display_current_namespace
              press_any_key
              }
          else 
              { config_file_missing }
          }
        3 {
          if ( $configfile_exists -eq $true )
              {  action_main_menu_item_3  }
          else 
              { config_file_missing }
          }
        4 { 
          if( $configfile_exists -eq $true )
               { action_main_menu_item_4  }
          else 
               { config_file_missing }
          }
        5 {
          if ( $configfile_exists -eq $true )
              { action_main_menu_item_5 } 
          else 
              { config_file_missing }
          }
        6 {
          if ( $configfile_exists -eq $true )
              { action_main_menu_item_6  }
          else 
              { config_file_missing }
          }
        7 { 
          if( $configfile_exists -eq $true )
              {  action_main_menu_item_7  }
          else 
              { config_file_missing }
          } 
        8 { 
          if( $configfile_exists -eq $true )
              {
              clear-host
              testcleanup

              press_any_key 
              } 
          else 
              {  config_file_missing }
          }
        9 { 
          if( $configfile_exists -eq $true )
              {  action_main_menu_item_9  } 
          else 
              {  config_file_missing }
          }
        10 { 
          if( $configfile_exists -eq $true )
              {
              clear-host
              testcleanup 'full'

              press_any_key 
              } 
          else 
              {  config_file_missing }
          }
        11 { 
          if( $configfile_exists -eq $true )
              {
              clear-host
              show_existing_testobjects

              press_any_key 
              } 
          else 
              {  config_file_missing }
          }
        12 { } 
        default {"This should not happen"}
    }
} while ( $selection -ne 12 )
 
}


#################################################################################
# start the main script function after checking existence of the local script
# config file
#################################################################################


if( !$script_param_configpath )
    {
    clear-host
    display_text '' 0 1 
    display_text 'Please start script with parameter -script_param_configpath which tells the directory where the script config file is stored.' 0 1
    display_text '' 0 1 
    display_text 'Example :  <scriptname>  -script_param_configpath "C:\azure_file_share_ha_test_config"' 0 1
    display_text '' 0 1 
    }
else
    {
    if( test-path $script_param_configpath -pathtype container )
       { main_test_setup  $script_param_configpath $script_param_logintype $script_param_verbosemode }
    else
       { 
       clear-host
       display_text '' 0 1
       display_text 'entered path for parameter -script_param_configpath does not exist or is not a directory' 0 1
       display_text '' 0 1
       }
    }