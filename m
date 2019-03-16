Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5Fib-0006By-CR
	for mharc-qemu-trivial@gnu.org; Sat, 16 Mar 2019 16:15:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h5FiY-00068s-0Y
	for qemu-trivial@nongnu.org; Sat, 16 Mar 2019 16:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h5FiW-0003M0-Tz
	for qemu-trivial@nongnu.org; Sat, 16 Mar 2019 16:15:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h5FiS-0003I4-5r; Sat, 16 Mar 2019 16:15:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6E1230254A1;
	Sat, 16 Mar 2019 20:15:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CEDA57982;
	Sat, 16 Mar 2019 20:15:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Sat, 16 Mar 2019 21:15:28 +0100
Message-Id: <20190316201528.9140-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sat, 16 Mar 2019 20:15:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/ppc/prep: Drop useless inclusion of
 "hw/input/i8042.h"
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
X-List-Received-Date: Sat, 16 Mar 2019 20:15:43 -0000

In commit 47973a2dbf we split the last generic chipset out of
the PC board, but missed to remove the i8042 keyboard controller.
This omission was later fixed in commit 7cb00357c1, but here we
forgot to remove the "i8042.h" include. Do it now.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/prep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 847d320465..b7f459d475 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -40,7 +40,6 @@
 #include "hw/ide.h"
 #include "hw/loader.h"
 #include "hw/timer/mc146818rtc.h"
-#include "hw/input/i8042.h"
 #include "hw/isa/pc87312.h"
 #include "hw/net/ne2000-isa.h"
 #include "sysemu/arch_init.h"
--=20
2.20.1


