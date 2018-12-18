Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGJ4-0005gF-4i
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:25:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZGIz-0005cw-VT
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:25:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZGIz-0007XM-7s
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:25:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gZGIu-0007UB-UO; Tue, 18 Dec 2018 09:25:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 232559D1EB;
	Tue, 18 Dec 2018 11:57:17 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B966E1001914;
	Tue, 18 Dec 2018 11:56:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Markus Armbruster <armbru@redhat.com>, Helge Deller <deller@gmx.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 18 Dec 2018 12:56:05 +0100
Message-Id: <20181218115615.1499-3-philmd@redhat.com>
In-Reply-To: <20181218115615.1499-1-philmd@redhat.com>
References: <20181218115615.1499-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 18 Dec 2018 11:57:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 02/12] MAINTAINERS: Add missing entries
 for the sun4u machines
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
X-List-Received-Date: Tue, 18 Dec 2018 14:25:06 -0000

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Added simba
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 771b1c7b94..dac394d125 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1056,9 +1056,13 @@ Sun4u
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc64/sun4u.c
-F: pc-bios/openbios-sparc64
+F: hw/sparc64/sun4u_iommu.c
+F: include/hw/sparc/sun4u_iommu.h
 F: hw/pci-host/sabre.c
 F: include/hw/pci-host/sabre.h
+F: hw/pci-bridge/simba.c
+F: include/hw/pci-bridge/simba.h
+F: pc-bios/openbios-sparc64
=20
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
--=20
2.17.2


