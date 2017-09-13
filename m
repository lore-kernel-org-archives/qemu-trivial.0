Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ds3dy-0003Ng-2K
	for mharc-qemu-trivial@gnu.org; Wed, 13 Sep 2017 05:07:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ds3dv-0003LZ-MJ
	for qemu-trivial@nongnu.org; Wed, 13 Sep 2017 05:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ds3ds-0000dD-Gv
	for qemu-trivial@nongnu.org; Wed, 13 Sep 2017 05:07:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ds3dg-0000QK-Ft; Wed, 13 Sep 2017 05:07:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F5CA80464;
	Wed, 13 Sep 2017 09:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8F5CA80464
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-123.ams2.redhat.com
	[10.36.116.123])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 046F861981;
	Wed, 13 Sep 2017 09:07:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	qemu-trivial@nongnu.org
Date: Wed, 13 Sep 2017 11:07:17 +0200
Message-Id: <1505293637-10450-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 13 Sep 2017 09:07:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/isa/pc87312: Mark the device with
 user_creatable = false
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
X-List-Received-Date: Wed, 13 Sep 2017 09:07:37 -0000

QEMU currently aborts if you try to use the device at the command
line:

$ ppc64-softmmu/qemu-system-ppc64 -S -machine prep -device pc87312
Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
qemu-system-ppc64: -device pc87312: Device 'parallel0' is in use
Aborted (core dumped)

It uses parallel_hds in its realize function, so I can not be
instantiated by the user again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/isa/pc87312.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 5ce9f0a..48b29e3 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -386,6 +386,8 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
     dc->reset = pc87312_reset;
     dc->vmsd = &vmstate_pc87312;
     dc->props = pc87312_properties;
+    /* Reason: Uses parallel_hds[0] in realize(), so it can't be used twice */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo pc87312_type_info = {
-- 
1.8.3.1


