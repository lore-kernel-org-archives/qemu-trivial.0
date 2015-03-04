Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTE0J-0002RC-L6
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 13:26:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0G-0002Iv-Bj
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0F-00022t-EB
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTE0A-00020j-1N; Wed, 04 Mar 2015 13:26:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D2C3B408CF;
	Wed,  4 Mar 2015 21:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9CDCF946;
	Wed,  4 Mar 2015 20:07:07 +0300 (MSK)
Received: (nullmailer pid 17499 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:25 +0300
Message-Id: <7a22aeb9f186ae10730bcd31f70a2acd8f81a728.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/47] cutils: refine strtol error handling in
	parse_debug_env
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
X-List-Received-Date: Wed, 04 Mar 2015 18:26:41 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Avoid truncation of a 64-bit long to a 32-bit int, and check for errno
(especially ERANGE).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/cutils.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index dbe7412..9312e45 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -523,16 +523,17 @@ int parse_debug_env(const char *name, int max, int initial)
 {
     char *debug_env = getenv(name);
     char *inv = NULL;
-    int debug;
+    long debug;
 
     if (!debug_env) {
         return initial;
     }
+    errno = 0;
     debug = strtol(debug_env, &inv, 10);
     if (inv == debug_env) {
         return initial;
     }
-    if (debug < 0 || debug > max) {
+    if (debug < 0 || debug > max || errno != 0) {
         fprintf(stderr, "warning: %s not in [0, %d]", name, max);
         return initial;
     }
-- 
2.1.4


