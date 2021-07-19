<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction">${message.summary?no_esc}</p>
            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#else>
                <div id="kc-form-buttons" class="${properties.kcCustomBackButton!}">
                    <a class="${properties.kcCustomBackAction!}" href="${url.loginUrl}" >${kcSanitize(msg("backToLogin"))?no_esc}</a> 
                </div>              
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>