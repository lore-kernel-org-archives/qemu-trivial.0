Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFr2I-0003YT-9Z
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:45:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr2B-0003JG-O5
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr26-00060S-RN
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFr1s-0005m1-Rq; Fri, 08 Aug 2014 16:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 53EBC41A19;
	Sat,  9 Aug 2014 00:44:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0FF846EE;
	Sat,  9 Aug 2014 00:39:07 +0400 (MSK)
Received: (nullmailer pid 10312 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:55 +0400
Message-Id: <1407530342-10259-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 2/9] l2tpv3 (configure): it is linux-specific
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
X-List-Received-Date: Fri, 08 Aug 2014 20:45:13 -0000

Some non-linux systems, for example a system with
FreeBSD kernel and glibc, may declare struct mmsghdr
(in glibc) but may not have linux-specific header
file linux/ip.h.  The actual implementation in qemu
includes this linux-specific header file unconditionally,
so compilation fails if it is not present.  Include
this header in the configure test too.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index f7685b5..f49e618 100755
--- a/configure
+++ b/configure
@@ -1723,6 +1723,7 @@ fi
 
 cat > $TMPC <<EOF
 #include <sys/socket.h>
+#include <linux/ip.h>
 int main(void) { return sizeof(struct mmsghdr); }
 EOF
 if compile_prog "" "" ; then
-- 
1.7.10.4


