import aiosql
import psycopg2


class Chinook:
    def __init__(self):
        self.pgconn = psycopg2.connect("dbname=chinook")

        self.queries = aiosql.from_path(
            "sql",
            "psycopg2"
        )

    def genre_list(self):
        return self.queries.tracks_by_genre(self.pgconn)

    def genre_top_n(self, n):
        return self.queries.genre_top_n(self.pgconn, n=n)

    def artist_by_albums(self, n):
        return self.queries.top_artists_by_album(
            self.pgconn, n=n
        )

    def album_details(self, albumid):
        return self.queries.list_tracks_by_albumid(
            self.pgconn, id=albumid
        )

    def album_by_artist(self, artist):
        return self.queries.list_albums_by_artist(
            self.pgconn, name=artist
        )


if __name__ == "__main__":
    db = Chinook()

    print("\nTop 10 Artists by Albums:\n")

    for row in db.artist_by_albums(10):
        print(row)