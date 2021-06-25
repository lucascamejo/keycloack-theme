<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>
<html>
    <style type="text/css">
        body {
            background: #FFFFFF !important;
            height: 100%;
            color: #949493;
            font-family: 'DIN';
            font-size: 17px;
            line-height: 1.66666667;
        }

        .header {
            display: flex;
            height: 80px;            
            padding-top: 10px;
            border-bottom: 1px solid;
            border-color: #f9f6f6;
            box-shadow: 0 0  15px rgb(0 0 0  / 30%);                
        }

        .content-align {
            text-align: center;
            margin: auto;
        }

        .logo-seguros {
            background-image: url('https://i.ibb.co/99CZ6hb/logo-experta-seguros.png');
            background-size: contain;
            background-repeat: no-repeat;            
            text-align: center;
            display: inline-block;
            margin-left: auto;
            margin-right: auto;
        }

        .divider {
            border-left: 1px solid #e4e0e0;
            display: inline-block;
            margin-left: auto;
            margin-right: auto;
        }

        .divider-header {
            height: 60px;
        }

        .divider-footer {
            height: 30px;
            margin-bottom: 10px;
        }   
            
        .logo-art {
            background-image: url('https://i.ibb.co/sCWRtS4/logo-experta-art.png');
            background-size: contain;
            background-repeat: no-repeat;            
            display: inline-block;
            margin-left: auto;
            margin-right: auto;
        }

        .size-logo-header {
            height: 60px;
            width: 150px;
        }

        .size-logo-footer {
            height: 45px;
            width: 80px;
        }

        .contact-block {
            display: flex;
            height: 200px;            
            border-bottom: 1px solid;
            border-color: #f9f6f6;
            background-color: #eaebed
        }

        .contact {
            margin: auto;
            height: 80%;
            width: 100%;
            color: #969696
        }

        .contact-title {
            width: 100%; 
            text-align: center
        }

        .contact-type-block {
            display: flex; 
            padding: 10px 0 20px 0; 
            width: 100%;
        }
        
        .contact-type {
            width: 90%; display: flex; margin: auto;
        }

        .contact {
            margin: auto;
            border: 0px;
            background-color: #eaebed;
            min-height: 40px;
            text-align: center;            
        }

        .pr-5 {
            padding-right: 5px
        }

        .pl-5 {
            padding-left: 5px
        }

        .logo-contact {
            width: 100%;
            max-width: 240px;
            background-color: white;
            border-radius: 5px;
        }

        .network-social-type-block {
            display: flex; 
            padding: 10px 0 20px 0; 
            width: 100%; 
            padding:0;
        }

        .network-social-desc {
            font-size: 0.8em;
            color: #969696;
            display: inline-block;
            margin-left: auto;
            margin-right: auto;
            vertical-align: super;
        }

        .network-social {
            display: inline-block; 
            margin-left: auto; 
            margin-right: auto;
        }

        .logo-network-social {
            width: 100%; 
            max-width: 40px; 
            min-width: 30px;
        }

        .footer {
            display: flex;
            height: 60px;            
            padding-top: 10px;
            border-bottom: 1px solid;
            border-color: #f9f6f6;
            box-shadow: 0 0  15px rgb(0 0 0  / 30%);
        }

        . {
            
        }
    </style>
    <body>
        <div class="header">
            <div class="content-align ">
              <div class="logo-seguros size-logo-header ">
              </div>
              <div class="divider divider-header">
              </div>
              <div class="logo-art size-logo-header ">
              </div>
            </div>
        </div>
        <#if requiredActionsText == msg("requiredAction.VERIFY_EMAIL")>
        <div class="display: flex;
                height: 100px;
                background-color: #006196;">
            <div class="text-align: center; margin: auto; color: white; font-size: 20px;">
              <p>TE DAMOS LA BIENVENIDA <br>A EXPERTA ONLINE</p>
             
            </div>
        </div>
        </#if>
        <div class="margin-top: 35px;">
         <#if requiredActionsText == msg("requiredAction.VERIFY_EMAIL")>
            ${kcSanitize(msg("welcomeBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration),user.username, user.getFirstName(), user.getLastName()))?no_esc}
         <#else>
            ${kcSanitize(msg("executeActionsBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration),user.username, user.getFirstName(), user.getLastName()))?no_esc}
            <#--  <p>${msg(requiredActionsText)}</p>  -->
        </#if>   
        </div>
                
        <div class="contact-block">
            <div class="contact">
                <div class="contact-title">
                CONTACTATE
                </div>
                <div class="contact-type-block">
                    <div class="contact-type">                            
                        <div class="contact pr-5">
                            <a target="_blank" href="https://web.whatsapp.com/send?phone=5491147041830" rel="noopener noreferrer">
                                <img src="https://i.ibb.co/YP4Kn5t/footer-wpp.png" alt="Cotizá" width="175" class=" logo-contact" >
                            </a>
                        </div>
                        <div class="contact">
                            <a target="_blank" href="tel:08007777278" rel="noopener noreferrer" >
                                <img src="https://i.ibb.co/87PxKvy/footer-telefono.png" alt="Manual de producto" width="175" class="logo-contact" >
                            </a>
                        </div>
                        <div class="contact pl-5">
                            <a target="_blank" href="mailto:clientes@experta.com.ar" rel="noopener noreferrer" link_name="" >
                                <img src="https://i.ibb.co/3f17MmH/footer-mail.png" alt="" width="173" class="logo-contact" >
                            </a>
                        </div>                            
                    </div>
                </div> 
                <div class="network-social-type-block">
                    <div class="content-align">
                        <div class="network-social-desc">ADEMÁS ENCONTRANOS EN</div>                            
                        <div class="network-social">
                            <a target="_blank" href="https://www.youtube.com/channel/UChEF-f811Pd6etl3" rel="noopener noreferrer" >
                                <img src="https://i.ibb.co/qRhsN0B/footer-youtube.png" width="38" class="logo-network-social" >
                            </a>
                        </div>
                        <div class="network-social">
                            <a target="_blank" href="https://www.experta.com.ar/blogg/" rel="noopener noreferrer" >
                                <img src="https://i.ibb.co/KzMFxJK/footer-blog.png" width="37" class="logo-network-social" >
                            </a>
                        </div>
                        <div class="network-social">
                            <a target="_blank" href="https://www.linkedin.com/company/experta-seguros" rel="noopener noreferrer" >
                                <img src="https://i.ibb.co/dkWcKt7/footer-linkedin.png" width="37" class="logo-network-social">
                            </a>
                        </div>
                    </div>
                </div>          
             
            </div>
        </div>

        <div class="footer">
            <div class="content-align">
              <div class="logo-seguros size-logo-footer">
              </div>
              <div class="divider divider-footer">
              </div>
              <div class="logo-art size-logo-header">
              </div>
            </div>
        </div>
    
    </body>
</html>
