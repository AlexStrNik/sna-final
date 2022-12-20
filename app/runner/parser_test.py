import unittest

from .parser import parse_config

VALID_CONFIG = """
image: "node:19"

stages:
  install:
    steps:
      - npm i
    artifacts:
      - node_modules
  test:
    image: "node:22"
    steps:
      - npm run test
  build:
    steps:
      - echo "test" > build
    artifacts:
      - build

branches:
  - main
"""

ANOTHER_VALID_CONFIG = """
stages:
  install:
    image: "node:19"
    steps:
      - npm i
    artifacts:
      - node_modules
  test:
    image: "node:19"
    steps:
      - npm run test
  build:
    image: "node:19"
    steps:
      - echo "test" > build
    artifacts:
      - build

branches:
  - main
"""

INVALID_CONFIG = """
stages:
  install:
    image: "node:19"
    steps:
      - npm i
    artifacts:
      - node_modules
  test:
    image: "node:19"
    steps:
      - npm run test
  build:
    steps:
      - echo "test" > build
    artifacts:
      - build

branches:
  - main
"""

class TestParser(unittest.TestCase):
    def test_image_resolving(self):
        config = parse_config(VALID_CONFIG)
        self.assertEqual(config.stages['install'].image, 'node:19')
        self.assertEqual(config.stages['test'].image, 'node:22')

        config = parse_config(ANOTHER_VALID_CONFIG)
        self.assertEqual(config.stages['install'].image, 'node:19')

    def test_invalid_config(self):
        with self.assertRaisesRegex(expected_exception=Exception, expected_regex='cannot resolve `image` for stage `build`'):
            parse_config(INVALID_CONFIG)
