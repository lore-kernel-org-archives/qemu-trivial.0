Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPoV-0003cW-Fh
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:44:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPoS-0003XH-9d
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:44:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPoR-0005r6-F2
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:44:52 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:20106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPoM-0005pI-T7; Thu, 03 Mar 2016 04:44:47 -0500
Received: from 172.24.1.48 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCN05974; Thu, 03 Mar 2016 17:44:37 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:52 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:39 +0800
Message-ID: <1456998223-12356-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.56D80786.0054, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c605072bbb0049f41171f28fc3f45632
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 2/6] sheepdog: fix possible resouce leak and
	out-of-bounds access
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
X-List-Received-Date: Thu, 03 Mar 2016 09:44:53 -0000

CID 1352418 (#1 of 1): Out-of-bounds access (INCOMPATIBLE_CAST)
incompatible_cast: Pointer &snap_id points to an object whose effective
type is unsigned int (32 bits, unsigned) but is dereferenced as a wider
unsigned long (64 bits, unsigned). This may lead to memory corruption.

We also need to free local_err when ret is not equals to 0.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 block/sheepdog.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index 8739acc..3d81bba 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -2543,7 +2543,7 @@ static int sd_snapshot_delete(BlockDriverState *bs,
                               const char *name,
                               Error **errp)
 {
-    uint32_t snap_id = 0;
+    unsigned long snap_id = 0;
     char snap_tag[SD_MAX_VDI_TAG_LEN];
     Error *local_err = NULL;
     int fd, ret;
@@ -2565,20 +2565,23 @@ static int sd_snapshot_delete(BlockDriverState *bs,
     memset(buf, 0, sizeof(buf));
     memset(snap_tag, 0, sizeof(snap_tag));
     pstrcpy(buf, SD_MAX_VDI_LEN, s->name);
-    if (qemu_strtoul(snapshot_id, NULL, 10, (unsigned long *)&snap_id)) {
+    if (qemu_strtoul(snapshot_id, NULL, 10, &snap_id)) {
         return -1;
     }
 
     if (snap_id) {
+        assert(snap_id <= UINT_MAX);
+
         hdr.snapid = snap_id;
     } else {
         pstrcpy(snap_tag, sizeof(snap_tag), snapshot_id);
         pstrcpy(buf + SD_MAX_VDI_LEN, SD_MAX_VDI_TAG_LEN, snap_tag);
     }
 
-    ret = find_vdi_name(s, s->name, snap_id, snap_tag, &vid, true,
+    ret = find_vdi_name(s, s->name, hdr.snapid, snap_tag, &vid, true,
                         &local_err);
     if (ret) {
+        error_report_err(local_err);
         return ret;
     }
 
-- 
1.8.5.2



