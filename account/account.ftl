<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <div class="col-md-4">
        <div class="col-md-10">
            <h2>${msg("editAccountHtmlTitle")}</h2>
        </div>
        <#--   <div class="col-md-2 subtitle">
                <span class="subtitle"> ${msg("requiredFields")}</span>
            </div>  -->
    </div>

    <form action="${url.accountUrl}" class="col-md-10" method="post">
    <div class="col-md-12 mt-20">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <#if !realm.registrationEmailAsUsername>
            <div class="col-md-12">
                <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label> <#if realm.editUsernameAllowed></#if>
                <input type="text" class="pf-c-form-control col-md-8" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
            </div>
        </#if>

        <div class="col-md-12">            
            <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>            
            <input type="text" class="pf-c-form-control col-md-8" id="email" name="email" autofocus value="${(account.email!'')}"/>           
        </div>

        <div class="col-md-12">
            <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label> 
            <input type="text" class="pf-c-form-control col-md-8" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
        </div>

        <div class="col-md-12">
            <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
            <input type="text" class="pf-c-form-control col-md-8" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
        </div>
    </div>
        

    <div class="col-md-12 mt-20">
            <div class="col-md-5">
                <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                <button type="submit" class="button-experta" name="submitAction" value="Save">${msg("doSave")}</button>
            </div>
            <div class="col-md-5">
                <button type="submit" class="button-experta" name="submitAction" value="Cancel">${msg("doCancel")}</button>
            </div>
    </div>
</form>



</@layout.mainLayout>
