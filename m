Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsKj1-0000ZV-UT
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jul 2012 17:27:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SsKik-0000Ho-9T
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2012 17:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SsKib-0007yB-CZ
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2012 17:26:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SsKi5-0007pQ-I0; Fri, 20 Jul 2012 17:26:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0D4AE72800A0; Fri, 20 Jul 2012 23:26:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id yTjdjSFnPa0P; Fri, 20 Jul 2012 23:26:03 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 7EE1972800C8; Fri, 20 Jul 2012 23:26:03 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 20 Jul 2012 23:26:02 +0200
Message-Id: <1342819562-11053-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix some more Qemus in documentation and
	help text
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
X-List-Received-Date: Fri, 20 Jul 2012 21:27:02 -0000

Hopefully they will be eliminated one day.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/usb-storage.txt |    2 +-
 qemu-options.hx      |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/usb-storage.txt b/docs/usb-storage.txt
index ff97559..e58e849 100644
--- a/docs/usb-storage.txt
+++ b/docs/usb-storage.txt
@@ -2,7 +2,7 @@
 qemu usb storage emulation
 --------------------------
 
-Qemu has two emulations for usb storage devices.
+QEMU has two emulations for usb storage devices.
 
 Number one emulates the classic bulk-only transport protocol which is
 used by 99% of the usb sticks on the marked today and is called
diff --git a/qemu-options.hx b/qemu-options.hx
index 97245a3..dc68e15 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1439,7 +1439,7 @@ Forward guest TCP connections to the IP address @var{server} on port @var{port}
 to the character device @var{dev} or to a program executed by @var{cmd:command}
 which gets spawned for each connection. This option can be given multiple times.
 
-You can either use a chardev directly and have that one used throughout Qemu's
+You can either use a chardev directly and have that one used throughout QEMU's
 lifetime, like in the following example:
 
 @example
@@ -1449,7 +1449,7 @@ qemu -net user,guestfwd=tcp:10.0.2.100:1234-tcp:10.10.1.1:4321 [...]
 @end example
 
 Or you can execute a command on every TCP connection established by the guest,
-so that Qemu behaves similar to an inetd process for that virtual server:
+so that QEMU behaves similar to an inetd process for that virtual server:
 
 @example
 # call "netcat 10.10.1.1 4321" on every TCP connection to 10.0.2.100:1234
-- 
1.7.10


