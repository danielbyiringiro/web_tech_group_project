<?php
    session_start();
?>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, width=device-width">
        <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" rel="stylesheet">
        <script crossorigin="anonymous" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css" rel="stylesheet">
        <link href="/static/favicon.ico" rel="icon">
        <link href="../css/homepage.css" rel="stylesheet">  
        <title>Home Page</title>
    </head>

    <body>
        <header>
            <nav class="navbar-expand-md navbar">
                <div class="container-fluid">
                    <a class="navbar-brand flex-between begin" href="homepage.php"><span><img class="navpicture" src="../images/vibe.png" alt="Ashesi"></span><span> </span><span class="cc">CONNECT</span></a>
                    <button aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-bs-target="#navbar" data-bs-toggle="collapse" type="button">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav ms-auto mt-2">
                            <li class="nav-item"><a class="nav-link navtypo" href="../actions/logout_user.php">Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div>
            <div class="d-flex search-form flex-between">
                <input autocomplete="off" class="form-control me-2 search-input search-icon" type="search" placeholder="Search..." aria-label="Search" name="query" oninput="searchQuery()" required>
            </div>
            <div id="search-results"></div>   
         
            <main class="container-fluid py-5 text-center top">
                <div class="container">
                    <form id="postForm" class="flex-container">
                        <a href="/users/">
                            <img src="../images/vibed.jpeg" alt="pic" class="horizontal-image">
                        </a>
                        <?php include("../actions/create_post_input.php") ?>
                    </form>
                </div>

                <?php include("../actions/display_all_post.php")?>
        </main>
        </div>
    </body>
</html>
<script>
    function openPostEditor()
    {
        const url = "../view/newpost.php";
        window.location.href = url;
    }
</script>