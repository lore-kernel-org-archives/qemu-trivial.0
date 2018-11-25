Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1OW-00018n-JX
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:52:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OT-00015o-GE
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OO-0006MH-EI
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1OL-0006KG-37; Sun, 25 Nov 2018 15:52:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6729883F46;
	Sun, 25 Nov 2018 20:52:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B05D95C1B2;
	Sun, 25 Nov 2018 20:52:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 25 Nov 2018 21:49:51 +0100
Message-Id: <20181125205000.10324-17-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 25 Nov 2018 20:52:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 16/25] MAINTAINERS: Add missing
 entries for the MPS2 machine
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
X-List-Received-Date: Sun, 25 Nov 2018 20:52:43 -0000

Missed in de343bb632a.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e04f2f1a44..2795135a09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -587,6 +587,8 @@ F: hw/misc/mps2-*.c
 F: include/hw/misc/mps2-*.h
 F: hw/arm/iotkit.c
 F: include/hw/arm/iotkit.h
+F: hw/misc/iotkit-secctl.c
+F: include/hw/misc/iotkit-secctl.h
 F: hw/misc/iotkit-sysctl.c
 F: include/hw/misc/iotkit-sysctl.h
 F: hw/misc/iotkit-sysinfo.c
--=20
2.17.2


