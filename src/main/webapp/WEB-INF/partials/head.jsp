<title>${param.title}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    body {
        background-color: lightgray;
    }
    .btn {
        background-color: #638f8f;
        color: white;
    }
    .btn:hover {
        color: white;
        background-color: #1d3131;
        transition: 0.7s;
    }
    #clearFiltersButton {
        background-color: darkslategray;
    }
    a {
        color: black;
    }
    a:hover {
        color: darkslategray;
    }
    #filters {
        display: flex;
        justify-content: space-evenly;
        margin-bottom: 30px;
    }
</style>


