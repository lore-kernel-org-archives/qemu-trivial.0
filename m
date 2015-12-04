Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4pdY-0008NT-0C
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 07:38:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a4pdW-0008MQ-3b
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 07:38:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a4pdV-0006qH-4A
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 07:38:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a4pdQ-0006ov-U7; Fri, 04 Dec 2015 07:38:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 79EDAC001244;
	Fri,  4 Dec 2015 12:38:48 +0000 (UTC)
Received: from donizetti.lan. (ovpn-112-59.ams2.redhat.com [10.36.112.59])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB4CckLl000531; Fri, 4 Dec 2015 07:38:47 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 13:38:46 +0100
Message-Id: <1449232726-18984-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] net: convert qemu_log to error_report,
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
X-List-Received-Date: Fri, 04 Dec 2015 12:38:55 -0000

Ensure that the error is printed with the proper timestamp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        v1->v2: remove reference to -net dump, dumping can be a network filter
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
2.5.0


