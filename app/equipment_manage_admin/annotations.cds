using AdminEquipmentService as service from '../../srv/AdminService';
using from '../../db/data-model';


// annotate service.Equipments @(UI.LineItem: [
//     {
//         $Type: 'UI.DataField',
//         Value: ID,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: name,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: type,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: manufacturer,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: location,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: status,
//     },
// ]

// )
annotate service.Equipments with @(
    UI.HeaderInfo:{
        TypeNamePlural:'Equipment',
        TypeName:'',
        Title:{
            $Type : 'UI.DataField',
            Value : name,
        }
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : manufacturer,
            Label : '{i18n>manufact}',
        },
        {
            $Type : 'UI.DataField',
            Value : type.name,
        },
        {
            $Type : 'UI.DataField',
            Value : status.name,
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : location.name,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
    ],
    UI.SelectionFields : [
        status.name,
        location.name,
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Details',
            ID : 'EquipmentDetails',
            Target : '@UI.FieldGroup#EquipmentDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Tasks Assigned to Employee',
            ID : 'TasksAssignedtoEmployee',
            Target : 'tasks/@UI.LineItem#TasksAssignedtoEmployee',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Reported Issues',
            ID : 'ReportedIssues',
            Target : 'issues/@UI.LineItem#ReportedIssues',
        },
    ],
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : manufacturer,
                Label : 'manufacturer',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : status.name,
            },
            {
                $Type : 'UI.DataField',
                Value : location.name,
            },
            {
                $Type : 'UI.DataField',
                Value : type.name,
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            ID : 'Details',
            Target : '@UI.FieldGroup#Details',
        },
    ],
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : manufacturer,
                Label : 'Manufacturer',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
        ],
    },
);

annotate service.EquipmentStatus with {
    name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
            Label : '{i18n>Status}',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Tasks with @(
    UI.LineItem #TasksAssignedtoEmployee : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : 'Equipement ID',
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : 'Due Date',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo_ID,
            Label : 'Assigned To',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
        },
    ]
);

annotate service.Issues with @(
    UI.LineItem #ReportedIssues : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : 'Equipement ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : reportedBy_ID,
            Label : 'Reported By',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ]
);

