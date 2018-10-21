#! /usr/bin/env python
import boto3, json, requests, time
from bottle import Bottle, route, get, post, request, run, static_file, jinja2_template as template, jinja2_view as view
from paste import httpserver

app = Bottle()

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='./static/')

@app.route('/')
@app.route('/alert', method='POST')
def application():
    #
    # Create CloudWatch client
    #
    cloudwatch = boto3.client('cloudwatch')

    alerts = request.query.get('alert')
    if alerts:
        #cloudwatch.put_metric_alarm(
        #    AlarmName='ResponseTime',
        #    ComparisonOperator='TargetResponseTime',
        #    EvaluationPeriods=20,
        #    MetricName='AppResponseTime',
        #    Namespace='AWS/ELB',
        #    Period=60,
        #    Statistic='Average',
        #    Threshold=20.0,
        #    ActionsEnabled=False,
        #    AlarmDescription='Alarm When Response exceeds 20s',
        #    Dimensions=[
        #        {
        #          'Name': 'LoadBalancer',
        #          'Value': 'INSTANCE_ID'
        #        },
        #    ],
        #    Unit='Seconds'
        #)
        # List alarms of insufficient data through the pagination interface
        paginator = cloudwatch.get_paginator('describe_alarms')
        for aws_response in paginator.paginate(StateValue='INSUFFICIENT_DATA'):
            print(aws_response['MetricAlarms'])
    else:
        # set the default search values
        aws_response = 'no alerts'
    #
    # Send The Search Result To A Template And Render With Proper Encoding
    #
    return template('landing.tpl', response=aws_response, http400=aws_response, http500=aws_response)

@app.route('/about', name='about')
def about():
    return template('about.tpl')

app.run(server='paste', host='0.0.0.0', port=5005, reloader=True)
