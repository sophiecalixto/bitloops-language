/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 by Bart Kiers (original author) and Alexandre Vitorelli (contributor -> ported to CSharp)
 * Copyright (c) 2017 by Ivan Kochurkin (Positive Technologies):
    added ECMAScript 6 support, cleared and transformed to the universal grammar.
 * Copyright (c) 2018 by Juan Alvarez (contributor -> ported to Go)
 * Copyright (c) 2019 by Andrii Artiushok (contributor -> added TypeScript support)
 * Copyright (c) 2022 by Bitloops S.A. (contributor -> added Bitloops support)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
parser grammar BitloopsParser;

options {
    tokenVocab=BitloopsLexer;
   // superClass=BitloopsParserBase;
}

// SupportSyntax

initializer
    : '=' singleExpression
    ;

bindingPattern
    : (arrayLiteral | objectLiteral)
    ;

// Bitloops SPart
// A.1 Types

typeParameters
    : '<' typeParameterList? '>'
    ;

typeParameterList
    : typeParameter (',' typeParameter)*
    ;

fieldList
    : field (';' field)* SemiColon
    ;

structEvaluationFieldList
    : structEvaluationField (',' structEvaluationField)*
    ;

propsEvaluationFieldList
    : propsEvaluationField (',' propsEvaluationField)*
    ;


dtoEvaluationFieldList
    : structEvaluationField (',' structEvaluationField)*
    ;

structEvaluationField
    : Identifier ':' expression
    ;

propsEvaluationField
    : Identifier ':' expression
    ;

typeParameter
    : Identifier constraint?
    | typeParameters
    ;

constraint
    : 'extends' type_
    ;

typeArguments
    : '<' typeArgumentList? '>'
    ;

propFields
    : '{' fieldList? '}'
    ;

typeArgumentList
    : typeArgument (',' typeArgument)*
    ;

typeArgument
    : type_
    ;

bitloopsIdentifiers
    : UseCaseIdentifier
    | dtoIdentifier
    | ControllerIdentifier
    | ErrorIdentifier
    | UpperCaseIdentifier
    | PropsIdentifier
    | ValueObjectIdentifier
    | EntityIdentifier
    | RepoPortIdentifier
    ;

type_
    : unionOrIntersectionOrPrimaryType
    | functionType
    | constructorType
    | typeGeneric
    | StringLiteral
    | bitloopsIdentifiers
    | type_ '[' ']' 
    ;

unionOrIntersectionOrPrimaryType
    : unionOrIntersectionOrPrimaryType '|' unionOrIntersectionOrPrimaryType #Union
    | unionOrIntersectionOrPrimaryType '&' unionOrIntersectionOrPrimaryType #Intersection
    // | primaryType #Primary
    | primitives #Primmitives
    ;

primaryType
    : '(' type_ ')'                                 #ParenthesizedPrimType
    | predefinedType                                #PredefinedPrimType
    | typeReference                                 #ReferencePrimType
    | objectType                                    #ObjectPrimType
    // | primaryType {notLineTerminator()}? '[' ']'    #ArrayPrimType
    | primaryType '[' ']'    #ArrayPrimType
    | '[' tupleElementTypes ']'                     #TuplePrimType
    | typeQuery                                     #QueryPrimType
    | This                                          #ThisPrimType
    | typeReference Is primaryType                  #RedefinitionOfType
    ;

primitives
    : Any
    | Double
    | Float
    | Int32
    | Int64
    | Uint32
    | Uint64
    | Sint32
    | Sint64
    | Fixed32
    | Fixed64
    | Sfixed32
    | Sfixed64
    | Boolean
    | String
    | Bytes
    | Timestamp
    | Void
    ;

identifier
    : Identifier
    ;

struct
    : UpperCaseIdentifier
    ;

regularEvaluation
    : regularMethodEvaluation
    | regularStringEvaluation
    | regularVariableEvaluation
    | regularIntegerEvaluation
    | regularDecimalEvaluation
    | regularBooleanEvaluation
    | regularDTOEvaluation
    | regularStructEvaluation
    ;
// regularVariableEvaluation | regularStringEvaluation |

methodArguments
    : '(' (argumentList (',' argumentList)*)? ')'
    ;

openParen:
    | OpenParen
    ;

closeParen:
    | CloseParen
    ;

//regularMethodEvaluation
//    : regularVariableEvaluation openParen regularVariableEvaluation closeParen;
regularVariableEvaluation
    : RegularVariableEvaluation
    | Identifier
    ;

regularMethodEvaluation
    : RegularVariableEvaluation methodArguments
    ;



regularStringEvaluation
    : StringLiteral
    ;

regularIntegerEvaluation
    : IntegerLiteral
    ;

regularDecimalEvaluation
    : DecimalLiteral
    ;

regularBooleanEvaluation
    : BooleanLiteral
    ;

regularStructEvaluation
    : UpperCaseIdentifier
    ;

regularDTOEvaluation
    : DTOIdentifier
    ;

// | RegularStringEvaluation | RegularBackTicksEvaluation
field
    : Optional? (primitives | struct) identifier
    ;

predefinedType
    : Any
    | Int32
    | Boolean
    | String
    | Struct
    | Void
    ;

typeReference
    : typeName nestedTypeGeneric?
    ;

nestedTypeGeneric
    : typeIncludeGeneric
    | typeGeneric
    ;

// I tried recursive include, but it's not working.
// typeGeneric
//    : '<' typeArgumentList typeGeneric?'>'
//    ;
//
// TODO: Fix recursive
//
typeGeneric
    : '<' typeArgumentList '>'
    ;

typeIncludeGeneric
    :'<' typeArgumentList '<' typeArgumentList ('>' bindingPattern '>' | '>>')
    ;

typeName
    : Identifier
    | namespaceName
    ;

objectType
    : '{' typeBody? '}'
    ;

typeBody
    : typeMemberList (SemiColon | ',')?
    ;

typeMemberList
    : typeMember ((SemiColon | ',') typeMember)*
    ;

typeMember
    : propertySignatur
    | callSignature
    | constructSignature
    | indexSignature
    | methodSignature ('=>' type_)?
    ;

methodDefinitionList
    : methodDefinition*
    ;

methodDefinition
    : identifier formalParameterList? typeAnnotation SemiColon
    ;

arrayType
    // : primaryType {notLineTerminator()}? '[' ']'
    : primaryType '[' ']'
    ;

tupleType
    : '[' tupleElementTypes ']'
    ;

tupleElementTypes
    : type_ (',' type_)*
    ;

functionType
    : typeParameters? '(' parameterList? ')' '=>' type_
    ;

constructorType
    : 'new' typeParameters? '(' parameterList? ')' '=>' type_
    ;

typeQuery
    : 'typeof' typeQueryExpression
    ;

typeQueryExpression
    : Identifier
    | (identifierName '.')+ identifierName
    ;

propertySignatur
    : ReadOnly? propertyName '?'? typeAnnotation? ('=>' type_)?
    ;

typeAnnotation
    : ':' type_
    ;

callSignature
    : typeParameters? '(' parameterList? ')' typeAnnotation?
    ;

parameterList
    : restParameter
    | parameter (',' parameter)* (',' restParameter)?
    ;

requiredParameterList
    : requiredParameter (',' requiredParameter)*
    ;

parameter
    : requiredParameter
    | optionalParameter
    ;

optionalParameter
    : decoratorList? ( accessibilityModifier? identifierOrPattern ('?' typeAnnotation? | typeAnnotation? initializer))
    ;

restParameter
    : '...' singleExpression typeAnnotation?
    ;

requiredParameter
    : decoratorList? accessibilityModifier? identifierOrPattern typeAnnotation?
    ;

accessibilityModifier
    : Public
    | Private
    // | Protected
    ;

identifierOrPattern
    : identifierName
    | bindingPattern
    ;

constructSignature
    : 'new' typeParameters? '(' parameterList? ')' typeAnnotation?
    ;

indexSignature
    : '[' Identifier ':' (Int32|String) ']' typeAnnotation
    ;

methodSignature
    : propertyName '?'? callSignature
    ;

typeAliasDeclaration
    : 'type' Identifier typeParameters? '=' type_ SemiColon
    ;

// constructorDeclaration
//     : accessibilityModifier? Constructor '(' formalParameterList? ')' ( ('{' functionBody '}') | SemiColon)?
//     ;
//useCaseExecuteDeclaration
//    : accessibilityModifier? Execute '(' formalParameterList? ')' ( ('{' functionBody '}') | SemiColon)
//;

// A.5 Interface

// interfaceDeclaration
//     : Export? Declare? Interface Identifier typeParameters? interfaceExtendsClause? objectType SemiColon?
//     ;

// propsDeclaration
//     : Props Identifier typeParameters? interfaceExtendsClause? objectType SemiColon?
//     ;

interfaceExtendsClause
    : Extends classOrInterfaceTypeList
    ;

classOrInterfaceTypeList
    : typeReference (',' typeReference)*
    ;

// A.7 Interface

// enumDeclaration
//     : Const? Enum Identifier '{' enumBody? '}'
//     ;

enumBody
    : enumMemberList ','?
    ;

enumMemberList
    : enumMember (',' enumMember)*
    ;

enumMember
    : propertyName ('=' singleExpression)?
    ;

// A.8 Namespaces

namespaceDeclaration
    : Namespace namespaceName '{' statementList? '}'
    ;

namespaceName
    : Identifier ('.'+ Identifier)*
    ;

importAliasDeclaration
    : Identifier '=' namespaceName SemiColon
    ;

// Ext.2 Additions to 1.8: Decorators

decoratorList
    : decorator+ ;

decorator
    : '@' (decoratorMemberExpression | decoratorCallExpression)
    ;

decoratorMemberExpression
    : Identifier
    | decoratorMemberExpression '.' identifierName
    | '(' singleExpression ')'
    ;

decoratorCallExpression
    : decoratorMemberExpression arguments;

// ECMAPart
program
    : sourceElement*
    // : sourceElements?
    // sourceElements? EOF?
    ;

sourceElements
    : sourceElement+
    ;

sourceElement
    : dtoDeclaration
    | domainErrorDeclaration
    | applicationErrorDeclaration
    | controllerDeclaration
    | jestTestDeclaration
    | propsDeclaration
    | structDeclaration
    | useCaseDeclaration
    | packagePortDeclaration
    | valueObjectDeclaration
    | domainCreateDeclaration
    | repoPortDeclaration
    ;

// TODO fix JestTestReturnOkErrorType
jestTestDeclaration
    : JestTestFunctionBody '{' functionBody '}' SemiColon?  
    // JestTestExecute '{' functionBody '}' SemiColon?      
    | JestTestStatementList '{' statementList '}' SemiColon?    
    | JestTestStatement '{' statement SemiColon? '}' SemiColon? 
    | JestTestStructEvaluation '{' structEvaluation ';'? '}'  ';'?  
    | JestTestDTOEvaluation '{' dtoEvaluation ';'? '}'  ';'?    
    | JestTestEvaluation '{' evaluation ';'? '}'  ';'?  
    | JestTest '{' regularEvaluation SemiColon? '}' SemiColon?  
    | JestTest '{' formalParameterList '}' SemiColon?   
    | JestTest '{' restControllerParameters '}'     
    | JestTest '{' restControllerExecuteDeclaration '}'    
    | JestTest '{' restControllerMethodDeclaration '}'  
    | JestTestReturnOkErrorType '{' returnOkErrorType '}' SemiColon?    
    | JestTestConstDeclaration '{' constDeclaration '}' SemiColon?  
    | JestTestSingleExpression '{' singleExpression '}' SemiColon?  
    | JestTestMethodDefinitionList '{' methodDefinitionList '}' SemiColon?
    | JestTestCreateMethodDeclaration '{' domainCreateDeclaration '}' SemiColon?
    | JestTestPrivateMethodDeclaration '{' privateMethodDeclaration '}' SemiColon?
    | JestTestPublicMethodDeclaration '{' publicMethodDeclaration '}' SemiColon?
    | JestTestValueObjectDeclaration '{' valueObjectDeclaration '}' SemiColon?
    | JestTestEntityDeclaration '{' entityDeclaration '}' SemiColon?
    ;

evaluation
    : regularEvaluation
    | dtoEvaluation
    | structEvaluation
    | valueObjectEvaluation
    | propsEvaluation
    ;

// condition
//     : evaluateTrue | evaluateFalse

expression
    : evaluation
    // | condition
    ;

returnStatement
    : Return expression
    ;

constDeclaration
    : Const identifier typeAnnotation? '=' expression
    ;

statement
    : block                         
    | expression
    | constDeclaration
    // | expressionStatement
    | emptyStatement_
    | propsDeclaration
    | namespaceDeclaration //ADDED
    | ifStatement
    | breakStatement
    | switchStatement
    | iterationStatement
    | returnStatement
    // | returnErrorStatement TODO
    // | labelledStatement
    | throwStatement
    | tryStatement
    | functionDeclaration
    | arrowFunctionDeclaration
    // | variableStatement
    | typeAliasDeclaration //ADDED
    | expressionAssignment
    ;

block
    : '{' statementList? '}'
    ;

statementList
    : statement+ SemiColon?
    ;

// abstractDeclaration
//     : Abstract (Identifier callSignature | variableStatement) eos
//     ;

// importStatement
//     : Import (fromBlock | importAliasDeclaration)
//     ;

fromBlock
    : (Multiply | multipleImportStatement) (As identifierName)? From StringLiteral eos
    ;

multipleImportStatement
    : (identifierName ',')? '{' identifierName (',' identifierName)* '}'
    ;

// exportStatement
//     : Export Default? (fromBlock | statement)
//     ;

variableStatement
    : bindingPattern typeAnnotation? initializer SemiColon?
    | accessibilityModifier? varModifier? ReadOnly? variableDeclarationList SemiColon?
    | Declare varModifier? variableDeclarationList SemiColon?
    ;

variableDeclarationList
    : variableDeclaration (',' variableDeclaration)*
    ;

variableDeclaration
    : ( identifierOrKeyWord | arrayLiteral | objectLiteral) typeAnnotation? singleExpression? ('=' typeParameters? singleExpression)? // ECMAScript 6: Array & Object Matching
    ;

emptyStatement_
    : SemiColon
    ;

expressionStatement
    // : {this.notOpenBraceAndNotFunction()}? expressionSequence SemiColon?
    : expressionSequence SemiColon?
    ;

ifStatement
    : If openParen singleExpression closeParen statement (Else statement)?
    ;


iterationStatement
    : Do statement While '(' expressionSequence ')' eos                                                         # DoStatement
    | While '(' expressionSequence ')' statement                                                                # WhileStatement
    | For '(' expressionSequence? SemiColon expressionSequence? SemiColon expressionSequence? ')' statement     # ForStatement
    | For '(' varModifier variableDeclarationList SemiColon expressionSequence? SemiColon expressionSequence? ')'
          statement                                                                                             # ForVarStatement
    // | For '(' singleExpression (In | Identifier{this.p("of")}?) expressionSequence ')' statement                # ForInStatement
    // | For '(' varModifier variableDeclaration (In | Identifier{this.p("of")}?) expressionSequence ')' statement # ForVarInStatement
    | For '(' singleExpression (In | Identifier?) expressionSequence ')' statement                # ForInStatement
    | For '(' varModifier variableDeclaration (In | Identifier?) expressionSequence ')' statement # ForVarInStatement
    ;

varModifier
    : Var
    | Let
    | Const
    ;

// continueStatement
//     : Continue ({this.notLineTerminator()}? Identifier)? eos
//     ;

// breakStatement
//     : Break ({this.notLineTerminator()}? Identifier)? eos
//     ;

// returnStatement
//     : Return ({this.notLineTerminator()}? expressionSequence)? eos
//     ;

continueStatement
    : Continue (Identifier)? eos
    ;

breakStatement
    : Break (Identifier)? eos
    ;

// returnStatement
//     : Return (expressionSequence)? eos
//     ;

// yieldStatement
//     : Yield ({this.notLineTerminator()}? expressionSequence)? eos
//     ;

withStatement
    : With '(' expressionSequence ')' statement
    ;

switchStatement
    : Switch '(' singleExpression ')' caseBlock
    ;

caseBlock
    : '{' caseClauses? (defaultClause caseClauses?)? '}'
    ;

caseClauses
    : caseClause+
    ;

caseClause
    : Case singleExpression ':' statementList? Break SemiColon?
    ;

defaultClause
    : Default ':' statementList? Break SemiColon?
    ;

labelledStatement
    : Identifier ':' statement
    ;

throwStatement
    // : Throw {this.notLineTerminator()}? expressionSequence eos
    : Throw expressionSequence eos
    ;

tryStatement
    : Try block (catchProduction finallyProduction? | finallyProduction)
    ;

catchProduction
    : Catch '(' Identifier ')' block
    ;

finallyProduction
    : Finally block
    ;

debuggerStatement
    : Debugger eos
    ;

functionDeclaration
    : Function_ Identifier callSignature ( ('{' functionBody '}') | SemiColon)
    ;

//Ovveride ECMA
// classDeclaration
//     : Abstract? Class Identifier typeParameters? classHeritage classTail
//     ;

// controllerDeclaration
//     : RESTController ControllerIdentifier formalParameterList '{' restControllerMethodDeclaration restControllerExecuteDeclaration '}' SemiColon?
//     | GraphQLController ControllerIdentifier formalParameterList '{' graphQLOperationAssignment '}' SemiColon?
//     ;

// aggregateDeclaration 
// : Aggregate aggregateIdentifier '{' constDeclaration* domainCreateDeclaration privateMethodDeclaration* publicMethodDeclaration*'}' SemiColon?
// ;

entityDeclaration 
: Entity entityIdentifier '{' constDeclaration* domainCreateDeclaration privateMethodDeclaration* publicMethodDeclaration*'}' SemiColon?
;

valueObjectDeclaration 
    : ValueObject valueObjectIdentifier '{' constDeclaration* domainCreateDeclaration privateMethodDeclaration* '}' SemiColon?
    ;

domainCreateDeclaration
    : Create formalParameterList? ':' returnOkErrorType '{' functionBody '}'
    ;

useCaseIdentifier
    : UseCaseIdentifier
    ;

useCaseDeclaration
    : UseCase useCaseIdentifier formalParameterList? '{' useCaseExecuteDeclaration '}' SemiColon?
    ;

propsDeclaration
    : Props PropsIdentifier '{' fieldList '}' SemiColon?
    ;

// RepoPort TodoRepoPort<TodoEntity> extends CRUDRepoPort;
repoPortDeclaration
    : RepoPort repoPortIdentifier '<' aggregateRootIdentifier '>' repoExtendsList SemiColon?
    | RepoPort repoPortIdentifier '<' aggregateRootIdentifier '>' repoExtendsList repoPortMethodDefinitions SemiColon?
    ;

repoPortIdentifier
    : RepoPortIdentifier
    ;

aggregateRootIdentifier
    : Identifier
    | UpperCaseIdentifier 
    | EntityIdentifier
    | DTOIdentifier
    ;

repoExtendsList
    : Extends repoPortExtendableIdentifierList
    ;

repoPortMethodDefinitions
    // : '{' '}'
    : '{' methodDefinitionList '}'
    ;

repoPortExtendableIdentifierList
    : (repoPortExtendableIdentifier) (',' (repoPortExtendableIdentifier))*
    ;

repoPortExtendableIdentifier
    : RepoPortIdentifier
    | UpperCaseIdentifier 
    | UpperCaseIdentifier '<' UpperCaseIdentifier '>'
    ;

dtoDeclaration
    : DTO DTOIdentifier '{' fieldList '}' SemiColon?
    ;

structDeclaration
    : Struct UpperCaseIdentifier '{' fieldList '}' ';'?
    ;

dtoEvaluationIdentifier
    : dtoIdentifier 
    ;

dtoEvaluation
    : dtoEvaluationIdentifier '(' '{' dtoEvaluationFieldList '}' ')'
    ;

// //TODO valueObjectEvaluation
valueObjectEvaluation
    : ValueObjectIdentifier '{' '(' (dtoEvaluationFieldList) ')' '}'
    ;

// TODO remove '{' and '(' from identifier
structEvaluationIdentifier
    : UpperCaseIdentifier WS* '(' WS* '{';

structEvaluation
    : structEvaluationIdentifier (structEvaluationFieldList) '}' ')'
    ;

propsEvaluation
    : '{' '(' PropsEvaluationIdentifier (propsEvaluationFieldList) '}' ')'
    ;

domainErrorDeclaration
    : DomainError domainErrorIdentifier formalParameterList? objectLiteral SemiColon?
    ;

applicationErrorDeclaration
    : ApplicationError applicationErrorIdentifier formalParameterList? objectLiteral SemiColon?
    ;

domainErrorIdentifier
    : UpperCaseIdentifier;

applicationErrorIdentifier
    : UpperCaseIdentifier;

useCaseExecuteDeclaration
    : Execute formalParameterList? ':' returnOkErrorType '{' functionBody '}'
    ;

restControllerParameters
    : Identifier ',' Identifier
    ;

restControllerExecuteDeclaration
    : Execute '(' restControllerParameters ')' '{' functionBody '}'
    ;

restControllerMethodDeclaration
    : Method ':' (MethodGet | MethodPut | MethodPost | MethodDelete | MethodPatch | MethodOptions) SemiColon?
    ;


controllerDeclaration
    : RESTController ControllerIdentifier formalParameterList '{' restControllerMethodDeclaration restControllerExecuteDeclaration '}' SemiColon?
    | GraphQLController ControllerIdentifier formalParameterList '{' graphQLResolverOptions graphQLControllerExecuteDeclaration '}' SemiColon?
    ;

graphQLResolverOptions
    : graphQLOperationTypeAssignment graphQLOperationInputTypeAssignment
    ;

graphQLOperationTypeAssignment
    : GraphQLOperation Colon graphQLOperation SemiColon
    ;
graphQLOperationInputTypeAssignment
    : Input ':' graphQLResolverInputType SemiColon
    ;

graphQLResolverInputType
    : DTOIdentifier;

graphQLOperation
    : OperationMutation
    | OperationQuery
    | OperationSubscription
    ;

graphQLControllerExecuteDeclaration
    : Execute '(' graphQLControllerParameters ')' ':' graphQLControllerReturnType '{' functionBody '}'
    ;
    // graphQLControllerParameters

graphQLControllerParameters
    : Identifier
    ;

graphQLControllerReturnType
    : DTOIdentifier
    ;

dtoIdentifier
    : DTOIdentifier
    ;

dtoIdentifiers
    : WS* dtoIdentifier ( WS* BitOr WS* dtoIdentifier)*
    ;

errorIdentifier
    : ErrorIdentifier
    ;

errorIdentifiers
    : errorIdentifier (BitOr errorIdentifier)*
    ;

valueObjectIdentifier
    : ValueObjectIdentifier
    ;

entityIdentifier
: EntityIdentifier
;

// aggregateIdentifier
// : AggregateIdentifier
// ;

// TODO valueObjectIdentifier inside bitloops identifiers 
// TODO change it to something like this dtoIdentifiers | valueObjectIdentifier | type_
returnOkType
    : WS* OK WS* OpenParen WS* ( type_ (BitOr type_)* ) WS* CloseParen
    ;

returnErrorsType
    : Errors OpenParen errorIdentifiers? CloseParen
    ;

returnOkErrorType
    : WS* OpenParen WS* returnOkType WS* Comma WS* returnErrorsType WS* CloseParen
    ;

packagePortIdentifier
    : PackagePortIdentifier
    ;

packagePortDeclaration
    : PackagePort packagePortIdentifier '{' methodDefinitionList '}'
    ;

// classHeritage
//     : classExtendsClause? implementsClause?
//     ;

// classTail
//     :  '{' classElement* '}'
//     ;

classExtendsClause
    : Extends typeReference
    ;

// useCaseTail
//     :  '{' useCaseElement* '}'
//     ;

// implementsClause
//     : Implements classOrInterfaceTypeList
//     ;

// Classes modified
// classElement
//     : constructorDeclaration
//     | decoratorList? propertyMemberDeclaration
//     | indexMemberDeclaration
//     | statement
//     ;

// useCaseElement
//     : executeDeclaration
//     | decoratorList? propertyMemberDeclaration
//     | indexMemberDeclaration
//     | statement
//     ;

// propertyMemberDeclaration
    // : propertyMemberBase propertyName '?'? typeAnnotation? initializer? SemiColon                   # PropertyDeclarationExpression
    // | propertyMemberBase propertyName callSignature ( ('{' functionBody '}') | SemiColon)           # MethodDeclarationExpression
    // | propertyMemberBase (getAccessor | setAccessor)                                                # GetterSetterDeclarationExpression
    // | abstractDeclaration     # AbstractMemberDeclaration

methodDeclaration
    : publicMethodDeclaration            # MethodDeclarationExpression
    | privateMethodDeclaration           # MethodDeclarationExpression
    ;

privateMethodDeclaration
    : Private? identifier formalParameterList? returnPrivateMethodType '{' functionBody '}'                 # PrivatePropertyMethodDeclarationExpression
    ;

publicMethodDeclaration
    : Public? identifier formalParameterList? returnPublicMethodType '{' functionBody '}'    
    ;

returnPublicMethodType
    : ':' returnOkErrorType
    ;

returnPrivateMethodType
    : typeAnnotation | (':' returnOkErrorType)
;

propertyMemberBase
    : accessibilityModifier? Static?
    ;

indexMemberDeclaration
    : indexSignature SemiColon
    ;

generatorMethod
    : '*'?  Identifier '(' formalParameterList? ')' '{' functionBody '}'
    ;

generatorFunctionDeclaration
    : Function_ '*' Identifier? '(' formalParameterList? ')' '{' functionBody '}'
    ;

generatorBlock
    : '{' generatorDefinition (',' generatorDefinition)* ','? '}'
    ;

generatorDefinition
    : '*' iteratorDefinition
    ;

iteratorBlock
    : '{' iteratorDefinition (',' iteratorDefinition)* ','? '}'
    ;

iteratorDefinition
    : '[' singleExpression ']' '(' formalParameterList? ')' '{' functionBody '}'
    ;

formalParameterList
    : '()' 
    | '('
    (
    formalParameterArg (',' formalParameterArg)* (',' lastFormalParameterArg)?
    | lastFormalParameterArg
    | arrayLiteral                              // ECMAScript 6: Parameter Context Matching
    | objectLiteral (':' formalParameterList )? // ECMAScript 6: Parameter Context Matching
    )?
    ')' 
    | '(' ')'
    ;

formalParameterArg
    : decorator? accessibilityModifier? identifierOrKeyWord typeAnnotation? ('=' singleExpression )?      // ECMAScript 6: Initialization
    ;

lastFormalParameterArg                        // ECMAScript 6: Rest Parameter
    : Ellipsis Identifier
    ;

functionBody
    : statementList?
    ;

// sourceElements
//     : sourceElement+
//     ;

arrayLiteral
    : ('[' elementList? ']')
    ;

elementList
    : arrayElement (','+ arrayElement)*
    ;

arrayElement                      // ECMAScript 6: Spread Operator
    : Ellipsis? (singleExpression | Identifier) ','?
    ;

objectLiteral
    : '{' (propertyAssignment (',' propertyAssignment)* ','?)? '}'
    ;

functionParameters
    : (propertyAssignment (',' propertyAssignment)* ','?)
    ;

// MODIFIED
propertyAssignment
    : propertyName (':' |'=') singleExpression                # PropertyExpressionAssignment
    | '[' singleExpression ']' ':' singleExpression           # ComputedPropertyExpressionAssignment
    | getAccessor                                             # PropertyGetter
    | setAccessor                                             # PropertySetter
    | generatorMethod                                         # MethodProperty
    | identifierOrKeyWord                                     # PropertyShorthand
    | restParameter                                           # RestParameterInObject
    ;

expressionAssignment
    : identifier op='=' expression SemiColon?                   #IdentifierExpressionAssingment
    | regularVariableEvaluation op='=' expression SemiColon?    #RegularVariableExpressionAssingment
    ;

getAccessor
    : getter '(' ')' typeAnnotation? '{' functionBody '}'
    ;

setAccessor
    : setter '(' ( Identifier | bindingPattern) typeAnnotation? ')' '{' functionBody '}'
    ;

propertyName
    : identifierName
    | StringLiteral
    | numericLiteral
    ;

arguments
    : '(' (argumentList ','?)? ')'
    ;

argumentList
    : argument (',' argument)*
    ;

argument                      // ECMAScript 6: Spread Operator
    : Ellipsis? (singleExpression | Identifier)
    ;

expressionSequence
    : singleExpression (',' singleExpression)*
    ;

functionExpressionDeclaration
    : Function_ Identifier? '(' formalParameterList? ')' typeAnnotation? '{' functionBody '}'
    ;

singleExpression
    : Not singleExpression                                                   # NotExpression
    | singleExpression op=('*' | '/' | '%') singleExpression                 # MultiplicativeExpression
    | singleExpression op=('+' | '-') singleExpression                       # AdditiveExpression
    | singleExpression op=('<' | '>' | '<=' | '>=') singleExpression         # RelationalExpression
    | singleExpression op=('==' | '!=' ) singleExpression                    # EqualityExpression
    | singleExpression op=And singleExpression                               # LogicalAndExpression
    | singleExpression op=Or singleExpression                                # LogicalOrExpression
    | This                                                                   # ThisExpression
    | literal                                                                # LiteralExpression
    | regularVariableEvaluation                                              # IdentifierExpression //Identifier or Variable method
    ;

// more single expressions
    // | functionExpressionDeclaration                                          # FunctionExpression
    // | arrowFunctionDeclaration                                               # ArrowFunctionExpression   // ECMAScript 6
    // | Class Identifier? classTail                                            # ClassExpression
    // | UseCase Identifier? useCaseTail                                        # UseCaseExpression
    // | singleExpression '[' expressionSequence ']'                            # MemberIndexExpression
    // Split to try `new Date()` first, then `new Date`.
    // | New singleExpression typeArguments? arguments                          # NewExpression
    // | New singleExpression typeArguments?                                    # NewExpression
    // | singleExpression arguments                                             # ArgumentsExpression
    // | singleExpression {this.notLineTerminator()}? '++'                      # PostIncrementExpression
    // | singleExpression {this.notLineTerminator()}? '--'                      # PostDecreaseExpression
    // | singleExpression '++'                      # PostIncrementExpression
    // | singleExpression '--'                      # PostDecreaseExpression
    // | Delete singleExpression                                                # DeleteExpression
    // | Void singleExpression                                                  # VoidExpression
    // | Typeof singleExpression                                                # TypeofExpression
    // | '++' singleExpression                                                  # PreIncrementExpression
    // | '--' singleExpression                                                  # PreDecreaseExpression
    // | '+' singleExpression                                                   # UnaryPlusExpression
    // | '-' singleExpression                                                   # UnaryMinusExpression
    // | '~' singleExpression                                                   # BitNotExpression
    // | '!' singleExpression                                                   # NotExpression
    // | singleExpression ('<<' | '>>' | '>>>') singleExpression                # BitShiftExpression
    // | singleExpression Instanceof singleExpression                           # InstanceofExpression
    // | singleExpression In singleExpression                                   # InExpression
    // | singleExpression '&' singleExpression                                  # BitAndExpression
    // | singleExpression '^' singleExpression                                  # BitXOrExpression
    // | singleExpression '|' singleExpression                                  # BitOrExpression
    // | singleExpression '&&' singleExpression                                 # LogicalAndExpression
    // | singleExpression '||' singleExpression                                 # LogicalOrExpression
    // | singleExpression '?' singleExpression ':' singleExpression             # TernaryExpression
    // | singleExpression '=' singleExpression                                  # AssignmentExpression
    // | singleExpression assignmentOperator singleExpression                   # AssignmentOperatorExpression
    // | singleExpression templateStringLiteral                                 # TemplateStringExpression  // ECMAScript 6
    // | iteratorBlock                                                          # IteratorsExpression // ECMAScript 6
    // | generatorBlock                                                         # GeneratorsExpression // ECMAScript 6
    // | generatorFunctionDeclaration                                           # GeneratorsFunctionExpression // ECMAScript 6
    // | yieldStatement                                                         # YieldExpression // ECMAScript 6
    // | Super                                                                  # SuperExpression
    // | arrayLiteral                                                           # ArrayLiteralExpression
    // | objectLiteral                                                          # ObjectLiteralExpression
    // | '(' expressionSequence ')'                                             # ParenthesizedExpression
    // | typeArguments expressionSequence?                                      # GenericTypes
    // | singleExpression As asExpression                                       # CastAsExpression

asExpression
    : predefinedType ('[' ']')?
    | singleExpression
    ;

arrowFunctionDeclaration
    : Async? arrowFunctionParameters typeAnnotation? '=>' arrowFunctionBody
    ;

arrowFunctionParameters
    : Identifier
    | '(' formalParameterList? ')'
    ;

arrowFunctionBody
    : singleExpression
    | '{' functionBody '}'
    ;

assignmentOperator
    : '*='
    | '/='
    | '%='
    | '+='
    | '-='
    | '<<='
    | '>>='
    | '>>>='
    | '&='
    | '^='
    | '|='
    ;

literal
    : NullLiteral
    | BooleanLiteral
    | StringLiteral
    | templateStringLiteral
    | RegularExpressionLiteral
    | numericLiteral
    ;

templateStringLiteral
    : BackTick templateStringAtom* BackTick
    ;

templateStringAtom
    : TemplateStringAtom
    | TemplateStringStartExpression singleExpression TemplateCloseBrace
    ;

numericLiteral
    : IntegerLiteral        #IntegerLiteral
    | DecimalLiteral        #DecimalLiteral
    | HexIntegerLiteral     #HexIntegerLiteral
    | OctalIntegerLiteral   #OctalIntegerLiteral
    | OctalIntegerLiteral2  #OctalIntegerLiteral2
    | BinaryIntegerLiteral  #BinaryIntegerLiteral
    ;


identifierName
    : Identifier
    ;

identifierOrKeyWord
    : Identifier
    | TypeAlias
    // | Require
    ;

reservedWord
    : keyword
    | NullLiteral
    | BooleanLiteral
    ;

keyword
    : Break
    | Do
    | Instanceof
    | Typeof
    | Case
    | Else
    | New
    | Var
    | Catch
    | Finally
    | Return
    | Void
    | Continue
    | For
    | Switch
    | While
    | Debugger
    | Function_
    | This
    | With
    | Default
    | If
    | Throw
    | Delete
    | In
    | Try
    | ReadOnly
    | Async
    | From
    | UseCase
    // | Class
    // | Enum
    | Extends
    // | Super
    | Const
    // | Export
    // | Import
    // | Implements
    | Let
    | Private
    | Public
    // | Interface
    // | Package
    | Protected
    | Static
    // | Yield
    | Get
    | Set
    // | Require
    | TypeAlias
    | String
    ;

getter
    : Get propertyName
    ;

setter
    : Set propertyName
    ;

eos
    : SemiColon
    | EOF
    // | {this.lineTerminatorAhead()}?
    // | {this.closeBrace()}?
    ;