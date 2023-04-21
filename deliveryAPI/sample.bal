import ballerina/http;

import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
    label: "deliveryAPI",
    id: "deliveryAPI-14b01977-b9a7-4188-ad01-2f95e5d54f4d"
}
service / on new graphql:Listener(8090) {
    @display {
        label: "deliveryIntegration",
        id: "deliveryIntegration-b31a5a7d-332f-4dc5-a078-3b4b3ac9a435"
    }
    http:Client deliveryIntegrationClient;

    @display {
        label: "billingService",
        id: "billingService-9573bf70-e3ab-446d-a535-7f662ca107da"
    }
    http:Client billingServiceClient;

    function init() returns error? {
        self.deliveryIntegrationClient = check new ("");
        self.billingServiceClient = check new ("");

    }

    # A resource for generating greetings
    # Example query:
    # query GreetWorld{ 
    # greeting(name: "World") 
    # }
    # Curl command: 
    # curl -X POST -H "Content-Type: application/json" -d '{"query": "query GreetWorld{ greeting(name:\"World\") }"}' http://localhost:8090
    #
    # + name - the input string name
    # + return - string name with greeting message or error
    resource function get greeting(string name) returns string|error {
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
