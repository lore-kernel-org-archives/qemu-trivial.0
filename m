Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buLXa-0003bE-14
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 11:33:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buLXX-0003Z6-CK
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buLXV-00089W-9D
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:33:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1buLXP-000870-Q9; Wed, 12 Oct 2016 11:33:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 110EA4E02D;
	Wed, 12 Oct 2016 15:33:47 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9CFXjVq023522; Wed, 12 Oct 2016 11:33:45 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Wed, 12 Oct 2016 17:33:44 +0200
Message-Id: <1476286424-9744-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 12 Oct 2016 15:33:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/tpm/tpm_passthrough: Simplify
 if-statements a little bit
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2016 15:33:56 -0000

The condition  '!A || (A && B)' is equivalent to '!A || B'

Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/tpm/tpm_passthrough.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index e88c0d2..9234eb3 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -165,8 +165,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
 
     ret = tpm_passthrough_unix_write(tpm_pt->tpm_fd, in, in_len);
     if (ret != in_len) {
-        if (!tpm_pt->tpm_op_canceled ||
-            (tpm_pt->tpm_op_canceled && errno != ECANCELED)) {
+        if (!tpm_pt->tpm_op_canceled || errno != ECANCELED) {
             error_report("tpm_passthrough: error while transmitting data "
                          "to TPM: %s (%i)",
                          strerror(errno), errno);
@@ -178,8 +177,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
 
     ret = tpm_passthrough_unix_read(tpm_pt->tpm_fd, out, out_len);
     if (ret < 0) {
-        if (!tpm_pt->tpm_op_canceled ||
-            (tpm_pt->tpm_op_canceled && errno != ECANCELED)) {
+        if (!tpm_pt->tpm_op_canceled || errno != ECANCELED) {
             error_report("tpm_passthrough: error while reading data from "
                          "TPM: %s (%i)",
                          strerror(errno), errno);
-- 
1.8.3.1


