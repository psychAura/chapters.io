Chapters.io 

![Chapters Screenshot](./chapters.png)

**Chapters** is a full-stack Ruby on Rails application that integrates with the **New York Times Books API** to deliver a curated experience of the current bestsellers across multiple genres.  
It features dynamic category browsing, a static weekly featured book, mailing subscription integration, and planned social automation (Twitter bot for weekly highlights).

This project demonstrates:
- **API integration** (NYT Books API, future expansion to Open Library/Goodreads for reviews).
- **Caching strategies** for weekly featured content with Redis for production and sidekiq for dev.
- **Dynamic frontend rendering** with TailwindCSS, Flowbite and Rails partials.
- **Routing and controller design** for scalability.
- **Extensibility** with planned modules for newsletter delivery and social media automation.

---