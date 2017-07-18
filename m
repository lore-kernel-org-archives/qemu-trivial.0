Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXVKm-0000dD-2O
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 12:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKk-0000bM-4z
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKj-00014M-Ba
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:50 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dXVKg-0000zb-UE; Tue, 18 Jul 2017 12:26:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dXVKW-000549-0Y; Tue, 18 Jul 2017 17:26:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 18 Jul 2017 17:26:31 +0100
Message-Id: <1500395194-21455-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH for-2.10 1/4] bsd-user/mmap.c: Move __thread
 attribute to right place
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
X-List-Received-Date: Tue, 18 Jul 2017 16:26:51 -0000

Avoid a compiler warning on OpenBSD:
bsd-user/mmap.c:28:1: warning: '__thread' is not at beginning of declaration [-Wold-style-declaration]
by moving the __thread attribute to its proper place.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 7f2018e..20cd29d 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -25,7 +25,7 @@
 //#define DEBUG_MMAP
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
-static int __thread mmap_lock_count;
+static __thread int mmap_lock_count;
 
 void mmap_lock(void)
 {
-- 
2.7.4


