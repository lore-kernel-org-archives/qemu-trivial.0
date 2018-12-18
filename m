Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGIo-0005TQ-Du
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:24:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZGIj-0005R7-8G
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:24:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZGIh-0007NO-DV
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:24:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gZGIc-0007L6-5A; Tue, 18 Dec 2018 09:24:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 874F158E38;
	Tue, 18 Dec 2018 11:57:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 051A61059581;
	Tue, 18 Dec 2018 11:57:26 +0000 (UTC)
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
Date: Tue, 18 Dec 2018 12:56:07 +0100
Message-Id: <20181218115615.1499-5-philmd@redhat.com>
In-Reply-To: <20181218115615.1499-1-philmd@redhat.com>
References: <20181218115615.1499-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 18 Dec 2018 11:57:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 04/12] MAINTAINERS: Add missing entries to
 VFIO and NVMe
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
X-List-Received-Date: Tue, 18 Dec 2018 14:24:53 -0000

The VFIO helpers are used by the NVMe block driver, add the
entries to both sections.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: add util/vfio-helpers.c, add entries to NVMe section
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3305a65b6..7a94b0dab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1365,7 +1365,10 @@ VFIO
 M: Alex Williamson <alex.williamson@redhat.com>
 S: Supported
 F: hw/vfio/*
+F: util/vfio-helpers.c
 F: include/hw/vfio/
+F: include/qemu/vfio-helpers.h
+F: docs/igd-assign.txt
=20
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
@@ -2290,6 +2293,8 @@ M: Fam Zheng <fam@euphon.net>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/nvme*
+F: util/vfio-helpers.c
+F: include/qemu/vfio-helpers.h
=20
 Bootdevice
 M: Gonglei <arei.gonglei@huawei.com>
--=20
2.17.2


