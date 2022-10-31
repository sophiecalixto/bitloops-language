# https://docs.google.com/spreadsheets/d/1k11qRqaGkIXNO_zWAHRZ_rsaBg73m6U6QUUV9xCAI10/edit#gid=0
Feature: Entity to Typescript target language

  Background:
    Given language is "TypeScript"

    Scenario Template: Entities are valid
    Given I have entities <entities> and props <props>
    When I generate the code
    Then I should see the outputEntities <outputEntities> and outputProps <outputProps>

   # Examples: # @bitloops-auto-generated
       # | entities | outputEntities | props | outputProps | @bitloops-auto-generated |
       # | {     "TodoEntity": {       "create": {         "parameterDependency": {           "type": "TodoProps",           "value": "props"         },         "returnType": {           "ok": "TodoEntity",           "errors": [             "DomainErrors.InvalidTitleError"           ]         },         "statements": [           {             "constDeclaration": {               "name": "id",               "expression": {                 "evaluation": {                   "regularEvaluation": {                     "type": "int32",                     "value": "7"                   }                 }               }             }           }         ]       },       "methods": {         "isValidName": {           "privateMethod": {             "parameterDependencies": [               {                 "type": "string",                 "value": "name"               }             ],             "returnType": "bool",             "statements": [               {                 "return": {                   "expression": {                     "evaluation": {                       "regularEvaluation": {                         "type": "bool",                         "value": "true"                       }                     }                   }                 }               }             ]           }         },         "complete": {           "publicMethod": {             "parameterDependencies": [],             "returnType": {               "ok": "TodoEntity",               "errors": []             },             "statements": [               {                 "return": {                   "expression": {                     "evaluation": {                       "regularEvaluation": {                         "type": "string",                         "value": "hey"                       }                     }                   }                 }               }             ]           }         }       }     } } | {"TodoEntity":"import { Domain } from '@bitloops/bl-boilerplate-core';import { Either } from '@bitloops/bl-boilerplate-core';import { ok } from '@bitloops/bl-boilerplate-core';import { TodoProps } from './TodoProps';import { DomainErrors } from './errors/index';export class TodoEntity extends Domain.Entity<TodoProps> {private constructor(props: TodoProps) {super(props, props.id);} public static create(props:TodoProps): Either<TodoEntity, DomainErrors.InvalidTitleError> { return ok(new TodoEntity(props));} get id() { return this._id; } get completed(): boolean {return this.props.completed;} private isValidName(name: string): boolean { return true;} public complete(): Either<TodoEntity, never> {return 'hey';}}"} | {   "TodoProps":{     "variables":[{         "type":"bool",         "name":"completed",         "optional":false     },{         "type":"UUIDv4",         "name":"id",         "optional":false     }] }} | import { Domain } from '@bitloops/bl-boilerplate-core';export interface TodoProps { completed: boolean; id: UUIDv4; } | @bitloops-auto-generated |
       # | {   "TodoEntity": {     "create": {       "parameterDependency": {         "type": "TodoProps",         "value": "props"       },       "returnType": {         "ok": "TodoEntity",         "errors": []       },      "statements": [ {                     "thisDeclaration": {                       "name": "this.completed",                       "expression": {                         "evaluation": {                           "regularEvaluation": {                             "type": "bool",                             "value": "false"                           }                         }                       }                     }                   }       ]     },     "methods": {         "uncomplete": {               "publicMethod": {                 "parameterDependencies": [],                 "returnType": {                   "ok": "void",                   "errors": []                 },                 "statements": [                   {                     "thisDeclaration": {                       "name": "this.completed",                       "expression": {                         "evaluation": {                           "regularEvaluation": {                             "type": "bool",                             "value": "false"                           }                         }                       }                     }                   },                   {                     "returnOK": {                       "expression": {                         "evaluation": {                           "regularEvaluation": {                             "type": "void",                             "value": ""                           }                         }                       }                     }                   }                 ]               }             },       "complete": {         "publicMethod": {           "parameterDependencies": [],           "returnType": {             "ok": "bool",             "errors": []           },           "statements": [             {               "returnOK": {                 "expression": {                   "evaluation": {                     "regularEvaluation": {                       "type": "bool",                       "argumentDependencies": [],                       "value": "true"                     }                   }                 }               }             }           ]         }       }     }   } } | {"TodoEntity":"import { Domain } from '@bitloops/bl-boilerplate-core';import { Either } from '@bitloops/bl-boilerplate-core';import { ok } from '@bitloops/bl-boilerplate-core';import { TodoProps } from './TodoProps';export class TodoEntity extends Domain.Entity<TodoProps> {  private constructor(props: TodoProps) { super(props, props.id); this.props.completed = false;}  public static create(props:TodoProps): Either<TodoEntity, never> {    return ok(new TodoEntity(props));  } get id() {return this._id;} get completed(): boolean { return this.props.completed;} public uncomplete():Either<void, never> {this.props.completed = false;return ok();}public complete(): Either<boolean, never> {    return ok(true);  }}"} | {   "TodoProps":{     "variables":[{         "type":"bool",         "name":"completed",         "optional":false     }] }} | export interface TodoProps { completed: boolean; } | @bitloops-auto-generated |
  
    Examples: # @bitloops-auto-generated
        | entities | outputEntities | props | outputProps | @bitloops-auto-generated |
        | 123,10,32,32,32,32,34,84,111,100,111,69,110,116,105,116,121,34,58,32,123,10,32,32,32,32,32,32,34,99,114,101,97,116,101,34,58,32,123,10,32,32,32,32,32,32,32,32,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,121,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,84,111,100,111,80,114,111,112,115,34,44,10,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,112,114,111,112,115,34,10,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,84,121,112,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,34,111,107,34,58,32,34,84,111,100,111,69,110,116,105,116,121,34,44,10,32,32,32,32,32,32,32,32,32,32,34,101,114,114,111,114,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,34,68,111,109,97,105,110,69,114,114,111,114,115,46,73,110,118,97,108,105,100,84,105,116,108,101,69,114,114,111,114,34,10,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,34,115,116,97,116,101,109,101,110,116,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,34,99,111,110,115,116,68,101,99,108,97,114,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,32,34,105,100,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,105,110,116,51,50,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,55,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,34,109,101,116,104,111,100,115,34,58,32,123,10,32,32,32,32,32,32,32,32,34,105,115,86,97,108,105,100,78,97,109,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,34,112,114,105,118,97,116,101,77,101,116,104,111,100,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,115,116,114,105,110,103,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,110,97,109,101,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,93,44,10,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,84,121,112,101,34,58,32,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,34,115,116,97,116,101,109,101,110,116,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,116,114,117,101,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,34,99,111,109,112,108,101,116,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,34,112,117,98,108,105,99,77,101,116,104,111,100,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,32,91,93,44,10,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,84,121,112,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,111,107,34,58,32,34,84,111,100,111,69,110,116,105,116,121,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,114,114,111,114,115,34,58,32,91,93,10,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,34,115,116,97,116,101,109,101,110,116,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,115,116,114,105,110,103,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,104,101,121,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,125,10,32,32,32,32,125,10,125 | 123,34,84,111,100,111,69,110,116,105,116,121,34,58,34,105,109,112,111,114,116,32,123,32,68,111,109,97,105,110,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,105,109,112,111,114,116,32,123,32,69,105,116,104,101,114,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,105,109,112,111,114,116,32,123,32,111,107,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,105,109,112,111,114,116,32,123,32,84,111,100,111,80,114,111,112,115,32,125,32,102,114,111,109,32,39,46,47,84,111,100,111,80,114,111,112,115,39,59,105,109,112,111,114,116,32,123,32,68,111,109,97,105,110,69,114,114,111,114,115,32,125,32,102,114,111,109,32,39,46,47,101,114,114,111,114,115,47,105,110,100,101,120,39,59,101,120,112,111,114,116,32,99,108,97,115,115,32,84,111,100,111,69,110,116,105,116,121,32,101,120,116,101,110,100,115,32,68,111,109,97,105,110,46,69,110,116,105,116,121,60,84,111,100,111,80,114,111,112,115,62,32,123,112,114,105,118,97,116,101,32,99,111,110,115,116,114,117,99,116,111,114,40,112,114,111,112,115,58,32,84,111,100,111,80,114,111,112,115,41,32,123,115,117,112,101,114,40,112,114,111,112,115,44,32,112,114,111,112,115,46,105,100,41,59,125,32,112,117,98,108,105,99,32,115,116,97,116,105,99,32,99,114,101,97,116,101,40,112,114,111,112,115,58,84,111,100,111,80,114,111,112,115,41,58,32,69,105,116,104,101,114,60,84,111,100,111,69,110,116,105,116,121,44,32,68,111,109,97,105,110,69,114,114,111,114,115,46,73,110,118,97,108,105,100,84,105,116,108,101,69,114,114,111,114,62,32,123,32,114,101,116,117,114,110,32,111,107,40,110,101,119,32,84,111,100,111,69,110,116,105,116,121,40,112,114,111,112,115,41,41,59,125,32,103,101,116,32,105,100,40,41,32,123,32,114,101,116,117,114,110,32,116,104,105,115,46,95,105,100,59,32,125,32,103,101,116,32,99,111,109,112,108,101,116,101,100,40,41,58,32,98,111,111,108,101,97,110,32,123,114,101,116,117,114,110,32,116,104,105,115,46,112,114,111,112,115,46,99,111,109,112,108,101,116,101,100,59,125,32,112,114,105,118,97,116,101,32,105,115,86,97,108,105,100,78,97,109,101,40,110,97,109,101,58,32,115,116,114,105,110,103,41,58,32,98,111,111,108,101,97,110,32,123,32,114,101,116,117,114,110,32,116,114,117,101,59,125,32,112,117,98,108,105,99,32,99,111,109,112,108,101,116,101,40,41,58,32,69,105,116,104,101,114,60,84,111,100,111,69,110,116,105,116,121,44,32,110,101,118,101,114,62,32,123,114,101,116,117,114,110,32,39,104,101,121,39,59,125,125,34,125 | 123,10,32,32,34,84,111,100,111,80,114,111,112,115,34,58,123,10,32,32,32,32,34,118,97,114,105,97,98,108,101,115,34,58,91,123,10,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,34,99,111,109,112,108,101,116,101,100,34,44,10,32,32,32,32,32,32,32,32,34,111,112,116,105,111,110,97,108,34,58,102,97,108,115,101,10,32,32,32,32,125,44,123,10,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,34,85,85,73,68,118,52,34,44,10,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,34,105,100,34,44,10,32,32,32,32,32,32,32,32,34,111,112,116,105,111,110,97,108,34,58,102,97,108,115,101,10,32,32,32,32,125,93,10,125,125 | 105,109,112,111,114,116,32,123,32,68,111,109,97,105,110,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,101,120,112,111,114,116,32,105,110,116,101,114,102,97,99,101,32,84,111,100,111,80,114,111,112,115,32,123,32,99,111,109,112,108,101,116,101,100,58,32,98,111,111,108,101,97,110,59,32,105,100,58,32,85,85,73,68,118,52,59,32,125 | @bitloops-auto-generated |
        | 123,10,32,32,34,84,111,100,111,69,110,116,105,116,121,34,58,32,123,10,32,32,32,32,34,99,114,101,97,116,101,34,58,32,123,10,32,32,32,32,32,32,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,121,34,58,32,123,10,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,84,111,100,111,80,114,111,112,115,34,44,10,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,112,114,111,112,115,34,10,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,34,114,101,116,117,114,110,84,121,112,101,34,58,32,123,10,32,32,32,32,32,32,32,32,34,111,107,34,58,32,34,84,111,100,111,69,110,116,105,116,121,34,44,10,32,32,32,32,32,32,32,32,34,101,114,114,111,114,115,34,58,32,91,93,10,32,32,32,32,32,32,125,44,10,32,32,32,32,32,34,115,116,97,116,101,109,101,110,116,115,34,58,32,91,10,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,104,105,115,68,101,99,108,97,114,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,32,34,116,104,105,115,46,99,111,109,112,108,101,116,101,100,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,102,97,108,115,101,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,93,10,32,32,32,32,125,44,10,32,32,32,32,34,109,101,116,104,111,100,115,34,58,32,123,10,32,32,32,32,32,32,32,32,34,117,110,99,111,109,112,108,101,116,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,112,117,98,108,105,99,77,101,116,104,111,100,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,32,91,93,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,84,121,112,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,111,107,34,58,32,34,118,111,105,100,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,114,114,111,114,115,34,58,32,91,93,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,115,116,97,116,101,109,101,110,116,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,104,105,115,68,101,99,108,97,114,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,32,34,116,104,105,115,46,99,111,109,112,108,101,116,101,100,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,102,97,108,115,101,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,79,75,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,118,111,105,100,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,34,99,111,109,112,108,101,116,101,34,58,32,123,10,32,32,32,32,32,32,32,32,34,112,117,98,108,105,99,77,101,116,104,111,100,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,34,112,97,114,97,109,101,116,101,114,68,101,112,101,110,100,101,110,99,105,101,115,34,58,32,91,93,44,10,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,84,121,112,101,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,34,111,107,34,58,32,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,34,101,114,114,111,114,115,34,58,32,91,93,10,32,32,32,32,32,32,32,32,32,32,125,44,10,32,32,32,32,32,32,32,32,32,32,34,115,116,97,116,101,109,101,110,116,115,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,116,117,114,110,79,75,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,120,112,114,101,115,115,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,101,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,114,101,103,117,108,97,114,69,118,97,108,117,97,116,105,111,110,34,58,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,32,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,97,114,103,117,109,101,110,116,68,101,112,101,110,100,101,110,99,105,101,115,34,58,32,91,93,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,118,97,108,117,101,34,58,32,34,116,114,117,101,34,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,125,10,32,32,32,32,125,10,32,32,125,10,125 | 123,34,84,111,100,111,69,110,116,105,116,121,34,58,34,105,109,112,111,114,116,32,123,32,68,111,109,97,105,110,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,105,109,112,111,114,116,32,123,32,69,105,116,104,101,114,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,105,109,112,111,114,116,32,123,32,111,107,32,125,32,102,114,111,109,32,39,64,98,105,116,108,111,111,112,115,47,98,108,45,98,111,105,108,101,114,112,108,97,116,101,45,99,111,114,101,39,59,105,109,112,111,114,116,32,123,32,84,111,100,111,80,114,111,112,115,32,125,32,102,114,111,109,32,39,46,47,84,111,100,111,80,114,111,112,115,39,59,101,120,112,111,114,116,32,99,108,97,115,115,32,84,111,100,111,69,110,116,105,116,121,32,101,120,116,101,110,100,115,32,68,111,109,97,105,110,46,69,110,116,105,116,121,60,84,111,100,111,80,114,111,112,115,62,32,123,32,32,112,114,105,118,97,116,101,32,99,111,110,115,116,114,117,99,116,111,114,40,112,114,111,112,115,58,32,84,111,100,111,80,114,111,112,115,41,32,123,32,115,117,112,101,114,40,112,114,111,112,115,44,32,112,114,111,112,115,46,105,100,41,59,32,116,104,105,115,46,112,114,111,112,115,46,99,111,109,112,108,101,116,101,100,32,61,32,102,97,108,115,101,59,125,32,32,112,117,98,108,105,99,32,115,116,97,116,105,99,32,99,114,101,97,116,101,40,112,114,111,112,115,58,84,111,100,111,80,114,111,112,115,41,58,32,69,105,116,104,101,114,60,84,111,100,111,69,110,116,105,116,121,44,32,110,101,118,101,114,62,32,123,32,32,32,32,114,101,116,117,114,110,32,111,107,40,110,101,119,32,84,111,100,111,69,110,116,105,116,121,40,112,114,111,112,115,41,41,59,32,32,125,32,103,101,116,32,105,100,40,41,32,123,114,101,116,117,114,110,32,116,104,105,115,46,95,105,100,59,125,32,103,101,116,32,99,111,109,112,108,101,116,101,100,40,41,58,32,98,111,111,108,101,97,110,32,123,32,114,101,116,117,114,110,32,116,104,105,115,46,112,114,111,112,115,46,99,111,109,112,108,101,116,101,100,59,125,32,112,117,98,108,105,99,32,117,110,99,111,109,112,108,101,116,101,40,41,58,69,105,116,104,101,114,60,118,111,105,100,44,32,110,101,118,101,114,62,32,123,116,104,105,115,46,112,114,111,112,115,46,99,111,109,112,108,101,116,101,100,32,61,32,102,97,108,115,101,59,114,101,116,117,114,110,32,111,107,40,41,59,125,112,117,98,108,105,99,32,99,111,109,112,108,101,116,101,40,41,58,32,69,105,116,104,101,114,60,98,111,111,108,101,97,110,44,32,110,101,118,101,114,62,32,123,32,32,32,32,114,101,116,117,114,110,32,111,107,40,116,114,117,101,41,59,32,32,125,125,34,125 | 123,10,32,32,34,84,111,100,111,80,114,111,112,115,34,58,123,10,32,32,32,32,34,118,97,114,105,97,98,108,101,115,34,58,91,123,10,32,32,32,32,32,32,32,32,34,116,121,112,101,34,58,34,98,111,111,108,34,44,10,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,34,99,111,109,112,108,101,116,101,100,34,44,10,32,32,32,32,32,32,32,32,34,111,112,116,105,111,110,97,108,34,58,102,97,108,115,101,10,32,32,32,32,125,93,10,125,125 | 101,120,112,111,114,116,32,105,110,116,101,114,102,97,99,101,32,84,111,100,111,80,114,111,112,115,32,123,32,99,111,109,112,108,101,116,101,100,58,32,98,111,111,108,101,97,110,59,32,125 | @bitloops-auto-generated |
  