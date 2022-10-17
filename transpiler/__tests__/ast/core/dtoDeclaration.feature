# https://docs.google.com/spreadsheets/d/1G9FrQm-Ecw4XEYHbU453h9Qf7TsvteJesmsgzjTeiLc/edit#gid=0
Feature: DTO

    Scenario Template: DTO declaration is valid
    Given Valid bounded context <boundedContext>, module <module>, DTO <blString> strings
    When I generate the model
    Then I should get <output>

    # Examples: # @bitloops-auto-generated
    #   | boundedContext | module | blString                                                                  | output                                                                                                                                                                   | @bitloops-auto-generated |
    #   | Hello World    | core   | DTO HelloWorldRequestDTO { optional string name; }                        | {"Hello World":{"core":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"optional":true,"type":"string","name":"name"}]}}}}}                                                  | @bitloops-auto-generated |
    #   | Hello World    | core   | DTO HelloWorldRequestDTO { string name; }                                 | {"Hello World":{"core":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"type":"string","name":"name"}]}}}}}                                                                  | @bitloops-auto-generated |
    #   | Hello World    | core   | DTO HelloWorldRequestDTO { string name; optional string phone; }          | {"Hello World":{"core":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"type":"string","name":"name"},{"optional":true,"type":"string","name":"phone"}]}}}}}                 | @bitloops-auto-generated |
    #   | Hello World    | core   | DTO HelloWorldRequestDTO { string name; optional string phone; }          | {"Hello World":{"core":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"type":"string","name":"name"},{"optional":true,"type":"string","name":"phone"}]}}}}}                 | @bitloops-auto-generated |
    #   | Hello World    | core   | DTO HelloWorldRequestDTO { optional string name; optional string phone; } | {"Hello World":{"core":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"optional":true,"type":"string","name":"name"},{"optional":true,"type":"string","name":"phone"}]}}}}} | @bitloops-auto-generated |
    #   | Hello World    | core   | DTO HelloWorldRequestDTO { string name; string phone; }                   | {"Hello World":{"core":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"type":"string","name":"name"},{"type":"string","name":"phone"}]}}}}}                                 | @bitloops-auto-generated |

    Examples: # @bitloops-auto-generated
      | boundedContext                           | module         | blString                                                                                                                                                                                                                                                                     | output                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | @bitloops-auto-generated |
      | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 68,84,79,32,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,32,123,32,111,112,116,105,111,110,97,108,32,115,116,114,105,110,103,32,110,97,109,101,59,32,125                                                                                        | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,68,84,79,115,34,58,123,34,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,34,58,123,34,102,105,101,108,100,115,34,58,91,123,34,111,112,116,105,111,110,97,108,34,58,116,114,117,101,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,110,97,109,101,34,125,93,125,125,125,125,125                                                                                                                                                                                   | @bitloops-auto-generated |
      | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 68,84,79,32,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,32,123,32,115,116,114,105,110,103,32,110,97,109,101,59,32,125                                                                                                                          | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,68,84,79,115,34,58,123,34,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,34,58,123,34,102,105,101,108,100,115,34,58,91,123,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,110,97,109,101,34,125,93,125,125,125,125,125                                                                                                                                                                                                                                              | @bitloops-auto-generated |
      | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 68,84,79,32,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,32,123,32,115,116,114,105,110,103,32,110,97,109,101,59,32,111,112,116,105,111,110,97,108,32,115,116,114,105,110,103,32,112,104,111,110,101,59,32,125                                   | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,68,84,79,115,34,58,123,34,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,34,58,123,34,102,105,101,108,100,115,34,58,91,123,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,110,97,109,101,34,125,44,123,34,111,112,116,105,111,110,97,108,34,58,116,114,117,101,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,112,104,111,110,101,34,125,93,125,125,125,125,125                                                            | @bitloops-auto-generated |
      | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 68,84,79,32,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,32,123,32,115,116,114,105,110,103,32,110,97,109,101,59,32,111,112,116,105,111,110,97,108,32,115,116,114,105,110,103,32,112,104,111,110,101,59,32,125                                   | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,68,84,79,115,34,58,123,34,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,34,58,123,34,102,105,101,108,100,115,34,58,91,123,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,110,97,109,101,34,125,44,123,34,111,112,116,105,111,110,97,108,34,58,116,114,117,101,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,112,104,111,110,101,34,125,93,125,125,125,125,125                                                            | @bitloops-auto-generated |
      | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 68,84,79,32,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,32,123,32,111,112,116,105,111,110,97,108,32,115,116,114,105,110,103,32,110,97,109,101,59,32,111,112,116,105,111,110,97,108,32,115,116,114,105,110,103,32,112,104,111,110,101,59,32,125 | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,68,84,79,115,34,58,123,34,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,34,58,123,34,102,105,101,108,100,115,34,58,91,123,34,111,112,116,105,111,110,97,108,34,58,116,114,117,101,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,110,97,109,101,34,125,44,123,34,111,112,116,105,111,110,97,108,34,58,116,114,117,101,44,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,112,104,111,110,101,34,125,93,125,125,125,125,125 | @bitloops-auto-generated |
      | 72,101,108,108,111,32,87,111,114,108,100 | 99,111,114,101 | 68,84,79,32,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,32,123,32,115,116,114,105,110,103,32,110,97,109,101,59,32,115,116,114,105,110,103,32,112,104,111,110,101,59,32,125                                                                     | 123,34,72,101,108,108,111,32,87,111,114,108,100,34,58,123,34,99,111,114,101,34,58,123,34,68,84,79,115,34,58,123,34,72,101,108,108,111,87,111,114,108,100,82,101,113,117,101,115,116,68,84,79,34,58,123,34,102,105,101,108,100,115,34,58,91,123,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,110,97,109,101,34,125,44,123,34,116,121,112,101,34,58,34,115,116,114,105,110,103,34,44,34,110,97,109,101,34,58,34,112,104,111,110,101,34,125,93,125,125,125,125,125                                                                                                                       | @bitloops-auto-generated |
