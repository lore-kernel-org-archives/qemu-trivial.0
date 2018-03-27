Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0v6b-0007nZ-Eg
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2018 16:22:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f0v6Z-0007lx-2Y
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 16:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f0v6Y-0002hs-6f
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 16:22:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50618 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f0v6U-0002fY-0I; Tue, 27 Mar 2018 16:21:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9102C8182D2A;
	Tue, 27 Mar 2018 20:21:57 +0000 (UTC)
Received: from red.redhat.com (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA3163534;
	Tue, 27 Mar 2018 20:21:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Mar 2018 15:21:51 -0500
Message-Id: <20180327202152.1799131-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 27 Mar 2018 20:21:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 27 Mar 2018 20:21:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH for-2.12] dump: Fix build with newer gcc
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 20:22:04 -0000

gcc 8 on rawhide is picky enough to complain:

/home/dummy/qemu/dump.c: In function 'create_header32':
/home/dummy/qemu/dump.c:817:5: error: 'strncpy' output truncated before terminating nul copying 8 bytes from a string of the same length [-Werror=stringop-truncation]
     strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

But we already have SIG_LEN defined as the right length without needing
to do a strlen(), and memcpy() is better than strncpy() when we know
we do not want a trailing NUL byte.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 dump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dump.c b/dump.c
index 669f715274d..b54cd42b217 100644
--- a/dump.c
+++ b/dump.c
@@ -814,7 +814,7 @@ static void create_header32(DumpState *s, Error **errp)
     size = sizeof(DiskDumpHeader32);
     dh = g_malloc0(size);

-    strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
+    memcpy(dh->signature, KDUMP_SIGNATURE, SIG_LEN);
     dh->header_version = cpu_to_dump32(s, 6);
     block_size = s->dump_info.page_size;
     dh->block_size = cpu_to_dump32(s, block_size);
@@ -926,7 +926,7 @@ static void create_header64(DumpState *s, Error **errp)
     size = sizeof(DiskDumpHeader64);
     dh = g_malloc0(size);

-    strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
+    memcpy(dh->signature, KDUMP_SIGNATURE, SIG_LEN);
     dh->header_version = cpu_to_dump32(s, 6);
     block_size = s->dump_info.page_size;
     dh->block_size = cpu_to_dump32(s, block_size);
-- 
2.14.3


