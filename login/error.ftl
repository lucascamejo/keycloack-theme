<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction">${message.summary?no_esc}</p>
            <#if client?? && client.baseUrl?has_content>
                <div id="kc-form-buttons" class="${properties.kcCustomBackButton!}">
                    <a id="backToApplication" class="${properties.kcCustomBackAction!}" href="${client.baseUrl}" >${kcSanitize(msg("backToLogin"))?no_esc}</a> 
                </div> 
            <#else>
                <div id="kc-form-buttons" class="${properties.kcCustomBackButton!}">
                    <a class="${properties.kcCustomBackAction!}" href="${url.loginUrl}" >${kcSanitize(msg("backToLogin"))?no_esc}</a> 
                </div>              
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>