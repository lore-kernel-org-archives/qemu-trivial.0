Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsGuR-0000NT-Pt
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2013 12:54:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TsGuM-0000LV-FI
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:54:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TsGuK-0000kA-4T
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:54:46 -0500
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:37009 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TsGuJ-0000h1-U0
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:54:44 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TsGWJ-00034H-FH; Mon, 07 Jan 2013 17:29:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jan 2013 17:29:55 +0000
Message-Id: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qga/channel-posix.c: Explicitly include
	string.h
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
X-List-Received-Date: Mon, 07 Jan 2013 17:54:50 -0000

Explicitly include string.h to avoid warnings under MacOS X/clang
about implicit declarations of strerror() and strlen().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I assume under Linux these are implicitly dragged in via one of the
other headers.

 qga/channel-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index d4fd628..ca9e4aa 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -4,6 +4,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <stdlib.h>
+#include <string.h>
 #include "qemu/osdep.h"
 #include "qemu/sockets.h"
 #include "qga/channel.h"
-- 
1.7.11.4


