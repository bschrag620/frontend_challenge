module Views
  class Sample::Index < ApplicationView
    def template
      div class: 'max-w-lg mx-auto mt-12' do
        h1(class: 'text-xl mb-2') { 'Frontend challenge!' }
        p(class: 'mb-8') do
          text 'Complete the functionality  ('
          a(class: 'underline', href: 'https://twitter.com/johnmosesman/status/1598753931135418372') { 'demo here' }
          text ') for this mockup using your technique of choice and post your solution to '
          a(class: 'underline', href: "https://twitter.com/johnmosesman/status/1598688398679724033?cxt=HHwWgsC-3Zuo168sAAAA") { '@johnmosesman.' }
        end
        div(class: 'border border-gray-300 rounded p-6') do
          div(class: 'mb-4') do
            p(class: 'mb-1') { 'Select Course' }
            div do
              select(value: 'All courses', class: 'border border-gray-300 rounded p-2') do
                option(value: 'all') { 'All courses' }
                option(value: 'appetizers') { 'Appetizers' }
                option(value: 'entrees') { 'Entrees' }
                option(value: 'desserts') { 'Desserts' }
              end
            end
          end
          div(class: 'mb-8') do
            p(class: 'mb-1') { 'Search Items' }
            input type: 'text', placeholder: 'Search Items', class: 'border border-gray-300 rounded p-2'
          end
          div(class: 'flex flex-row justify-between') do
            div do
              p(class: 'mb-4') { 'All Items' }
              render Views::Shared::FlexGroup.new(heading: 'Appetizer') do |group|
                group.checkbox(name: 'appetizer-select-all', class: 'mb-2', checked: true, label: 'Select All')
                group.checkbox(name: 'appetizer-breadsticks', class: 'mb-2', checked: true, label: 'Breadsticks')
                group.checkbox(name: 'appetizer-buffalo-wings', class: 'mb-2', checked: true, label: 'Buffalo Wings')
              end

              render Views::Shared::FlexGroup.new(heading: 'Entrees') do |group|
                group.checkbox(name: 'entrees-select-all', class: 'mb-2', checked: true, label: 'Select All')
                group.checkbox(name: 'entrees-hamburger', class: 'mb-2', checked: true, label: 'Hamburger')
                group.checkbox(name: 'entrees-pasta', class: 'mb-2', checked: true, label: 'Pasta')
              end

              render Views::Shared::FlexGroup.new(heading: 'Desserts') do |group|
                group.checkbox(name: 'desserts-select-all', class: 'mb-2', checked: true, label: 'Select All')
                group.checkbox(name: 'desserts-cake', class: 'mb-2', checked: true, label: 'Cake')
                group.checkbox(name: 'desserts-ice-cream', class: 'mb-2', checked: true, label: 'Ice cream')
              end
            end
            div do
              p(class: 'mb-4') { 'Selected items' }
            end
          end
          button type: :submit, class: 'w-full bg-blue-600 py-4 px-8 rounded text-white mt-8' do
            'Submit'
          end
        end
      end
    end
  end
end