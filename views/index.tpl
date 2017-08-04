% import os

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title>Ponypack Downloads</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha256-rr9hHBQ43H7HSOmmNkxzQGazS/Khx+L8ZRHteEY1tQ4=" crossorigin="anonymous" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <h1>Ponypack downloads</h1>
            % if status == 'fail':
            <div class="alert alert-danger" role="alert">
                <strong>Danger Will Robinson!</strong>
                Something went wrong while processing emotes! These packs might not be up to date!
            </div>
            % elif status == 'updating':
            <div class="alert alert-warning" role="alert">
                Emotes are updating, please refresh the page in a few moments to get the latest emotes!
            </div>
            % end
            <h4>Latest commit</h4>
            <p>
                % for msg in message:
                {{msg}}<br />
                % end
                <small>Last commit: {{version}}</small>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td class="w-75">File</td>
                        <td>Download</td>
                    </tr>
                </thead>
                <tbody>
                    % for filename in dirlist:
                    <tr>
                        <td class="w-75 align-middle">{{ os.path.splitext(filename)[0] }}</td>
                        <td>
                            <a href="/output/{{filename}}" class="btn btn-block btn-primary">
                                <i class="fa fa-download" aria-hidden="true"></i> Download
                            </a>
                        </td>
                    </tr>
                    % end
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <footer class="text-right">
                <a href="https://github.com/XyyxShard/Ponysquad-Emote-Pack" class="btn btn-link">
                    <i class="fa fa-github" aria-hidden="true"></i> Emotes
                </a>
                <a href="https://github.com/Woll0r/emoteweb" class="btn btn-link">
                    <i class="fa fa-github" aria-hidden="true"></i> Sources
                </a>
            </footer>
        </div>
    </div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

</body>
</html>
