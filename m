Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBItU-0004LS-T0
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2014 01:57:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBItN-0004CD-In
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 01:57:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBItI-0006oT-KD
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 01:56:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WBIt8-0006k2-7z; Thu, 06 Feb 2014 01:56:42 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ADB1740B6D;
	Thu,  6 Feb 2014 10:56:39 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9972D639;
	Thu,  6 Feb 2014 10:56:39 +0400 (MSK)
Received: (nullmailer pid 23612 invoked by uid 1000);
	Thu, 06 Feb 2014 06:56:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  6 Feb 2014 10:56:38 +0400
Message-Id: <1391669798-23577-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] linux-user: simplify/refactor socketcall
	implementation
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
X-List-Received-Date: Thu, 06 Feb 2014 06:57:02 -0000

socketcall is just a dispatcher, it accepts an array of ulongs and should
call the right socket function.  We tried to handle arguments for every
function case, and did that differently, which in the past caused errors
due to wrong types or sizes used.  So instead of extracting args in every
case, do it once (based on a small mapping of function num. to argument count)
and once this is done, just call the right function passing it the extracted
args in a ready to use form.  This also simplifies the function alot.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c |  294 +++++++++-----------------------------------------
 1 file changed, 52 insertions(+), 242 deletions(-)

I think it is okay to go to -trivial with it, even if the amount of code
it changes is large, because even if large(ish), the change is trivial.

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index bc0ac98..817468d 100644
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
+    /* argument counts per syscall number */
+    static const unsigned ac[] = {
+        [SOCKOP_socket] = 3,      /* domain, type, protocol */
+        [SOCKOP_bind] = 3,        /* fd, addr, addrlen */
+        [SOCKOP_connect] = 3,     /* fd, addr, addrlen */
+        [SOCKOP_listen] = 2,      /* fd, backlog */
+        [SOCKOP_accept] = 3,      /* fd, addr, addrlen */
+        [SOCKOP_accept4] = 4,     /* fd, addr, addrlen, flags */
+        [SOCKOP_getsockname] = 3, /* fd, addr, addrlen */
+        [SOCKOP_getpeername] = 3, /* fd, addr, addrlen */
+        [SOCKOP_socketpair] = 4,  /* domain, type, protocol, tab */
+        [SOCKOP_send] = 4,        /* fd, msg, msglen, flags */
+        [SOCKOP_recv] = 4,        /* fd, msg, msglen, flags */
+        [SOCKOP_sendto] = 6,      /* fd, msg, msglen, flags, addr, addrlen */
+        [SOCKOP_recvfrom] = 6,    /* fd, msg, msglen, flags, addr, addrlen */
+        [SOCKOP_shutdown] = 2,    /* fd, how */
+        [SOCKOP_sendmsg] = 3,     /* fd, msg, flags */
+        [SOCKOP_recvmsg] = 3,     /* fd, msg, flags */
+        [SOCKOP_setsockopt] = 5,  /* fd, level, optname, optval, optlen */
+        [SOCKOP_getsockopt] = 5,  /* fd, level, optname, optval, optlen */
+    };
+    abi_ulong a[6]; /* arguments for our call */
 
-            if (get_user_ual(domain, vptr)
-                || get_user_ual(type, vptr + n)
-                || get_user_ual(protocol, vptr + 2 * n))
+    /* first extract args from vptr according to ac[num] if num is correct */
+    if (num >= 0 && num < ARRAY_SIZE(ac)) {
+        unsigned i;
+        for (i = 0; i < ac[num]; ++i) {
+            if (get_user_ual(a[i], vptr + i * sizeof(target_ulong)) != 0) {
                 return -TARGET_EFAULT;
+            }
+        }
+    }
 
-            ret = do_socket(domain, type, protocol);
-	}
-        break;
+    /* now when the args are ready in a[], just call the right function */
+    switch (num) {
+    case SOCKOP_socket:
+        return do_socket(a[0], a[1], a[2]);
     case SOCKOP_bind:
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
+        return do_bind(a[0], a[1], a[2]);
     case SOCKOP_connect:
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
+        return do_connect(a[0], a[1], a[2]);
     case SOCKOP_listen:
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
+        return get_errno(listen(a[0], a[1]));
     case SOCKOP_accept:
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
+        return do_accept4(a[0], a[1], a[2], 0);
     case SOCKOP_accept4:
-        {
-            abi_ulong sockfd;
-            abi_ulong target_addr, target_addrlen;
-            abi_ulong flags;
-
-            if (get_user_ual(sockfd, vptr)
-                || get_user_ual(target_addr, vptr + n)
-                || get_user_ual(target_addrlen, vptr + 2 * n)
-                || get_user_ual(flags, vptr + 3 * n)) {
-                return -TARGET_EFAULT;
-            }
-
-            ret = do_accept4(sockfd, target_addr, target_addrlen, flags);
-        }
-        break;
+        return do_accept4(a[0], a[1], a[2], a[3]);
     case SOCKOP_getsockname:
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
-        }
-        break;
+        return do_getsockname(a[0], a[1], a[2]);
     case SOCKOP_getpeername:
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
+        return do_getpeername(a[0], a[1], a[2]);
     case SOCKOP_socketpair:
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
+        return do_socketpair(a[0], a[1], a[2], a[3]);
     case SOCKOP_send:
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
+        return do_sendto(a[0], a[1], a[2], a[3], 0, 0);
     case SOCKOP_recv:
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
+        return do_recvfrom(a[0], a[1], a[2], a[3], 0, 0);
     case SOCKOP_sendto:
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
+        return do_sendto(a[0], a[1], a[2], a[3], a[4], a[5]);
     case SOCKOP_recvfrom:
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
+        return do_sendto(a[0], a[1], a[2], a[3], a[4], a[5]);
     case SOCKOP_shutdown:
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
+        return get_errno(shutdown(a[0], a[1]));
     case SOCKOP_sendmsg:
+        return do_sendrecvmsg(a[0], a[1], a[2], 1);
     case SOCKOP_recvmsg:
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
+        return do_sendrecvmsg(a[0], a[1], a[2], 0);
     case SOCKOP_setsockopt:
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
+        return do_setsockopt(a[0], a[1], a[2], a[3], a[4]);
     case SOCKOP_getsockopt:
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
-
-            ret = do_getsockopt(sockfd, level, optname, optval, optlen);
-        }
-        break;
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


