Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVdEI-0001WS-Sf
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 10:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iVdEG-0001Te-7H
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:09:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iVdED-00087K-Dk
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:09:42 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42358
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iVdED-00086y-5b
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573830580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/C08I94E41LhRbG7BjaHY25aetPMw9QUs0aFH5/d2/c=;
 b=Vj+qBxloflDQhBOSmFh2jUjktGHZqrKqZ+JFF5ari95d13HmNnOwntZZKNYCtT8BxtHXuU
 CZQy8MqWzffAGrAfAPuUZKC/Gd7MHXvzKaWOvvWzdF3EOuhN9Zfx4GE1c464Qbu4pFyT+7
 zmHIp0zTs3lM2MJyzC0S+QdQ+zsq7gA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-xqQ2s-ssNjCwKT03Gb6qhA-1; Fri, 15 Nov 2019 10:09:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25CF2649B;
 Fri, 15 Nov 2019 15:09:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-84.ams2.redhat.com
 [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 628FF60C81;
 Fri, 15 Nov 2019 15:09:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA is
 disabled
Date: Fri, 15 Nov 2019 15:50:49 +0100
Message-Id: <20191115145049.26868-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: xqQ2s-ssNjCwKT03Gb6qhA-1
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
X-List-Received-Date: Fri, 15 Nov 2019 15:09:45 -0000

When CONFIG_IDE_ISA is disabled, compilation currently fails:

 hw/i386/pc_piix.c: In function =E2=80=98pc_init1=E2=80=99:
 hw/i386/pc_piix.c:81:9: error: unused variable =E2=80=98i=E2=80=99 [-Werro=
r=3Dunused-variable]

Move the variable declaration to the right code block to avoid
this problem.

Fixes: 4501d317b50e ("hw/i386/pc: Extract pc_i8259_create()")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2aefa3b8df..d187db761c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
     X86MachineState *x86ms =3D X86_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *system_io =3D get_system_io();
-    int i;
     PCIBus *pci_bus;
     ISABus *isa_bus;
     PCII440FXState *i440fx_state;
@@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
     }
 #ifdef CONFIG_IDE_ISA
 else {
-        for(i =3D 0; i < MAX_IDE_BUS; i++) {
+        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
             ISADevice *dev;
             char busname[] =3D "ide.0";
             dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i],
--=20
2.23.0


