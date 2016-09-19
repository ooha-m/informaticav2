workflow CreateTable
{
	param(
		
	[Parameter(Mandatory=$true)]
    	[string] 
    	$ServerName,

        [Parameter(Mandatory=$true)]
        [string] 
        $DatabaseName, 

        [Parameter(Mandatory=$true)]
        [string] 
        $DBUsername,

        [Parameter(Mandatory=$true)]
        [string] 
        $DBPassword 
	)
	inlinescript
       {
      
	
    	$ServerName1= $Using:ServerName   
    	$DatabaseName1 = $Using:DatabaseName
	$DBUsername1 = 	$Using:DBUsername
	$DBPassword1 = $Using:DBPassword 
    
  <#  $ServerName1= "powerbi.database.windows.net"   
    $DatabaseName1 = "powerbidb"
	$DBUsername1 = 	"sysgain"
	$DBPassword1 = "Sysga1n987!" #>
	
	Write-Output $ServerName1
	Write-Output $DatabaseName1
    	Write-Output $DBUsername1
    	Write-Output $DBPassword1
    	$MasterDatabaseConnection = New-Object System.Data.SqlClient.SqlConnection
    	$MasterDatabaseConnection.ConnectionString = "Server = $ServerName1; Database = $DatabaseName1; User ID = $DBUsername1; Password = $DBPassword1;"
    	$MasterDatabaseConnection.Open();
    
    Write-Output "connection successful-----" 
    
    $MasterDatabaseCommand = New-Object System.Data.SqlClient.SqlCommand
    $MasterDatabaseCommand.Connection = $MasterDatabaseConnection
    $MasterDatabaseCommand.CommandText = 
    "
        CREATE TABLE dbo.bi9
        (
                date varchar(500),
                time varchar(500),
                ssitename varchar(500),
                csmethod varchar(500),
                csuristem varchar(500),
                csuriquery varchar(500),
                sport varchar(500),
                susername varchar(500),
                cipcsUserAgent varchar(500),
                csCookie varchar(500),
                csReferer varchar(500),
                cshost varchar(500),
                scstatus varchar(500),
                scsubstatus varchar(500),
                scwin32status varchar(500),
                scbytes varchar(500),
                csbytes varchar(500),
                timetaken varchar(500),
		row19 varchar(500)
        );
        
       
    "
       # CREATE CLUSTERED INDEX IX_emp_ID ON dbo.emp (ID); 
       Write-Output "command successful-----"  
      # $MasterDbResult = $MasterDatabaseCommand.ExecuteReader()
      $MasterDatabaseCommand.ExecuteReader()
       Write-Output "command executed-----" 
     #  Write-Output $MasterDbResult
        $MasterDatabaseConnection.Close()  
        Write-Output "connection closed-----"       
    }
	
    #[string] $UserSqlQuery= $("SELECT * FROM [dbo].[User]")
   
   # Write-Output $subscriptionList
	#Select-AzureRmSubscription -SubscriptionId "7eab3893-bd71-4690-84a5-47624df0b0e5"
		
	#Pause the data warehouse
	#$database = Get-AzureRmSqlDatabase –ResourceGroupName "powerbitestdbrg" –ServerName "poerbitestbd" –DatabaseName "powerbitestdb"
	#$resultDatabase = $database | Suspend-AzureRmSqlDatabase
	#Write-Output $resultDatabase
    
    # New-AzureRmSqlDatabase -RequestedServiceObjectiveName "DW100" -DatabaseName "mynewsqldw" -ServerName "poerbitestbd" -ResourceGroupName "powerbitestdbrg" -Edition "DataWarehouse"


<#	
    #The name of the Automation Credential Asset this runbook will use to authenticate to Azure.
    $CredentialAssetName = $credentialName

    #Get the credential with the above name from the Automation Asset store
    $Cred = Get-AutomationPSCredential -Name $CredentialAssetName
    if(!$Cred) {
        Throw "Could not find an Automation Credential Asset named '${CredentialAssetName}'. Make sure you have created one in this Automation Account."
    }

    #Connect to your Azure Account
    #Add-AzureAccount -Credential $Cred
    Add-AzureRmAccount -Credential $Cred
	
	

    $Account1 = $accountName
 #$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
#$headers.Add("x-api-key", 'cmwPU5D5T2aJWaGjtVlon7VqSghAkl6C1oOfrhxB')
	
	$headers = @{
    'x-api-key'= 'cmwPU5D5T2aJWaGjtVlon7VqSghAkl6C1oOfrhxB'
}
	
	
	$fnbody = @{
    testdriveid=$Tdid
}
$json = $fnbody | ConvertTo-Json
$invokeUrl = 'https://sxmguodehi.execute-api.us-west-2.amazonaws.com/prod/licenseManager/'+ $Tdid +'/reserveLicense'
$response = Invoke-RestMethod $invokeUrl -Method Put -Headers $headers -Body $json -ContentType 'application/json'
	
   # $blobURL ='https://fortinetkeys.blob.core.windows.net/licensefiles/arm_template-3.json.zip?st=2016-03-29T03%3A44%3A25Z&se=2016-03-29T07%3A04%3A25Z&sp=r&sv=2015-04-05&sr=b&sig=8qXrBQF0AWcXU6XXOwjCvQhiycy4mqvMmrZhYLdaW4k%3D'
    
	
	
	Write-Output "Current Values of the variables For ISV"
	Write-Output $ISVName
  Write-Output $response


	
	#Set-AutomationVariable –Name TDidVariable –Value $Tdid
	#Set-AutomationVariable –Name LicenseBlobUrl –Value 'http://yejdjtjtj'
	
	Set-AzureRmAutomationVariable `
		-AutomationAccountName $Account1 `
		-Encrypted $False `
		-Name $variableName `
		-ResourceGroupName $resourceGroupName `
		-Value $response.blobUrl


	$LicenseBlobURL = Get-AzureRmAutomationVariable `
		-AutomationAccountName $Account1 `
		-Name $variableName `
		-ResourceGroupName $resourceGroupName
	
	Write-Output "New Values of the variables"	

     Write-Output $LicenseBlobURL
  #>  
}
