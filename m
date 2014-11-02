Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktoM-0005vh-7m
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:59:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoG-0005kr-5C
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoB-0002Tb-M5
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:04 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkto1-0002Rk-Ez; Sun, 02 Nov 2014 06:58:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 587B8402BE;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2D8DE705;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14958 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:16 +0300
Message-Id: <11693a6cf0c3fac2e0ad64f06978095f85f0ec8a.1414929284.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/23] target-xtensa: mark XtensaConfig
	structs as unused
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
X-List-Received-Date: Sun, 02 Nov 2014 11:59:09 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The XtensaConfig structs will be defined but not used if they are
for the opposite endianness from that of the binary being built;
keep the compiler from complaining about this by marking them
with the 'unused' attribute.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-xtensa/core-dc232b.c |    2 +-
 target-xtensa/core-dc233c.c |    2 +-
 target-xtensa/core-fsf.c    |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-xtensa/core-dc232b.c b/target-xtensa/core-dc232b.c
index c51e11e..a3b914b 100644
--- a/target-xtensa/core-dc232b.c
+++ b/target-xtensa/core-dc232b.c
@@ -33,7 +33,7 @@
 #include "core-dc232b/core-isa.h"
 #include "overlay_tool.h"
 
-static const XtensaConfig dc232b = {
+static const XtensaConfig dc232b __attribute__((unused)) = {
     .name = "dc232b",
     .gdb_regmap = {
         .num_regs = 120,
diff --git a/target-xtensa/core-dc233c.c b/target-xtensa/core-dc233c.c
index 42dd64f..ac745d1 100644
--- a/target-xtensa/core-dc233c.c
+++ b/target-xtensa/core-dc233c.c
@@ -34,7 +34,7 @@
 #include "core-dc233c/core-isa.h"
 #include "overlay_tool.h"
 
-static const XtensaConfig dc233c = {
+static const XtensaConfig dc233c __attribute__((unused)) = {
     .name = "dc233c",
     .gdb_regmap = {
         .num_regs = 121,
diff --git a/target-xtensa/core-fsf.c b/target-xtensa/core-fsf.c
index 6859bee..cfcc840 100644
--- a/target-xtensa/core-fsf.c
+++ b/target-xtensa/core-fsf.c
@@ -33,7 +33,7 @@
 #include "core-fsf/core-isa.h"
 #include "overlay_tool.h"
 
-static const XtensaConfig fsf = {
+static const XtensaConfig fsf __attribute__((unused)) = {
     .name = "fsf",
     /* GDB for this core is not supported currently */
     .clock_freq_khz = 10000,
-- 
1.7.10.4


