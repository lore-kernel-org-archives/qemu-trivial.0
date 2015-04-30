Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhwL-0005ef-Jk
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 02:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwD-0005MX-K0
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwC-0002bD-TJ
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynhw7-0002Z6-98; Thu, 30 Apr 2015 02:27:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DD54442BA5;
	Thu, 30 Apr 2015 09:27:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4EFA7959;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4356 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:44 +0300
Message-Id: <f4514eab7d088bc26e3e5c7f7d405b40ff0f5d8c.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 31/42] cpus: use first_cpu macro instead of
	QTAILQ_FIRST(&cpus)
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
X-List-Received-Date: Thu, 30 Apr 2015 06:27:10 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index e6dcae3..62d157a 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1016,7 +1016,7 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
     qemu_cond_signal(&qemu_cpu_cond);
 
     /* wait for initial kick-off after machine start */
-    while (QTAILQ_FIRST(&cpus)->stopped) {
+    while (first_cpu->stopped) {
         qemu_cond_wait(tcg_halt_cond, &qemu_global_mutex);
 
         /* process any pending work */
-- 
2.1.4


