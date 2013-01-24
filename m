Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyR6x-00005b-VR
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2013 13:01:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TyR6r-0008Gy-TY
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 13:01:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TyR6j-0008Hs-QC
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 13:01:09 -0500
Received: from mail-pb0-f50.google.com ([209.85.160.50]:59153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>)
	id 1TyR6X-0008GL-H7; Thu, 24 Jan 2013 13:00:49 -0500
Received: by mail-pb0-f50.google.com with SMTP id wz7so5582751pbc.9
	for <multiple recipients>; Thu, 24 Jan 2013 10:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=x+nDxS8bh2WGbB9oncOLrCrBVR4octP02siUflAsULY=;
	b=ImOK5OoNYlopIWvGmrpkHxWQq/B9HaMv7ntB4Hd1PWHGJo+KGeh8qws3XxPp+8wyNX
	HX/h/UBjuzCa0VEKOFiQu+OfxzfFddbCUrbRuW8Xa6LQj3UGJLMqa8Hub1bbX7294u/F
	tPsTCF2Sa35SfO6EL5QO2gnWSbZ6V1E2qejw1CwzqT0/Il/37eErsAuOl7LYZyPr/RvX
	lfWLuLVPPs8E3vr3lpRiAeivRAFUmfHJh/kyv+doxUPVV44CV1RbzpBXWvQ7HrDAxULb
	a74v+QgGibRMmmE4e/ivEr0cRhvScD8cC6jes3SWsfkzGSOgKles0e4ICXD7Dp+9uIrL
	8Bdw==
X-Received: by 10.66.82.200 with SMTP id k8mr6714948pay.56.1359050447837;
	Thu, 24 Jan 2013 10:00:47 -0800 (PST)
Received: from localhost.localdomain
	(108-71-89-7.lightspeed.sntcca.sbcglobal.net. [108.71.89.7])
	by mx.google.com with ESMTPS id wg3sm15256063pbc.28.2013.01.24.10.00.45
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 10:00:47 -0800 (PST)
From: Vishvananda Ishaya <vishvananda@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2013 10:00:40 -0800
Message-Id: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.50
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Vishvananda Ishaya <vishvananda@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] block: Create proper size file for disk
	mirror
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
X-List-Received-Date: Thu, 24 Jan 2013 18:01:14 -0000

The qmp monitor command to mirror a disk was passing -1 for size
along with the disk's backing file. This size of the resulting disk
is the size of the backing file, which is incorrect if the disk
has been resized. Therefore we should always pass in the size of
the current disk.

Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
---
Fixes https://bugs.launchpad.net/qemu/+bug/1103903

 blockdev.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 9126587..bb63162 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1259,11 +1259,11 @@ void qmp_drive_mirror(const char *device, const char *target,
         return;
     }
 
+    bdrv_get_geometry(bs, &size);
+    size *= 512;
     if (sync == MIRROR_SYNC_MODE_FULL && mode != NEW_IMAGE_MODE_EXISTING) {
         /* create new image w/o backing file */
         assert(format && drv);
-        bdrv_get_geometry(bs, &size);
-        size *= 512;
         bdrv_img_create(target, format,
                         NULL, NULL, NULL, size, flags, &local_err);
     } else {
@@ -1276,7 +1276,7 @@ void qmp_drive_mirror(const char *device, const char *target,
             bdrv_img_create(target, format,
                             source->filename,
                             source->drv->format_name,
-                            NULL, -1, flags, &local_err);
+                            NULL, size, flags, &local_err);
             break;
         default:
             abort();
-- 
1.7.9.5


