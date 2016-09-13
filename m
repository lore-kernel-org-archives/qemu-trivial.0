Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqMD-0006ST-BQ
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM8-0006NL-1q
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM3-00088d-VU
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqLv-0007lS-0s; Tue, 13 Sep 2016 12:14:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 15FB9416DF;
	Tue, 13 Sep 2016 19:14:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 350D4AFD;
	Tue, 13 Sep 2016 19:07:40 +0300 (MSK)
Received: (nullmailer pid 31896 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:45 +0300
Message-Id: <a337f295defad7eb977da4d6317cf70f7f2fa4b4.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/16] sparc: Use g_memdup() instead of
 g_new0() + memcpy()
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
X-List-Received-Date: Tue, 13 Sep 2016 16:14:48 -0000

From: Thomas Huth <thuth@redhat.com>

There is no need to make sure that the memory is zeroed after the
allocation if we also immediatly fill the whole buffer afterwards
with memcpy(). Thus g_new0 should be g_new instead. But since we
are also doing a memcpy() here, we can also simply replace both
with g_memdup() instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-sparc/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
index e4089f2..800a25a 100644
--- a/target-sparc/cpu.c
+++ b/target-sparc/cpu.c
@@ -117,8 +117,7 @@ static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
         return -1;
     }
 
-    env->def = g_new0(sparc_def_t, 1);
-    memcpy(env->def, def, sizeof(*def));
+    env->def = g_memdup(def, sizeof(*def));
 
     featurestr = strtok(NULL, ",");
     sparc_cpu_parse_features(CPU(cpu), featurestr, &err);
-- 
2.1.4


