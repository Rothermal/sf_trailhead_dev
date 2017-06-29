<aura:application >
	<ltng:require styles="/resource/SLDS202/assets/styles/salesforce-lightning-design-system-ltng.css" />
    <div class="unorganized">
			<span class="slds-icon__container slds-icon-standard-account">
            <c:svg class="slds-icon" xlinkHref="/resource/SLDS202/assets/icons/standard-sprite/svg/symbols.svg#account" />
            <span class="slds-assistive-text">Account Icon</span>
        </span>    
   <c:button class="slds-button slds-button--neutral" 
             label="Details" 
             svgXlinkHref="/resource/SLDS202/assets/icons/standard-sprite/svg/symbols.svg#account" 
             svgClass="slds-icon slds-icon-text-default"
             onclick="{!c.showDetails}"
   />
        <c:AccountsList />
    </div>
</aura:application>