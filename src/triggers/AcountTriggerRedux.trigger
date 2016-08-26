trigger AcountTriggerRedux on Account (before insert, before update, 
                                       before delete, after insert, 
                                       after update, after delete, after undelete) {
                                           if(Trigger.isAfter && Trigger.isInsert){
                                               AccountHandlerRedux.CreateNewOpportunity(Trigger.New);
                                           }
}