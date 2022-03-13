#!/usr/bin/env groovy
@Library('github.com/jenkins-infra/pipeline-library@master') _
buildDockerAndPublishImage(
    'controller',
    [
        agentLabels: '',
        credentials: 'dockerhub-troublemaker',
        platform: 'linux/arm64',
        useContainer: true
    ]
)
