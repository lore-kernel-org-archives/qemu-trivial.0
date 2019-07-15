Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmy7j-0007hD-34
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2019 06:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmy7h-0007dz-SV
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2019 06:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmy7h-0006xJ-1w
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2019 06:22:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmy7f-0006rf-5B; Mon, 15 Jul 2019 06:22:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D666686658;
 Mon, 15 Jul 2019 10:22:17 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57B134505;
 Mon, 15 Jul 2019 10:22:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon, 15 Jul 2019 12:22:10 +0200
Message-Id: <20190715102210.31365-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 15 Jul 2019 10:22:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/net/e1000: Fix erroneous comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 10:22:22 -0000

Missed during the QOM convertion in 9af21dbee14.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/e1000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 1dc1466332..ec8ded7252 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1611,7 +1611,7 @@ static const VMStateDescription vmstate_e1000 =3D {
=20
 /*
  * EEPROM contents documented in Tables 5-2 and 5-3, pp. 98-102.
- * Note: A valid DevId will be inserted during pci_e1000_init().
+ * Note: A valid DevId will be inserted during pci_e1000_realize().
  */
 static const uint16_t e1000_eeprom_template[64] =3D {
     0x0000, 0x0000, 0x0000, 0x0000,      0xffff, 0x0000,      0x0000, 0x=
0000,
--=20
2.20.1


