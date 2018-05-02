node{
    stage("building image"){
        checkout scm
        def slave-container = docker.build("test-slave", "./src/main/resources/docker/slave/")
        docker.withRegistry('http://server.crobatair.com:5000/'){
            docker.withServer('tcp://server.crobatair.com:2376','Docker'){
                slave-container.push 'latest'

            }    
        }
    }
    stage('Test files'){
        docker.withRegistry('http://server.crobatair.com:5000/'){
            docker.withServer('tcp://server.crobatair.com:2376','Docker'){
                def slave = docker.image('test-slave:latest')
                slave.pull()
                slave.inside{
                    sh 'echo hola mundo desde la imagen :) '
                }

            }    
        }
    }
    

}
