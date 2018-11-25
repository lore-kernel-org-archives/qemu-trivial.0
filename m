Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1Ou-0001X8-1j
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:53:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Os-0001Uw-7x
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:53:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Or-0006hb-H0
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:53:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1On-0006et-Bl; Sun, 25 Nov 2018 15:53:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C00430DDBD4;
	Sun, 25 Nov 2018 20:53:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7E85C1B2;
	Sun, 25 Nov 2018 20:52:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Sun, 25 Nov 2018 21:49:57 +0100
Message-Id: <20181125205000.10324-23-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sun, 25 Nov 2018 20:53:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 22/25] MAINTAINERS: Add a missing
 entry to the New World machines
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
X-List-Received-Date: Sun, 25 Nov 2018 20:53:07 -0000

The CHRP NVRAM has his own section, but since the New World
section contains the mac_nvram.c, it makes sens to also monitor
the corresponding header.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92691589b1..a248c8c564 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -930,6 +930,7 @@ F: hw/nvram/mac_nvram.c
 F: include/hw/misc/macio/
 F: include/hw/misc/mos6522.h
 F: include/hw/ppc/mac_dbdma.h
+F: include/hw/nvram/chrp_nvram.h
=20
 Old World
 M: David Gibson <david@gibson.dropbear.id.au>
--=20
2.17.2


