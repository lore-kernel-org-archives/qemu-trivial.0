Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAShD-0001tM-Av
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 17:03:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SAShB-0001qK-1O
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SASh8-00063I-H6
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>)
	id 1SASh3-00060R-Cb; Wed, 21 Mar 2012 17:03:41 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LL3dPg007874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 17:03:39 -0400
Received: from frodo.bos.redhat.com (frodo.bos.redhat.com [10.16.184.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LL3bdN024568; Wed, 21 Mar 2012 17:03:39 -0400
From: Peter Portante <peter.portante@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 17:02:46 -0400
Message-Id: <1332363767-21327-4-git-send-email-peter.portante@redhat.com>
In-Reply-To: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Portante <pportant@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/4] And some final work to complete the
	coding style upgrade, missed by the previous commit.
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
X-List-Received-Date: Wed, 21 Mar 2012 21:03:50 -0000

Signed-off-by: Peter Portante <pportant@redhat.com>
---
 slirp/slirp.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index 40f7523..fd28f17 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -457,7 +457,7 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
                  * (and they can crash the program)
                  */
                 if (so->so_state & SS_NOFDREF || so->s == -1) {
-                   continue;
+					continue;
                 }
 
                 /*
@@ -535,7 +535,7 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
                  */
 #ifdef PROBE_CONN
                 if (so->so_state & SS_ISFCONNECTING) {
-                    ret = qemu_recv(so->s, &ret, 0,0);
+                    ret = qemu_recv(so->s, &ret, 0, 0);
 
                     if (ret < 0) {
                         /* XXX */
@@ -549,7 +549,7 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
 
                         /* tcp_input will take care of it */
                     } else {
-                        ret = send(so->s, &ret, 0,0);
+                        ret = send(so->s, &ret, 0, 0);
                         if (ret < 0) {
                             /* XXX */
                             if (errno == EAGAIN || errno == EWOULDBLOCK ||
@@ -563,7 +563,7 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
                           so->so_state &= ~SS_ISFCONNECTING;
                         }
                     }
-                    tcp_input((struct mbuf *)NULL, sizeof(struct ip),so);
+                    tcp_input((struct mbuf *)NULL, sizeof(struct ip), so);
                 } /* SS_ISFCONNECTING */
 #endif
             }
-- 
1.7.7.6


