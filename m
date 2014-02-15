Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIR-00076I-Ss
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:24:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIK-0006tz-PT
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIF-0000C8-RS
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:32 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeI4-00009z-Pl; Sat, 15 Feb 2014 07:24:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 26AAB41C29;
	Sat, 15 Feb 2014 16:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D1D6D5FC;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21834 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:17 +0400
Message-Id: <1392466700-21770-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/10] vl: remove old, long-unused defines
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
X-List-Received-Date: Sat, 15 Feb 2014 12:24:37 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/vl.c b/vl.c
index a7b00cd..a7c3f8e 100644
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
-- 
1.7.10.4


