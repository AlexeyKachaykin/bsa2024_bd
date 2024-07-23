erDiagram
    User ||--o{ UserAvatar : has
    User ||--o{ FavoriteMovie : has
    User {
        int id PK
        string username
        string first_name
        string last_name
        string email
        string password_hash
        timestamp created_at
        timestamp updated_at
    }
    
    File {
        int id PK
        string file_name
        string mime_type
        string key
        string url
        timestamp created_at
        timestamp updated_at
    }
    
    UserAvatar {
        int id PK
        int user_id FK
        int file_id FK
    }
    
    Movie ||--|{ MovieGenre : has
    Movie ||--o| File : has_poster
    Movie ||--|| Country : produced_in
    Movie ||--|| Person : directed_by
    Movie ||--o{ Character : has
    Movie ||--o{ MovieActor : features
    Movie {
        int id PK
        string title
        text description
        decimal budget
        date release_date
        int duration
        int director_id FK
        int country_id FK
        int poster_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    
    Country {
        int id PK
        string name
        timestamp created_at
        timestamp updated_at
    }
    
    Genre {
        int id PK
        string name
        timestamp created_at
        timestamp updated_at
    }
    
    MovieGenre {
        int movie_id FK
        int genre_id FK
    }
    
    Character {
        int id PK
        int movie_id FK
        string name
        text description
        enum role
        timestamp created_at
        timestamp updated_at
    }
    
    Person ||--o{ PersonPhoto : has
    Person ||--|| Country : from
    Person {
        int id PK
        string first_name
        string last_name
        text biography
        date date_of_birth
        enum gender
        int country_id FK
        int primary_photo_id FK
        timestamp created_at
        timestamp updated_at
    }
    
    PersonPhoto {
        int id PK
        int person_id FK
        int file_id FK
        boolean is_primary
    }
    
    MovieActor {
        int id PK
        int movie_id FK
        int person_id FK
        int character_id FK
        timestamp created_at
        timestamp updated_at
    }
    
    FavoriteMovie {
        int id PK
        int user_id FK
        int movie_id FK
        timestamp created_at
    }