Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeS7-0006au-F1
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:34:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeS0-0006SI-H8
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:34:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeRw-0002pw-1k
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:34:32 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42217)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeRm-0002oY-Gy; Sat, 15 Feb 2014 07:34:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 99EE841C2A;
	Sat, 15 Feb 2014 16:34:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 278C163E;
	Sat, 15 Feb 2014 16:18:23 +0400 (MSK)
Received: (nullmailer pid 21829 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:15 +0400
Message-Id: <1392466700-21770-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/10] linux-user: refactor do_socketcall()
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
X-List-Received-Date: Sat, 15 Feb 2014 12:34:37 -0000

Refactor do_socketcall() to do argument conversion/checking first,
according to a lookup table (which call has how many args) and
by calling the right function second with ready-to-go arguments.

This ensures that all arguments are handled as abi_long, according
to socketcall prototype, and simplifies argument handling alot too.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/syscall.c |  326 +++++++++++---------------------------------------
 1 file changed, 68 insertions(+), 258 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index bc0ac98..f370087 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2177,271 +2177,81 @@ fail:
 /* do_socketcall() Must return target values and target errnos. */
 static abi_long do_socketcall(int num, abi_ulong vptr)
 {
-    abi_long ret;
-    const int n = sizeof(abi_ulong);
-
-    switch(num) {
-    case SOCKOP_socket:
-	{
-            abi_ulong domain, type, protocol;
-
-            if (get_user_ual(domain, vptr)
-                || get_user_ual(type, vptr + n)
-                || get_user_ual(protocol, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_socket(domain, type, protocol);
-	}
-        break;
-    case SOCKOP_bind:
-	{
-            abi_ulong sockfd;
-            abi_ulong target_addr;
-            socklen_t addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(addrlen, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_bind(sockfd, target_addr, addrlen);
-        }
-        break;
-    case SOCKOP_connect:
-        {
-            abi_ulong sockfd;
-            abi_ulong target_addr;
-            socklen_t addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(addrlen, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_connect(sockfd, target_addr, addrlen);
-        }
-        break;
-    case SOCKOP_listen:
-        {
-            abi_ulong sockfd, backlog;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(backlog, vptr + n))
-                return -TARGET_EFAULT;
-
-            ret = get_errno(listen(sockfd, backlog));
-        }
-        break;
-    case SOCKOP_accept:
-        {
-            abi_ulong sockfd;
-            abi_ulong target_addr, target_addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(target_addrlen, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_accept4(sockfd, target_addr, target_addrlen, 0);
-        }
-        break;
-    case SOCKOP_accept4:
-        {
-            abi_ulong sockfd;
-            abi_ulong target_addr, target_addrlen;
-            abi_ulong flags;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(target_addrlen, vptr + 2 * n)
-                || get_user_ual(flags, vptr + 3 * n)) {
+    static const unsigned ac[] = { /* number of arguments per call */
+        [SOCKOP_socket] = 3,      /* domain, type, protocol */
+        [SOCKOP_bind] = 3,        /* sockfd, addr, addrlen */
+        [SOCKOP_connect] = 3,     /* sockfd, addr, addrlen */
+        [SOCKOP_listen] = 2,      /* sockfd, backlog */
+        [SOCKOP_accept] = 3,      /* sockfd, addr, addrlen */
+        [SOCKOP_accept4] = 4,     /* sockfd, addr, addrlen, flags */
+        [SOCKOP_getsockname] = 3, /* sockfd, addr, addrlen */
+        [SOCKOP_getpeername] = 3, /* sockfd, addr, addrlen */
+        [SOCKOP_socketpair] = 4,  /* domain, type, protocol, tab */
+        [SOCKOP_send] = 4,        /* sockfd, msg, len, flags */
+        [SOCKOP_recv] = 4,        /* sockfd, msg, len, flags */
+        [SOCKOP_sendto] = 6,      /* sockfd, msg, len, flags, addr, addrlen */
+        [SOCKOP_recvfrom] = 6,    /* sockfd, msg, len, flags, addr, addrlen */
+        [SOCKOP_shutdown] = 2,    /* sockfd, how */
+        [SOCKOP_sendmsg] = 3,     /* sockfd, msg, flags */
+        [SOCKOP_recvmsg] = 3,     /* sockfd, msg, flags */
+        [SOCKOP_setsockopt] = 5,  /* sockfd, level, optname, optval, optlen */
+        [SOCKOP_getsockopt] = 5,  /* sockfd, level, optname, optval, optlen */
+    };
+    abi_long a[6]; /* max 6 args */
+
+    /* first, collect the arguments in a[] according to ac[] */
+    if (num >= 0 && num < ARRAY_SIZE(ac)) {
+        unsigned i;
+        assert(ARRAY_SIZE(a) >= ac[num]); /* ensure we have space for args */
+        for (i = 0; i < ac[num]; ++i) {
+            if (get_user_ual(a[i], vptr + i * sizeof(abi_long)) != 0) {
                 return -TARGET_EFAULT;
             }
-
-            ret = do_accept4(sockfd, target_addr, target_addrlen, flags);
-        }
-        break;
-    case SOCKOP_getsockname:
-        {
-            abi_ulong sockfd;
-            abi_ulong target_addr, target_addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(target_addrlen, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_getsockname(sockfd, target_addr, target_addrlen);
         }
-        break;
-    case SOCKOP_getpeername:
-        {
-            abi_ulong sockfd;
-            abi_ulong target_addr, target_addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(target_addrlen, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_getpeername(sockfd, target_addr, target_addrlen);
-        }
-        break;
-    case SOCKOP_socketpair:
-        {
-            abi_ulong domain, type, protocol;
-            abi_ulong tab;
-
-            if (get_user_ual(domain, vptr)
-                || get_user_ual(type, vptr + n)
-                || get_user_ual(protocol, vptr + 2 * n)
-                || get_user_ual(tab, vptr + 3 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_socketpair(domain, type, protocol, tab);
-        }
-        break;
-    case SOCKOP_send:
-        {
-            abi_ulong sockfd;
-            abi_ulong msg;
-            size_t len;
-            abi_ulong flags;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(msg, vptr + n)
-                || get_user_ual(len, vptr + 2 * n)
-                || get_user_ual(flags, vptr + 3 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_sendto(sockfd, msg, len, flags, 0, 0);
-        }
-        break;
-    case SOCKOP_recv:
-        {
-            abi_ulong sockfd;
-            abi_ulong msg;
-            size_t len;
-            abi_ulong flags;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(msg, vptr + n)
-                || get_user_ual(len, vptr + 2 * n)
-                || get_user_ual(flags, vptr + 3 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_recvfrom(sockfd, msg, len, flags, 0, 0);
-        }
-        break;
-    case SOCKOP_sendto:
-        {
-            abi_ulong sockfd;
-            abi_ulong msg;
-            size_t len;
-            abi_ulong flags;
-            abi_ulong addr;
-            abi_ulong addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(msg, vptr + n)
-                || get_user_ual(len, vptr + 2 * n)
-                || get_user_ual(flags, vptr + 3 * n)
-                || get_user_ual(addr, vptr + 4 * n)
-                || get_user_ual(addrlen, vptr + 5 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_sendto(sockfd, msg, len, flags, addr, addrlen);
-        }
-        break;
-    case SOCKOP_recvfrom:
-        {
-            abi_ulong sockfd;
-            abi_ulong msg;
-            size_t len;
-            abi_ulong flags;
-            abi_ulong addr;
-            socklen_t addrlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(msg, vptr + n)
-                || get_user_ual(len, vptr + 2 * n)
-                || get_user_ual(flags, vptr + 3 * n)
-                || get_user_ual(addr, vptr + 4 * n)
-                || get_user_ual(addrlen, vptr + 5 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_recvfrom(sockfd, msg, len, flags, addr, addrlen);
-        }
-        break;
-    case SOCKOP_shutdown:
-        {
-            abi_ulong sockfd, how;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(how, vptr + n))
-                return -TARGET_EFAULT;
-
-            ret = get_errno(shutdown(sockfd, how));
-        }
-        break;
-    case SOCKOP_sendmsg:
-    case SOCKOP_recvmsg:
-        {
-            abi_ulong fd;
-            abi_ulong target_msg;
-            abi_ulong flags;
-
-            if (get_user_ual(fd, vptr)
-                || get_user_ual(target_msg, vptr + n)
-                || get_user_ual(flags, vptr + 2 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_sendrecvmsg(fd, target_msg, flags,
-                                 (num == SOCKOP_sendmsg));
-        }
-        break;
-    case SOCKOP_setsockopt:
-        {
-            abi_ulong sockfd;
-            abi_ulong level;
-            abi_ulong optname;
-            abi_ulong optval;
-            abi_ulong optlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(level, vptr + n)
-                || get_user_ual(optname, vptr + 2 * n)
-                || get_user_ual(optval, vptr + 3 * n)
-                || get_user_ual(optlen, vptr + 4 * n))
-                return -TARGET_EFAULT;
-
-            ret = do_setsockopt(sockfd, level, optname, optval, optlen);
-        }
-        break;
-    case SOCKOP_getsockopt:
-        {
-            abi_ulong sockfd;
-            abi_ulong level;
-            abi_ulong optname;
-            abi_ulong optval;
-            socklen_t optlen;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(level, vptr + n)
-                || get_user_ual(optname, vptr + 2 * n)
-                || get_user_ual(optval, vptr + 3 * n)
-                || get_user_ual(optlen, vptr + 4 * n))
-                return -TARGET_EFAULT;
+    }
 
-            ret = do_getsockopt(sockfd, level, optname, optval, optlen);
-        }
-        break;
+    /* now when we have the args, actually handle the call */
+    switch (num) {
+    case SOCKOP_socket: /* domain, type, protocol */
+        return do_socket(a[0], a[1], a[2]);
+    case SOCKOP_bind: /* sockfd, addr, addrlen */
+        return do_bind(a[0], a[1], a[2]);
+    case SOCKOP_connect: /* sockfd, addr, addrlen */
+        return do_connect(a[0], a[1], a[2]);
+    case SOCKOP_listen: /* sockfd, backlog */
+        return get_errno(listen(a[0], a[1]));
+    case SOCKOP_accept: /* sockfd, addr, addrlen */
+        return do_accept4(a[0], a[1], a[2], 0);
+    case SOCKOP_accept4: /* sockfd, addr, addrlen, flags */
+        return do_accept4(a[0], a[1], a[2], a[3]);
+    case SOCKOP_getsockname: /* sockfd, addr, addrlen */
+        return do_getsockname(a[0], a[1], a[2]);
+    case SOCKOP_getpeername: /* sockfd, addr, addrlen */
+        return do_getpeername(a[0], a[1], a[2]);
+    case SOCKOP_socketpair: /* domain, type, protocol, tab */
+        return do_socketpair(a[0], a[1], a[2], a[3]);
+    case SOCKOP_send: /* sockfd, msg, len, flags */
+        return do_sendto(a[0], a[1], a[2], a[3], 0, 0);
+    case SOCKOP_recv: /* sockfd, msg, len, flags */
+        return do_recvfrom(a[0], a[1], a[2], a[3], 0, 0);
+    case SOCKOP_sendto: /* sockfd, msg, len, flags, addr, addrlen */
+        return do_sendto(a[0], a[1], a[2], a[3], a[4], a[5]);
+    case SOCKOP_recvfrom: /* sockfd, msg, len, flags, addr, addrlen */
+        return do_recvfrom(a[0], a[1], a[2], a[3], a[4], a[5]);
+    case SOCKOP_shutdown: /* sockfd, how */
+        return get_errno(shutdown(a[0], a[1]));
+    case SOCKOP_sendmsg: /* sockfd, msg, flags */
+        return do_sendrecvmsg(a[0], a[1], a[2], 1);
+    case SOCKOP_recvmsg: /* sockfd, msg, flags */
+        return do_sendrecvmsg(a[0], a[1], a[2], 0);
+    case SOCKOP_setsockopt: /* sockfd, level, optname, optval, optlen */
+        return do_setsockopt(a[0], a[1], a[2], a[3], a[4]);
+    case SOCKOP_getsockopt: /* sockfd, level, optname, optval, optlen */
+        return do_getsockopt(a[0], a[1], a[2], a[3], a[4]);
     default:
         gemu_log("Unsupported socketcall: %d\n", num);
-        ret = -TARGET_ENOSYS;
-        break;
+        return -TARGET_ENOSYS;
     }
-    return ret;
 }
 #endif
 
-- 
1.7.10.4


