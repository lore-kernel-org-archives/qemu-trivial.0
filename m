Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyoTa-0007Rk-S3
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 13:58:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TyoTU-00079V-Uk
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:58:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TyoTN-0002rl-2y
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:58:04 -0500
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>)
	id 1TyoT8-0002nb-8Z; Fri, 25 Jan 2013 13:57:43 -0500
Received: by mail-pb0-f46.google.com with SMTP id uo15so373204pbc.33
	for <multiple recipients>; Fri, 25 Jan 2013 10:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ur5A3qkk3w9Dp66EKOk1X/pcypsbvGAI+Z6kdafEzvU=;
	b=XFZ4Pln2iAt9WLe2SZq/26edpvzhcM5ARzk1SVRP/30czw/W/guQK7yJEVPteHl9Ua
	S+C6z8AU/IwMRPxl4mO9YBygonUOBJ1roOISZpqBBVs1wKyzLDqSEWHMMMcTyzw0rWoY
	JEHT/0HwrfuiDLbyS1jFKokuQp3PVMqeqqMyxjNnpiGLRlnWxeYA7leP09D71hQM4ev/
	L+R1tx20H7KYqep0KOHD4s6sbx25u2xTAqhnR7aXibjtwlM9zbaAAmHw7peYCy4KxazD
	PNFpOUaQ4D1sQrpKVjQ8hHikyNuPU6F3aLbQG/FPpy8CR6CCHXvVreQcu8YYYhtCgKss
	Yv/w==
X-Received: by 10.68.254.137 with SMTP id ai9mr16518475pbd.21.1359140260864;
	Fri, 25 Jan 2013 10:57:40 -0800 (PST)
Received: from localhost.localdomain (50-0-250-146.dedicated.static.sonic.net.
	[50.0.250.146])
	by mx.google.com with ESMTPS id w5sm1329834pax.28.2013.01.25.10.57.38
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 10:57:39 -0800 (PST)
From: Vishvananda Ishaya <vishvananda@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 25 Jan 2013 10:57:20 -0800
Message-Id: <1359140240-42972-1-git-send-email-vishvananda@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <51024DE2.907@redhat.com>
References: <51024DE2.907@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.46
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Vishvananda Ishaya <vishvananda@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] block: Adds mirroring tests for resized
	images
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 18:58:08 -0000

This test verifies two mirroring issues are fixed with resized images:

 * sync='top' creates an image that is the proper size
 * sync='full' doesn't cause an assertion failure and crash qemu
---
These are tests for my patches for the following bugs:

https://bugs.launchpad.net/qemu/+bug/1103868
https://bugs.launchpad.net/qemu/+bug/1103903

 tests/qemu-iotests/041     |   48 ++++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/041.out |    4 ++--
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index c6eb851..e7c004a 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -292,6 +292,54 @@ class TestMirrorNoBacking(ImageMirroringTestCase):
         self.assertTrue(self.compare_images(test_img, target_img),
                         'target image does not match source after mirroring')
 
+class TestMirrorResized(ImageMirroringTestCase):
+    backing_len = 1 * 1024 * 1024 # MB
+    image_len = 2 * 1024 * 1024 # MB
+
+    def setUp(self):
+        self.create_image(backing_img, TestMirrorResized.backing_len)
+        qemu_img('create', '-f', iotests.imgfmt, '-o', 'backing_file=%s' % backing_img, test_img)
+        qemu_img('resize', test_img, '2M')
+        self.vm = iotests.VM().add_drive(test_img)
+        self.vm.launch()
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(test_img)
+        os.remove(backing_img)
+        try:
+            os.remove(target_img)
+        except OSError:
+            pass
+
+    def test_complete_top(self):
+        self.assert_no_active_mirrors()
+
+        result = self.vm.qmp('drive-mirror', device='drive0', sync='top',
+                             target=target_img)
+        self.assert_qmp(result, 'return', {})
+
+        self.complete_and_wait()
+        result = self.vm.qmp('query-block')
+        self.assert_qmp(result, 'return[0]/inserted/file', target_img)
+        self.vm.shutdown()
+        self.assertTrue(self.compare_images(test_img, target_img),
+                        'target image does not match source after mirroring')
+
+    def test_complete_full(self):
+        self.assert_no_active_mirrors()
+
+        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
+                             target=target_img)
+        self.assert_qmp(result, 'return', {})
+
+        self.complete_and_wait()
+        result = self.vm.qmp('query-block')
+        self.assert_qmp(result, 'return[0]/inserted/file', target_img)
+        self.vm.shutdown()
+        self.assertTrue(self.compare_images(test_img, target_img),
+                        'target image does not match source after mirroring')
+
 class TestReadErrors(ImageMirroringTestCase):
     image_len = 2 * 1024 * 1024 # MB
 
diff --git a/tests/qemu-iotests/041.out b/tests/qemu-iotests/041.out
index 71009c2..3a89159 100644
--- a/tests/qemu-iotests/041.out
+++ b/tests/qemu-iotests/041.out
@@ -1,5 +1,5 @@
-..................
+....................
 ----------------------------------------------------------------------
-Ran 18 tests
+Ran 20 tests
 
 OK
-- 
1.7.9.5


