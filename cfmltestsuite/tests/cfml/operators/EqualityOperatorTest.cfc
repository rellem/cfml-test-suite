<cfcomponent extends="cfmltestsuite.tests.Test" output="false">
	
	<cffunction name="testEqualityOperator_AdobeBug3831792" access="public" returntype="void" output="false">
		<cfset $assert.isFalse('1821,9' eq '9,1821') />
	</cffunction>
	
</cfcomponent>