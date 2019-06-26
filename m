Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg6vG-0005ME-Ay
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 08:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hg6vC-0005Dd-QA
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 08:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hg6vB-0005rl-Uy
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 08:21:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49073)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hg6v8-0005iL-2e; Wed, 26 Jun 2019 08:21:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DAA393082E64;
 Wed, 26 Jun 2019 12:20:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46FCD1001281;
 Wed, 26 Jun 2019 12:20:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 26 Jun 2019 14:20:41 +0200
Message-Id: <20190626122042.7656-2-philmd@redhat.com>
In-Reply-To: <20190626122042.7656-1-philmd@redhat.com>
References: <20190626122042.7656-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 26 Jun 2019 12:20:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/2] MAINTAINERS: Add missing m48t59 files to
 the PReP section
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
X-List-Received-Date: Wed, 26 Jun 2019 12:21:07 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cad58b9487..fbe89c0812 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1047,6 +1047,8 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.c
 F: hw/dma/i82374.c
+F: hw/timer/m48t59.c
+F: hw/timer/m48t59-internal.h
 F: hw/timer/m48t59-isa.c
 F: include/hw/isa/pc87312.h
 F: include/hw/timer/m48t59.h
--=20
2.20.1


