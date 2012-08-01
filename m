Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwUlR-0008Bz-RW
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 04:58:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SwUlL-0007t7-Ig
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:58:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SwUlK-0002i5-Lx
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:58:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1SwUlI-0002he-FY; Wed, 01 Aug 2012 04:58:36 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q718wZuP009537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 04:58:35 -0400
Received: from dhcp-8-167.nay.redhat.com ([10.66.7.126])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q718wSqC027838; Wed, 1 Aug 2012 04:58:33 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  1 Aug 2012 16:59:01 +0800
Message-Id: <1343811543-12137-2-git-send-email-akong@redhat.com>
In-Reply-To: <1343811543-12137-1-git-send-email-akong@redhat.com>
References: <1343811543-12137-1-git-send-email-akong@redhat.com>
In-Reply-To: <1342539951-30915-1-git-send-email-akong@redhat.com>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, quintela@redhat.com
Subject: [Qemu-trivial] [RESEND PATCH 1/3] socket: remove redundant check
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
X-List-Received-Date: Wed, 01 Aug 2012 08:58:45 -0000

It's aleady in the end of loop, error should be set.

Signed-off-by: Amos Kong <akong@redhat.com>
---
 qemu-sockets.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/qemu-sockets.c b/qemu-sockets.c
index 668fa93..c636882 100644
--- a/qemu-sockets.c
+++ b/qemu-sockets.c
@@ -181,9 +181,7 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
                 fprintf(stderr,"%s: bind(%s,%s,%d): %s\n", __FUNCTION__,
                         inet_strfamily(e->ai_family), uaddr, inet_getport(e),
                         strerror(errno));
-                if (!e->ai_next) {
-                    error_set(errp, QERR_SOCKET_BIND_FAILED);
-                }
+                error_set(errp, QERR_SOCKET_BIND_FAILED);
             }
         }
         closesocket(slisten);
-- 
1.7.1


