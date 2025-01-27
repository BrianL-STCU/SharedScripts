Useful General-Purpose Scripts
==============================

[![Pester tests status](https://github.com/brianary/scripts/actions/workflows/pester.yml/badge.svg)][pester.yml]
[![Pester tests results](https://gist.githubusercontent.com/brianary/4642e5c804aa1b40738def5a7c03607a/raw/badge.svg)][pester.yml]
[![GitHub license badge](https://badgen.net/github/license/brianary/Scripts)](https://mit-license.org/ "MIT License")
[![GitHub stars badge](https://badgen.net/github/stars/brianary/Scripts)](https://github.com/brianary/scripts/stargazers "Stars")
[![GitHub watchers badge](https://badgen.net/github/watchers/brianary/Scripts)](https://github.com/brianary/scripts/watchers "Watchers")
[![GitHub forks badge](https://badgen.net/github/forks/brianary/Scripts)](https://github.com/brianary/scripts/network/members "Forks")
[![GitHub issues badge](https://badgen.net/github/open-issues/brianary/Scripts)](https://github.com/brianary/scripts/issues "Issues")
[![GitHub commits badge](https://badgen.net/github/commits/brianary/Scripts/main)](https://github.com/brianary/scripts/commits/main "Commits")
[![GitHub last commit badge](https://badgen.net/github/last-commit/brianary/Scripts/main)](https://github.com/brianary/scripts/commits/main "Last commit")
[![Mastodon: @brianary@mastodon.spotek.io](https://badgen.net/mastodon/follow/brianary@mastodon.spotek.io)](https://mastodon.spotek.io/@brianary "Mastodon profile")

[pester.yml]: https://github.com/brianary/scripts/actions/workflows/pester.yml "Pester test run history"

This repo contains a collection of generally useful scripts (mostly Windows PowerShell).

See [PS5](PS5) for legacy scripts, [syscfg](syscfg) for single-use system config scripts.

PowerShell Scripts
------------------
![script dependencies](dependencies.svg)

- **[Add-CapturesToMatches.ps1](Add-CapturesToMatches.ps1)**: Adds named capture group values as note properties to Select-String MatchInfo objects.
- **[Add-Counter.ps1](Add-Counter.ps1)**: Adds an incrementing integer property to each pipeline object.
- **[Add-DynamicParam.ps1](Add-DynamicParam.ps1)**: Adds a dynamic parameter to a script, within a DynamicParam block.
- :up: **[Add-GitHubMetadata.ps1](Add-GitHubMetadata.ps1)**: Adds GitHub Linguist overrides to a repo's .gitattributes.
- **[Add-NoteProperty.ps1](Add-NoteProperty.ps1)**: Adds a NoteProperty to a PSObject, calculating the value with the object in context.
- **[Add-ParameterDefault.ps1](Add-ParameterDefault.ps1)**: Appends or creates a value to use for the specified cmdlet parameter to use when one is not specified.
- **[Add-ScopeLevel.ps1](Add-ScopeLevel.ps1)**: Convert a scope level to account for another call stack level.
- :up: **[Add-ScriptCredential.ps1](Add-ScriptCredential.ps1)**: Serializes a an encrypted credential to a PowerShell script using 32-byte random key file.
- **[Add-TimeSpan.ps1](Add-TimeSpan.ps1)**: Adds a timespan to DateTime values.
- **[Add-VsCodeDatabaseConnection.ps1](Add-VsCodeDatabaseConnection.ps1)**: Adds a VS Code MSSQL database connection to the repo.
- **[Backup-File.ps1](Backup-File.ps1)**: Create a backup as a sibling to a file, with date and time values in the name.
- **[Backup-SchTasks.ps1](Backup-SchTasks.ps1)**: Exports the local list of Scheduled Tasks into a single XML file.
- **[Compare-Properties.ps1](Compare-Properties.ps1)**: Compares the properties of two objects.
- **[Compare-Xml.ps1](Compare-Xml.ps1)**: Compares two XML documents and returns the differences.
- **[Compress-EnvironmentVariables.ps1](Compress-EnvironmentVariables.ps1)**: Replaces each of the longest matching parts of a string with an embedded environment variable with that value.
- **[Connect-SshKey.ps1](Connect-SshKey.ps1)**: Uses OpenSSH to generate a key and connect it to an ssh server.
- **[Convert-ChocolateyToWinget.ps1](Convert-ChocolateyToWinget.ps1)**: Change from managing various packages with Chocolatey to WinGet.
- **[Convert-ClipboardTsvToHtml.ps1](Convert-ClipboardTsvToHtml.ps1)**: Parses TSV clipboard data into HTML table data which is copied back to the clipboard.
- **[Convert-Xml.ps1](Convert-Xml.ps1)**: Transform XML using an XSLT template.
- **[ConvertFrom-Base64.ps1](ConvertFrom-Base64.ps1)**: Converts base64-encoded text to bytes or text.
- **[ConvertFrom-CimInstance.ps1](ConvertFrom-CimInstance.ps1)**: Convert a CimInstance object to a PSObject.
- **[ConvertFrom-DataRow.ps1](ConvertFrom-DataRow.ps1)**: Converts a DataRow object to a PSObject, Hashtable, or single value.
- :up: **[ConvertFrom-Duration.ps1](ConvertFrom-Duration.ps1)**: Parses a Timespan from a ISO8601 duration string.
- **[ConvertFrom-EscapedXml.ps1](ConvertFrom-EscapedXml.ps1)**: Parse escaped XML into XML and serialize it.
- **[ConvertFrom-Hex.ps1](ConvertFrom-Hex.ps1)**: Convert a string of hexadecimal digits into a byte array.
- :up: **[ConvertFrom-XmlElement.ps1](ConvertFrom-XmlElement.ps1)**: Converts named nodes of an element to properties of a PSObject, recursively.
- **[ConvertTo-Base64.ps1](ConvertTo-Base64.ps1)**: Converts bytes or text to base64-encoded text.
- **[ConvertTo-BasicAuthentication.ps1](ConvertTo-BasicAuthentication.ps1)**: Produces a basic authentication header string from a credential.
- **[ConvertTo-EpochTime.ps1](ConvertTo-EpochTime.ps1)**: Converts a DateTime value into an integer Unix (POSIX) time, seconds since Jan 1, 1970.
- :up: **[ConvertTo-ICalendar.ps1](ConvertTo-ICalendar.ps1)**: Converts supported objects to the RFC 5545 iCalendar format.
- **[ConvertTo-LogParserTimestamp.ps1](ConvertTo-LogParserTimestamp.ps1)**: Formats a datetime as a LogParser literal.
- **[ConvertTo-MultipartFormData.ps1](ConvertTo-MultipartFormData.ps1)**: Creates multipart/form-data to send as a request body.
- **[ConvertTo-OrderedDictionary.ps1](ConvertTo-OrderedDictionary.ps1)**: Converts an object to an ordered dictionary of properties and values.
- **[ConvertTo-PowerShell.ps1](ConvertTo-PowerShell.ps1)**: Serializes complex content into PowerShell literals.
- **[ConvertTo-RomanNumeral.ps1](ConvertTo-RomanNumeral.ps1)**: Convert a number to a Roman numeral.
- **[ConvertTo-SafeEntities.ps1](ConvertTo-SafeEntities.ps1)**: Encode text as XML/HTML, escaping all characters outside 7-bit ASCII.
- **[ConvertTo-XmlElements.ps1](ConvertTo-XmlElements.ps1)**: Serializes complex content into XML elements.
- **[Copy-SchTasks.ps1](Copy-SchTasks.ps1)**: Copy scheduled jobs from another computer to this one, using a GUI list to choose jobs.
- **[Disable-AnsiColor.ps1](Disable-AnsiColor.ps1)**: Disables ANSI terminal colors.
- **[Enable-AnsiColor.ps1](Enable-AnsiColor.ps1)**: Enables ANSI terminal colors.
- **[Expand-EnvironmentVariables.ps1](Expand-EnvironmentVariables.ps1)**: Replaces the name of each environment variable embedded in the specified string with the string equivalent of the value of the variable, then returns the resulting string.
- **[Export-DatabaseObjectScript.ps1](Export-DatabaseObjectScript.ps1)**: Exports MS SQL script for an object from the given server.
- **[Export-DatabaseScripts.ps1](Export-DatabaseScripts.ps1)**: Exports MS SQL database objects from the given server and database as files, into a consistent folder structure.
- :up: **[Export-MermaidER.ps1](Export-MermaidER.ps1)**: Generates a Mermaid entity relation diagram for database tables.
- :up: **[Export-Readme.ps1](Export-Readme.ps1)**: Generate README.md file for the scripts repo.
- **[Export-TableMerge.ps1](Export-TableMerge.ps1)**: Exports table data as a T-SQL MERGE statement.
- **[Find-Comics.ps1](Find-Comics.ps1)**: Finds comics.
- **[Find-DatabaseValue.ps1](Find-DatabaseValue.ps1)**: Searches an entire database for a field value.
- **[Find-DbColumn.ps1](Find-DbColumn.ps1)**: Searches for database columns.
- **[Find-DotNetGlobalTools.ps1](Find-DotNetGlobalTools.ps1)**: Returns a list of global dotnet tools.
- :up: **[Find-DuplicateFiles.ps1](Find-DuplicateFiles.ps1)**: Removes duplicates from a list of files.
- **[Find-Indexes.ps1](Find-Indexes.ps1)**: Returns indexes using a column with the given name.
- **[Find-InstalledPrograms.ps1](Find-InstalledPrograms.ps1)**: Searches installed programs.
- **[Find-Lines.ps1](Find-Lines.ps1)**: Searches a specific subset of files for lines matching a pattern.
- **[Find-NewestFile.ps1](Find-NewestFile.ps1)**: Finds the most recent file.
- **[Find-ProjectPackages.ps1](Find-ProjectPackages.ps1)**: Find modules used in projects.
- **[Find-SqlDeprecatedLargeValueTypes.ps1](Find-SqlDeprecatedLargeValueTypes.ps1)**: Reports text, ntext, and image datatypes found in a given database.
- :up: **[ForEach-Progress.ps1](ForEach-Progress.ps1)**: Performs an operation against each item in a collection of input objects, with a progress bar.
- **[Format-ByteUnits.ps1](Format-ByteUnits.ps1)**: Converts bytes to largest possible units, to improve readability.
- **[Format-Date.ps1](Format-Date.ps1)**: Returns a date/time as a named format.
- **[Format-EscapedUrl.ps1](Format-EscapedUrl.ps1)**: Escape URLs more aggressively.
- **[Format-HtmlDataTable.ps1](Format-HtmlDataTable.ps1)**: Right-aligns numeric data in an HTML table for emailing, and optionally zebra-stripes &c.
- **[Format-Permutations.ps1](Format-Permutations.ps1)**: Builds format strings using every combination of elements from multiple arrays.
- :up: **[Format-Xml.ps1](Format-Xml.ps1)**: Pretty-print XML.
- **[Get-AspNetEvents.ps1](Get-AspNetEvents.ps1)**: Parses ASP.NET errors from the event log on the given server.
- **[Get-AssemblyFramework.ps1](Get-AssemblyFramework.ps1)**: Gets the framework version an assembly was compiled for.
- **[Get-CachedCredential.ps1](Get-CachedCredential.ps1)**: Return a credential from secure storage, or prompt the user for it if not found.
- **[Get-CharacterDetails.ps1](Get-CharacterDetails.ps1)**: Returns filterable categorical information about characters in the Unicode Basic Multilingual Plane.
- **[Get-ClassicAspEvents.ps1](Get-ClassicAspEvents.ps1)**: Gets Classic ASP errors from the event log on the given server.
- **[Get-Comics.ps1](Get-Comics.ps1)**: Returns a cached list of comics from the Shortboxed API.
- **[Get-CommandParameters.ps1](Get-CommandParameters.ps1)**: Returns the parameters of the specified cmdlet.
- **[Get-CommandPath.ps1](Get-CommandPath.ps1)**: Locates a command.
- **[Get-ConfigConnectionStringBuilders.ps1](Get-ConfigConnectionStringBuilders.ps1)**: Return named connection string builders for connection strings in a config file.
- **[Get-ConsoleHistory.ps1](Get-ConsoleHistory.ps1)**: Returns the DOSKey-style console command history (up arrow or F8).
- **[Get-ContentSecurityPolicy.ps1](Get-ContentSecurityPolicy.ps1)**: Returns the content security policy at from the given URL.
- **[Get-Dns.ps1](Get-Dns.ps1)**: Looks up DNS info, given a hostname or address.
- **[Get-DotNetFrameworkVersions.ps1](Get-DotNetFrameworkVersions.ps1)**: Determine which .NET Frameworks are installed on the requested system.
- **[Get-DotNetGlobalTools.ps1](Get-DotNetGlobalTools.ps1)**: Returns a list of global dotnet tools.
- **[Get-DotNetVersions.ps1](Get-DotNetVersions.ps1)**: Get-DotNetVersions.ps1 [<CommonParameters>]

- **[Get-EnumValues.ps1](Get-EnumValues.ps1)**: Returns the possible values of the specified enumeration.
- **[Get-FrenchRepublicanDate.ps1](Get-FrenchRepublicanDate.ps1)**: Returns a date and time converted to the French Republican Calendar.
- **[Get-GitFileMetadata.ps1](Get-GitFileMetadata.ps1)**: Returns the creation and last modification metadata for a file in a git repo.
- **[Get-GitFirstCommit.ps1](Get-GitFirstCommit.ps1)**: Gets the SHA-1 hash of the first commit of the current repo.
- **[Get-GitHubRepoChildItem.ps1](Get-GitHubRepoChildItem.ps1)**: Adds any missing topics based on repo content.
- **[Get-IisLog.ps1](Get-IisLog.ps1)**: Easily query IIS logs.
- **[Get-LibraryVulnerabilityInfo.ps1](Get-LibraryVulnerabilityInfo.ps1)**: Get the list of module/package/library vulnerabilities from the RetireJS or SafeNuGet projects.
- **[Get-PocketArticles.ps1](Get-PocketArticles.ps1)**: Retrieves a list of saved articles from a Pocket account.
- **[Get-RandomBytes.ps1](Get-RandomBytes.ps1)**: Returns random bytes.
- **[Get-RepoName.ps1](Get-RepoName.ps1)**: Gets the name of the repo.
- **[Get-SslDetails.ps1](Get-SslDetails.ps1)**: Enumerates the SSL protocols that the client is able to successfully use to connect to a server.
- **[Get-SystemDetails.ps1](Get-SystemDetails.ps1)**: Collects some useful system hardware and operating system details via CIM.
- **[Get-Todos.ps1](Get-Todos.ps1)**: Returns the TODOs for the current git repo, which can help document technical debt.
- **[Get-TypeAccelerators.ps1](Get-TypeAccelerators.ps1)**: Returns the list of PowerShell type accelerators.
- **[Get-Unicode.ps1](Get-Unicode.ps1)**: Returns the (UTF-16) .NET string for a given Unicode codepoint, which may be a surrogate pair.
- **[Get-UnicodeName.ps1](Get-UnicodeName.ps1)**: Get-UnicodeName.ps1 [-CodePoint] <int> [<CommonParameters>]
Get-UnicodeName.ps1 [-Character] <string> [<CommonParameters>]

- **[Get-VSCodeSetting.ps1](Get-VSCodeSetting.ps1)**: Sets a VSCode setting.
- **[Get-VSCodeSettingsFile.ps1](Get-VSCodeSettingsFile.ps1)**: Gets the path of the VSCode settings.config file.
- **[Get-XmlNamespaces.ps1](Get-XmlNamespaces.ps1)**: Gets the namespaces from a document as a dictionary.
- **[Hide-Command.ps1](Hide-Command.ps1)**: Make a command unavailable.
- **[Import-ClipboardTsv.ps1](Import-ClipboardTsv.ps1)**: Parses TSV clipboard data into objects.
- **[Import-Variables.ps1](Import-Variables.ps1)**: Creates local variables from a data row or dictionary (hashtable).
- **[Import-VsCodeDatabaseConnections.ps1](Import-VsCodeDatabaseConnections.ps1)**: Adds config XDT connection strings to VSCode settings.
- **[Invoke-CommandWithParams.ps1](Invoke-CommandWithParams.ps1)**: Execute a command by using matching dictionary entries as parameters.
- **[Invoke-WindowsPowerShell.ps1](Invoke-WindowsPowerShell.ps1)**: Runs commands in Windows PowerShell (typically from PowerShell Core).
- **[Join-FileName.ps1](Join-FileName.ps1)**: Combines a filename with a string.
- **[Join-Keys.ps1](Join-Keys.ps1)**: Combines dictionaries together into a single dictionary.
- **[Measure-DbColumn.ps1](Measure-DbColumn.ps1)**: Provides statistics about SQL Server column data.
- **[Measure-DbColumnValues.ps1](Measure-DbColumnValues.ps1)**: Provides sorted counts of SQL Server column values.
- **[Measure-DbTable.ps1](Measure-DbTable.ps1)**: Provides frequency details about SQL Server table data.
- **[Measure-Indents.ps1](Measure-Indents.ps1)**: Measures the indentation characters used in a text file.
- :up: **[Measure-StandardDeviation.ps1](Measure-StandardDeviation.ps1)**: Calculate the standard deviation of numeric values.
- **[Measure-TextFile.ps1](Measure-TextFile.ps1)**: Counts each type of indent and line ending.
- **[Merge-Json.ps1](Merge-Json.ps1)**: Create a new JSON string by recursively combining the properties of JSON strings.
- **[Merge-PSObject.ps1](Merge-PSObject.ps1)**: Create a new PSObject by recursively combining the properties of PSObjects.
- **[Merge-XmlSelections.ps1](Merge-XmlSelections.ps1)**: Builds an object using the named XPath selections as properties.
- **[New-DbProviderObject.ps1](New-DbProviderObject.ps1)**: Create a common database object.
- **[New-Jwt.ps1](New-Jwt.ps1)**: Generates a JSON Web Token (JWT)
- **[New-NamespaceManager.ps1](New-NamespaceManager.ps1)**: Creates an object to lookup XML namespace prefixes.
- :up: **[New-PesterTests.ps1](New-PesterTests.ps1)**: Creates a new Pester testing script from a script's examples and parameter sets.
- **[New-RandomVehicle.ps1](New-RandomVehicle.ps1)**: Generates random vehicle details with a valid VIN.
- **[New-Script.ps1](New-Script.ps1)**: Creates a simple boilerplate script.
- **[New-Shortcut.ps1](New-Shortcut.ps1)**: Create a Windows shortcut.
- **[Open-Comic.ps1](Open-Comic.ps1)**: Opens a comic's PreviewsWorld page.
- **[Optimize-Help.ps1](Optimize-Help.ps1)**: Cleans up comment-based help blocks by fully unindenting and capitalizing dot keywords.
- **[Optimize-Path.ps1](Optimize-Path.ps1)**: Sorts, prunes, and normalizes both user and system Path entries.
- **[Push-WorkspaceLocation.ps1](Push-WorkspaceLocation.ps1)**: Pushes the current VS Code editor workspace location to the location stack.
- **[Read-ChocolateySummary.ps1](Read-ChocolateySummary.ps1)**: Retrieves the a summary from the Chocolatey log.
- :up: **[Read-Choice.ps1](Read-Choice.ps1)**: Returns choice selected from a list of options.
- **[Remove-CachedCredential.ps1](Remove-CachedCredential.ps1)**: Removes a credential from secure storage.
- **[Remove-LockyFile.ps1](Remove-LockyFile.ps1)**: Removes a file that may be prone to locking.
- **[Remove-NullValues.ps1](Remove-NullValues.ps1)**: Removes dictionary entries with null vaules.
- **[Remove-ParameterDefault.ps1](Remove-ParameterDefault.ps1)**: Removes a value that would have been used for a parameter if none was specified, if one existed.
- :up: **[Rename-GitHubLocalBranch.ps1](Rename-GitHubLocalBranch.ps1)**: Rename a git repository branch.
- **[Rename-Script.ps1](Rename-Script.ps1)**: Renames all instances of a script, and updates any usage of it.
- **[Repair-DatabaseConstraintNames.ps1](Repair-DatabaseConstraintNames.ps1)**: Finds database constraints with system-generated names and gives them deterministic names.
- **[Repair-DatabaseUntrustedConstraints.ps1](Repair-DatabaseUntrustedConstraints.ps1)**: Finds database constraints that have been incompletely re-enabled.
- :up: **[Repair-ScriptStyle.ps1](Repair-ScriptStyle.ps1)**: Accepts justifications for script analysis rule violations, fixing the rest using Invoke-ScriptAnalysis.
- **[Resolve-XmlSchemaLocation.ps1](Resolve-XmlSchemaLocation.ps1)**: Gets the namespaces and their URIs and URLs from a document.
- **[Resolve-XPath.ps1](Resolve-XPath.ps1)**: Returns the XPath of the location of an XML node.
- **[Restore-SchTasks.ps1](Restore-SchTasks.ps1)**: Imports from a single XML file into the local Scheduled Tasks.
- **[Save-PodcastEpisodes.ps1](Save-PodcastEpisodes.ps1)**: Saves enclosures from a podcast feed.
- **[Save-WebRequest.ps1](Save-WebRequest.ps1)**: Downloads a given URL to a file, automatically determining the filename.
- **[Select-CapturesFromMatches.ps1](Select-CapturesFromMatches.ps1)**: Selects named capture group values as note properties from Select-String MatchInfo objects.
- **[Send-MailMessageFile.ps1](Send-MailMessageFile.ps1)**: Sends emails from a drop folder using .NET config defaults.
- **[Send-SeqEvent.ps1](Send-SeqEvent.ps1)**: Send an event to a Seq server.
- **[Send-SeqScriptEvent.ps1](Send-SeqScriptEvent.ps1)**: Sends an event (often an error) from a script to a Seq server, including script info.
- **[Send-SqlReport.ps1](Send-SqlReport.ps1)**: Execute a SQL statement and email the results.
- **[Set-ConsoleColorTheme.ps1](Set-ConsoleColorTheme.ps1)**: Overrides ConsoleClass window color palette entries with a preset color theme.
- **[Set-JsonProperty.ps1](Set-JsonProperty.ps1)**: Sets a property of arbitrary depth in a JSON string.
- **[Set-ParameterDefault.ps1](Set-ParameterDefault.ps1)**: Assigns a value to use for the specified cmdlet parameter to use when one is not specified.
- **[Set-RegexReplace.ps1](Set-RegexReplace.ps1)**: Updates text found with Select-String, using a regular expression replacement template.
- **[Set-VSCodeSetting.ps1](Set-VSCodeSetting.ps1)**: Sets a VSCode setting.
- **[Show-DataRef.ps1](Show-DataRef.ps1)**: Display an HTML view of an XML schema or WSDL using Saxon.
- **[Show-HttpStatus.ps1](Show-HttpStatus.ps1)**: Displays the HTTP status code info.
- :up: **[Show-Time.ps1](Show-Time.ps1)**: Displays a formatted date using powerline font characters.
- **[Split-FileName.ps1](Split-FileName.ps1)**: Returns the specified part of the filename.
- **[Split-Keys.ps1](Split-Keys.ps1)**: Clones a dictionary keeping only the specified keys.
- **[Stop-ThrowError.ps1](Stop-ThrowError.ps1)**: Throws a better error than "throw".
- **[Test-Administrator.ps1](Test-Administrator.ps1)**: Checks whether the current session has administrator privileges.
- **[Test-DateTime.ps1](Test-DateTime.ps1)**: Tests whether the given string can be parsed as a date.
- **[Test-FileTypeMagicNumber.ps1](Test-FileTypeMagicNumber.ps1)**: Tests for a given common file type by magic number.
- **[Test-HttpSecurity.ps1](Test-HttpSecurity.ps1)**: Scan sites using Mozilla's Observatory.
- **[Test-Interactive.ps1](Test-Interactive.ps1)**: Determines whether both the user and process are interactive.
- **[Test-Json.ps1](Test-Json.ps1)**: Determines whether a string is valid JSON.
- **[Test-Jwt.ps1](Test-Jwt.ps1)**: Determines whether a string is a valid JWT.
- **[Test-LockedFile.ps1](Test-LockedFile.ps1)**: Returns true if the specified file is locked.
- **[Test-MagicNumber.ps1](Test-MagicNumber.ps1)**: Tests a file for a "magic number" (identifying sequence of bytes) at a given location.
- **[Test-NewerFile.ps1](Test-NewerFile.ps1)**: Returns true if the difference file is newer than the reference file.
- **[Test-NoteProperty.ps1](Test-NoteProperty.ps1)**: Looks for any matching NoteProperties on an object.
- **[Test-Range.ps1](Test-Range.ps1)**: Returns true from an initial condition until a terminating condition; a latching test.
- **[Test-Uri.ps1](Test-Uri.ps1)**: Determines whether a string is a valid URI.
- **[Test-USFederalHoliday.ps1](Test-USFederalHoliday.ps1)**: Returns true if the given date is a U.S. federal holiday.
- **[Test-Variable.ps1](Test-Variable.ps1)**: Indicates whether a variable has been defined.
- **[Test-Windows1252.ps1](Test-Windows1252.ps1)**: Determines whether a file contains Windows-1252 bytes that are invalid UTF-8 bytes.
- **[Test-Xml.ps1](Test-Xml.ps1)**: Try parsing text as XML, and validating it if a schema is provided.
- **[Trace-GitRepoTest.ps1](Trace-GitRepoTest.ps1)**: Uses git bisect to search for the point in the repo history that the test script starts returning true.
- **[Uninstall-OldModules.ps1](Uninstall-OldModules.ps1)**: Uninstalls old module versions.
- :up: **[Update-Everything.ps1](Update-Everything.ps1)**: Updates everything it can on the system.
- **[Update-Files.ps1](Update-Files.ps1)**: Copies specified source files that exist in the destination directory.
- **[Update-Modules.ps1](Update-Modules.ps1)**: Cleans up old modules.
- :up: **[Use-Command.ps1](Use-Command.ps1)**: Checks for the existence of the given command, and adds if missing and a source is defined.
- **[Use-Java.ps1](Use-Java.ps1)**: Switch the Java version for the current process by modifying environment variables.
- **[Use-NetMailConfig.ps1](Use-NetMailConfig.ps1)**: Use .NET configuration to set defaults for Send-MailMessage.
- **[Use-ProgressView.ps1](Use-ProgressView.ps1)**: Sets the progress bar display view.
- **[Use-ReasonableDefaults.ps1](Use-ReasonableDefaults.ps1)**: Sets certain cmdlet parameter defaults to rational, useful values.
- **[Use-SeqServer.ps1](Use-SeqServer.ps1)**: Set the default Server and ApiKey for Send-SeqEvent.ps1
- **[Use-SqlcmdParams.ps1](Use-SqlcmdParams.ps1)**: Use the calling script parameters to set Invoke-Sqlcmd defaults.
- :new: **[Write-Info.ps1](Write-Info.ps1)**: Writes to the information stream, with color support and more.
- :up: **[Write-VisibleString.ps1](Write-VisibleString.ps1)**: Displays a string, showing nonprintable characters.

F# Scripts
----------
- **[NCrontab Schedule Test](https://webcoder.info/scripts/Test-NCrontab.html)**: Returns a sampling of the next several date & times scheduled by an NCrontab string.
- **[US Federal Holiday Detection](https://webcoder.info/scripts/USFederalHolidays.html)**: Here's how to determine whether a date is a US federal holiday using F#.

Office VBA Scripts
------------------
- **[OutlookExpireTag.vba](OutlookExpireTag.vba)**: Too many emails remain beyond their period of relevance: daily personnel schedule changes, found item notices, office food notices, server reboot notices, weather/traffic warnings, &c. This Outlook script will allow specifying an expiration date as a hashtag in the subject of outgoing emails, since Outlook does such a good job of hiding the UI for that field. -BL 
- **[OutlookPasteFormattedIndented.vba](OutlookPasteFormattedIndented.vba)**: Outlook will strip single-space indents when displaying emails. If you've got, for example, syntax highlighted source code that employs any indentation of only one space, you'll want to add two spaces to the each line (adding one will not appear for text that isn't indented). This Outlook script will paste formatted text, and indent it. Requires Tools -> References -> Microsoft Word 14.0 Object Library (later versions may also work) 
- **[OutlookPasteTsvTable.vba](OutlookPasteTsvTable.vba)**: This Outlook VBA Sub can be connected to a toolbar button for pasting TSV data as an attractive, formatted table. -BL Requires Tools -> References -> Microsoft Word 14.0 Object Library (later versions may also work) 

<!-- generated 11/28/2022 20:40:36 -->
