Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlwEc-0001gy-WF
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 03:46:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XlwEW-0001ft-SI
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 03:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XlwES-0006vf-8Y
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 03:46:28 -0500
Received: from [59.151.112.132] (port=52024 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XlwER-0006ug-Gi; Wed, 05 Nov 2014 03:46:23 -0500
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="42884469"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Nov 2014 16:43:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sA58jtbQ026309;
	Wed, 5 Nov 2014 16:46:05 +0800
Received: from G08FNSTD131468.g08.fujitsu.local (10.167.226.78) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Nov 2014 16:46:17 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
To: <qemu-trivial@nongnu.org>
Date: Wed, 5 Nov 2014 16:40:33 +0800
Message-ID: <1415176833-26438-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.78]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-i386: cpu: keeping function
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
X-List-Received-Date: Wed, 05 Nov 2014 08:46:33 -0000

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
---
 target-i386/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index fa860de..3f13dfe 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -540,8 +540,8 @@ void host_cpuid(uint32_t function, uint32_t count,
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
@@ -1859,7 +1859,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
  * if flags, suppress names undefined in featureset.
  */
 static void listflags(char *buf, int bufsize, uint32_t fbits,
-    const char **featureset, uint32_t flags)
+                      const char **featureset, uint32_t flags)
 {
     const char **p = &featureset[31];
     char *q, *b, bit;
-- 
1.9.3


