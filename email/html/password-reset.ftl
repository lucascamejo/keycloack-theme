<html>
    <head>
        <style>
            body{
                background: #FFFFFF !important;
                height: 100%;
                color: #949493;
                font-family: 'DIN';
                font-size: 12px;
                line-height: 1.66666667;
            }

            .header{
                width: 100%;
                height: 70px;
                position: relative;
                padding-top: 10px;
                padding-left: 40px;
                border-bottom: 1px solid;
                border-color: #f9f6f6;
                box-shadow: 0 0  15px rgb(0 0 0  / 30%);
            }

            .logo-seguro{
                background-image: url('https://i.ibb.co/99CZ6hb/logo-experta-seguros.png');
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
                margin-left: 135px;
            }

            .logo-art {
                background-image: url('https://i.ibb.co/sCWRtS4/logo-experta-art.png');
                background-size: contain;
                background-repeat: no-repeat;
                height: 125px;
                width: 125px;
                position: absolute;
                margin-left: 130px;
            }

        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo-seguro">
            </div>
            <div class="divider"></div>
            <div class="logo-art">
            </div>
        </div>
        ${kcSanitize(msg("passwordResetBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
    </body>
</html>