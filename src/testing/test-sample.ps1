param($testOutputRoot)

set-psdebug -strict -trace 0

$succeeded = $true
# define all test cases here
function TestGetPathToMSDeploy01 {
    $expectedMsdeployExe = "C:\Program Files\IIS\Microsoft Web Deploy V2\msdeploy.exe"
    
    $actualMsdeployExe = GetPathToMSDeploy
    
    $msg = "TestGetPathToMSDeploy01"
    AssertNotNull $actualMsdeployExe $msg
    AssertEqual $expectedMsdeployExe $actualMsdeployExe
    if(!(RaiseAssertions)) { $succeeded = false }
}

$currentDirectory = split-path $MyInvocation.MyCommand.Definition -parent

# Run the initilization script
& (Join-Path -Path $currentDirectory -ChildPath "setup-testing.ps1")

# start running test cases
TestGetPathToMSDeploy01

# Run the tear-down script
& (Join-Path -Path $currentDirectory -ChildPath "teardown-testing.ps1")
ExitScript -succeeded $succeeded -sourceScriptFile $MyInvocation.MyCommand.Definition

