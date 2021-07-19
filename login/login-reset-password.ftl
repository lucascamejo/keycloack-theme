<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}    
    <#elseif section = "form">       
        <div id="kc-description" class="${properties.kcSignUpClass!}">
            <div id="kc-info-reset-password" class="${properties.kcInfoAreaWrapperClass!}">
                 ${msg("emailInstruction")}
            </div>
        </div> 
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="number" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    <#else>
                        <input type="number" id="username" name="username" class="${properties.kcInputClass!}" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    </#if>

                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcCustomButtonClass}" type="submit" value="${msg("emailPasswordRecovery")}"/>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcCustomBackButton!}">
                    <a class="${properties.kcCustomBackAction!}" href="${url.loginUrl}" >${kcSanitize(msg("backToLogin"))?no_esc}</a> 
                </div>

            </div>
        </form>
    </#if>
</@layout.registrationLayout>
