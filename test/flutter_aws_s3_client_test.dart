import 'dart:io';
import 'package:test/test.dart';
import '../lib/flutter_aws_s3_client.dart';

void main() {
  group('S3 Test', () {
    test('Get Object', () async {
      const region = "us-east-2";
      const bucketId = "--BUCKET ID--";
      final s3client = AwsS3Client(
          region: region,
          // host: "s3.$region.amazonaws.com",
          bucketId: bucketId,
          accessKey: "<YOUR ACCESS KEY>",
          secretKey: "<YOUR SECRET KEY>");

      // final listBucketResult =
      //     await s3client.listObjects(prefix: "dir/dir2/", delimiter: "/");
      // print(listBucketResult.toString());

      final resp = await s3client.getObject("yourObjectId");
      print(resp.body.toString());
    });

    test('Put Object', () async {
      const region = "us-east-2";
      const bucketId = "--BUCKET ID--";
      final s3client = AwsS3Client(
          region: region,
          host: "s3.$region.amazonaws.com",
          bucketId: bucketId,
          accessKey: "<YOUR ACCESS KEY>",
          secretKey: "<YOUR SECRET KEY>");

      File f = File('test_data/fourth.png');
      var d = await f.readAsBytes();

      final resp = await s3client.putObject(
          "yourObjectId", "image/png", d.buffer.asUint8List().toList());
      print(resp.body.toString());
    });
  });
}
