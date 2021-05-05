#!/bin/bash
find . -name '*.cc' -exec rename 's/\.cc$/.s/' '{}' +
