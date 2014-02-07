Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBgNv-0004G8-NA
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2014 03:02:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBgNp-0004EG-Bq
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 03:02:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBgNk-0002L4-CY
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 03:01:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBgNk-0002KM-5Z
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 03:01:52 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7BC2740B49
	for <qemu-trivial@nongnu.org>; Fri,  7 Feb 2014 12:01:50 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 68C20639;
	Fri,  7 Feb 2014 12:01:50 +0400 (MSK)
Received: (nullmailer pid 23526 invoked by uid 1000);
	Fri, 07 Feb 2014 08:01:50 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Fri,  7 Feb 2014 12:01:44 +0400
Message-Id: <1391760104-23489-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH trivial] vl: remove old, long-unused defines
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
X-List-Received-Date: Fri, 07 Feb 2014 08:02:02 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/vl.c b/vl.c
index 383be1b..cd89090 100644
--- a/vl.c
+++ b/vl.c
@@ -172,9 +172,6 @@ int main(int argc, char **argv)
 #include "qapi/string-input-visitor.h"
 #include "qom/object_interfaces.h"
 
-//#define DEBUG_NET
-//#define DEBUG_SLIRP
-
 #define DEFAULT_RAM_SIZE 128
 
 #define MAX_VIRTIO_CONSOLES 1

