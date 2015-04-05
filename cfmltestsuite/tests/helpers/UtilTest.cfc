<cfcomponent extends="cfmltestsuite.tests.Test" output="false">
	
	<cffunction name="testEscapeCharacterAsHexadecimalNumberEscapeSequenceForJSON" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = 'a', acceptableResults = [ '\u0061' ] },
			{ input = Chr(42496), acceptableResults = [ '\ua600' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, instance = variables.util, functionName = 'escapeCharacterAsHexadecimalNumberEscapeSequenceForJSON') />
	</cffunction>
	
	<cffunction name="testWorkingChr0" access="public" returntype="void" output="false">
		<cfset var chr0 = variables.util.workingChr0() />
		<cfset $assert.isEqual(1, Len(chr0)) />
		<cfset $assert.isEqual(0, Asc(chr0)) />
	</cffunction>
	
</cfcomponent>