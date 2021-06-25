
<html>
<style type="text/css">
    .header-experta {
        width: 100%;
        height: 70px;
        position: relative;
        padding-top: 10px;
        padding-left: 40px;
        border-bottom: 1px solid;
        border-color: #f9f6f6;
        box-shadow: 0 0  15px rgb(0 0 0  / 30%);
    }

    .logo-seguro {
        background-image: url('https://i.ibb.co/jy0ZvQF/logo-seguros.jpg');
        background-size: contain;
        background-repeat: no-repeat;
        height: 125px;
        width: 125px;
        position: absolute;
    }

    .divider {
    border-left: 1px solid #e4e0e0;
    height: 40px;
    position: absolute;
    margin-left: 130px;
    }

    .logo-art {
        /* TODO: remove 3 lines below */
        background-image: url('https://i.ibb.co/zZZt20b/logo-art.png');
        background-size: 140px;
        margin-top: -3px;
        /* TODO: uncomment when lines above are removed */
        /* background-image: url(http://wstst.art.com/ARTServicio/ART/images/static/style10/logotypeLogin2.jpg); 
        background-size: contain;*/
        background-repeat: no-repeat;
        height: 125px;
        width: 125px;
        position: absolute;
        margin-left: 131px;
    }


</style>
<body>
<div class="header-experta">
    <div class="logo-seguro">
    </div>
    <div class="divider"></div>
    <div class="logo-art">
    </div>
</div>
${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
</body>
</html>
<#--  <html>
<body>
${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
</body>
</html>  -->
