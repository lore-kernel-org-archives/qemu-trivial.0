Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vuzya-0004NK-Ku
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 02:30:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nerv@dawncrow.de>) id 1Vusjq-0005D2-DS
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 18:47:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nerv@dawncrow.de>) id 1Vusjl-00055W-IO
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 18:47:14 -0500
Received: from moutng.kundenserver.de ([212.227.126.171]:53167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nerv@dawncrow.de>) id 1Vusjl-00055S-7r
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 18:47:09 -0500
Received: from [192.168.178.50] (pD95322EE.dip0.t-ipconnect.de [217.83.34.238])
	by mrelayeu.kundenserver.de (node=mreu4) with ESMTP (Nemesis)
	id 0La6Uk-1VDXEA2xv4-00m2r0; Mon, 23 Dec 2013 00:47:01 +0100
Message-ID: <52B779F1.5080901@dawncrow.de>
Date: Mon, 23 Dec 2013 00:46:57 +0100
From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:Ce73e23gqtYKbvPhtiPJhTC+CUDsEpmDiYVxZWaH4GI
	C1p6rYqTaM+UEubZSnYJx8rVgaCNBFGEBqj3yNwLal7ZUIiAyD
	W7k44zPiIjMSSpYgdGpm0gm1qK1Vui93wCIpNIdBe1+aZz7b9z
	sBwDOVrIJIPkcu+eHXHYvLc62yENYTg0RqGcv0YymmqOgPdko6
	/MZGDHBfrj7b8BgChySvwZ/Q7+8Ar/aD0z6nBbr5MTBj02Lzwq
	PaJP2ycFOYtZZVreJ6hjxgQXqnHmu8zO9b557J8fHI9raE+l4M
	h6L5oqRl2fd0C+LASdzQcZXoFwKwQPJcj87PtBhVaiBT/w6qy3
	5EDDWlVAKdp2ptV72RRQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.126.171
X-Mailman-Approved-At: Mon, 23 Dec 2013 02:30:54 -0500
Cc: Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] linux-user: Support the accept4 socketcall
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
X-List-Received-Date: Sun, 22 Dec 2013 23:47:19 -0000

From: André Hentschel <nerv@dawncrow.de>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: André Hentschel <nerv@dawncrow.de>
---
See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/net.h for the values.
Not entirely sure how to implement recvmmsg and sendmmsg...
PS: I hit send to early on the last attempt, sry.

 linux-user/syscall.c      | 15 +++++++++++++++
 linux-user/syscall_defs.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index efd1453..475fb8c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2245,6 +2245,21 @@ static abi_long do_socketcall(int num, abi_ulong vptr)
             ret = do_accept4(sockfd, target_addr, target_addrlen, 0);
         }
         break;
+    case SOCKOP_accept4:
+        {
+            abi_ulong sockfd;
+            abi_ulong target_addr, target_addrlen;
+            abi_ulong flags;
+
+            if (get_user_ual(sockfd, vptr)
+                || get_user_ual(target_addr, vptr + n)
+                || get_user_ual(target_addrlen, vptr + 2 * n)
+                || get_user_ual(flags, vptr + 3 * n))
+                return -TARGET_EFAULT;
+
+            ret = do_accept4(sockfd, target_addr, target_addrlen, flags);
+        }
+        break;
     case SOCKOP_getsockname:
         {
             abi_ulong sockfd;
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index cf08db5..b36f99c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -27,6 +27,9 @@
 #define SOCKOP_getsockopt       15
 #define SOCKOP_sendmsg          16
 #define SOCKOP_recvmsg          17
+#define SOCKOP_accept4          18
+#define SOCKOP_recvmmsg         19
+#define SOCKOP_sendmmsg         20
 
 #define IPCOP_semop		1
 #define IPCOP_semget		2
-- 
1.8.1.2


