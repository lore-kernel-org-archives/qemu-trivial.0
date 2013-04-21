Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UTuLT-0001Ps-FI
	for mharc-qemu-trivial@gnu.org; Sun, 21 Apr 2013 09:30:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UTuLP-0001IE-62
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 09:30:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UTuLM-0002MV-SO
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 09:30:15 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:56726 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UTuLI-0002LC-12; Sun, 21 Apr 2013 09:30:08 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UTuLD-0004Ky-Hh; Sun, 21 Apr 2013 14:30:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 21 Apr 2013 14:30:03 +0100
Message-Id: <1366551003-16649-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qtest: Handle addresses and values for {in,
	out}[bwl] as unsigned
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
X-List-Received-Date: Sun, 21 Apr 2013 13:30:18 -0000

Handle the addresses and values for {in,out}[bwl] as unsigned (ie
with strtoul), as per the protocol specification comment. This fixes
a test failure in test_i440fx_defaults on 32-bit hosts where the test
tries to write 0x80000000 and qtest was instead writing 0x7fffffff.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This fixes the actual parsing error; checking strtol errors is
a separate bug which should be done for the whole file.

 qtest.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qtest.c b/qtest.c
index 3bba3e5..07a9612 100644
--- a/qtest.c
+++ b/qtest.c
@@ -271,8 +271,8 @@ static void qtest_process_command(CharDriverState *chr, gchar **words)
         uint32_t value;
 
         g_assert(words[1] && words[2]);
-        addr = strtol(words[1], NULL, 0);
-        value = strtol(words[2], NULL, 0);
+        addr = strtoul(words[1], NULL, 0);
+        value = strtoul(words[2], NULL, 0);
 
         if (words[0][3] == 'b') {
             cpu_outb(addr, value);
@@ -290,7 +290,7 @@ static void qtest_process_command(CharDriverState *chr, gchar **words)
         uint32_t value = -1U;
 
         g_assert(words[1]);
-        addr = strtol(words[1], NULL, 0);
+        addr = strtoul(words[1], NULL, 0);
 
         if (words[0][2] == 'b') {
             value = cpu_inb(addr);
-- 
1.7.10.4


