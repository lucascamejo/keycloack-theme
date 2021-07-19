<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#--  Para ir al login  -->
    <#assign goToDefault><#if client?? && client.baseUrl?has_content>${client.baseUrl}<#else>${url.loginUrl}</#if></#assign>
</head>

<body class="${properties.kcBodyClass!}">
<div class="${properties.kcCustomHeaderClass}">
    <a href="http://cluster-test.art.com:20400/users/registro">
        <div class="${properties.kcCustomLogoSeguroClass}">
        </div>
    </a>
        <div class="${properties.kcCustomDividerClass}"></div>

    <a href="https://webinstitucional.expertaart.com.ar/">
        <div class="${properties.kcCustomLogoARTClass}">
        </div>
    </a>
</div>
<div class="${properties.kcLoginClass!}">
    <#--  <div id="kc-header" class="${properties.kcCustomHeaderTitleClass}">
        <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
            ${msg("loginTitleHtml")}
        </div>
    </div>  -->
    <div class="${properties.kcFormCardClass!}">
        <header class="${properties.kcFormHeaderClass!}">
            <#--   <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul class="${properties.kcLocaleListClass!}">
                                <#list locale.supported as l>
                                    <li class="${properties.kcLocaleListItemClass!}">
                                        <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>  -->
        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <h1 id="kc-page-title"><#nested "header"></h1><#-- Title  -->
                    </div>
                </div>
            <#else>
                <h1 id="kc-page-title"><#nested "header"></h1>
                <#--  <#if (message.type == 'success' && !displayInfo)>
                <div class="${properties.kcMT20Class!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                        </div>
                    </div>
                </div>
                </#if>  -->
            </#if>
        <#else>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <#nested "show-username">
                        <div id="kc-username" class="${properties.kcFormGroupClass!}">
                            <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                            <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                <div class="kc-login-tooltip">
                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <#else>
                <#nested "show-username">
                <div id="kc-username" class="${properties.kcFormGroupClass!}">
                    <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                    <a id="reset-login" href="${url.loginRestartFlowUrl}">
                        <div class="kc-login-tooltip">
                            <i class="${properties.kcResetFlowIcon!}"></i>
                            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                        </div>
                    </a>
                </div>
            </#if>
        </#if>
        </header>
        <div id="kc-content">
            <div id="kc-content-wrapper">

                <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                <#-- during login.                                                                               -->
                <#if displayMessage && message?has_content && message.type != 'warning' && (!isAppInitiatedAction??)>
                    <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                        <div class="pf-c-alert__icon">
                            <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        </div>
                            <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <#--  <#if displayInfo>
                    <div id="kc-info" class="${properties.kcSignUpClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                </#if>  -->

                <#nested "form">

                <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                    <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                        <div class="${properties.kcFormGroupClass!}">
                            <input type="hidden" name="tryAnotherWay" value="on"/>
                            <a href="#" id="try-another-way"
                                onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                        </div>
                    </form>
                </#if>

                <#if displayInfo>
                    <div id="kc-info" class="${properties.kcSignUpClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                <#--  <#else>
                    <div class="${properties.kcMT20Class!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                            </div>
                        </div>
                    </div>  -->
                </#if> 
            </div>
        </div>
        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                    <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                        <ul class="${properties.kcLocaleListClass!}">
                            <#list locale.supported as l>
                                <li class="${properties.kcLocaleListItemClass!}">
                                    <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </#if>

    </div>
  </div>
  <div class="${properties.kcCustomFooter!}">
    <div class="section-1">
        <div class="col-md-4 col-xs-12">

            <div class="col-md-6">
                <div class="col-md-12">
                    <p class="contactate">
                    CONTACTATE
                    </p>
                </div>    
                <div class="col-md-12 df">                            
                    <a target="_blank" href="https://web.whatsapp.com/send?phone=5491147041830" rel="noopener noreferrer">
                        <div class="icon-footer icon-whatsapp">
                        </div>
                    </a>  
                    <a target="_blank" href="tel:08007777278" rel="noopener noreferrer" >   
                        <div class="icon-footer icon-phone">
                        </div>
                    </a> 
                    <a target="_blank" href="mailto:clientes@experta.com.ar" rel="noopener noreferrer" link_name="" >
                        <div class="icon-footer icon-email">
                        </div>
                    </a>  
                        
                </div>
                                                
            </div>
            <div class="col-md-6">
                <p>PREVENCIÓN CONTRA EL FRAUDE</p>
                <p><a target="_blank" href="https://www.experta.com.ar/terminos-y-condiciones/">TÉRMINOS Y CONDICIONES</a></p>
            </div>

        </div>

        <div class="col-md-4 col-xs-12">
            <div class="row">
                <div class="col-md-6 col-xs-12">                        
                    <div class="col-md-12 col-xs-6 logo-ssn">                    
                    </div>                                                    
                </div>

                <div class="col-md-6 col-xs-12">
                    <b><p class="number col-xs-12">0800-666-8400</p></b>
                </div>
            </div>

            <div class="col-md-12 col-xs-12">
                <p class="logo-text">
                SUPERINTENDENCIA DE SEGUROS DE LA NACIÓN 0-800-666-8400, WWW.SSN.GOB.AR
                </p>
            </div>
        </div>
        
        <div class="col-md-4 col-xs-12">
            <div class="row">
                <div class="col-md-2  col-xs-12">                    
                    <div class="col-md-12 col-xs-6 logo-srt">                    
                    </div>                                                    
                </div>
                <div class="col-md-6 col-xs-12">
                    <b><p class="number col-xs-12">0800-666-6778</p></b>
                </div>
            </div>

            <div class="col-md-12 col-xs-12">
                <p class="logo-text">
                SUPERINTENDENCIA DE RIESGOS DEL TRABAJO 0800-666-6778, WWW.SRT.GOB.AR
                </p>
            </div> 
        </div>  
    </div>

    <div class="section-2">
    <div id="footerTerms" class="terms">
        <a target="_blank" href="https://www.experta.com.ar/terminos-y-condiciones/">TÉRMINOS Y CONDICIONES</a>
    </div>
    <div id="footerLegals" class="text">
        LOS SEGUROS SON EMITIDOS POR EXPERTA SEGUROS S.A.U AV. DEL LIBERTADOR 6902, PISO 12 (C1429BMP) C.A.B.A., ARGENTINA
    </div>
    </div>
</div>
</body>
</html>
</#macro>
