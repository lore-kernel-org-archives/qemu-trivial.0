Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmhHU-0008Ny-7H
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 07:32:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1YmhHO-0008HC-Uz
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 07:32:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1YmhHO-0006kV-2W
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 07:32:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1YmhHI-0006jB-By; Mon, 27 Apr 2015 07:32:44 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id EAAD88E670;
	Mon, 27 Apr 2015 11:32:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-82.ams2.redhat.com
	[10.36.116.82])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3RBWdKY008578; Mon, 27 Apr 2015 07:32:40 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, lersek@redhat.com
Date: Mon, 27 Apr 2015 13:32:35 +0200
Message-Id: <1430134355-8657-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] docs/atomics.txt: fix two typos
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
X-List-Received-Date: Mon, 27 Apr 2015 11:32:55 -0000

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
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
1.8.3.1


