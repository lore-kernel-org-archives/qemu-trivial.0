Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08w7-0004PW-Ux
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:19:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08w3-0004LM-I4
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vz-0004fP-K5
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08vs-0004XV-RE; Fri, 28 Oct 2016 11:19:00 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02EBC43731;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C82A7B4A;
	Fri, 28 Oct 2016 18:18:56 +0300 (MSK)
Received: (nullmailer pid 6048 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:33 +0300
Message-Id: <5f333d79a4337b390fa4103e270d2bdaf243aad6.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/23] hw/tpm/tpm_passthrough: Simplify
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
X-List-Received-Date: Fri, 28 Oct 2016 15:19:12 -0000

From: Thomas Huth <thuth@redhat.com>

The condition  '!A || (A && B)' is equivalent to '!A || B'

Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


