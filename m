Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwUld-0000Mq-1I
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 04:58:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SwUlT-0008G8-7V
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SwUlS-0002jb-B6
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:58:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1SwUlN-0002ie-GA; Wed, 01 Aug 2012 04:58:41 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q718weJF000757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 04:58:40 -0400
Received: from dhcp-8-167.nay.redhat.com ([10.66.7.126])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q718wSqE027838; Wed, 1 Aug 2012 04:58:38 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  1 Aug 2012 16:59:03 +0800
Message-Id: <1343811543-12137-4-git-send-email-akong@redhat.com>
In-Reply-To: <1343811543-12137-1-git-send-email-akong@redhat.com>
References: <1343811543-12137-1-git-send-email-akong@redhat.com>
In-Reply-To: <1342539951-30915-1-git-send-email-akong@redhat.com>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, quintela@redhat.com
Subject: [Qemu-trivial] [RESEND PATCH 3/3] socket: clean up redundant
	assignment
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
X-List-Received-Date: Wed, 01 Aug 2012 08:58:53 -0000

Signed-off-by: Amos Kong <akong@redhat.com>
---
 qemu-sockets.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/qemu-sockets.c b/qemu-sockets.c
index c636882..9cd4114 100644
--- a/qemu-sockets.c
+++ b/qemu-sockets.c
@@ -282,7 +282,6 @@ int inet_connect_opts(QemuOpts *opts, Error **errp)
                         inet_strfamily(e->ai_family),
                         e->ai_canonname, uaddr, uport, strerror(errno));
             closesocket(sock);
-            sock = -1;
             continue;
         }
         freeaddrinfo(res);
-- 
1.7.1


