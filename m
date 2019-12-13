Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifira-0001yz-OW
	for mharc-qemu-trivial@gnu.org; Fri, 13 Dec 2019 06:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ifirX-0001wo-KH
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 06:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ifirW-0000ZL-Jg
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 06:11:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43924
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ifirW-0000YE-Gq
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 06:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576235517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9m3dEZtdHZV4704oi8uUh8EJBV6qZdzh2uIOy9D2PN0=;
 b=cUZUvd4JQJ7yBiToLNGdTXrI9QpAmJTgCm+IXsGx9diLUvT6rjDwP3VVhstYqMqdnVT7HJ
 sb9cJEWpbA3bh+/gwj80ApxFbHxD9pmTyya48xF0sxD0RtNz6qkXBzVwRRS5lSHRbJOPaw
 yRseOFptLsYRq6ZXHu809IDUA7/aCPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-km6ISO6JOp2eqirXKCoUXw-1; Fri, 13 Dec 2019 06:11:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DDB6800D41;
 Fri, 13 Dec 2019 11:11:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-134.brq.redhat.com [10.40.204.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54EC75C3FD;
 Fri, 13 Dec 2019 11:11:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/i386/pc: Simplify ioapic_init_gsi()
Date: Fri, 13 Dec 2019 12:11:45 +0100
Message-Id: <20191213111145.11288-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: km6ISO6JOp2eqirXKCoUXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 13 Dec 2019 11:12:00 -0000

All callers of ioapic_init_gsi() provide a parent. We want new
uses to follow the same good practice and provide the parent
name, so do not make this optional: assert the parent name is
provided, and simplify the code.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ac08e63604..234945d328 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1488,15 +1488,14 @@ void ioapic_init_gsi(GSIState *gsi_state, const cha=
r *parent_name)
     SysBusDevice *d;
     unsigned int i;
=20
+    assert(parent_name);
     if (kvm_ioapic_in_kernel()) {
         dev =3D qdev_create(NULL, TYPE_KVM_IOAPIC);
     } else {
         dev =3D qdev_create(NULL, TYPE_IOAPIC);
     }
-    if (parent_name) {
-        object_property_add_child(object_resolve_path(parent_name, NULL),
-                                  "ioapic", OBJECT(dev), NULL);
-    }
+    object_property_add_child(object_resolve_path(parent_name, NULL),
+                              "ioapic", OBJECT(dev), NULL);
     qdev_init_nofail(dev);
     d =3D SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(d, 0, IO_APIC_DEFAULT_ADDRESS);
--=20
2.21.0


