import ballerina/http;
import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
    label: "DeliveryAPI",
    id: "DeliveryAPI-952baece-946c-40d9-bf63-e9678cf9a458"
}
service / on new graphql:Listener(8090) {
    @display {
        label: "deliveryScheduling",
        id: "deliveryScheduling-5ce86fad-a1d3-4625-a453-5a26669e7536"
    }
    http:Client deliverySchedulingClient;

    @display {
        label: "billingAPI",
        id: "billingAPI-1bc67315-66a1-4031-a7d9-c3807fadf712"
    }
    http:Client billingApiClient;

    function init() returns error? {
        self.deliverySchedulingClient = check new ("");
        self.billingApiClient = check new ("");
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
