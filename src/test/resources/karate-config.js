function() {
    karate.configure('ssl', {
        trustAll: true 
    });
    karate.configure('report', { 
        showLog: true, 
        showAllSteps: true 
    });
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);
    karate.configure('headers', {Accept: '*/*'});
    
    var config = {};
    config.global = karate.callSingle('classpath:features/common_resources/global-variables.feature');

    // BASE_URL, environment dependent
    config.BASE_URL = 'https://petstore.swagger.io/v2/';
    return config;
}