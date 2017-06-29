<aura:application extends="force:slds">
	    <!-- Include the SLDS static resource (adjust to match package version) DEc2016- does not appear to be neccesary
		see above, just extend the force:slds library.. how  quaint. edit by mark
     <ltng:require styles="/resource/SLDS202/assets/styles/salesforce-lightning-design-system-ltng.css"/>
 
    Add the "scoping" element to activate SLDS on components
         that we add inside it. -->
    <div>
       
        <!-- This component is the real "app" -->
      <c:expenses />
       
    </div>
    <!-- / SLDS SCOPING DIV -->
</aura:application>