.container
  .row
    .col-sm-8.col-sm-push-1
      .page-header
        h1
          | Edit
          = location.name


      form.form(action="/locations/update/#{location.id}" method="POST")
        .form__field
          label.form__label.form__label--large Name
          input.form__input(name="name" type="text" value=location.name require="true")

        .form__field
          label.form__label.form__label--large Street Address
          input.form__input(name="street_address" type="text" value=location.street_address require="true")

        .form__field.form__field--checkbox
          label.form__label.form__label--checkbox
            - if location.dine_in
              input.form__input(name="dine_in" type="checkbox" checked=true )
            - else
              input.form__input(name="dine_in" type="checkbox")
            | Dine in?

        .form__field
          label.form__label.form__label--large Wait Time
          input.form__input(name="average_wait" type="number" step="1" min="0" value=location.average_wait require="true")

        .form__field
          label.form__label.form__label--large Website
          input.form__input(name="website" type="text" value=location.website require="true")

        .form__field.form__field--checkbox
          label.form__label.form__label--checkbox
            - if location.brianable
              input.form__input(name="brianable" type="checkbox" checked=true )
            - else
              input.form__input(name="brianable" type="checkbox")
            | Brianable (vegetarian?)

        .form__field.form__field--checkbox
          label.form__label.form__label--checkbox
            - if location.alexable
              input.form__input(name="alexable" type="checkbox" checked=true )
            - else
              input.form__input(name="alexable" type="checkbox")
            | Alexable

        .form__field
          label.form__label.form__label--large Price Level
          input.form__input(name="price_level" type="number" step="1" min="0" value=location.price_level require="true")

        .form__field
          label.form__label.form__label--large Group Size
          input.form__input(name="group_size" type="number" step="1" min="0" value=location.group_size require="true")


        input.form__submit(type="submit")
