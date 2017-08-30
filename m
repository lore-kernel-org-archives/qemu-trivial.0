Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn3DH-0004OP-O2
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 09:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dn3DF-0004Ma-MY
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 09:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dn3DB-0004Wo-R8
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 09:39:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dn3D7-0004Sk-54; Wed, 30 Aug 2017 09:39:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67F518763A;
	Wed, 30 Aug 2017 13:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67F518763A
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-68.ams2.redhat.com [10.36.116.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D92848D543;
	Wed, 30 Aug 2017 13:39:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Wed, 30 Aug 2017 15:39:03 +0200
Message-Id: <1504100343-26607-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 30 Aug 2017 13:39:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.11] hw/misc/ivshmem: Fix
 ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Wed, 30 Aug 2017 13:39:22 -0000

The "slow" ivshmem-tests currently fail when they are running on a
big endian host:

$ uname -m
ppc64
$ V=1 QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 tests/ivshmem-test -m slow
/x86_64/ivshmem/single: OK
/x86_64/ivshmem/hotplug: OK
/x86_64/ivshmem/memdev: OK
/x86_64/ivshmem/pair: OK
/x86_64/ivshmem/server-msi: qemu-system-x86_64:
 -device ivshmem-doorbell,chardev=chr0,vectors=2: server sent invalid ID message
Broken pipe

The problem is that the server side code in ivshmem_server_send_one_msg()
correctly translates all messages IDs into little endian 64-bit values,
but the client side code in the ivshmem_recv_msg() function does not swap
the byte order back. Fix it by passing the value through le64_to_cpu().

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/ivshmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 47a015f..b3ef3ec 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -653,7 +653,7 @@ static int64_t ivshmem_recv_msg(IVShmemState *s, int *pfd, Error **errp)
     } while (n < sizeof(msg));
 
     *pfd = qemu_chr_fe_get_msgfd(&s->server_chr);
-    return msg;
+    return le64_to_cpu(msg);
 }
 
 static void ivshmem_recv_setup(IVShmemState *s, Error **errp)
-- 
1.8.3.1


