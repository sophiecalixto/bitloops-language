#https://docs.google.com/spreadsheets/d/19Z-1FokMan53v1JfyNzdtedBC5ksEqUXWaJXP9sqP04/edit#gid=0

Feature: Condition

    Scenario Template: Condition is valid
    Given A valid condition <blString> string
    When I generate the model
    Then I should get <output>

   # Examples: # @bitloops-auto-generated
       # | blString | output | @bitloops-auto-generated |
       # | JestTestCondition { a==b } | {   "condition": {     "expression": {       "equalityExpression": {         "left": {             "evaluation": {               "regularEvaluation": {                 "type": "variable",                 "value": "a"               }           }         },         "right": {             "evaluation": {               "regularEvaluation": {                 "type": "variable",                 "value": "b"               }             }         },         "operator": "=="       }     }   } } | @bitloops-auto-generated |
       # | JestTestCondition { (a == b) AND (c >= d) } | {   "condition": {     "expression": {       "logicalExpression": {         "andExpression": {           "left": {               "parenthesizedExpression": {                   "equalityExpression": {                     "left": {                         "evaluation": {                           "regularEvaluation": {                             "type": "variable",                             "value": "a"                           }                       }                     },                     "right": {                         "evaluation": {                           "regularEvaluation": {                             "type": "variable",                             "value": "b"                           }                       }                     },                     "operator": "=="                   }             }           },           "right": {               "parenthesizedExpression": {                   "relationalExpression": {                     "left": {                         "evaluation": {                           "regularEvaluation": {                             "type": "variable",                             "value": "c"                           }                         }                     },                     "right": {                         "evaluation": {                           "regularEvaluation": {                             "type": "variable",                             "value": "d"                           }                         }                     },                     "operator": ">="                   }             }           }         }       }     }   } } | @bitloops-auto-generated |
  
    Examples: # @bitloops-auto-generated
        | blString | output | @bitloops-auto-generated |
        | 74,101,115,116,84,101,115,116,67,111,110,100,105,116,105,111,110,32,123,32,97,61,61,98,32,125 | 123,10,32,32,34,99,111,110,100,105,116,105,111,110,34,58,32,123,10,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,34,101,113,117,97,108,105,116,121,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,34,108,101,102,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,97,114,105,97,98,108,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,97,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,34,114,105,103,104,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,97,114,105,97,98,108,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,98,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,34,111,112,101,114,97,116,111,114,34,58,32,34,61,61,34,10,32,32,32,32,32,32,125,10,32,32,32,32,125,10,32,32,125,10,125 | @bitloops-auto-generated |
        | 74,101,115,116,84,101,115,116,67,111,110,100,105,116,105,111,110,32,123,32,40,97,32,61,61,32,98,41,32,65,78,68,32,40,99,32,62,61,32,100,41,32,125 | 123,10,32,32,34,99,111,110,100,105,116,105,111,110,34,58,32,123,10,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,34,108,111,103,105,99,97,108,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,34,97,110,100,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,34,108,101,102,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,112,97,114,101,110,116,104,101,115,105,122,101,100,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,113,117,97,108,105,116,121,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,108,101,102,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,97,114,105,97,98,108,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,97,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,105,103,104,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,97,114,105,97,98,108,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,98,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,111,112,101,114,97,116,111,114,34,58,32,34,61,61,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,34,114,105,103,104,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,112,97,114,101,110,116,104,101,115,105,122,101,100,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,108,97,116,105,111,110,97,108,69,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,108,101,102,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,97,114,105,97,98,108,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,99,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,105,103,104,116,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,97,114,105,97,98,108,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,100,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,111,112,101,114,97,116,111,114,34,58,32,34,62,61,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,125,10,32,32,32,32,125,10,32,32,125,10,125 | @bitloops-auto-generated |
  