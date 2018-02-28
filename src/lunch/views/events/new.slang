.container
  .row
    .col-sm-8.col-sm-push-1
      .page-header
        h1 Create an Event


      form.form(action="/events/create" method="POST")
        .form__field
          label.form__label.form__label--large Name
          input.form__input(name="name" type="text" require="true")

        .form__field
          label.form__label.form__label--large Location
          select.form__input(name="location_id" placeholder="Gomez Salsa...")
            - locations.each do |l|
              option(value=l.id )= l.name

        .form__field
          label.form__label.form__label--large Time
          input.form__input(name="time" type="datetime-local" require="true")

        input.form__submit(type="submit")
