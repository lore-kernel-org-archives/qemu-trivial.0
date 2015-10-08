Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOf-0005KO-Lz
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGya-0004ed-Nl
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyY-0006O3-NG
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkGyV-0006Ks-0f; Thu, 08 Oct 2015 15:35:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B5127AB87A;
	Thu,  8 Oct 2015 19:35:34 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-90.ams2.redhat.com [10.36.6.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98JZH3M009701; Thu, 8 Oct 2015 15:35:32 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 21:35:16 +0200
Message-Id: <1444332916-16476-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1444332916-16476-1-git-send-email-thuth@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Subject: [Qemu-trivial] [PATCH 5/5] linux-user/syscall: Replace g_malloc0 +
	memcpy with g_memdup
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
X-List-Received-Date: Thu, 08 Oct 2015 19:35:45 -0000

No need to use g_malloc0 to zero the memory if we memcpy to
the whole buffer afterwards anyway. Actually, there is even
a function which combines both steps, g_memdup, so let's use
this function here instead.

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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


