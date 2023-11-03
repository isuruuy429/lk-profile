import healthcare/healthcare.fhir as lk;
import ballerina/http;

service /lk on new http:Listener(9090) {
    isolated resource function get patient/[string id]() returns lk:LKCorePatient {
        return getLKPatient();
    }
}

isolated function getLKPatient() returns lk:LKCorePatient {
    lk:LkCoreAddress addr = {
        id: "123",
        extension: [
            {
                url: "http://fhir.health.gov.lk/StructureDefinition/lk-core-moh-area-ex",
                valueCodeableConcept: {
                    coding: [
                        {
                            system: "http://fhir.health.gov.lk/CodeSystem/lk-core-moh-area-cs",
                            code: "moh063",
                            display: "Boralesgamuwa MOH"
                        }
                    ]
                }
            }
        ],
        line: [
            "No 29A",
            "Newton Senevirathne road"
        ],
        city: "Boralesgamuwa",
        district: "Colombo",
        state: "Western",
        postalCode: "10290",
        country: "Sri Lanka"
    };

    lk:LKCorePatient lkPatient = {

        identifier: [
            {
                id: "0112518117",
                use: "usual",
                system: "https://fhir.health.gov.lk/id/phn",
                value: "0112518117"
            },
            {
                id: "896201328V",
                use: "official",
                system: "https://fhir.health.gov.lk/id/nic",
                value: "896201328V"
            }
        ],
        gender: "male",
        birthDate: "2003-10-21",
        address: [
            addr
        ]

    };
    return lkPatient;
}
