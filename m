Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zka35-000833-IH
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:57:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2S-00070H-OY
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2P-0005hl-Gy
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33051)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1Zka2I-0005Hy-3q; Fri, 09 Oct 2015 11:56:46 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B6F8BC0BE089;
	Fri,  9 Oct 2015 15:56:45 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99Fud3N025235; Fri, 9 Oct 2015 11:56:44 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  9 Oct 2015 17:56:38 +0200
Message-Id: <1444406198-6521-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1444406198-6521-1-git-send-email-thuth@redhat.com>
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 4/4] linux-user/syscall: Replace g_malloc0
	+ memcpy with g_memdup
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
X-List-Received-Date: Fri, 09 Oct 2015 15:56:58 -0000

No need to use g_malloc0 to zero the memory if we memcpy to
the whole buffer afterwards anyway. Actually, there is even
a function which combines both steps, g_memdup, so let's use
this function here instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 98b5766..f2ada0a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5325,8 +5325,7 @@ static abi_long do_open_by_handle_at(abi_long mount_fd, abi_long handle,
         return -TARGET_EFAULT;
     }
 
-    fh = g_malloc0(total_size);
-    memcpy(fh, target_fh, total_size);
+    fh = g_memdup(target_fh, total_size);
     fh->handle_bytes = size;
     fh->handle_type = tswap32(target_fh->handle_type);
 
-- 
1.8.3.1


