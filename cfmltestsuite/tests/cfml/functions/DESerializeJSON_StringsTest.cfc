<cfcomponent extends="cfmltestsuite.tests.Test" output="false">
	
	<cffunction name="testDESerializeJSON_BooleanLookingStrings" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '"true"', acceptableResults = [ 'true' ] },
			{ input = '"TRUE"', acceptableResults = [ 'TRUE' ] },
			{ input = '"false"', acceptableResults = [ 'false' ] },
			{ input = '"FALSE"', acceptableResults = [ 'FALSE' ] },
			{ input = '"yes"', acceptableResults = [ 'yes' ] },
			{ input = '"YES"', acceptableResults = [ 'YES' ] },
			{ input = '"no"', acceptableResults = [ 'no' ] },
			{ input = '"NO"', acceptableResults = [ 'NO' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
	<cffunction name="testDESerializeJSON_DigitStrings" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '"0"', acceptableResults = [ '0' ] },
			{ input = '"1"', acceptableResults = [ '1' ] },
			{ input = '"2"', acceptableResults = [ '2' ] },
			{ input = '"3"', acceptableResults = [ '3' ] },
			{ input = '"4"', acceptableResults = [ '4' ] },
			{ input = '"5"', acceptableResults = [ '5' ] },
			{ input = '"6"', acceptableResults = [ '6' ] },
			{ input = '"7"', acceptableResults = [ '7' ] },
			{ input = '"8"', acceptableResults = [ '8' ] },
			{ input = '"9"', acceptableResults = [ '9' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
	<cffunction name="testDESerializeJSON_HexadecimalNumberEscapeSequences" access="public" returntype="void" output="false">
		<cfset var testCases = [] />
		<cfset var i = '' />
		<cfset var character = '' />
		<cfloop from="1" to="65535" index="i">
			<cfset character = Chr(i) />
			<cfset ArrayAppend(
				testCases,
				{ input = '"' & variables.util.escapeCharacterAsHexadecimalNumberEscapeSequenceForJSON(character) & '"', acceptableResults = [ character ] }
			) />
		</cfloop>
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
	<cffunction name="testDESerializeJSON_InvalidEscapeSequences" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '"\x"', expectedException = 'Application' },
			{ input = '"\u"', expectedException = 'Application' }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
	<cffunction name="testDESerializeJSON_ShortEscapeSequences" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '"\""', acceptableResults = [ '"' ] },
			{ input = '"\\"', acceptableResults = [ '\' ] },
			{ input = '"\/"', acceptableResults = [ '/' ] },
			{ input = '"\b"', acceptableResults = [ Chr(8) ] },
			{ input = '"\t"', acceptableResults = [ Chr(9) ] },
			{ input = '"\n"', acceptableResults = [ Chr(10) ] },
			{ input = '"\f"', acceptableResults = [ Chr(12) ] },
			{ input = '"\r"', acceptableResults = [ Chr(13) ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
	<cffunction name="testDESerializeJSON_VariousStrings" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '"Hello world!"', acceptableResults = [ 'Hello world!' ] },
			{ input = '"U+0001"', acceptableResults = [ 'U+0001' ] },
			{ input = '"U+a600"', acceptableResults = [ 'U+a600' ] },
			{ input = '"one\ntwo\ua600three"', acceptableResults = [ 'one' & Chr(10) & 'two' & Chr(42496) & 'three' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
	<cffunction name="testDESerializeJSON_ZeroLengthString" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '""', acceptableResults = [ '' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'DESerializeJSON') />
	</cffunction>
	
</cfcomponent>