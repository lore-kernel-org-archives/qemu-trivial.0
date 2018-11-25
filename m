Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1OO-00011V-TZ
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:52:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OM-0000yZ-BV
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OL-0006L5-Li
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45744)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1OH-0006HM-Jr; Sun, 25 Nov 2018 15:52:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA52C3078AA3;
	Sun, 25 Nov 2018 20:52:28 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4985C1B2;
	Sun, 25 Nov 2018 20:52:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 25 Nov 2018 21:49:50 +0100
Message-Id: <20181125205000.10324-16-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 25 Nov 2018 20:52:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 15/25] MAINTAINERS: Add missing
 entries for the Canon DIGIC machine
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
X-List-Received-Date: Sun, 25 Nov 2018 20:52:35 -0000

This pattern now also matches:
- include/hw/timer/digic-timer.h
- include/hw/char/digic-uart.h

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eab0fb9742..e04f2f1a44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -527,6 +527,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
+F: include/hw/*/digic*
=20
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
--=20
2.17.2


