Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvnWh-0001Ez-Uk
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 06:20:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1TvnWf-00018b-H8
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:20:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1TvnWe-0001gc-Dk
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:20:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Tvn6a-0004Fs-0Q; Thu, 17 Jan 2013 05:53:56 -0500
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4AFD1A1277;
	Thu, 17 Jan 2013 14:53:55 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id C6979423; Thu, 17 Jan 2013 14:53:53 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 17 Jan 2013 14:53:52 +0400
Message-Id: <1358420032-25275-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: TeLeMan <geleman@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [Trivial PATCH] acpitable: open the data file in
	binary mode
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
X-List-Received-Date: Thu, 17 Jan 2013 11:20:54 -0000

-acpitable {file|data}=file reads the content of file, but it is
in binary form, so the file should be opened usin O_BINARY flag.
On *nix it is a no-op, but on windows and other weird platform
it is really needed.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi.c b/hw/acpi.c
index 5d521e5..49510be 100644
--- a/hw/acpi.c
+++ b/hw/acpi.c
@@ -115,7 +115,7 @@ int acpi_table_add(const char *t)
     /* now read in the data files, reallocating buffer as needed */
 
     for (f = strtok(buf, ":"); f; f = strtok(NULL, ":")) {
-        int fd = open(f, O_RDONLY);
+        int fd = open(f, O_RDONLY | O_BINARY);
 
         if (fd < 0) {
             fprintf(stderr, "can't open file %s: %s\n", f, strerror(errno));
-- 
1.7.10.4


