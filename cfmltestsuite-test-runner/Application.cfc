<cfcomponent output="false">
	
	<cfset this.name = 'cfmltestsuite-test-runner2-' & Hash(GetCurrentTemplatePath()) />
	<cfset this.mappings = {
			'/cfmltestsuite' = ExpandPath('..') & '/cfmltestsuite',
			'/testbox' = ExpandPath('..') & '/testbox'
	} />
	
</cfcomponent>