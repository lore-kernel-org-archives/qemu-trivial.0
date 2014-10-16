Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xekse-00011d-LR
	for mharc-qemu-trivial@gnu.org; Thu, 16 Oct 2014 09:14:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1XeksW-0000r6-Fj
	for qemu-trivial@nongnu.org; Thu, 16 Oct 2014 09:14:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1XeksQ-0006Zu-BA
	for qemu-trivial@nongnu.org; Thu, 16 Oct 2014 09:14:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1XeksD-0006Yr-Na; Thu, 16 Oct 2014 09:13:45 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9GDDgri000530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 16 Oct 2014 09:13:42 -0400
Received: from lisa.fdxtended.com (vpn-232-253.phx2.redhat.com [10.3.232.253])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s9GDDdnu017925; Thu, 16 Oct 2014 09:13:40 -0400
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 16 Oct 2014 15:13:32 +0200
Message-Id: <26626bbd0b1652d964c39937c378bb53089260f6.1413465100.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com
Subject: [Qemu-trivial] [PATCH] util: Improve os_mem_prealloc error message
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
X-List-Received-Date: Thu, 16 Oct 2014 13:14:10 -0000

Currently, when the preallocating guest memory process fails, an not
so helpful error message is printed out:

    # virsh start migt10
    error: Failed to start domain migt10
    error: internal error: process exited while connecting to monitor:
    os_mem_prealloc: failed to preallocate pages

From the error message it's not clear at the first glance where the
problem lies. However, changing the error message might give uses a
clue.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 util/oslib-posix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 016a047..8c9d80e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -390,7 +390,8 @@ void os_mem_prealloc(int fd, char *area, size_t memory)
     pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
 
     if (sigsetjmp(sigjump, 1)) {
-        fprintf(stderr, "os_mem_prealloc: failed to preallocate pages\n");
+        fprintf(stderr, "os_mem_prealloc: Insufficient free host memory "
+                        "pages available to allocate guest RAM\n");
         exit(1);
     } else {
         int i;
-- 
2.0.4


