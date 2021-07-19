<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
        ${messageHeader}
        <#else>
        ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="instruction"><#--  ${message.summary}  --><#if requiredActions??><#list requiredActions><div style="font-size: 25px;"><b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></div></#list><#else></#if></p>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <div id="kc-form-buttons" class="${properties.kcCustomBackButton!}">
                    <a class="${properties.kcCustomBackAction!}" href="${pageRedirectUri}" >${kcSanitize(msg("backToApplication"))?no_esc}</a> 
                </div>
                <#--  <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>  -->
            <#elseif actionUri?has_content>
                <div id="kc-form-buttons" class="${properties.kcCustomBackButton!}">
                    <a class="${properties.kcCustomBackAction!}" href="${actionUri}" >${kcSanitize(msg("proceedWithAction"))?no_esc}</a> 
                </div>
                <#--  <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>  -->
            <#elseif (client.baseUrl)?has_content>
                <div id="kc-form-buttons" class="${properties.kcCustomBackButton!}">
                    <a class="${properties.kcCustomBackAction!}" href="${client.baseUrl}" >${kcSanitize(msg("backToApplication"))?no_esc}</a> 
                </div>
                <#--  <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>  -->
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>