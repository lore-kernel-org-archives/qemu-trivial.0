Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aUEzz-0005gl-Tm
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2016 09:47:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aUEzw-0005Zv-Fc
	for qemu-trivial@nongnu.org; Fri, 12 Feb 2016 09:47:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aUEzv-0005O5-BD
	for qemu-trivial@nongnu.org; Fri, 12 Feb 2016 09:47:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aUEzp-0005KC-1R; Fri, 12 Feb 2016 09:46:57 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id A04C28E697;
	Fri, 12 Feb 2016 14:46:56 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (dhcp-1-180.lcy.redhat.com
	[10.32.224.180])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1CEktAY023705; Fri, 12 Feb 2016 09:46:55 -0500
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 14:46:50 +0000
Message-Id: <1455288410-27046-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: [Qemu-trivial] [PATCH] char: fix handling of QIO_CHANNEL_ERR_BLOCK
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
X-List-Received-Date: Fri, 12 Feb 2016 14:47:05 -0000

If io_channel_send_full gets QIO_CHANNEL_ERR_BLOCK it
and has already sent some of the data, it should return
that amount of data, not EAGAIN, as that would cause
the caller to re-try already sent data.

Unfortunately due to a previous rebase conflict resolution
error, the code for dealing with this was in the wrong
part of the conditional, and so mistakenly ran on other
I/O errors.

This be seen running

   qemu-system-x86_64 -monitor stdio

and entering 'info mtree', when running on a slow console
(eg a slow remote ssh session). The monitor would get into
an indefinite loop writing the same data until it managed
to send it all without getting EAGAIN.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 qemu-char.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 1b7d5da..c2e24a5 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -896,13 +896,13 @@ static int io_channel_send_full(QIOChannel *ioc,
             ioc, &iov, 1,
             fds, nfds, NULL);
         if (ret == QIO_CHANNEL_ERR_BLOCK) {
-            errno = EAGAIN;
-            return -1;
-        } else if (ret < 0) {
             if (offset) {
                 return offset;
             }
 
+            errno = EAGAIN;
+            return -1;
+        } else if (ret < 0) {
             errno = EINVAL;
             return -1;
         }
-- 
2.5.0


