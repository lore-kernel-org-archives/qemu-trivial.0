Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btyqX-0005IC-BS
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:20:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqV-0005FY-3J
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqT-0004Jq-SU
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:19:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1btyqE-0004Dp-Ts; Tue, 11 Oct 2016 11:19:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EA93C05AA61;
	Tue, 11 Oct 2016 15:19:42 +0000 (UTC)
Received: from thh440s.str.redhat.com. (dhcp-192-218.str.redhat.com
	[10.33.192.218])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BFJbMM002507; Tue, 11 Oct 2016 11:19:40 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-trivial@nongnu.org,
	Michael Tsirkin <mst@redhat.com>, qemu-ppc@nongnu.org,
	Victor Kaplansky <victork@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 11 Oct 2016 17:19:35 +0200
Message-Id: <1476199177-32411-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1476199177-32411-1-git-send-email-thuth@redhat.com>
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 11 Oct 2016 15:19:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/3] tests/boot-sector: Use minimum length
 for the Forth boot script
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
X-List-Received-Date: Tue, 11 Oct 2016 15:20:00 -0000

The pxe-test is quite slow on ppc64 with tcg. We can speed it up
a little bit by decreasing the size of the file that has to be
loaded via TFTP.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/boot-sector.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/boot-sector.c b/tests/boot-sector.c
index e3193c0..0168fd0 100644
--- a/tests/boot-sector.c
+++ b/tests/boot-sector.c
@@ -72,6 +72,7 @@ static uint8_t boot_sector[0x7e000] = {
 int boot_sector_init(const char *fname)
 {
     FILE *f = fopen(fname, "w");
+    size_t len = sizeof boot_sector;
 
     if (!f) {
         fprintf(stderr, "Couldn't open \"%s\": %s", fname, strerror(errno));
@@ -80,13 +81,12 @@ int boot_sector_init(const char *fname)
 
     /* For Open Firmware based system, we can use a Forth script instead */
     if (strcmp(qtest_get_arch(), "ppc64") == 0) {
-        memset(boot_sector, ' ', sizeof boot_sector);
-        sprintf((char *)boot_sector, "\\ Bootscript\n%x %x c! %x %x c!\n",
+        len = sprintf((char *)boot_sector, "\\ Bootscript\n%x %x c! %x %x c!\n",
                 LOW(SIGNATURE), BOOT_SECTOR_ADDRESS + SIGNATURE_OFFSET,
                 HIGH(SIGNATURE), BOOT_SECTOR_ADDRESS + SIGNATURE_OFFSET + 1);
     }
 
-    fwrite(boot_sector, 1, sizeof boot_sector, f);
+    fwrite(boot_sector, 1, len, f);
     fclose(f);
     return 0;
 }
-- 
1.8.3.1


