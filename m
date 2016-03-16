Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agQsu-0003Pp-Vd
	for mharc-qemu-trivial@gnu.org; Thu, 17 Mar 2016 01:54:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@us.ibm.com>) id 1agIBB-00071X-DK
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 16:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@us.ibm.com>) id 1agIB6-0005qD-S5
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 16:36:29 -0400
Received: from e17.ny.us.ibm.com ([129.33.205.207]:42857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@us.ibm.com>) id 1agIB6-0005px-Oc
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 16:36:24 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@us.ibm.com>;
	Wed, 16 Mar 2016 16:36:22 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 16 Mar 2016 16:36:19 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stefanb@us.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
	[9.57.198.26])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 76B03C90042;
	Wed, 16 Mar 2016 16:36:15 -0400 (EDT)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u2GKaJJm13303962; Wed, 16 Mar 2016 20:36:19 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	u2GKaIP4001165; Wed, 16 Mar 2016 16:36:18 -0400
Received: from sbct-3.watson.ibm.com (sbct-3.watson.ibm.com [9.2.141.158])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	u2GKaI9m001132; Wed, 16 Mar 2016 16:36:18 -0400
From: Stefan Berger <stefanb@us.ibm.com>
To: qemu-trivial@nongnu.org
Date: Wed, 16 Mar 2016 16:36:16 -0400
Message-Id: <1458160576-1076-1-git-send-email-stefanb@us.ibm.com>
X-Mailer: git-send-email 2.4.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16031620-0041-0000-0000-0000039C56B0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 129.33.205.207
X-Mailman-Approved-At: Thu, 17 Mar 2016 01:54:11 -0400
Cc: Stefan Berger <stefanb@us.ibm.com>, qemu-devel@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] tpm: Fix write to file descriptor function
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
X-List-Received-Date: Wed, 16 Mar 2016 20:36:30 -0000

Fix a bug introduced in 46f296c while moving send_all to the
tpm_passthrough code.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_passthrough.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index e98efb7..e88c0d2 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -86,7 +86,7 @@ static int tpm_passthrough_unix_write(int fd, const uint8_t *buf, uint32_t len)
     int ret, remain;
 
     remain = len;
-    while (len > 0) {
+    while (remain > 0) {
         ret = write(fd, buf, remain);
         if (ret < 0) {
             if (errno != EINTR && errno != EAGAIN) {
-- 
2.4.3


