using {equipment.com.app as AdminModel} from '../db/data-model';

service AdminEquipmentService {
    entity Equipments as projection on  AdminModel.Equipments;
    entity Issues as projection on  AdminModel.Issues;
    entity IssueStatus as projection on  AdminModel.IssueStatus;
    entity TaskPriority as projection on  AdminModel.TaskPriority;
    entity EquipmentTypes as projection on  AdminModel.EquipmentTypes;
    entity Locations as projection on  AdminModel.Locations;
    entity EquipmentStatus as projection on  AdminModel.EquipmentStatus;
    entity Employees as projection on  AdminModel.Employees;
    entity Roles as projection on AdminModel.Roles;

}