<cfcomponent extends="cfmltestsuite.tests.Test" output="false">
	
	<cffunction name="testArrayFind_EmptyArray" access="public" returntype="void" output="false">
		<cfset var haystack = [] />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, '')) />
	</cffunction>
	
	<cffunction name="testArrayFind_FindFirstOccurrence" access="public" returntype="void" output="false">
		<cfset var haystack = [ 'test', 'test' ] />
		<cfset $assert.isEqual(1, ArrayFind(haystack, 'test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'Test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'tes')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'test ')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, ' test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, '')) />
	</cffunction>
	
	<cffunction name="testArrayFind_FindStringInMixedTypeArray" access="public" returntype="void" output="false">
		<cfset var haystack = [ 21, true, [], {}, 'test' ] />
		<cfset $assert.isEqual(5, ArrayFind(haystack, 'test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'Test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'tes')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'test ')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, ' test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, '')) />
	</cffunction>
	
	<cffunction name="testArrayFind_FindStringInOneElementArray" access="public" returntype="void" output="false">
		<cfset var haystack = [ 'test' ] />
		<cfset $assert.isEqual(1, ArrayFind(haystack, 'test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'Test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'tes')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, 'test ')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, ' test')) />
		<cfset $assert.isEqual(0, ArrayFind(haystack, '')) />
	</cffunction>
	
</cfcomponent>