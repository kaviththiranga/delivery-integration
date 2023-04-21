import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "billingService",
    id: "billingService-9573bf70-e3ab-446d-a535-7f662ca107da"
}
service / on new http:Listener(9090) {

    @display {
        label: "mysql",
        id: "mysql-4af50f18-db67-4558-b814-b4c5941e2a1b"
    }
    mysql:Client mysqlEp;

    function init() returns error? {
        self.mysqlEp = check new ();
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
