Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnlDQ-0007Wk-AY
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 05:57:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnlDO-0007Ur-Sf
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 05:57:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnlDN-0006Yk-Ts
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 05:57:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnlDF-0006Vs-QX; Thu, 30 Apr 2015 05:56:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AAF8242233;
	Thu, 30 Apr 2015 12:56:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 186D496B;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4335 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:34 +0300
Message-Id: <5051cdf83461eca7cc4f9ea9e68f60df79d59fdb.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PULL 21/42] docs/atomics.txt: fix two typos
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
X-List-Received-Date: Thu, 30 Apr 2015 09:57:07 -0000

From: Laszlo Ersek <lersek@redhat.com>

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/atomics.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/atomics.txt b/docs/atomics.txt
index 6f2997b..ef285e3 100644
--- a/docs/atomics.txt
+++ b/docs/atomics.txt
@@ -281,7 +281,7 @@ note that the other barrier may actually be in a driver that runs in
 the guest!
 
 For the purposes of pairing, smp_read_barrier_depends() and smp_rmb()
-both count as read barriers.  A read barriers shall pair with a write
+both count as read barriers.  A read barrier shall pair with a write
 barrier or a full barrier; a write barrier shall pair with a read
 barrier or a full barrier.  A full barrier can pair with anything.
 For example:
@@ -294,7 +294,7 @@ For example:
                              smp_rmb();
                              y = a;
 
-Note that the "writing" thread are accessing the variables in the
+Note that the "writing" thread is accessing the variables in the
 opposite order as the "reading" thread.  This is expected: stores
 before the write barrier will normally match the loads after the
 read barrier, and vice versa.  The same is true for more than 2
-- 
2.1.4


