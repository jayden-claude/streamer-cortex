# Video Playlist App

## Overview

The Video Playlist App allows users to interact with video content using data from the Mock YouTube API. Users can fetch and display videos, create playlists, and manage their contents.

## Features

- **Fetch and Display Videos**: Retrieve and show a list of videos from the Mock YouTube API.
- **Create Playlists**: Create new, empty playlists with custom names.
- **Manage Playlists**: Add videos to playlists and remove videos from them.
- **Video Metadata**: Display video thumbnails, titles, descriptions, and view counts.
- **Search and Pagination**: Filter videos by title and implement basic pagination.

## Technologies Used

- **Backend**: Ruby on Rails
- **Frontend**: HTML, CSS, Bootstrap, JavaScript
- **API**: Mock YouTube API (https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos)
- **Database**: SQLite

## Installation

### Prerequisites

Ensure you have the following installed:
- Ruby (version 3.2.2)
- Rails (version ~> 7.0.8)

### Setup

1. **Clone the Repository**

    ```bash
    git clone https://github.com/mehmetabakir/video-playlist-app.git
    cd video-playlist-app
    ```

2. **Install Dependencies**

    ```bash
    bundle install
    ```

3. **Database Setup**

    ```bash
    bundle exec rails db:create
    bundle exec rails db:migrate
    ```

4. **Start the Server**

    ```bash
    bundle exec rails server
    ```

    Open your browser and navigate to `http://localhost:3000` to view the app.

## Usage

### Fetch Videos

Navigate to the **Index Page** to view a list of videos fetched from the Mock YouTube API. Each video card includes options to add the video to a playlist.

### Create a Playlist

Click on the "Create Playlist" **Sidebar** button to navigate to the Playlist Creation page. Enter a name for the new playlist and click "Create Playlist" to add it.

### Add/Remove Videos

- **Add Videos**: On the **Index Page**, use the "Add to Playlist" dropdown menu on each video card to add the video to a specific playlist.
- **Remove Videos**: On the **Playlist Show Page**, click the "Remove Video" button on specific video card to remove it from the playlist.

### Search and Pagination (Bonus)

Use the search bar to filter videos by title. Navigate through paginated video lists using the pagination controls.

## API Reference

### Fetch Videos

**Endpoint:** `GET /api/videos`

**Query Params:**
- `page` (optional): Specify the page to retrieve.

**Response Example:**

```json
{
  "videos": [
    {
      "id": 1,
      "title": "thanks for 5 million",
      "video_id": "H1tQhK0n5Qk",
      "views": 279357,
      "likes": 66689,
      "comments": 3144,
      "description": "#shorts",
      "thumbnail_url": "https://i.ytimg.com/vi/H1tQhK0n5Qk/default.jpg",
      "created_at": "2021-11-24T22:23:27.130Z",
      "updated_at": "2021-11-24T22:23:27.130Z"
    }
  ],
  "meta": {
    "total": 92,
    "page": 2
  }
}
