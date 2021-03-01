public inherited sharing class EventRegistrationSelector extends fflib_SObjectSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList(){

        return new List<Schema.SObjectField>{
            Event_Registration__c.Contact__c,
            Event_Registration__c.Event__c,
            Event_Registration__c.Name
        };

    }

    public Schema.SObjectType getSObjectType(){
        return Event_Registration__c.sObjectType;
    }

    public List<Event_Registration__c> selectByEventAndContact(Id eventId, Id contactId){

        return (List<Event_Registration__c>)Database.query(
            newQueryFactory().setCondition('Contact__c = :contactId AND Event__c = :eventId').toSOQL()
        );

    }
    
}
