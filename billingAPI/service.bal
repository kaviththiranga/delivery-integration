import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "billingAPI",
    id: "billingAPI-1bc67315-66a1-4031-a7d9-c3807fadf712"
}
service / on new http:Listener(9090) {

    @display {
        label: "mysql",
        id: "mysql-53e287ac-d1f6-4bd2-b428-fe1f5db1008e"
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
