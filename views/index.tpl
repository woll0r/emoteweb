% import os

<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Ponypack Downloads</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/css/normalize.min.css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/css/foundation.min.css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css"/>
    <style>
        table {
            width: 100%;
        }

        a.button {
            margin: 0 !important;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="small-12 columns">
        <h1>Ponypack downloads</h1>
        <p>Latest commit: {{message}}<br />
        Built: {{version}}</p>
    </div>
</div>
<div id="contents">
    <div class="row">
        <div class="small-12 columns">
            <table>
                <thead>
                <tr>
                    <th style="width: 66%">File</th>
                    <th>Download</th>
                </tr>
                </thead>
                <tbody>
                % for filename in dirlist:
                <tr>
                    <td>{{ os.path.splitext(filename)[0] }}</td>
                    <td><a href="/output/{{filename}}" class="button small expand"><i class="fi-download"></i> Download</a></td>
                </tr>
                % end
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer class="row" style="max-width: 100%">
    <hr/>
    <div class="small-12 columns">
        <ul class="inline-list right">
            <li>
                <a href="https://github.com/XyyxShard/Ponysquad-Emote-Pack"><i class="fi-social-github"></i> Emotes</a>
            </li>
            <li>
                <a href="https://github.com/Woll0r/emoteweb"><i class="fi-social-github"></i> Sources</a>
            </li>
        </ul>
    </div>
</footer>

<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/js/vendor/modernizr.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/js/vendor/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/js/foundation.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/js/foundation/foundation.topbar.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/js/foundation/foundation.tooltip.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.4.7/js/foundation/foundation.equalizer.min.js"></script>

<script src="/static/script.js"></script>

</body>
</html>
