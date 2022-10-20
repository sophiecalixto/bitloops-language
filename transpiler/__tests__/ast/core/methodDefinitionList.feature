# https://docs.google.com/spreadsheets/d/1Ta_frTFsN4zmnVSPnqEprs6DBkk8avJE_uObrSYrEhg/edit#gid=0
Feature: Method definition list

        Scenario Template: methodDefinitionList is valid
        Given A valid methodDefinitionList <blString> string
        When I generate the model
        Then I should get <output>

   # Examples: # @bitloops-auto-generated
       # | blString | output | @bitloops-auto-generated |
       # | JestTestMethodDefinitionList { encode(value: string): bytes; } | {"Hello World":{"core":{"Tests":{"jestTest":{"definitionMethods":{"encode":{"parameterDependencies":[{"value":"value","type":"string"}],"returnType":"bytes"}}}}}}} | @bitloops-auto-generated |
       # | JestTestMethodDefinitionList { encode(value: string): bytes; decode(value: string): string; } | {"Hello World":{"core":{"Tests":{"jestTest":{"definitionMethods":{"encode":{"parameterDependencies":[{"value":"value","type":"string"}],"returnType":"bytes"},"decode":{"parameterDependencies":[{"value":"value","type":"string"}],"returnType":"string"}}}}}}} | @bitloops-auto-generated |
       # | JestTestMethodDefinitionList { encode( ): bytes; } | {"Hello World":{"core":{"Tests":{"jestTest":{"definitionMethods":{"encode":{"parameterDependencies":[],"returnType":"bytes"}}}}}}} | @bitloops-auto-generated |
  
    Examples: # @bitloops-auto-generated
        | blString | output | @bitloops-auto-generated |
        | 74,101,115,116,84,101,115,116,77,101,116,104,111,100,68,101,102,105,110,105,116,105,111,110,76,105,115,116,32,123,32,101,110,99,111,100,101,40,118,97,108,117,101,58,32,115,116,114,105,110,103,41,58,32,98,121,116,101,115,59,32,125 | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,84,101,115,116,115,34,58,123,34,106,101,115,116,84,101,115,116,34,58,123,34,100,101,102,105,110,105,116,105,111,110,77,101,116,104,111,100,115,34,58,123,34,101,110,99,111,100,101,34,58,123,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,91,123,34,118,97,108,117,101,34,58,34,118,97,108,117,101,34,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,125,93,44,34,114,101,116,117,114,110,84,121,112,101,34,58,34,98,121,116,101,115,34,125,125,125,125,125,125,125 | @bitloops-auto-generated |
        | 74,101,115,116,84,101,115,116,77,101,116,104,111,100,68,101,102,105,110,105,116,105,111,110,76,105,115,116,32,123,32,101,110,99,111,100,101,40,118,97,108,117,101,58,32,115,116,114,105,110,103,41,58,32,98,121,116,101,115,59,32,100,101,99,111,100,101,40,118,97,108,117,101,58,32,115,116,114,105,110,103,41,58,32,115,116,114,105,110,103,59,32,125 | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,84,101,115,116,115,34,58,123,34,106,101,115,116,84,101,115,116,34,58,123,34,100,101,102,105,110,105,116,105,111,110,77,101,116,104,111,100,115,34,58,123,34,101,110,99,111,100,101,34,58,123,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,91,123,34,118,97,108,117,101,34,58,34,118,97,108,117,101,34,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,125,93,44,34,114,101,116,117,114,110,84,121,112,101,34,58,34,98,121,116,101,115,34,125,44,34,100,101,99,111,100,101,34,58,123,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,91,123,34,118,97,108,117,101,34,58,34,118,97,108,117,101,34,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,125,93,44,34,114,101,116,117,114,110,84,121,112,101,34,58,34,115,116,114,105,110,103,34,125,125,125,125,125,125,125 | @bitloops-auto-generated |
        | 74,101,115,116,84,101,115,116,77,101,116,104,111,100,68,101,102,105,110,105,116,105,111,110,76,105,115,116,32,123,32,101,110,99,111,100,101,40,32,41,58,32,98,121,116,101,115,59,32,125 | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,84,101,115,116,115,34,58,123,34,106,101,115,116,84,101,115,116,34,58,123,34,100,101,102,105,110,105,116,105,111,110,77,101,116,104,111,100,115,34,58,123,34,101,110,99,111,100,101,34,58,123,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,91,93,44,34,114,101,116,117,114,110,84,121,112,101,34,58,34,98,121,116,101,115,34,125,125,125,125,125,125,125 | @bitloops-auto-generated |
  