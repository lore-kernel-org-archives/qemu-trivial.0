Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYbJ-0004Bt-44
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:17:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbF-00043t-7k
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbE-0000Ig-GM
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYb8-0000GJ-O4; Mon, 11 Jan 2016 04:17:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5BEC340402;
	Mon, 11 Jan 2016 12:17:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8F4DDA8A;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28771 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:42 +0300
Message-Id: <34f22fc034470032a647262ee142867b3ebe5b2f.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/19] net: convert qemu_log to error_report,
	fix message
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
X-List-Received-Date: Mon, 11 Jan 2016 09:17:19 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Ensure that the error is printed with the proper timestamp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dump.c b/net/dump.c
index ce16a4b..1c05f78 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -84,7 +84,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
     cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
 
     if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
-        qemu_log("-net dump write error - stop dump\n");
+        error_report("network dump write error - stopping dump");
         close(s->fd);
         s->fd = -1;
     }
-- 
2.1.4


