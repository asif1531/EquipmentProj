using AdminEquipmentService as service from '../../srv/AdminService';

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

