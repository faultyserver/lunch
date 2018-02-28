.container
  .row
    .col-sm-10
      .page-header
        h1
          | Outings
          .pull-right
            small
              a(href="/events/new") Schedule an Outing


      table.table.table-striped
        thead
          tr
            th Name

        tbody
          - events.each do |event|
            tr
              td
                h4= event.name
