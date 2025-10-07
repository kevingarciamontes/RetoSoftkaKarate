function fn (){

    config = {
        urlBase: 'https://petstore.swagger.io/#/'
    };

    karate.configure('conectTimeout',5000);
    karate.configure('readTimeout',5000);
    return config;


}