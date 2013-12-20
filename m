Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VtuA5-0000VB-EV
	for mharc-qemu-trivial@gnu.org; Fri, 20 Dec 2013 02:06:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Vtu9y-0000Mq-Cy
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 02:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Vtu9s-0006Bc-Er
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 02:06:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:21168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Vtu9g-0006BB-7C; Fri, 20 Dec 2013 02:05:52 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBK75j5N010896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 20 Dec 2013 02:05:45 -0500
Received: from ad.nay.redhat.com ([10.66.6.190])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBK75ewI006982; Fri, 20 Dec 2013 02:05:41 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Dec 2013 15:05:31 +0800
Message-Id: <1387523131-15647-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Marcel Apfelbaum <marcel.a@redhat.com>
Subject: [Qemu-trivial] [PATCH] acpi unit-test: Create temporary disk file
	under /tmp
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
X-List-Received-Date: Fri, 20 Dec 2013 07:06:16 -0000

As other tests, the image file is created in /tmp other than current
dir. Thus there will not be an unignored file under tests for intree
build.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/acpi-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acpi-test.c b/tests/acpi-test.c
index ca83b1d6..e4f31b7 100644
--- a/tests/acpi-test.c
+++ b/tests/acpi-test.c
@@ -116,7 +116,7 @@ static uint8_t boot_sector[0x200] = {
     [0x1FF] = 0xAA,
 };
 
-static const char *disk = "tests/acpi-test-disk.raw";
+static const char *disk = "/tmp/qtest-acpi-test-disk.raw";
 
 static void free_test_data(test_data *data)
 {
-- 
1.8.5.1


