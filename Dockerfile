version: 2.1

executors:
  docker-executor:
    docker:
      - image: circleci/python:3.8  # You can replace this with a more suitable image for your needs

jobs:
  build:
    executor: docker-executor
    steps:
      - checkout
      - setup_remote_docker:
          version: 20.10.7
          docker_layer_caching: true
      - run:
          name: Build Docker Image
          command: |
            docker build -t api_test_automation .
      - run:
          name: Run Tests in Docker
          command: |
            docker run --rm -v "${CIRCLE_WORKING_DIRECTORY}/allure-results:/usr/src/app/allure-results" api_test_automation

workflows:
  version: 2
  build_and_test:
    jobs:
      - build
