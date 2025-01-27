﻿<#
.SYNOPSIS
Tests adding an incrementing integer property to each pipeline object.
#>

Describe 'Add-Counter' -Tag Add-Counter {
	BeforeAll {
		if(!(Get-Module -List PSScriptAnalyzer)) {Install-Module PSScriptAnalyzer -Force}
		$scriptsdir,$sep = (Split-Path $PSScriptRoot),[io.path]::PathSeparator
		if($scriptsdir -notin ($env:Path -split $sep)) {$env:Path += "$sep$scriptsdir"}
	}
	Context 'Script style' -Tag Style {
		It "Should follow best practices for style" {
			Invoke-ScriptAnalyzer -Path "$PSScriptRoot\..\Add-Counter.ps1" -Severity Warning |
				Should -HaveCount 0 -Because 'there should be no style warnings'
			Invoke-ScriptAnalyzer -Path "$PSScriptRoot\..\Add-Counter.ps1" -Severity Error |
				Should -HaveCount 0 -Because 'there should be no style errors'
		}
	}
	Context 'Adds a counter property' -Tag From-Zero {
		It "Providers get numbered" {
			[psobject[]] $providers = Get-PSProvider |Add-Counter.ps1 -PropertyName Position -InitialValue 0 -Force
			foreach($i in 0..($providers.Count -1))
			{
				$providers[$i].Position |Should -Be $i
			}
		}
		It "Given JSON '<JsonInput>', adding a '<PropertyName>' counter results in '<JsonOutput>'" -Tag From-One -TestCases @(
			@{ JsonInput = '[{"name": "A"},{"name": "B"},{"name": "C"}]'; PropertyName = 'id'
				JsonOutput = '[{"name":"A","id":1},{"name":"B","id":2},{"name":"C","id":3}]' }
		) {
			Param([string]$JsonInput,[string]$PropertyName,[string]$JsonOutput)
			$JsonInput |
				ConvertFrom-Json |
				Add-Counter.ps1 -PropertyName $PropertyName |
				ConvertTo-Json -Compress |
				Should -BeExactly $JsonOutput
		}
	}
}
