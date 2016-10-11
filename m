Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btyqW-0005Gz-5j
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:20:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqT-0005Dy-F8
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqO-0004Hw-K4
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:19:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1btyqG-0004Ed-Pv; Tue, 11 Oct 2016 11:19:45 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54C58935C7;
	Tue, 11 Oct 2016 15:19:44 +0000 (UTC)
Received: from thh440s.str.redhat.com. (dhcp-192-218.str.redhat.com
	[10.33.192.218])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BFJbMN002507; Tue, 11 Oct 2016 11:19:42 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-trivial@nongnu.org,
	Michael Tsirkin <mst@redhat.com>, qemu-ppc@nongnu.org,
	Victor Kaplansky <victork@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 11 Oct 2016 17:19:36 +0200
Message-Id: <1476199177-32411-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1476199177-32411-1-git-send-email-thuth@redhat.com>
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 11 Oct 2016 15:19:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/3] tests/boot-sector: Use mkstemp() to
 create a unique file name
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
X-List-Received-Date: Tue, 11 Oct 2016 15:19:58 -0000

The pxe-test is run for three different targets now (x86_64, i386
and ppc64), and the bios-tables-test is run for two targets (x86_64
and i386). But each of the tests is using an invariant name for the
disk image with the boot sector code - so if the tests are running in
parallel, there is a race condition that they destroy the disk image
of a parallel test program. Let's use mkstemp() to create unique
temporary files here instead - and since mkstemp() is returning an
integer file descriptor instead of a FILE pointer, we also switch
the fwrite() and fclose() to write() and close() instead.

Reported-by: Sascha Silbe <x-qemu@se-silbe.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/bios-tables-test.c |  2 +-
 tests/boot-sector.c      | 17 ++++++++++++-----
 tests/boot-sector.h      |  4 ++--
 tests/pxe-test.c         |  2 +-
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 6ea2b6d..812f830 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -112,7 +112,7 @@ typedef struct {
     g_assert_cmpstr(ACPI_ASSERT_CMP_str, ==, expected); \
 } while (0)
 
-static const char *disk = "tests/acpi-test-disk.raw";
+static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/acpi-test-data";
 #ifdef CONFIG_IASL
 static const char *iasl = stringify(CONFIG_IASL);
diff --git a/tests/boot-sector.c b/tests/boot-sector.c
index 0168fd0..8399314 100644
--- a/tests/boot-sector.c
+++ b/tests/boot-sector.c
@@ -69,12 +69,13 @@ static uint8_t boot_sector[0x7e000] = {
 };
 
 /* Create boot disk file.  */
-int boot_sector_init(const char *fname)
+int boot_sector_init(char *fname)
 {
-    FILE *f = fopen(fname, "w");
+    int fd, ret;
     size_t len = sizeof boot_sector;
 
-    if (!f) {
+    fd = mkstemp(fname);
+    if (fd < 0) {
         fprintf(stderr, "Couldn't open \"%s\": %s", fname, strerror(errno));
         return 1;
     }
@@ -86,8 +87,14 @@ int boot_sector_init(const char *fname)
                 HIGH(SIGNATURE), BOOT_SECTOR_ADDRESS + SIGNATURE_OFFSET + 1);
     }
 
-    fwrite(boot_sector, 1, len, f);
-    fclose(f);
+    ret = write(fd, boot_sector, len);
+    close(fd);
+
+    if (ret != len) {
+        fprintf(stderr, "Could not write \"%s\"", fname);
+        return 1;
+    }
+
     return 0;
 }
 
diff --git a/tests/boot-sector.h b/tests/boot-sector.h
index f64b477..35d61c7 100644
--- a/tests/boot-sector.h
+++ b/tests/boot-sector.h
@@ -14,8 +14,8 @@
 #ifndef TEST_BOOT_SECTOR_H
 #define TEST_BOOT_SECTOR_H
 
-/* Create boot disk file.  */
-int boot_sector_init(const char *fname);
+/* Create boot disk file. fname must be a suitable string for mkstemp() */
+int boot_sector_init(char *fname);
 
 /* Loop until signature in memory is OK.  */
 void boot_sector_test(void);
diff --git a/tests/pxe-test.c b/tests/pxe-test.c
index 5d3ddbe..34282d3 100644
--- a/tests/pxe-test.c
+++ b/tests/pxe-test.c
@@ -19,7 +19,7 @@
 
 #define NETNAME "net0"
 
-static const char *disk = "tests/pxe-test-disk.raw";
+static char disk[] = "tests/pxe-test-disk-XXXXXX";
 
 static void test_pxe_one(const char *params, bool ipv6)
 {
-- 
1.8.3.1


