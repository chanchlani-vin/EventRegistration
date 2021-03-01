public inherited sharing class ContactSelector extends fflib_SObjectSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList(){

        return new List<Schema.SObjectField>{
            Contact.FirstName,
            Contact.LastName,
            Contact.email
        };

    }

    public Schema.SObjectType getSObjectType(){
        return Contact.sObjectType;
    }

    public List<Contact> selectByEmail(String email){
        return (List<Contact>)Database.query(
            newQueryFactory().setCondition('Email = :email').toSOQL()
        );
    }
}
