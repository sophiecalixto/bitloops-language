Feature: Struct to Typescript target language

  Background:
    Given type is "TGraphQLSetupData"
    And language is "TypeScript"

    Scenario Template: GraphQL Server setup to Typescript with one server
    Given I have a graphql setup <setup>
    When I generate the code
    Then I should see the <output> code

    Examples:
      | setup                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | output                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | {"servers":[{"type":"graphql","name":"server","port":"4002"}],"resolvers":[{"boundedContext":"bx","module":"mod","operationType":"query","operationName":"hello","controller":"helloWorldController","input":"HelloWorldRequestDTO","output":"HelloWorldResponseDTO"},{"boundedContext":"bx","module":"mod","operationType":"mutation","operationName":"saveHello","controller":"saveHelloController","input":"SaveHelloRequestDTO","output":"HelloWorldResponseDTO"}],"addResolversToServer":[{"serverName":"server","resolver":{"boundedContext":"bx","module":"mod","name":"hello"}},{"serverName":"server","resolver":{"boundedContext":"bx","module":"mod","name":"saveHello"}}],"bitloopsModel":{"bx":{"mod":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"name":"name","type":"string","optional":false}]},"HelloWorldResponseDTO":{"fields":[{"name":"message","type":"string","optional":false}]},"SaveHelloRequestDTO":{"fields":[{"name":"helloToBeSaved","type":"string","optional":false}]}}}}}} | const serverTypeDefs = gql`input HelloWorldRequest {name: String!}input SaveHelloRequest {helloToBeSaved: String!}type HelloWorldResponse {message: String!}type Query {hello(input: HelloWorldRequest): HelloWorldResponse }type Mutation {saveHello(input: SaveHelloRequest): HelloWorldResponse }`;const serverResolvers = {  Query: {hello: async(_parent: any, args: any, context: any): Promise<any> => { const result = await helloWorldController.execute({ args: args.input, context }); return result; },  },  Mutation: {saveHello: async(_parent: any, args: any, context: any): Promise<any> => { const result = await saveHelloController.execute({ args: args.input, context }); return result; },  },};const server = new ApolloServer({ typeDefs: serverTypeDefs, resolvers: serverResolvers }); server.listen({ port: 4002 }); |


    Scenario Template: GraphQL setup to Typescript with two servers
    Given I have a graphql setup <setup>
    When I generate the code
    Then I should see the <output> code

    Examples:
      | setup                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | output                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | {"servers":[{"type":"graphql","name":"server","port":"4002"},{"type":"graphql","name":"secondServer","port":"4003"}],"resolvers":[{"boundedContext":"bx","module":"mod","operationType":"query","operationName":"hello","controller":"helloWorldController","input":"HelloWorldRequestDTO","output":"HelloWorldResponseDTO"},{"boundedContext":"bx","module":"mod","operationType":"mutation","operationName":"saveHello","controller":"saveHelloController","input":"SaveHelloRequestDTO","output":"HelloWorldResponseDTO"}],"addResolversToServer":[{"serverName":"server","resolver":{"boundedContext":"bx","module":"mod","name":"hello"}},{"serverName":"secondServer","resolver":{"boundedContext":"bx","module":"mod","name":"saveHello"}}],"bitloopsModel":{"bx":{"mod":{"DTOs":{"HelloWorldRequestDTO":{"fields":[{"name":"name","type":"string","optional":false}]},"HelloWorldResponseDTO":{"fields":[{"name":"message","type":"string","optional":false}]},"SaveHelloRequestDTO":{"fields":[{"name":"helloToBeSaved","type":"string","optional":false}]}}}}}} | const serverTypeDefs = gql`input HelloWorldRequest {name: String!}type HelloWorldResponse {message: String!}type Query {hello(input: HelloWorldRequest): HelloWorldResponse }`;const serverResolvers = {  Query: {hello: async(_parent: any, args: any, context: any): Promise<any> => { const result = await helloWorldController.execute({ args: args.input, context }); return result; },  },};const server = new ApolloServer({ typeDefs: serverTypeDefs, resolvers: serverResolvers }); server.listen({ port: 4002 });const secondServerTypeDefs = gql`input SaveHelloRequest {helloToBeSaved: String!}type HelloWorldResponse {message: String!}type Mutation {saveHello(input: SaveHelloRequest): HelloWorldResponse }`;const secondServerResolvers = {  Mutation: {saveHello: async(_parent: any, args: any, context: any): Promise<any> => { const result = await saveHelloController.execute({ args: args.input, context }); return result; },  },};const secondServer = new ApolloServer({ typeDefs: secondServerTypeDefs, resolvers: secondServerResolvers }); server.listen({ port: 4003 }); |