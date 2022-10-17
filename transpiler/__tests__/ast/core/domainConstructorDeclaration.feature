# https://docs.google.com/spreadsheets/d/1G1uyx6MN7Qe7Bxk1Se-5BX36jkp5w4JXQwDKXE35YQ8/edit#gid=0
Feature: Domain constructor Declaration

        Scenario Template: Domain constructor declaration is valid
        Given A Valid bounded context <boundedContext>, module <module>, constructor declaration <blString> string
        When I generate the model
        Then I should get <output>

        # Examples: # @bitloops-auto-generated
        # | boundedContext | module | blString | output | @bitloops-auto-generated |
        # | Hello World | core | JestTestCreateMethodDeclaration {     constructor(props: string): ( OK ( NameVO ) ,  Errors ( DomainErrors.InvalidName )) {         return regName.test( name );     } } | {"Hello World":{"core":{"Tests": {"jestTest": {"create":{"parameterDependencies":[{"value":"props","type":"string"}],"returnType":{"ok":["NameVO"],"errors":["DomainErrors.InvalidName"]},"statements":[{"return":{"expression":{"evaluation":{"regularEvaluation":{"type":"method","argumentDependencies":[{"value":"name","type":"variable"}],"value":"regName.test"}}}}}]}}}}}} | @bitloops-auto-generated |

        Examples: # @bitloops-auto-generated
            | boundedContext                           | module         | blString                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | output                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | @bitloops-auto-generated |
            | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 74,101,115,116,84,101,115,116,67,114,101,97,116,101,77,101,116,104,111,100,68,101,99,108,97,114,97,116,105,111,110,32,123,32,10,32,32,32,99,111,110,115,116,114,117,99,116,111,114,40,112,114,111,112,115,58,32,115,116,114,105,110,103,41,58,32,40,32,79,75,32,40,32,78,97,109,101,86,79,32,41,32,44,32,32,69,114,114,111,114,115,32,40,32,68,111,109,97,105,110,69,114,114,111,114,115,46,73,110,118,97,108,105,100,78,97,109,101,32,41,41,32,123,10,32,32,32,32,32,32,32,32,114,101,116,117,114,110,32,114,101,103,78,97,109,101,46,116,101,115,116,40,32,110,97,109,101,32,41,59,10,32,32,32,32,125,10,125 | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,84,101,115,116,115,34,58,32,123,34,106,101,115,116,84,101,115,116,34,58,32,123,34,99,114,101,97,116,101,34,58,123,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,91,123,34,118,97,108,117,101,34,58,34,112,114,111,112,115,34,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,125,93,44,34,114,101,116,117,114,110,84,121,112,101,34,58,123,34,111,107,34,58,91,34,78,97,109,101,86,79,34,93,44,34,101,114,114,111,114,115,34,58,91,34,68,111,109,97,105,110,69,114,114,111,114,115,46,73,110,118,97,108,105,100,78,97,109,101,34,93,125,44,34,115,116,97,116,101,109,101,110,116,115,34,58,91,123,34,114,101,116,117,114,110,34,58,123,34,101,120,112,114,101,115,115,105,111,110,34,58,123,34,101,118,97,108,117,97,116,105,111,110,34,58,123,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,123,34,116,121,112,101,34,58,34,109,101,116,104,111,100,34,44,34,97,114,103,117,109,101,110,116,68,101,112,101,110,100,101,110,99,105,101,115,34,58,91,123,34,118,97,108,117,101,34,58,34,110,97,109,101,34,44,34,116,121,112,101,34,58,34,118,97,114,105,97,98,108,101,34,125,93,44,34,118,97,108,117,101,34,58,34,114,101,103,78,97,109,101,46,116,101,115,116,34,125,125,125,125,125,93,125,125,125,125,125,125 | @bitloops-auto-generated |