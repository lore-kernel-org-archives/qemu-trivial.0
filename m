Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ififb-00055f-E2
	for mharc-qemu-trivial@gnu.org; Fri, 13 Dec 2019 05:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ififX-000545-3Z
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 05:59:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ififW-0006LF-7u
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 05:59:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45528
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ififW-0006K4-2h
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 05:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576234773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AmmOFuYGtKlXxuusm4o7US5u79QybDIbfYEE1TIgLbk=;
 b=cG6r2rRmThPqdf3yyNGGY+OGhrcsZb70F+pCofxhFY+GbmvxdGbGI6m7Pqw/so7OscmyyT
 TLkB9rolBBYfoTDHG0Jk3P3SMfrhpP78I3Om4veIRUa1z5oR2sFX4GRzHnYV2IXhpcxdae
 QYk/TvL6VuMJrV5JIziWOJopCFi9RSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-6KJGTFsLNr-EC8dW4WINIA-1; Fri, 13 Dec 2019 05:59:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63EE800D48;
 Fri, 13 Dec 2019 10:59:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-134.brq.redhat.com [10.40.204.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 216916764A;
 Fri, 13 Dec 2019 10:59:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/isa/isa-bus: Use ISA_NUM_IRQS instead of magic number
Date: Fri, 13 Dec 2019 11:59:21 +0100
Message-Id: <20191213105921.9529-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 6KJGTFsLNr-EC8dW4WINIA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 13 Dec 2019 10:59:36 -0000

We have a definition for the number of ISA IRQs, use it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/isa-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 388800603b..1d79ed133c 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -85,7 +85,7 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
 qemu_irq isa_get_irq(ISADevice *dev, int isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) =3D=3D isabus=
);
-    if (isairq < 0 || isairq > 15) {
+    if (isairq < 0 || isairq > >=3D ISA_NUM_IRQS) {
         hw_error("isa irq %d invalid", isairq);
     }
     return isabus->irqs[isairq];
--=20
2.21.0


