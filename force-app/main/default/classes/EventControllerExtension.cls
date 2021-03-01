public inherited sharing class EventControllerExtension {
    private final Event__c event;
    
    public String registrationMessage{get;set;}

    public String email{get;set;}
    public String firstName{get;set;}
    public String lastName{get;set;}

    
    public EventControllerExtension(ApexPages.StandardController stdController) {

        stdController.addFields(new List<String>{'Number_of_participants_allowed__c','Number_of_registrations__c'});
        this.event = (Event__c)stdController.getRecord();

    }

    public Boolean getIsRegistrationAllowed(){
        return this.event.Number_of_participants_allowed__c==null || this.event.Number_of_participants_allowed__c > this.event.Number_of_registrations__c;
    }

    public void register(){
        Contact contact = new Contact(firstName = firstName, lastName = lastName, email = email);
        if(getIsRegistrationAllowed()){

            try {
                EventRegistrationService.registerEvent(contact, event);
                registrationMessage = Label.RegistrationSuccess;
            } catch (Exception e) {
                registrationMessage = e.getMessage();
            }

        }else{
            registrationMessage = Label.Registration_Closed;
        }
    }


}
