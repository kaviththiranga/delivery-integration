import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "deliveryIntegration",
    id: "deliveryIntegration-b31a5a7d-332f-4dc5-a078-3b4b3ac9a435"
}
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function post delivery(@http:Payload Item payload) returns string|error {
        return "Order Delivered";
    }
}

type Item record {
};
