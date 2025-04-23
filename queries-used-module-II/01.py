# Conectar no BD antes

from openai import OpenAI
client = OpenAI()
galaxies = [
 {"id":1, "name":'M31', "doc":'Messier 31 is a barred spiral galaxy in the Andromeda constellation which has a lot of barred spiral galaxies.'},
 {"id":2, "name":'M33', "doc":'Messier 33 is a spiral galaxy in the Triangulum constellation.'},
 {"id":3, "name":'M58', "doc":'Messier 58 is an intermediate barred spiral galaxy in the Virgo constellation.'},
 {"id":4, "name":'M63', "doc":'Messier 63 is a spiral galaxy in the Canes Venatici constellation.'},
 {"id":5, "name":'M77', "doc":'Messier 77 is a barred spiral galaxy in the Cetus constellation.'},
 {"id":6, "name":'M91', "doc":'Messier 91 is a barred spiral galaxy in the Coma Berenices constellation.'},
 {"id":7, "name":'M49', "doc":'Messier 49 is a giant elliptical galaxy in the Virgo constellation.'},
 {"id":8, "name":'M60', "doc":'Messier 60 is an elliptical galaxy in the Virgo constellation.'},
 {"id":9, "name":'NGC1073', "doc":'NGC 1073 is a barred spiral galaxy in Cetus constellation.'}
]
for galaxy in galaxies:
    embedding_response = client.embeddings.create(
        model = "text-embedding-3-large",
        input = galaxy["doc"],
        dimensions = 5
    )
    str_embedding = str(embedding_response.data[0].embedding)
    str_insert = "INSERT INTO galaxies VALUES (" + str(galaxy["id"]) + ", '" + galaxy["name"] + "', '" + galaxy["doc"] + "', '" + str_embedding + "');"
    print(str_insert)