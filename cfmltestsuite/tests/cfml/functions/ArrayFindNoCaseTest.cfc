<cfcomponent extends="cfmltestsuite.tests.Test" output="false">
	
	<cffunction name="testArrayFindNoCase_EmptyArray" access="public" returntype="void" output="false">
		<cfset var haystack = [] />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, '')) />
	</cffunction>
	
	<cffunction name="testArrayFindNoCase_FindFirstOccurrence" access="public" returntype="void" output="false">
		<cfset var haystack = [ 'test', 'test' ] />
		<cfset $assert.isEqual(1, ArrayFindNoCase(haystack, 'test')) />
		<cfset $assert.isEqual(1, ArrayFindNoCase(haystack, 'Test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'tes')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'test ')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, ' test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, '')) />
	</cffunction>
	
	<cffunction name="testArrayFindNoCase_FindStringInMixedTypeArray" access="public" returntype="void" output="false">
		<cfset var haystack = [ 21, true, [], {}, 'test' ] />
		<cfset $assert.isEqual(5, ArrayFindNoCase(haystack, 'test')) />
		<cfset $assert.isEqual(5, ArrayFindNoCase(haystack, 'Test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'tes')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'test ')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, ' test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, '')) />
	</cffunction>
	
	<cffunction name="testArrayFindNoCase_FindStringInOneElementArray" access="public" returntype="void" output="false">
		<cfset var haystack = [ 'test' ] />
		<cfset $assert.isEqual(1, ArrayFindNoCase(haystack, 'test')) />
		<cfset $assert.isEqual(1, ArrayFindNoCase(haystack, 'Test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'tes')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, 'test ')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, ' test')) />
		<cfset $assert.isEqual(0, ArrayFindNoCase(haystack, '')) />
	</cffunction>
	
</cfcomponent>