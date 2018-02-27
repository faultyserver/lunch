.container
  .row
    .col-sm-8.col-sm-push-1
      .page-header
        h1 Create a Location


      form.form(action="/locations/create" method="POST")
        .form__field
          label.form__label.form__label--large Name
          input.form__input(name="name" type="text" require="true")

        .form__field
          label.form__label.form__label--large Street Address
          input.form__input(name="street_address" type="text" require="true")

        .form__field.form__field--checkbox
          label.form__label.form__label--checkbox
            input.form__input(type="checkbox")
            | Dine in?

        .form__field
          label.form__label.form__label--large Wait Time
          input.form__input(name="average_wait" type="number" step="1" min="0" require="true")

        .form__field
          label.form__label.form__label--large Website
          input.form__input(name="website" type="text" require="true")

        .form__field.form__field--checkbox
          label.form__label.form__label--checkbox
            input.form__input(name="brianable" type="checkbox")
            | Brianable (vegetarian?)

        .form__field.form__field--checkbox
          label.form__label.form__label--checkbox
            input.form__input(name="alexable" type="checkbox")
            | Alexable

        .form__field
          label.form__label.form__label--large Price Level
          input.form__input(name="price_level" type="number" step="1" min="0" require="true")

        .form__field
          label.form__label.form__label--large Group Size
          input.form__input(name="group_size" type="number" step="1" min="0" require="true")


        input.form__submit(type="submit")
