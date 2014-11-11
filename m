Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCij-0002lQ-E9
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:47:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCib-0002XI-TS
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiX-00082T-Gp
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCiJ-0007yX-TO; Tue, 11 Nov 2014 09:46:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 193DD41DF5;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EC8F46D9;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: (nullmailer pid 14577 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:31 +0300
Message-Id: <8f9d989cac7bd92fb976d65d0aada2d4c6d8ecf9.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Chen Fan <chen.fan.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/11] target-i386: cpu: keeping function
	parameters alignment on new line
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
X-List-Received-Date: Tue, 11 Nov 2014 14:46:58 -0000

From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/cpu.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index e4ccee1..236bbee 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -533,8 +533,8 @@ void host_cpuid(uint32_t function, uint32_t count,
  * otherwise the string is assumed to sized by a terminating nul.
  * Return lexical ordering of *s1:*s2.
  */
-static int sstrcmp(const char *s1, const char *e1, const char *s2,
-    const char *e2)
+static int sstrcmp(const char *s1, const char *e1,
+                   const char *s2, const char *e2)
 {
     for (;;) {
         if (!*s1 || !*s2 || *s1 != *s2)
@@ -1845,7 +1845,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
  * if flags, suppress names undefined in featureset.
  */
 static void listflags(char *buf, int bufsize, uint32_t fbits,
-    const char **featureset, uint32_t flags)
+                      const char **featureset, uint32_t flags)
 {
     const char **p = &featureset[31];
     char *q, *b, bit;
-- 
1.7.10.4


