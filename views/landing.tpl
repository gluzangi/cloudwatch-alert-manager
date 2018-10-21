{% extends "layout.tpl" %}
{% block content %}
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="/about">About</a></li>
          </ul>
        </nav>
        {% include "logo.tpl"  %}
      </div>

      <div class="jumbotron">
        <form class="form-horizontal" action="/alert" method="post">
            <div class="form-group">
              <input type="submit" class="btn btn-lg btn-primary outline pull-right" id="alert" value="Create Alerts"/>
          </div>
     	</form>
      </div>

        <!-- Nav tabs -->
        <ul class="nav nav-pills nav-justified" role="tablist">
          <li role="presentation" class="active"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Response</a></li>
          <li role="presentation"><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">HTTP 4XX</a></li>
          <li role="presentation"><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">HTTP 5XX</a></li>
        </ul>    
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="tab1">
                <div class="lead google-fonts-body" style="margin-top:30px;">
                    Alerts For Response
                </div>
                <div class="google-fonts-body"><pre class="prettyprint">{% print response %}</pre></div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="tab2">
                <div class="lead google-fonts-body" style="margin-top:30px;">
                    Alerts For 4XX
                </div>
                <div class="google-fonts-body"><pre class="prettyprint lang-bsh">{% print http400 %}</pre></div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="tab3">
                <div class="lead google-fonts-body" style="margin-top:30px;">
                    Alerts For 5XX
                </div>
                <div class="google-fonts-body"><pre class="prettyprint lang-bsh">{% print http500 %}</pre></div>
            </div>
        </div>
{% endblock %}
