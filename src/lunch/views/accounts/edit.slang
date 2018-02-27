.container
  .row
    .col-sm-8.col-sm-push-1
      .page-header
        h1 Edit Account


      form.form(action="/accounts/update" method="POST")
        .form__field
          label.form__label.form__label--large Username
          input.form__input(name="username" value=env.current_user.username required="true")

        .form__field
          label.form__label.form__label--large Password
          input.form__input(name="password" type="password" required="true")

        .form__field
          label.form__label.form__label--large Confirm
          input.form__input(name="confirm_password" type="password" required="true")

        input.form__submit(type="submit")
