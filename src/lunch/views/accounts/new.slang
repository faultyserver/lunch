.container
  .row
    .col-sm-8.col-sm-push-1
      .page-header
        h1 Create an Account


      h3 Account Setup

      form.form(action="/accounts/create" method="POST")
        .form__field
          label.form__label.form__label--large Username
          input.form__input(name="username" required="true")

        .form__field
          label.form__label.form__label--large Password
          input.form__input(name="password" type="password" required="true")

        .form__field
          label.form__label.form__label--large Confirm
          input.form__input(name="confirm_password" type="password" required="true")

        input.form__submit(type="submit")
