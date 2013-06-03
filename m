Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjQwy-0003YQ-JJ
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 05:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UjQws-0003QU-Jd
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 05:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UjQwq-0007DT-4k
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 05:21:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UjQwg-0007AI-74; Mon, 03 Jun 2013 05:20:54 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7EC72401ED;
	Mon,  3 Jun 2013 13:20:45 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id EF80F4F3; Mon,  3 Jun 2013 13:20:44 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 13:20:43 +0400
Message-Id: <1370251243-20352-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial] acpi: actually require either data=
	or file= for -acpitable
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
X-List-Received-Date: Mon, 03 Jun 2013 09:21:11 -0000

Initially the code ensured that we have exactly one of
data= or file= option for -acpitable.  But after some
transformations, the condition becomes

  if (has_data == has_file) { error }

to mean, probably, that both should not be set at the same
time.  But this condition does not cover the case when
neither is set, and we generate bogus acpi table in this
case.

Instead, check if sum of the two is exactly 1.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 42eeace..2815d8c 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -249,7 +249,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
     if (err) {
         goto out;
     }
-    if (hdrs->has_file == hdrs->has_data) {
+    if (!hdrs->has_file + !hdrs->has_data != 1) {
         error_setg(&err, "'-acpitable' requires one of 'data' or 'file'");
         goto out;
     }
-- 
1.7.10.4


