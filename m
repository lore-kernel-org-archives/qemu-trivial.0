Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wlyfx-0003oL-Ei
	for mharc-qemu-trivial@gnu.org; Sun, 18 May 2014 06:50:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wlyfq-0003iw-Gq
	for qemu-trivial@nongnu.org; Sun, 18 May 2014 06:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wlyfk-0007M4-Hh
	for qemu-trivial@nongnu.org; Sun, 18 May 2014 06:50:34 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:53975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WlyfY-0007K4-0x; Sun, 18 May 2014 06:50:16 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so2831183wib.5
	for <multiple recipients>; Sun, 18 May 2014 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HqLkg/5qqkMW6R4GPdMZup2+Snb041HawB6qm/9yavE=;
	b=Vm5/5ln1ZfOSgOEl1BKyUsvcQ94nSIfPaEL9dgmnxn5R/cqvxn9sH4V1LSLcEJ/j04
	07xQWlbRUGIpH7FmzGZ64rFpL9aVj4glLLdTdiwqdUkt17r8PsCkJnt6AwFeO5m3nQSD
	bRkuTN5x4/p0L7dOXU1VYzUH+kYjiNnbYW6OHtVUsFalau6vJ2DEFq+4yGj0wSriAMXg
	t+JbEBCMcAVMkysGiOlyUku+j+L+Yxt9fg0RfXZTEcNU7DYdct1tX/7NnIy4NrEaKsZP
	vt9KItGGGj7eg0ZFRTzmauB7bNlMTTqoBFDqR1C4HaXlEhYETawoFM6QaHdxFBeV9pFq
	GMzA==
X-Received: by 10.180.96.225 with SMTP id dv1mr7166307wib.37.1400410214545;
	Sun, 18 May 2014 03:50:14 -0700 (PDT)
Received: from localhost.localdomain ([41.104.79.242])
	by mx.google.com with ESMTPSA id pm6sm2228191wjc.25.2014.05.18.03.50.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 18 May 2014 03:50:13 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 18 May 2014 11:50:04 +0100
Message-Id: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kwolf@redhat.com,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] nbd: Don't export a block device with no
	medium.
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
X-List-Received-Date: Sun, 18 May 2014 10:50:40 -0000

The device is exported with erroneous values and can't be read.

Before the patch:
$ sudo nbd-client localhost -p 10809 /dev/nbd0 -name floppy0
Negotiation: ..size = 17592186044415MB
bs=1024, sz=18446744073709547520 bytes

$ sudo mount /dev/nbd0 /mnt/tmp/
mount: block device /dev/nbd0 is write-protected, mounting read-only
mount: /dev/nbd0: can't read superblock

After the patch:
(qemu) nbd_server_add ide0-hd0
(qemu) nbd_server_add floppy0
Device 'floppy0' has no medium

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 blockdev-nbd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 922cf56..a700d52 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -91,6 +91,10 @@ void qmp_nbd_server_add(const char *device, bool has_writable, bool writable,
         error_set(errp, QERR_DEVICE_NOT_FOUND, device);
         return;
     }
+    if (!bdrv_is_inserted(bs)) {
+        error_set(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
+        return;
+    }
 
     if (!has_writable) {
         writable = false;
-- 
1.8.3.2


