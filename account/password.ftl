<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

     <div class="col-md-4 col-md-offset-1">
        <div class="row">
            <div class="col-md-10">
                <h2>${msg("changePasswordHtmlTitle")}</h2>
            </div>
        <#--  <div class="col-md-2 subtitle">
            <span class="subtitle">${msg("allFieldsRequired")}</span>
        </div>  -->
        </div>
    </div>

    <form action="${url.passwordUrl}" class="row" method="post">
        <div class="col-md-10 col-md-offset-1 mt-20">
            <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

            <#if password.passwordSet>
                <div class="col-md-12">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>

                        <input type="password" class="pf-c-form-control col-md-8" id="password" name="password" autofocus autocomplete="current-password">
                </div>
            </#if>

            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

            <div class="col-md-12">
                    <label for="password-new" class="${properties.kcLabelClass!}">${msg("passwordNew")}</label>

                    <input type="password" class="pf-c-form-control col-md-8" id="password-new" name="password-new" autocomplete="new-password">
            </div>

            <div class="col-md-12">
                    <label for="password-confirm" class="${properties.kcLabelClass!}" class="two-lines">${msg("passwordConfirm")}</label>

                    <input type="password" class="pf-c-form-control col-md-8" id="password-confirm" name="password-confirm" autocomplete="new-password">
            </div>
        </div>

         <div class="col-md-10 col-md-offset-1 mt-20">
                <div class="col-md-5">
                    <button type="submit" class="button-experta" name="submitAction" value="Save">${msg("doSave")}</button>
                </div>
        </div>
    </form>

</@layout.mainLayout>
