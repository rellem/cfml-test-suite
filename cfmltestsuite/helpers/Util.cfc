<cfcomponent output="false">
	
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="escapeCharacterAsHexadecimalNumberEscapeSequenceForJSON" access="public" returntype="string" output="false">
		<cfargument name="character" type="string" required="true" />
		
		<cfif Len(arguments.character) neq 1>
			<cfthrow message="Expected a character." />
		</cfif>
		
		<cfset var number = Asc(arguments.character) />
		<cfset var hexString = FormatBaseN(number, 16) />
		<cfset var paddedHexString = Right('0000' & hexString, 4) />
		
		<cfreturn '\u' & paddedHexString />
	</cffunction>
	
	<cffunction name="workingChr0" access="public" returntype="string" output="false">
		<cfset var characterClass = CreateObject('java', 'java.lang.Character') />
		<cfset var stringClass = CreateObject('java', 'java.lang.String') />
		<cfreturn stringClass.valueOf(characterClass.MIN_VALUE) />
	</cffunction>
	
</cfcomponent>