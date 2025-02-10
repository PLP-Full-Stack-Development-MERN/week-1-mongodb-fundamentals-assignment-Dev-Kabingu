
--question2
use library

db.books

--question3
db.books.insertMany([
  {
    title: "The Silent Patient",
    author: "Alex Michaelides",
    publishedYear: 2019,
    genre: "Thriller, Mystery",
    ISBN: "9781250301697"
  },
  {
    title: "Where the Crawdads Sing",
    author: "Delia Owens",
    publishedYear: 2018,
    genre: "Fiction, Mystery",
    ISBN: "9780735219090"
  },
  {
    title: "The Night Circus",
    author: "Erin Morgenstern",
    publishedYear: 2011,
    genre: "Fantasy, Magical Realism",
    ISBN: "9780385534635"
  },
  {
    title: "The Girl on the Train",
    author: "Paula Hawkins",
    publishedYear: 2015,
    genre: "Thriller, Psychological Fiction",
    ISBN: "9781594633669"
  },
  {
    title: "Educated",
    author: "Tara Westover",
    publishedYear: 2018,
    genre: "Memoir, Non-fiction",
    ISBN: "9780399590504"
  },
  {
    title: "A Little Life",
    author: "Hanya Yanagihara",
    publishedYear: 2015,
    genre: "Literary Fiction",
    ISBN: "9780804172707"
  },
  {
    title: "The Underground Railroad",
    author: "Colson Whitehead",
    publishedYear: 2016,
    genre: "Historical Fiction",
    ISBN: "9780385542364"
  },
  {
    title: "The Goldfinch",
    author: "Donna Tartt",
    publishedYear: 2013,
    genre: "Fiction, Literary",
    ISBN: "9780316055444"
  },
  {
    title: "Normal People",
    author: "Sally Rooney",
    publishedYear: 2018,
    genre: "Fiction, Romance",
    ISBN: "9781984822178"
  },
  {
    title: "Circe",
    author: "Madeline Miller",
    publishedYear: 2018,
    genre: "Fantasy, Mythology",
    ISBN: "9780316339157"
  }
]);
--question 4
db.books.find()

db.books.find({author: "Sally Rooney"})

db.books.find({publishedYear: {$gt : 2000}})

--question 5
db.books.updateOne({title: "Normal People"}, {$set : {publishedYear: 2024}})

db.books.updateMany({},{$set: {rating: "Null"}})

--question 6
db.books.deleteOne({ISBN: "9780316339157"})

db.books.deleteMany({ genre: "Thriller" });



--Question7
db.users.insertMany([
  {
    _id: ObjectId("user1"),
    name: "Mark Muchema",
    email: "mark.muchema@example.com",
    address: {
      street: "123 Elm St",
      city: "Nairobi",
      zip: "00100"
    }
  },
  {
    _id: ObjectId("user2"),
    name: "James Kabingu",
    email: "james.kabingu@example.com",
    address: {
      street: "456 Oak Ave",
      city: "Nairobi",
      zip: "00200"
    }
  },
  {
    _id: ObjectId("user3"),
    name: "Rose Wanjiru",
    email: "rose.wanjiru@example.com",
    address: {
      street: "789 Pine Rd",
      city: "Nairobi",
      zip: "00300"
    }
  }
]);

db.products.insertMany([
  {
    _id: ObjectId("product1"),
    name: "Wireless Mouse",
    description: "A smooth and responsive wireless mouse.",
    price: 29.99,
    stockQuantity: 150,
    category: "Electronics"
  },
  {
    _id: ObjectId("product2"),
    name: "Bluetooth Headphones",
    description: "Noise-cancelling over-ear headphones.",
    price: 89.99,
    stockQuantity: 100,
    category: "Electronics"
  },
  {
    _id: ObjectId("product3"),
    name: "Smartphone Stand",
    description: "Adjustable phone holder for desks.",
    price: 15.99,
    stockQuantity: 200,
    category: "Accessories"
  }
]);


db.orders.insertMany([
  {
    _id: ObjectId("order1"),
    userId: ObjectId("user1"),
    products: [
      { productId: ObjectId("product1"), quantity: 2 },
      { productId: ObjectId("product2"), quantity: 1 }
    ],
    totalPrice: 149.97,
    shippingAddress: {
      street: "123 Elm St",
      city: "Nairobi",
      zip: "00100"
    },
    orderStatus: "Shipped"
  },
  {
    _id: ObjectId("order2"),
    userId: ObjectId("user2"),
    products: [
      { productId: ObjectId("product2"), quantity: 1 }
    ],
    totalPrice: 89.99,
    shippingAddress: {
      street: "456 Oak Ave",
      city: "Nairobi",
      zip: "00200"
    },
    orderStatus: "Delivered"
  },
  {
    _id: ObjectId("order3"),
    userId: ObjectId("user3"),
    products: [
      { productId: ObjectId("product3"), quantity: 3 }
    ],
    totalPrice: 47.97,
    shippingAddress: {
      street: "789 Pine Rd",
      city: "Nairobi",
      zip: "00300"
    },
    orderStatus: "Pending"
  }
]);

--question 8
db.books.aggregate([{$group: {_id: "$genre",totalBooks: { $sum: 1 }}}]);

db.books.aggregate([ { $group: { _id: null, averagePublishedYear: { $avg: "$publishedYear" }}}]);

db.books.aggregate([{ $sort: { rating: -1 }},{$limit: 1}
]);

--question 9 
db.books.createIndex({ author: 1 });

1.Faster Query Execution
2.Efficient Sorting
3.Optimized Query Performance for Large Collections
4.Improved Performance for Range Queries

--question 10
db.users.find()
db.products.find()
db.orders.find()

