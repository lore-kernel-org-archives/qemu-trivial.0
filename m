Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y3RQG-0000eZ-4l
	for mharc-qemu-trivial@gnu.org; Tue, 23 Dec 2014 10:30:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1Y3RQD-0000bH-78
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 10:30:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1Y3RQC-0003tH-9w
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 10:30:53 -0500
Received: from mail.lekensteyn.nl ([2a02:2308::360:1:25]:43137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1Y3RQ6-0003qg-G1; Tue, 23 Dec 2014 10:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2014-q3; 
	h=Message-Id:Date:Subject:Cc:To:From;
	bh=TIRYH5fCHT/sIOvrhi65mrFAsavu96cVKa8fulIZNaY=; 
	b=KUloAy3LAvWawonPke1oJ1gZebvhKHP2kDIFirO7S225yURaIyUPymCGiRxfaItB4CPYiFxtzEZdXHw4JPV3DD5MeF9zFGHmUOdO2XsDArpZor+hS5KDBv/d39Qc0ASLy3/YLKZ9k1rCPJ8kqDjhAcTL7TLP+sk+cIdsigqCIwqVxRUZ91uUnDUXLHSKvNOz/RjZAzo84xDcU+U6hZcu+9GH9dk9RtWnWC5F4uW3JBsl6Jhl4JoFQLAnUXwNkmZNzuYQGlqqX0nRJga+mZBfGBb8Ybz0RKAaR+DomE6mTyxVscBQMMSCzwwr1SAA0U6VyHy3Duod+CW4b/CwFJyHew==;
Received: by lekensteyn.nl with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA256:128)
	(Exim 4.80) (envelope-from <peter@lekensteyn.nl>)
	id 1Y3RQ2-0000IQ-PB; Tue, 23 Dec 2014 16:30:43 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: Peter Lieven <pl@kamp.de>,
	qemu-devel@nongnu.org
Date: Tue, 23 Dec 2014 16:30:41 +0100
Message-Id: <1419348641-20955-1-git-send-email-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.2.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2308::360:1:25
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] block/iscsi: fix uninitialized variable
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
X-List-Received-Date: Tue, 23 Dec 2014 15:30:54 -0000

'ret' was never initialized in the success path.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
Hi,

Found this warning when compiling with --enable-debug. This issue was previously
fixed as part of Peter Lieven's patch series[1] but it never seemed to get
merged.

Kinds regards,
Peter

 [1]: https://lists.gnu.org/archive/html/qemu-devel/2014-03/msg04279.html
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index ed375fc..12ddbfb 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1286,7 +1286,7 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
     QemuOpts *opts;
     Error *local_err = NULL;
     const char *filename;
-    int i, ret;
+    int i, ret = 0;
 
     if ((BDRV_SECTOR_SIZE % 512) != 0) {
         error_setg(errp, "iSCSI: Invalid BDRV_SECTOR_SIZE. "
-- 
2.2.1


