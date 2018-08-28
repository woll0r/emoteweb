% import os

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title>Ponypack Downloads</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha256-zVUlvIh3NEZRYa9X/qpNY8P1aBy0d4FrI7bhfZSZVwc=" crossorigin="anonymous" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <h1>Emote pack downloads</h1>
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
                        <td class="w-75">Emote pack</td>
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
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td class="w-75">Other nice things</td>
                        <td>Link</td>
                    </tr>
                </thead>
                    <tr>
                        <td class="w-75 align-middle">Conversations with emote support</td>
                        <td>
                            <a href="https://github.com/gamefreak/Conversations/releases" class="btn btn-block btn-primary">
                                <i class="fa fa-external-link" aria-hidden="true"></i> Link
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="w-75 align-middle">GTK+ that is less shit on Windows</td>
                        <td>
                            <a href="/static/gtk+-bundle_3.6.4-20130921_win32.zip" class="btn btn-block btn-primary">
                                <i class="fa fa-external-link" aria-hidden="true"></i> Link
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <footer class="text-right">
                <a href="https://github.com/{{ githubrepo }}" class="btn btn-link">
                    <i class="fa fa-github" aria-hidden="true"></i> Emotes
                </a>
                <a href="https://github.com/Woll0r/emoteweb" class="btn btn-link">
                    <i class="fa fa-github" aria-hidden="true"></i> Sources
                </a>
            </footer>
        </div>
    </div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.slim.min.js" integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.min.js" integrity="sha256-FCiJD1Xk+2itXYf5YdFQrPURijNogcXySEApUqeRwHc=" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha256-IeI0loa35pfuDxqZbGhQUiZmD2Cywv1/bdqiypGW46o=" crossorigin="anonymous"></script>

</body>
</html>

