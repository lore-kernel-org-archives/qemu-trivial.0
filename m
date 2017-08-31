Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMqC-0003KU-Qe
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMq8-0003Fe-2L
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMq7-0006le-4W
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59600)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMq4-0006kc-V3; Thu, 31 Aug 2017 06:36:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F044285A8;
	Thu, 31 Aug 2017 10:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0F044285A8
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6BDD8B2A9;
	Thu, 31 Aug 2017 10:36:43 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Date: Thu, 31 Aug 2017 12:34:32 +0200
Message-Id: <20170831103432.6007-30-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 31 Aug 2017 10:36:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 29/29] eepro100: replace g_malloc()+memcpy()
 with g_memdup()
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
X-List-Received-Date: Thu, 31 Aug 2017 10:36:51 -0000

I found these pattern via grepping the source tree. I don't have a
coccinelle script for it!

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 hw/net/eepro100.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 5a4774aab4..a7b9f77519 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1904,8 +1904,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Er=
ror **errp)
=20
     qemu_register_reset(nic_reset, s);
=20
-    s->vmstate =3D g_malloc(sizeof(vmstate_eepro100));
-    memcpy(s->vmstate, &vmstate_eepro100, sizeof(vmstate_eepro100));
+    s->vmstate =3D g_memdup(&vmstate_eepro100, sizeof(vmstate_eepro100))=
;
     s->vmstate->name =3D qemu_get_queue(s->nic)->model;
     vmstate_register(&pci_dev->qdev, -1, s->vmstate, s);
 }
--=20
2.14.1.146.gd35faa819


