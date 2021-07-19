<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
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
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body class="admin-console user ${bodyClass}">
        
    <#--  <header class="navbar navbar-default navbar-pf navbar-main header">  -->
        <#--  <nav class="navbar" role="navigation">
            <div class="navbar-header">
                <div class="container">
                    <h1 class="navbar-title">Keycloak</h1>
                </div>
            </div>
            <div class="navbar-collapse navbar-collapse-1">
                <div class="container">
                    <ul class="nav navbar-nav navbar-utility">
                        <#if realm.internationalizationEnabled>
                            <li>
                                <div class="kc-dropdown" id="kc-locale-dropdown">
                                    <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                    <ul>
                                        <#list locale.supported as l>
                                            <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                        </#list>
                                    </ul>
                                </div>
                            <li>
                        </#if>
                        <#if referrer?has_content && referrer.url?has_content><li><a href="${referrer.url}" id="referrer">${msg("backTo",referrer.name)}</a></li></#if>
                        <li><a href="${url.logoutUrl}">${msg("doSignOut")}</a></li>
                    </ul>
                </div>
            </div>
        </nav>  -->
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
            <div class="logout">
                    <ul >
                        <#--  <#if realm.internationalizationEnabled>
                            <li>
                                <div class="kc-dropdown" id="kc-locale-dropdown">
                                    <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                    <ul>
                                        <#list locale.supported as l>
                                            <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                        </#list>
                                    </ul>
                                </div>
                            <li>
                        </#if>  -->
                        <#if referrer?has_content && referrer.url?has_content><li><a href="${referrer.url}" id="referrer">${msg("backTo",referrer.name)}</a></li></#if>
                        <li><a href="${url.logoutUrl}">${msg("doSignOut")}</a></li>
                    </ul>
                </div>
        </div>
   <#--   </header>  -->

    <div class="container-fluid">
    <div class="row mt-20">
        <div class="col-md-2 mt-20">
            <ul>
                <li class="<#if active=='account'>active</#if>"><a href="${url.accountUrl}">${msg("account")}</a></li> 
                <#if features.passwordUpdateSupported><li class="<#if active=='password'>active</#if>"><a href="${url.passwordUrl}">${msg("password")}</a></li></#if>
                <#--  <li class="<#if active=='totp'>active</#if>"><a href="${url.totpUrl}">${msg("authenticator")}</a></li>
                <#if features.identityFederation><li class="<#if active=='social'>active</#if>"><a href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
                <li class="<#if active=='sessions'>active</#if>"><a href="${url.sessionsUrl}">${msg("sessions")}</a></li>
                <li class="<#if active=='applications'>active</#if>"><a href="${url.applicationsUrl}">${msg("applications")}</a></li>
                <#if features.log><li class="<#if active=='log'>active</#if>"><a href="${url.logUrl}">${msg("log")}</a></li></#if>
                <#if realm.userManagedAccessAllowed && features.authorization><li class="<#if active=='authorization'>active</#if>"><a href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>  -->
            </ul>
        </div>

        <div class="col-md-10 pl-4">
            <#if message?has_content>
                <div class="alert-${message.type} pf-c-alert pf-m-inline pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                    <div class="">
                        <#if message.type=='success' ><div class="${properties.kcFeedbackSuccessIcon!}"></div></#if>
                        <#if message.type=='error' ><div class="${properties.kcFeedbackErrorIcon!}"></div></#if>
                    </div>
                    <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <#nested "content">
        </div>
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