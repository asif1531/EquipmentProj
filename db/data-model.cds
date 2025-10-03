namespace equipment.com.app;

using {
    cuid,
    managed
} from '@sap/cds/common';

// entity Equipments : cuid, managed {
//     name         : String;
//     location     : Association to Locations on location.code = $self.location.code;
//     manufacturer : String;
//     type         : Association to EquipmentTypes on type.code = $self.type.code;
//     status       : Association to EquipmentStatus on status.code = $self.status_code;;
//     tasks        : Composition of many Tasks
//                        on tasks.equipment = $self;
//     issues       : Association to many Issues
//                        on issues.equipment = $self;
// }

entity Equipments : cuid, managed {
    name          : String;
    type_code     : String(50);
    location_code : String(50);
    status_code   : String(50);
    manufacturer  : String;

    type          : Association to EquipmentTypes
                        on type.code = $self.type_code;
    location      : Association to Locations
                        on location.code = $self.location_code;
    status        : Association to EquipmentStatus
                        on status.code = $self.status_code;

    tasks         : Composition of many Tasks
                        on tasks.equipment = $self;
    issues        : Association to many Issues
                        on issues.equipment = $self;
}


entity Tasks : cuid, managed {
    description : String(200);
    dueDate     : Date;
    priority    : Association to TaskPriority;
    status      : Association to TaskStatus;
    equipment   : Association to Equipments;
    assignedTo  : Association to Employees;
}


entity TaskStatus {
    key code : String(250);
        name : String;
}

entity TaskPriority {
    key code : String(250);
        name : String(50);
}

entity Issues : cuid, managed {
    description : String(200);
    status      : Association to IssueStatus;
    equipment   : Association to Equipments;
    reportedBy  : Association to Employees;
}

entity IssueStatus {
    key code : String(20);
        name : String(50);
}

entity EquipmentTypes {
    key code        : String(50);
        // name : String(100);
        name        : String(100) @title: '{i18n>nameType}';
        

}

entity Locations {
    key code : String(50);
        // name : String(100);
        name : String(100) @title: '{i18n>location}';

}

entity EquipmentStatus {
    key code : String(50);
        //  name : String(100) ;
        name : String(100) @title: '{i18n>equipStatus}';
        criticality : Integer;
}


entity Employees : cuid, managed {
    name     : String(100);
    username : String(50);
    email    : String(100);
    role     : Association to Roles;
}

entity Roles {
    key Code : String(5);
        type : String(50)
}
