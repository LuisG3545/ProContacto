trigger UpdateEmail on Contact (before insert , before update) {
 List<Messaging.SingleEmailMessage> mails = 
      
  new List<Messaging.SingleEmailMessage>();
  
  for (Contact myContact : Trigger.new) {
    if (myContact.Email != null && myContact.FirstName != null) {
    
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
      
      List<String> sendTo = new List<String>();
      sendTo.add(myContact.Email);
      mail.setToAddresses(sendTo);

 
      mail.setSubject('Your contact detail are added');
      String body = 'Dear ' + myContact.FirstName + ', '; 
      body += 'According to the ContactEmailTrigger trigger';
      body += 'Your email has been updated';
      body += 'For more details you can visit ';
      body += ' https://salesforceforfresher.wordpress.com/ ';
      mail.setHtmlBody(body);
    
      mails.add(mail);
    }
  }
  Messaging.sendEmail(mails);
}
