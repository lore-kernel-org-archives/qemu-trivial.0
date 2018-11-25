Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1OB-0000nu-4I
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:52:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1O9-0000m1-4B
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1O8-0006Du-DT
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1O2-000653-CC; Sun, 25 Nov 2018 15:52:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2DE33DE03;
	Sun, 25 Nov 2018 20:52:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF16D5C21A;
	Sun, 25 Nov 2018 20:52:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 25 Nov 2018 21:49:47 +0100
Message-Id: <20181125205000.10324-13-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 25 Nov 2018 20:52:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 12/25] MAINTAINERS: Add missing
 entries to the PC Chipset section
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
X-List-Received-Date: Sun, 25 Nov 2018 20:52:22 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f89e37a1e..bfe71f2555 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1126,11 +1126,13 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: hw/watchdog/wdt_ib700.c
+F: hw/watchdog/wdt_i6300esb.c
 F: include/hw/display/vga.h
 F: include/hw/char/parallel.h
 F: include/hw/dma/i8257.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/input/i8042.h
+F: include/hw/isa/i8259_internal.h
 F: include/hw/isa/superio.h
 F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
--=20
2.17.2


