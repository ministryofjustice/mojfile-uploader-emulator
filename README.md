# MoJFile Upload Emulator

## Overview

The MojFile Upload Emulator is intended as a drop-in replacement for the two most basic MoJFile Uploader calls:

***Uploading a file:***

```bash
$ echo '{"file_filename": "testfile.docx"}' | curl -d @- http://localhost:9292/ABC123/new

-- which returns:

{"collection":"ABC123","key":"testfile.docx"}
```

***Deleting a file:***

```bash
$ curl -I -XDELETE http://localhost:9292/ABC123/testfile.docx

-- which returns:

HTTP/1.1 204 No Content
X-Content-Type-Options: nosniff
```

Its use-case is user testing and front-end app development in situations
where full access to the MoJFile Uploader is either not available or not
needed.  It is ***NOT*** intended to fully emulate the MoJFile Uploader
API.

## Installation

```bash
  git clone git@github.com:ministryofjustice/mojfile-uploader-emulator.git
  cd mojfile-uploader-emulator
  gem install bundler
  bundle install
  ./run.sh
```

## With docker-compose

```bash
  git clone git@github.com:ministryofjustice/mojfile-uploader-emulator.git
  cd glimr-emulator
  docker-compose build
  docker-compose up
```

## Testing

Due to the simplicity and intended use of the app, there are currently
no tests.  Once the app is running, it is a simple matter to check that
it is operating correctly:

```bash
  echo '{"file_filename": "testfile.docx"}' | curl -d @- http://localhost:9292/ABC123/new
```

Should return something like this:

```json
{"collection":"ABC123","key":"testfile.docx"}
```

The `Content-Type` response header is `applicaiton/json`.
