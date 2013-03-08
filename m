Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UE2Vd-0000jH-KD
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 13:59:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:32958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UE2VV-0000Xj-AN
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 13:59:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UE2VO-0000GZ-Nf
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 13:59:05 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1UE2V9-0000C2-FF; Fri, 08 Mar 2013 13:58:43 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2D5B27280057; Fri,  8 Mar 2013 19:58:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ssh5oTiIJY-O; Fri,  8 Mar 2013 19:58:34 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id D404D72800CD; Fri,  8 Mar 2013 19:58:34 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri,  8 Mar 2013 19:58:32 +0100
Message-Id: <1362769112-6097-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] MinGW: Replace setsockopt by
	qemu_setsocketopt
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
X-List-Received-Date: Fri, 08 Mar 2013 18:59:12 -0000

Instead of adding missing type casts which are needed by MinGW for the
4th argument, the patch uses qemu_setsockopt which was invented for this
purpose.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I did not fix some coding style issues in modified slirp code
(tabs, line length). Nor did I replace setsockopt in code which
is unused for MinGW (linux-user, tests).

- Stefan W.


 bt-host.c           |    2 +-
 gdbstub.c           |    2 +-
 net/socket.c        |   21 ++++++++++-----------
 slirp/misc.c        |    4 ++--
 slirp/socket.c      |    4 ++--
 slirp/tcp_subr.c    |    8 ++++----
 slirp/udp.c         |    2 +-
 util/osdep.c        |    4 ++--
 util/qemu-sockets.c |   10 +++++-----
 9 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/bt-host.c b/bt-host.c
index 2092754..2da3c32 100644
--- a/bt-host.c
+++ b/bt-host.c
@@ -171,7 +171,7 @@ struct HCIInfo *bt_host_hci(const char *id)
     hci_filter_all_ptypes(&flt);
     hci_filter_all_events(&flt);
 
-    if (setsockopt(fd, SOL_HCI, HCI_FILTER, &flt, sizeof(flt)) < 0) {
+    if (qemu_setsockopt(fd, SOL_HCI, HCI_FILTER, &flt, sizeof(flt)) < 0) {
         fprintf(stderr, "qemu: Can't set HCI filter on socket (%i)\n", errno);
         return 0;
     }
diff --git a/gdbstub.c b/gdbstub.c
index e414ad9..d82181b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2887,7 +2887,7 @@ static int gdbserver_open(int port)
 
     /* allow fast reuse */
     val = 1;
-    setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (char *)&val, sizeof(val));
+    qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
 
     sockaddr.sin_family = AF_INET;
     sockaddr.sin_port = htons(port);
diff --git a/net/socket.c b/net/socket.c
index 396dc8c..d8b35a2 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -262,8 +262,7 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr, struct in_addr
     }
 
     val = 1;
-    ret=setsockopt(fd, SOL_SOCKET, SO_REUSEADDR,
-                   (const char *)&val, sizeof(val));
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
     if (ret < 0) {
         perror("setsockopt(SOL_SOCKET, SO_REUSEADDR)");
         goto fail;
@@ -283,8 +282,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr, struct in_addr
         imr.imr_interface.s_addr = htonl(INADDR_ANY);
     }
 
-    ret = setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
-                     (const char *)&imr, sizeof(struct ip_mreq));
+    ret = qemu_setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
+                          &imr, sizeof(struct ip_mreq));
     if (ret < 0) {
         perror("setsockopt(IP_ADD_MEMBERSHIP)");
         goto fail;
@@ -292,8 +291,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr, struct in_addr
 
     /* Force mcast msgs to loopback (eg. several QEMUs in same host */
     loop = 1;
-    ret=setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
-                   (const char *)&loop, sizeof(loop));
+    ret = qemu_setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
+                          &loop, sizeof(loop));
     if (ret < 0) {
         perror("setsockopt(SOL_IP, IP_MULTICAST_LOOP)");
         goto fail;
@@ -301,8 +300,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr, struct in_addr
 
     /* If a bind address is given, only send packets from that address */
     if (localaddr != NULL) {
-        ret = setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
-                         (const char *)localaddr, sizeof(*localaddr));
+        ret = qemu_setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
+                              localaddr, sizeof(*localaddr));
         if (ret < 0) {
             perror("setsockopt(IP_MULTICAST_IF)");
             goto fail;
@@ -521,7 +520,7 @@ static int net_socket_listen_init(NetClientState *peer,
 
     /* allow fast reuse */
     val = 1;
-    setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (const char *)&val, sizeof(val));
+    qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
 
     ret = bind(fd, (struct sockaddr *)&saddr, sizeof(saddr));
     if (ret < 0) {
@@ -659,8 +658,8 @@ static int net_socket_udp_init(NetClientState *peer,
         return -1;
     }
     val = 1;
-    ret = setsockopt(fd, SOL_SOCKET, SO_REUSEADDR,
-                   (const char *)&val, sizeof(val));
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEADDR,
+                          &val, sizeof(val));
     if (ret < 0) {
         perror("setsockopt(SOL_SOCKET, SO_REUSEADDR)");
         closesocket(fd);
diff --git a/slirp/misc.c b/slirp/misc.c
index d4df972..6b9c2c4 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -212,9 +212,9 @@ fork_exec(struct socket *so, const char *ex, int do_pty)
                 } while (so->s < 0 && errno == EINTR);
                 closesocket(s);
                 opt = 1;
-                setsockopt(so->s, SOL_SOCKET, SO_REUSEADDR, (char *)&opt, sizeof(int));
+                qemu_setsockopt(so->s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int));
                 opt = 1;
-                setsockopt(so->s, SOL_SOCKET, SO_OOBINLINE, (char *)&opt, sizeof(int));
+                qemu_setsockopt(so->s, SOL_SOCKET, SO_OOBINLINE, &opt, sizeof(int));
 		socket_set_nonblock(so->s);
 
 		/* Append the telnet options now */
diff --git a/slirp/socket.c b/slirp/socket.c
index bb639ae..8e8819c 100644
--- a/slirp/socket.c
+++ b/slirp/socket.c
@@ -627,7 +627,7 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
 	addr.sin_port = hport;
 
 	if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
-	    (setsockopt(s,SOL_SOCKET,SO_REUSEADDR,(char *)&opt,sizeof(int)) < 0) ||
+	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
 	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
 	    (listen(s,1) < 0)) {
 		int tmperrno = errno; /* Don't clobber the real reason we failed */
@@ -642,7 +642,7 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
 #endif
 		return NULL;
 	}
-	setsockopt(s,SOL_SOCKET,SO_OOBINLINE,(char *)&opt,sizeof(int));
+	qemu_setsockopt(s, SOL_SOCKET, SO_OOBINLINE, &opt, sizeof(int));
 
 	getsockname(s,(struct sockaddr *)&addr,&addrlen);
 	so->so_fport = addr.sin_port;
diff --git a/slirp/tcp_subr.c b/slirp/tcp_subr.c
index 7b7ad60..84a6bb5 100644
--- a/slirp/tcp_subr.c
+++ b/slirp/tcp_subr.c
@@ -338,9 +338,9 @@ int tcp_fconnect(struct socket *so)
 
     socket_set_nonblock(s);
     opt = 1;
-    setsockopt(s,SOL_SOCKET,SO_REUSEADDR,(char *)&opt,sizeof(opt ));
+    qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));
     opt = 1;
-    setsockopt(s,SOL_SOCKET,SO_OOBINLINE,(char *)&opt,sizeof(opt ));
+    qemu_setsockopt(s, SOL_SOCKET, SO_OOBINLINE, &opt, sizeof(opt));
 
     addr.sin_family = AF_INET;
     if ((so->so_faddr.s_addr & slirp->vnetwork_mask.s_addr) ==
@@ -427,9 +427,9 @@ void tcp_connect(struct socket *inso)
     }
     socket_set_nonblock(s);
     opt = 1;
-    setsockopt(s, SOL_SOCKET, SO_REUSEADDR, (char *)&opt, sizeof(int));
+    qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int));
     opt = 1;
-    setsockopt(s, SOL_SOCKET, SO_OOBINLINE, (char *)&opt, sizeof(int));
+    qemu_setsockopt(s, SOL_SOCKET, SO_OOBINLINE, &opt, sizeof(int));
     socket_set_nodelay(s);
 
     so->so_fport = addr.sin_port;
diff --git a/slirp/udp.c b/slirp/udp.c
index 9286cb7..b105f87 100644
--- a/slirp/udp.c
+++ b/slirp/udp.c
@@ -372,7 +372,7 @@ udp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
 		udp_detach(so);
 		return NULL;
 	}
-	setsockopt(so->s,SOL_SOCKET,SO_REUSEADDR,(char *)&opt,sizeof(int));
+	qemu_setsockopt(so->s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int));
 
 	getsockname(so->s,(struct sockaddr *)&addr,&addrlen);
 	so->so_fport = addr.sin_port;
diff --git a/util/osdep.c b/util/osdep.c
index c408261..bd59ac9 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -57,7 +57,7 @@ static const char *qemu_version = QEMU_VERSION;
 int socket_set_cork(int fd, int v)
 {
 #if defined(SOL_TCP) && defined(TCP_CORK)
-    return setsockopt(fd, SOL_TCP, TCP_CORK, &v, sizeof(v));
+    return qemu_setsockopt(fd, SOL_TCP, TCP_CORK, &v, sizeof(v));
 #else
     return 0;
 #endif
@@ -66,7 +66,7 @@ int socket_set_cork(int fd, int v)
 int socket_set_nodelay(int fd)
 {
     int v = 1;
-    return setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &v, sizeof(v));
+    return qemu_setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &v, sizeof(v));
 }
 
 int qemu_madvise(void *addr, size_t len, int advice)
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 1350ccc..f9272c2 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -156,12 +156,12 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
             continue;
         }
 
-        setsockopt(slisten,SOL_SOCKET,SO_REUSEADDR,(void*)&on,sizeof(on));
+        qemu_setsockopt(slisten, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
 #ifdef IPV6_V6ONLY
         if (e->ai_family == PF_INET6) {
             /* listen on both ipv4 and ipv6 */
-            setsockopt(slisten,IPPROTO_IPV6,IPV6_V6ONLY,(void*)&off,
-                sizeof(off));
+            qemu_setsockopt(slisten, IPPROTO_IPV6, IPV6_V6ONLY, &off,
+                            sizeof(off));
         }
 #endif
 
@@ -229,7 +229,7 @@ static void wait_for_connect(void *opaque)
     qemu_set_fd_handler2(s->fd, NULL, NULL, NULL, NULL);
 
     do {
-        rc = getsockopt(s->fd, SOL_SOCKET, SO_ERROR, (void *) &val, &valsize);
+        rc = qemu_getsockopt(s->fd, SOL_SOCKET, SO_ERROR, &val, &valsize);
     } while (rc == -1 && socket_error() == EINTR);
 
     /* update rc to contain error */
@@ -452,7 +452,7 @@ int inet_dgram_opts(QemuOpts *opts, Error **errp)
         error_set_errno(errp, errno, QERR_SOCKET_CREATE_FAILED);
         goto err;
     }
-    setsockopt(sock,SOL_SOCKET,SO_REUSEADDR,(void*)&on,sizeof(on));
+    qemu_setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
 
     /* bind socket */
     if (bind(sock, local->ai_addr, local->ai_addrlen) < 0) {
-- 
1.7.10.4


