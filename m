Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VuzyZ-0004Kd-Ch
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 02:30:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nerv@dawncrow.de>) id 1VusYx-00035L-7V
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 18:36:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nerv@dawncrow.de>) id 1VusYs-0002H7-Ca
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 18:35:59 -0500
Received: from moutng.kundenserver.de ([212.227.17.9]:53742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nerv@dawncrow.de>) id 1VusYs-0002GY-3D
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 18:35:54 -0500
Received: from [192.168.178.50] (pD95322EE.dip0.t-ipconnect.de [217.83.34.238])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0LqpCY-1VGqmO1eWw-00e9ZC; Mon, 23 Dec 2013 00:35:39 +0100
Message-ID: <52B77748.2090705@dawncrow.de>
Date: Mon, 23 Dec 2013 00:35:36 +0100
From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:ELNiDHxHcf2+f5uHcFVZfWJQGwPMh0Ql0J+C2h4gREA
	NJ9BOZ+o1NUuYbsHpIWHioyL16jHOiUQa8Kx5D5HhiFECkrAXJ
	ZT8b5yFjhn2xZCH3ESiMObFH2KVWr/sD1flbMMqrcSuDgI5Ca0
	MFCqBRBh5ahK8hpykOlNSRI6PduXwSa0ohaVq/5OfVXVGxLF3+
	1QWjn8BWKTbS9fvCSEnkaNOhXX3OOGw6nYszxW3OaBTdAtZvKu
	edv6MbKotsPcoKqFwGC+OFLcXlFOAv8Zy8imGFNQy0bNB8p8P1
	hsS0h33UPHgW97113jHV1Ib+jJQdb2m3Bx3UwCqzGQr1tqTJfD
	4nuKJvla+IZLEDmyFvWo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.17.9
X-Mailman-Approved-At: Mon, 23 Dec 2013 02:30:53 -0500
Cc: Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] accept4
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
X-List-Received-Date: Sun, 22 Dec 2013 23:36:04 -0000

From: André Hentschel <nerv@dawncrow.de>

See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/net.h for the values.
Not entirely sure how to implement recvmmsg and sendmmsg...

Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: André Hentschel <nerv@dawncrow.de>
---
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


