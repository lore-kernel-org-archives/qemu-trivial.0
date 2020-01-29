Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwlXx-0003sM-6Y
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jan 2020 06:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iwlXv-0003qt-0P
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 06:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iwlXs-0006Q5-U7
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 06:30:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45839
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iwlXs-0006OP-QR
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 06:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580297407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9vA2Gw92gXfzqmk4aDzT/TiikK1Fjy6BnvJ6wVpHazo=;
 b=aCn8UeYyny0QRjM7pRSFG1OohbQC0flmuR6F278Hji8JctDCEtBhjCwKZkt3E//SRVNR0M
 O7EAj5fLHvhLVFHtUUogOhUjec2Bf+391liiYdgbNSD2eUUdGG6F+liSQmLtgErISJEFDk
 hpUUW467AK91zntuyLJl8Q0RTUbpjpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-U284RoYDOfmVICkyz6tWhA-1; Wed, 29 Jan 2020 06:30:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5D31800D41;
 Wed, 29 Jan 2020 11:30:01 +0000 (UTC)
Received: from thuth.com (ovpn-116-210.ams2.redhat.com [10.36.116.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5563687041;
 Wed, 29 Jan 2020 11:29:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Michael S . Tsirkin " <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] hw/i386/vmmouse: Fix crash when using the vmmouse on a
 machine without vmport
Date: Wed, 29 Jan 2020 12:29:54 +0100
Message-Id: <20200129112954.4282-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: U284RoYDOfmVICkyz6tWhA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Wed, 29 Jan 2020 11:30:12 -0000

QEMU currently crashes when the user tries to use the "vmmouse" on a
machine without vmport, e.g.:

 $ x86_64-softmmu/qemu-system-x86_64 -machine microvm -device vmmouse
 Segmentation fault (core dumped)

or:

 $ x86_64-softmmu/qemu-system-x86_64 -device vmmouse -M pc,vmport=3Doff
 Segmentation fault (core dumped)

Let's avoid the crash by checking for the vmport device first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/vmmouse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 7c2a375527..e8e62bd96b 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "hw/input/i8042.h"
@@ -269,6 +270,11 @@ static void vmmouse_realizefn(DeviceState *dev, Error =
**errp)
=20
     DPRINTF("vmmouse_init\n");
=20
+    if (!object_resolve_path_type("", TYPE_VMPORT, NULL)) {
+        error_setg(errp, "vmmouse needs a machine with vmport");
+        return;
+    }
+
     vmport_register(VMMOUSE_STATUS, vmmouse_ioport_read, s);
     vmport_register(VMMOUSE_COMMAND, vmmouse_ioport_read, s);
     vmport_register(VMMOUSE_DATA, vmmouse_ioport_read, s);
--=20
2.18.1


