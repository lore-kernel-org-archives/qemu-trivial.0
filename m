Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAQBy-0006BE-67
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 14:23:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SAQBr-00069m-9I
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 14:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SAQBp-0002kc-CE
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 14:23:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2914)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>)
	id 1SAQBi-0002jb-RR; Wed, 21 Mar 2012 14:23:11 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LIN80m006447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 14:23:08 -0400
Received: from frodo.bos.redhat.com (frodo.bos.redhat.com [10.16.184.50])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LIN7Hn005051; Wed, 21 Mar 2012 14:23:07 -0400
From: Peter Portante <peter.portante@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 14:23:07 -0400
Message-Id: <1332354187-15720-1-git-send-email-peter.portante@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Portante <pportant@redhat.com>
Subject: [Qemu-trivial] [PATCH] Whitespace clean up.
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
X-List-Received-Date: Wed, 21 Mar 2012 18:23:25 -0000

Signed-off-by: Peter Portante <pportant@redhat.com>
---
 block/raw-posix.c |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/raw-posix.c b/block/raw-posix.c
index 2d1bc13..719a590 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -112,7 +112,7 @@
    reopen it to see if the disk has been changed */
 #define FD_OPEN_TIMEOUT (1000000000)
 
-#define MAX_BLOCKSIZE	4096
+#define MAX_BLOCKSIZE   4096
 
 typedef struct BDRVRawState {
     int fd;
@@ -494,7 +494,7 @@ again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
 #ifdef DIOCGMEDIASIZE
-	if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
+    if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
 #elif defined(DIOCGPART)
         {
                 struct partinfo pi;
@@ -894,7 +894,7 @@ static int hdev_has_zero_init(BlockDriverState *bs)
 
 static BlockDriver bdrv_host_device = {
     .format_name        = "host_device",
-    .protocol_name        = "host_device",
+    .protocol_name      = "host_device",
     .instance_size      = sizeof(BDRVRawState),
     .bdrv_probe_device  = hdev_probe_device,
     .bdrv_file_open     = hdev_open,
@@ -903,12 +903,12 @@ static BlockDriver bdrv_host_device = {
     .create_options     = raw_create_options,
     .bdrv_has_zero_init = hdev_has_zero_init,
 
-    .bdrv_aio_readv	= raw_aio_readv,
-    .bdrv_aio_writev	= raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_readv     = raw_aio_readv,
+    .bdrv_aio_writev    = raw_aio_writev,
+    .bdrv_aio_flush     = raw_aio_flush,
 
     .bdrv_truncate      = raw_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_getlength     = raw_getlength,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
@@ -1015,7 +1015,7 @@ static BlockDriver bdrv_host_floppy = {
     .format_name        = "host_floppy",
     .protocol_name      = "host_floppy",
     .instance_size      = sizeof(BDRVRawState),
-    .bdrv_probe_device	= floppy_probe_device,
+    .bdrv_probe_device  = floppy_probe_device,
     .bdrv_file_open     = floppy_open,
     .bdrv_close         = raw_close,
     .bdrv_create        = hdev_create,
@@ -1024,10 +1024,10 @@ static BlockDriver bdrv_host_floppy = {
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_flush     = raw_aio_flush,
 
     .bdrv_truncate      = raw_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_getlength     = raw_getlength,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
@@ -1114,7 +1114,7 @@ static BlockDriver bdrv_host_cdrom = {
     .format_name        = "host_cdrom",
     .protocol_name      = "host_cdrom",
     .instance_size      = sizeof(BDRVRawState),
-    .bdrv_probe_device	= cdrom_probe_device,
+    .bdrv_probe_device  = cdrom_probe_device,
     .bdrv_file_open     = cdrom_open,
     .bdrv_close         = raw_close,
     .bdrv_create        = hdev_create,
@@ -1123,7 +1123,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_flush     = raw_aio_flush,
 
     .bdrv_truncate      = raw_truncate,
     .bdrv_getlength     = raw_getlength,
@@ -1233,7 +1233,7 @@ static BlockDriver bdrv_host_cdrom = {
     .format_name        = "host_cdrom",
     .protocol_name      = "host_cdrom",
     .instance_size      = sizeof(BDRVRawState),
-    .bdrv_probe_device	= cdrom_probe_device,
+    .bdrv_probe_device  = cdrom_probe_device,
     .bdrv_file_open     = cdrom_open,
     .bdrv_close         = raw_close,
     .bdrv_create        = hdev_create,
@@ -1242,7 +1242,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_flush     = raw_aio_flush,
 
     .bdrv_truncate      = raw_truncate,
     .bdrv_getlength     = raw_getlength,
-- 
1.7.7.6


