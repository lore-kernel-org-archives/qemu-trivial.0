Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btyqj-0005VY-4c
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:20:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqg-0005Oy-8t
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqa-0004La-6B
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:20:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1btyqI-0004FK-OF; Tue, 11 Oct 2016 11:19:46 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 479A26648;
	Tue, 11 Oct 2016 15:19:46 +0000 (UTC)
Received: from thh440s.str.redhat.com. (dhcp-192-218.str.redhat.com
	[10.33.192.218])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BFJbMO002507; Tue, 11 Oct 2016 11:19:44 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-trivial@nongnu.org,
	Michael Tsirkin <mst@redhat.com>, qemu-ppc@nongnu.org,
	Victor Kaplansky <victork@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 11 Oct 2016 17:19:37 +0200
Message-Id: <1476199177-32411-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1476199177-32411-1-git-send-email-thuth@redhat.com>
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 11 Oct 2016 15:19:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/3] tests/boot-sector: Increase time-out to
 90 seconds
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
X-List-Received-Date: Tue, 11 Oct 2016 15:20:11 -0000

Since the PXE tester runs rather slow on ppc64 with tcg, there
is a chance that we hit the 60 seconds timeout on machines that
have a heavy CPU load. So let's increase the timeout to ease
the situation.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/boot-sector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/boot-sector.c b/tests/boot-sector.c
index 8399314..e3880f4 100644
--- a/tests/boot-sector.c
+++ b/tests/boot-sector.c
@@ -106,9 +106,9 @@ void boot_sector_test(void)
     uint16_t signature;
     int i;
 
-   /* Wait at most 1 minute */
+    /* Wait at most 90 seconds */
 #define TEST_DELAY (1 * G_USEC_PER_SEC / 10)
-#define TEST_CYCLES MAX((60 * G_USEC_PER_SEC / TEST_DELAY), 1)
+#define TEST_CYCLES MAX((90 * G_USEC_PER_SEC / TEST_DELAY), 1)
 
     /* Poll until code has run and modified memory.  Once it has we know BIOS
      * initialization is done.  TODO: check that IP reached the halt
-- 
1.8.3.1


