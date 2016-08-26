require "rails_helper"

RSpec.feature "books" do

  let!(:book) { FactoryGirl.build(:book, title: 'Traveling') }

  def generate_book_list
    10.times do |i|
      FactoryGirl.create(:book, title: "Traveling#{i}")
    end
  end



  scenario "Add new book" do

    visit new_book_path
    fill_in "Title", with: book.title
    fill_in "Author", with: book.author
    fill_in "Publisher", with: book.publisher
    fill_in "Description", with: book.description

    click_on("Save")

    expect(page).to have_content("Book added")
    expect(page).to have_content("Traveling")

  end

  scenario "Edit book" do
    visit new_book_path
    fill_in "Title", with: book.title
    fill_in "Author", with: book.author
    fill_in "Publisher", with: book.publisher
    fill_in "Description", with: book.description

    click_on("Save")

    click_on("Edit")
    fill_in "Title", with: "#{book.title} new"
    fill_in "Author", with: "#{book.author} new"

    click_on("Save")

    expect(page).to have_content("Book updated")
    expect(page).to have_content("#{book.title} new")
    expect(page).to have_content("#{book.author} new")

  end

  scenario "Show book index" do
    generate_book_list
    visit books_path
    10.times do |i|
      expect(page).to have_content("Traveling#{i}")
    end
  end

  scenario "Delete book" do
    generate_book_list

    visit edit_book_path(:id => 4)
    click_on("Delete")

    #expect(page).to have_content("Book deleted")
    #expect(page).to_nbot have_content(book.title)
    expect(page).to_not have_content("Traveling3")

  end

  scenario "Visit index without books" do
    visit books_path
    expect(page).to have_content("There are no books")
  end


end
