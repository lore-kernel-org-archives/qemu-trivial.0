Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anbEX-0007kU-Vz
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 20:22:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@us.ibm.com>) id 1anbEV-0007iU-2R
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 20:22:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@us.ibm.com>) id 1anbES-0003MD-Ry
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 20:22:07 -0400
Received: from e35.co.us.ibm.com ([32.97.110.153]:34183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@us.ibm.com>) id 1anbES-0003KN-G8
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 20:22:04 -0400
Received: from localhost
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@us.ibm.com>;
	Tue, 5 Apr 2016 18:22:01 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 5 Apr 2016 18:21:59 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stefanb@us.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b03cxnp08027.gho.boulder.ibm.com
	(b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id BEFE53E40052;
	Tue,  5 Apr 2016 18:21:58 -0600 (MDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u360LwPs35127500; Tue, 5 Apr 2016 17:21:58 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id u360LwfZ024695; Tue, 5 Apr 2016 18:21:58 -0600
Received: from sbct-3.watson.ibm.com (sbct-3.watson.ibm.com [9.2.141.158])
	by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	u360Lvdp024648; Tue, 5 Apr 2016 18:21:57 -0600
From: Stefan Berger <stefanb@us.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Tue,  5 Apr 2016 20:21:50 -0400
Message-Id: <1459902110-9856-1-git-send-email-stefanb@us.ibm.com>
X-Mailer: git-send-email 2.5.5
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16040600-0013-0000-0000-000025041F8A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.153
Cc: Stefan Berger <stefanb@us.ibm.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] tpm: Fix write to file descriptor function
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
X-List-Received-Date: Wed, 06 Apr 2016 00:22:08 -0000

Fix a bug introduced in commit 46f296c while moving send_all to the
tpm_passthrough code. Fix the name of the variable used in the loop.

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
2.5.5


