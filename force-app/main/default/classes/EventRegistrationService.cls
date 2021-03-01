public inherited sharing class EventRegistrationService {

    public static void registerEvent(Contact contact, Event__c event){
        
        List<Contact> existingContacts  = new ContactSelector().selectByEmail(contact.email);
                
        if(existingContacts != null && !existingContacts.isEmpty()){
            contact.Id = existingContacts[0].Id;
        }

        upsert contact;

        List<Event_Registration__c> existingRegistrations = new EventRegistrationSelector().selectByEventAndContact(event.Id, contact.Id);

        if(existingRegistrations == null || existingRegistrations.isEmpty()){
            Event_Registration__c registration = new Event_Registration__c(Contact__c = contact.Id, Event__c = event.Id);
            insert registration;
        }else{

            throw new EventRegisterationException(Label.Already_Registered);

        }

    }
}
