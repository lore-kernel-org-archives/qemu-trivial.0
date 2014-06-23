Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wz6BA-0002to-M1
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 11:29:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wz6Az-0002g2-OG
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 11:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wz6Aq-0000F3-Nx
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 11:28:57 -0400
Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233]:51697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wz6AU-0000Bk-PL; Mon, 23 Jun 2014 11:28:27 -0400
Received: by mail-pb0-f51.google.com with SMTP id rp16so6007816pbb.38
	for <multiple recipients>; Mon, 23 Jun 2014 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=YyE3+jXk7HJ84Jha1WmcsvEOBssiV/ajZE47KwbyqTQ=;
	b=eCMmB6p9K5szNmE0qBCciNPLEU0Vuq/sDQWMEvTo2Ok4IGVlYMFUJGGSGW+uBjFOrx
	q3SiT+sgfogq11sS0iCr5G5FsDAn04kZIEaN+hWJN+VaCdWL/3w/x1TtoijyvcscSQQ+
	DpqfOFyh2hOcbeVe1C8PVk0ezk5qa5SOmSZgzDcJwzPMneF34ZPawXrlwckho9j4roFt
	TVq0xeD6mmTEZ/nw8etp33CRVO4yGYA3U0BXpfSMz55LoBjcPUkjsJr6ILNM74b2fQxQ
	kPlkClwdToFrMyzTSKL4xQ//NSvTsclbOYO7KXrg4teQ072g3vaMPpEGSULdfVJCJnyV
	rXBQ==
X-Received: by 10.68.240.5 with SMTP id vw5mr29744814pbc.113.1403537305249;
	Mon, 23 Jun 2014 08:28:25 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.105])
	by mx.google.com with ESMTPSA id
	pw4sm27437319pbc.61.2014.06.23.08.28.22 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 08:28:24 -0700 (PDT)
Message-ID: <53A84797.9040304@gmail.com>
Date: Mon, 23 Jun 2014 23:28:23 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com, 
	Michael Tokarev <mjt@tls.msk.ru>,
	mreitz@redhat.com, eblake@redhat.com, famz@redhat.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::233
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial v2] block.c: Add return value for
 bdrv_append_temp_snapshot() to avoid incorrect failure processing issue
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
X-List-Received-Date: Mon, 23 Jun 2014 15:29:06 -0000

When failure occurs, 'ret' need be set, or may return 0 to indicate success.
And error_propagate() also need be called only one time within a function.

It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
set errp when error occurs -- although it contents return value internally.

So let bdrv_append_temp_snapshot() internal return value outside, and let
all things normal, then fix the issue too.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 block.c               | 7 ++++---
 include/block/block.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 74af8d7..5e4fb60 100644
--- a/block.c
+++ b/block.c
@@ -1240,7 +1240,7 @@ done:
     return ret;
 }
 
-void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
+int bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
 {
     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
     char *tmp_filename = g_malloc0(PATH_MAX + 1);
@@ -1258,6 +1258,7 @@ void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
     /* Get the required size from the image */
     total_size = bdrv_getlength(bs);
     if (total_size < 0) {
+        ret = total_size;
         error_setg_errno(errp, -total_size, "Could not get image size");
         goto out;
     }
@@ -1304,6 +1305,7 @@ void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
 
 out:
     g_free(tmp_filename);
+    return ret;
 }
 
 static QDict *parse_json_filename(const char *filename, Error **errp)
@@ -1495,9 +1497,8 @@ int bdrv_open(BlockDriverState **pbs, const char *filename,
     /* For snapshot=on, create a temporary qcow2 overlay. bs points to the
      * temporary snapshot afterwards. */
     if (snapshot_flags) {
-        bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
+        ret = bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
         if (local_err) {
-            error_propagate(errp, local_err);
             goto close_and_fail;
         }
     }
diff --git a/include/block/block.h b/include/block/block.h
index f15b99b..7b3381c 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -217,7 +217,7 @@ int bdrv_open_image(BlockDriverState **pbs, const char *filename,
                     bool allow_none, Error **errp);
 void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd);
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *options, Error **errp);
-void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp);
+int bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp);
 int bdrv_open(BlockDriverState **pbs, const char *filename,
               const char *reference, QDict *options, int flags,
               BlockDriver *drv, Error **errp);
-- 
1.7.11.7

