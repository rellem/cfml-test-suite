<cfcomponent extends="testbox.system.BaseSpec" output="false">
	
	<cffunction name="beforeTests" access="public" returntype="void" output="false">
		<cfset variables.util = CreateObject('component', 'cfmltestsuite.helpers.Util').init() />
	</cffunction>
	
	<cffunction name="runTestCasesAgainstFunction" access="private" returntype="void" output="false">
		<cfargument name="testCases" type="array" required="true" />
		<cfargument name="functionName" type="string" required="true" />
		<cfargument name="instance" type="any" required="false" />
		
		<cfset var failures = [] />
		
		<cfset var testCase = '' />
		<cfset var actualResult = '' />
		<cfset var actualException = '' />
		<cfloop array="#arguments.testCases#" index="testCase">
			<cfset actualException = '' />
			<cftry>
				<cfif StructKeyExists(arguments, 'instance')>
					<cfset actualResult = Evaluate('arguments.instance.#arguments.functionName#(testCase.input)') />
				<cfelse>
					<cfset actualResult = Evaluate('#arguments.functionName#(testCase.input)') />
				</cfif>
				<cfcatch type="any">
					<cfset actualException = cfcatch.type />
				</cfcatch>
			</cftry>
			
			<cfif StructKeyExists(testCase, 'acceptableResults')>
				<cfif ArrayFind(testCase.acceptableResults, actualResult) eq 0>
					<cfset ArrayAppend(failures, 'Expected [#ArrayToList(testCase.acceptableResults, "] or [")#] but got [#actualResult#].') />
				</cfif>
			<cfelseif StructKeyExists(testCase, 'expectedException')>
				<cfif testCase.expectedException neq actualException>
					<cfset ArrayAppend(failures, 'Expected exception [#testCase.expectedException#] but got [#actualException#].') />
				</cfif>
			<cfelse>
				<cfthrow message="Missing expected result" />
			</cfif>
		</cfloop>
		
		<cfif ArrayLen(failures) gt 0>
			<cfset debug(failures) />
			<cfset fail('#ArrayLen(failures)#/#ArrayLen(arguments.testCases)# test cases failed. See debug output for details.') />
		</cfif>
	</cffunction>
	
</cfcomponent>