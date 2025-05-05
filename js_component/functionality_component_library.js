let allBooks = [];
const BOOKS_PER_SET = 20;
let selectedBookId = null;

document.addEventListener("DOMContentLoaded", function () {
  console.log("Page loaded");
  setupDropdownListener();
  fetchAllBooks();

  // Reserve button logic
  document.getElementById("reserveButton").addEventListener("click", function (event) {
    event.preventDefault();
    console.log("Reserve button clicked");

    if (!selectedBookId) {
      apex.message.alert("Please select a book first.");
      return;
    }

    const btn = this;
    btn.disabled = true;
    console.log(" Reserving book ID:", selectedBookId);

    apex.server.process(
      "RESERVE_BOOK",
      {
        x01: selectedBookId,
      },
      {
        success: function () {
          console.log(" Book reserved successfully");
          apex.message.showPageSuccess("✅Book reserved!");
          fetchAllBooks();
          document.getElementById("bookDetails").classList.add("hidden");
          btn.disabled = false;
          selectedBookId = null;
        },
        error: function (req, status, error) {
          console.error("Reservation failed:", error);
          apex.message.alert("❌Reservation failed.");
          btn.disabled = false;
        },
      }
    );
  });

  //  Return button logic
  document.getElementById("returnButton").addEventListener("click", function (event) {
    event.preventDefault();
    console.log("Return button clicked");

    if (!selectedBookId) {
      apex.message.alert("Please select a book first.");
      return;
    }

    const btn = this;
    btn.disabled = true;
    console.log(" Returning book ID:", selectedBookId);

    apex.server.process(
      "RETURN_BOOK",
      {
        x01: selectedBookId,
      },
      {
        success: function () {
          console.log("Book returned successfully");
          apex.message.showPageSuccess("✅ Book returned!");
          fetchAllBooks();
          document.getElementById("bookDetails").classList.add("hidden");
          btn.disabled = false;
          selectedBookId = null;
        },
        error: function (req, status, error) {
          console.error("Return failed:", error);
          apex.message.alert("❌ Return failed.");
          btn.disabled = false;
        },
      }
    );
  });

  // Post review logic
  document.getElementById("postReviewButton").addEventListener("click", function (event) {
    event.preventDefault();
    console.log("Post Review button was clicked");

    if (!selectedBookId) {
      apex.message.alert("Please select a book first.");
      return;
    }

    const reviewText = document.getElementById("reviewText").value.trim();

    if (reviewText === "") {
      apex.message.alert("Please enter a review before posting.");
      return;
    }

    console.log("📤 Sending review for book ID:", selectedBookId);

    apex.server.process(
      "POST_BOOK_REVIEW",
      {
        x01: selectedBookId,
        x02: reviewText,
      },
      {
        success: function () {
          apex.message.showPageSuccess("✅ Review posted!");
          document.getElementById("reviewText").value = "";
        },
        error: function (req, status, error) {
          console.error("❌ Failed to post review:", error);
          apex.message.alert("Failed to post review.");
        },
      }
    );
  });

  /*review part*/
  document.getElementById("reviewFilterSelect").addEventListener("change", function () {
    const selection = this.value;
    if (selection === "all") {
      console.log("Fetching all reviews...");

      apex.server.process(
        "GET_ALL_REVIEWS",
        {},
        {
          success: function (data) {
            const container = document.getElementById("reviewTableContainer");
            const tbody = document.getElementById("reviewTableBody");
            tbody.innerHTML = "";

            (data.items || []).forEach((review) => {
              const row = document.createElement("tr");
              row.innerHTML = `
              <td>${review.ID_REVIEW}</td>
              <td>${review.BOOK_TITLE}</td>
              <td>${review.ID_CLIENT}</td>
              <td>${review.REVIEW_SCORE}</td>
              <td>${review.REVIEW_FEEDBACK}</td>
            `;
              tbody.appendChild(row);
            });

            container.classList.remove("hidden");
          },
          error: function () {
            apex.message.alert("Failed to fetch reviews.");
          },
        }
      );
    } else {
      document.getElementById("reviewTableContainer").classList.add("hidden");
    }
  });
});

function setupDropdownListener() {
  document.getElementById("bookSetSelect").addEventListener("change", function () {
    renderBooksForSet(parseInt(this.value));
  });
}

function fetchAllBooks() {
  console.log(" Fetching books...");
  apex.server.process(
    "GET_BOOKS_FOR_SHELF",
    {},
    {
      success: function (data) {
        allBooks = data.items || [];
        console.log(" Books fetched:", allBooks.length);
        generateBookSetOptions();
        renderBooksForSet(1);
      },
      error: function () {
        apex.message.alert("Failed to load books.");
      },
    }
  );
}

function generateBookSetOptions() {
  const dropdown = document.getElementById("bookSetSelect");
  dropdown.innerHTML = "";

  const totalSets = Math.ceil(allBooks.length / BOOKS_PER_SET);
  for (let i = 1; i <= totalSets; i++) {
    const option = document.createElement("option");
    option.value = i;
    option.text = `Book Set No. ${i}`;
    dropdown.appendChild(option);
  }

  dropdown.value = "1";
}

function renderBooksForSet(setNumber) {
  const shelf = document.getElementById("shelf");
  shelf.innerHTML = "";

  const startIdx = (setNumber - 1) * BOOKS_PER_SET;
  const setBooks = allBooks.slice(startIdx, startIdx + BOOKS_PER_SET);

  const booksPerRow = 5;
  const paddedBooks = [...setBooks];
  while (paddedBooks.length < BOOKS_PER_SET) {
    paddedBooks.push({ empty: true });
  }

  for (let i = 0; i < paddedBooks.length; i += booksPerRow) {
    const row = document.createElement("div");
    row.className = "shelf-row";

    paddedBooks.slice(i, i + booksPerRow).forEach((book) => {
      const bookDiv = document.createElement("div");
      bookDiv.classList.add("book");

      if (book.empty) {
        bookDiv.classList.add("empty");
      } else {
        bookDiv.textContent = book.TITLE;
        bookDiv.classList.add(book.RESERVED === "Y" ? "reserved" : "available");

        bookDiv.addEventListener("click", function () {
          console.log("Book clicked:", book.BOOK_ID);
          selectedBookId = book.BOOK_ID;
          fetchBookDetails(book.BOOK_ID);
        });
      }

      row.appendChild(bookDiv);
    });

    shelf.appendChild(row);
  }
}

function fetchBookDetails(bookId) {
  console.log(" Fetching details for book:", bookId);
  apex.server.process(
    "GET_BOOK_DETAILS",
    {
      x01: bookId,
    },
    {
      success: function (book) {
        console.log("Book details received:", book);
        showBookDetails(book);
      },
      error: function () {
        apex.message.alert("Failed to fetch book details.");
      },
    }
  );
}

function showBookDetails(book) {
  selectedBookId = book.BOOK_ID;
  console.log(" Showing book detail UI. selectedBookId is now:", selectedBookId);

  document.getElementById("detailTitle").innerText = book.TITLE;
  document.getElementById("detailAuthor").innerText = book.AUTHOR;
  document.getElementById("detailGenre").innerText = book.GENRE;
  document.getElementById("detailDate").innerText = book.DATE;
  document.getElementById("detailDescription").innerText = book.DESCRIPTION;
  document.getElementById("detailReserved").innerText = book.RESERVED === "Y" ? "Yes (Reserved)" : "No (Available)";

  // Show the correct button based on reservation status
  const reserveBtn = document.getElementById("reserveButton");
  const returnBtn = document.getElementById("returnButton");

  if (book.RESERVED === "N") {
    reserveBtn.classList.remove("hidden");
    reserveBtn.disabled = false;
    returnBtn.classList.add("hidden");
  } else {
    returnBtn.classList.remove("hidden");
    returnBtn.disabled = false;
    reserveBtn.classList.add("hidden");
  }

  document.getElementById("bookDetails").classList.remove("hidden");
}
