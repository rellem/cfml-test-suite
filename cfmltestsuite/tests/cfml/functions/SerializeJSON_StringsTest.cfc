<cfcomponent extends="cfmltestsuite.tests.Test" output="false">
	
	<cffunction name="testSerializeJSON_BooleanLookingStrings" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = 'true', acceptableResults = [ '"true"' ] },
			{ input = 'TRUE', acceptableResults = [ '"TRUE"' ] },
			{ input = 'false', acceptableResults = [ '"false"' ] },
			{ input = 'FALSE', acceptableResults = [ '"FALSE"' ] },
			{ input = 'yes', acceptableResults = [ '"yes"' ] },
			{ input = 'YES', acceptableResults = [ '"YES"' ] },
			{ input = 'no', acceptableResults = [ '"no"' ] },
			{ input = 'NO', acceptableResults = [ '"NO"' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_Characters_ControlCharacters" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = variables.util.workingChr0(), acceptableResults = [ '"\u0000"' ] }, <!--- Chr(0) seems to be broken. --->
			{ input = Chr(1), acceptableResults = [ '"\u0001"' ] },
			{ input = Chr(2), acceptableResults = [ '"\u0002"' ] },
			{ input = Chr(3), acceptableResults = [ '"\u0003"' ] },
			{ input = Chr(4), acceptableResults = [ '"\u0004"' ] },
			{ input = Chr(5), acceptableResults = [ '"\u0005"' ] },
			{ input = Chr(6), acceptableResults = [ '"\u0006"' ] },
			{ input = Chr(7), acceptableResults = [ '"\u0007"' ] },
			{ input = Chr(8), acceptableResults = [ '"\b"' ] },
			{ input = Chr(9), acceptableResults = [ '"\t"' ] },
			{ input = Chr(10), acceptableResults = [ '"\n"' ] },
			{ input = Chr(11), acceptableResults = [ '"\u000b"' ] },
			{ input = Chr(12), acceptableResults = [ '"\f"' ] },
			{ input = Chr(13), acceptableResults = [ '"\r"' ] },
			{ input = Chr(14), acceptableResults = [ '"\u000e"' ] },
			{ input = Chr(15), acceptableResults = [ '"\u000f"' ] },
			{ input = Chr(16), acceptableResults = [ '"\u0010"' ] },
			{ input = Chr(17), acceptableResults = [ '"\u0011"' ] },
			{ input = Chr(18), acceptableResults = [ '"\u0012"' ] },
			{ input = Chr(19), acceptableResults = [ '"\u0013"' ] },
			{ input = Chr(20), acceptableResults = [ '"\u0014"' ] },
			{ input = Chr(21), acceptableResults = [ '"\u0015"' ] },
			{ input = Chr(22), acceptableResults = [ '"\u0016"' ] },
			{ input = Chr(23), acceptableResults = [ '"\u0017"' ] },
			{ input = Chr(24), acceptableResults = [ '"\u0018"' ] },
			{ input = Chr(25), acceptableResults = [ '"\u0019"' ] },
			{ input = Chr(26), acceptableResults = [ '"\u001a"' ] },
			{ input = Chr(27), acceptableResults = [ '"\u001b"' ] },
			{ input = Chr(28), acceptableResults = [ '"\u001c"' ] },
			{ input = Chr(29), acceptableResults = [ '"\u001d"' ] },
			{ input = Chr(30), acceptableResults = [ '"\u001e"' ] },
			{ input = Chr(31), acceptableResults = [ '"\u001f"' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_Characters_QuotationMark" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '"', acceptableResults = [ '"\""' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_Characters_ReverseSolidus" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '\', acceptableResults = [ '"\\"' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_Characters_Solidus" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '/', acceptableResults = [ '"/"', '"\/"' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_Characters_TheRest" access="public" returntype="void" output="false">
		<cfset var testCases = [] />
		<cfset var testCase = '' />
		<cfset var charactersTestedInOtherTests = [ '"', '\', '/' ] />
		<cfset var i = '' />
		<cfloop from="32" to="65535" index="i">
			<cfset testCase = { input = Chr(i), acceptableResults = [] } />
			<cfif ArrayFind(charactersTestedInOtherTests, testCase.input) gt 0>
				<cfcontinue />
			</cfif>
			<cfset ArrayAppend(testCase.acceptableResults, '"' & testCase.input & '"') />
			<cfset ArrayAppend(testCase.acceptableResults, '"' & variables.util.escapeCharacterAsHexadecimalNumberEscapeSequenceForJSON(testCase.input) & '"') />
			<cfset ArrayAppend(testCases, testCase) />
		</cfloop>
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_VariousStrings" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = 'Hello world!', acceptableResults = [ '"Hello world!"' ] },
			{ input = 'U+0001', acceptableResults = [ '"U+0001"' ] },
			{ input = 'U+a600', acceptableResults = [ '"U+a600"' ] },
			{ input = 'one' & Chr(10) & 'two' & Chr(42496) & 'three', acceptableResults = [ '"one\ntwo#Chr(42496)#three"', '"one\ntwo\ua600three"' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
	<cffunction name="testSerializeJSON_ZeroLengthString" access="public" returntype="void" output="false">
		<cfset var testCases = [
			{ input = '', acceptableResults = [ '""' ] }
		] />
		<cfset runTestCasesAgainstFunction(testCases = testCases, functionName = 'SerializeJSON') />
	</cffunction>
	
</cfcomponent>