## Stack technique

- Ruby on rails (ruby 2.7.0p0)
- Mysql 5.7
- Vuejs 5.0.4
- docker / docker-compose

## Steps for init the project (developement)

build the project
```
make build
```

import the data for demo
```
make import-data
```

## Project availability

The front part is available on ``` http://localhost:3000```

The Api is avaible on ``` http://localhost:3001/api```


## API EndPoints

Recipes:
- GET /api/recipes - all recipes
- POST /api/recipes - create a new recipe
- PUT /api/recipes/:id - update a recipe
- DELETE /api/recipes/:id - delete a recipe

ingredients:
- GET /api/ingredients - all ingredients
- POST /api/ingredients - create a new ingredient
- PUT /api/ingredients/:id - update an ingredient
- DELETE /api/ingredients/:id - delete an ingredient