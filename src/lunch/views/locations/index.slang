.container
  .row
    .col-sm-10
      .page-header
        h1
          | Locations
          .pull-right
            small
              a(href="/locations/new") Add a location


      table.table.table-striped
        thead
          tr
            th Name
            th Price
            th Dine in?
            th Max Group Size
            th Wait time

        tbody
          - locations.each do |location|
            tr
              td
                h4= location.name
                - if location.website
                  a(href=location.website )= location.website
                p= location.street_address
              td= "$#{location.price_level}"
              td= location.dine_in ? "yes" : "no"
              td= location.group_size
              td= "#{location.average_wait} minutes"
