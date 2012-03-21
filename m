Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAShC-0001s7-89
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 17:03:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SASh9-0001pi-SO
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SASh7-00062j-0s
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>)
	id 1SASh3-00060j-Tb; Wed, 21 Mar 2012 17:03:42 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LL3eLN030144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 17:03:40 -0400
Received: from frodo.bos.redhat.com (frodo.bos.redhat.com [10.16.184.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LL3bdO024568; Wed, 21 Mar 2012 17:03:39 -0400
From: Peter Portante <peter.portante@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 17:02:47 -0400
Message-Id: <1332363767-21327-5-git-send-email-peter.portante@redhat.com>
In-Reply-To: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Portante <pportant@redhat.com>
Subject: [Qemu-trivial] [PATCH 4/4] Yet another missed use of tabs.
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
X-List-Received-Date: Wed, 21 Mar 2012 21:03:49 -0000

Signed-off-by: Peter Portante <pportant@redhat.com>
---
 slirp/slirp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index fd28f17..45a8de2 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -457,7 +457,7 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
                  * (and they can crash the program)
                  */
                 if (so->so_state & SS_NOFDREF || so->s == -1) {
-					continue;
+                    continue;
                 }
 
                 /*
-- 
1.7.7.6


