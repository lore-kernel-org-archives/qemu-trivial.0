Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kONZf-0008Tl-1Q
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 12:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kONZY-0008Ld-DI
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 12:06:20 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:48280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kONZW-0008Kf-Hh
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 12:06:16 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-UG4fdhobMza-zdyzZ4Ul5A-1; Fri, 02 Oct 2020 12:06:10 -0400
X-MC-Unique: UG4fdhobMza-zdyzZ4Ul5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C79CA64089;
 Fri,  2 Oct 2020 16:06:08 +0000 (UTC)
Received: from bahia.lan (ovpn-112-192.ams2.redhat.com [10.36.112.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BA0E60C15;
 Fri,  2 Oct 2020 16:06:08 +0000 (UTC)
Subject: [PATCH] hw/acpi/piix4: Rename piix4_pm_add_propeties() to
 piix4_pm_add_properties()
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 02 Oct 2020 18:06:07 +0200
Message-ID: <160165476743.57452.2128307974125615413.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 12:06:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 02 Oct 2020 16:06:21 -0000

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/acpi/piix4.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 894d357f8c35..67a1ea41914f 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -437,7 +437,7 @@ static void piix4_pm_machine_ready(Notifier *n, void *o=
paque)
         (memory_region_present(io_as, 0x2f8) ? 0x90 : 0);
 }
=20
-static void piix4_pm_add_propeties(PIIX4PMState *s)
+static void piix4_pm_add_properties(PIIX4PMState *s)
 {
     static const uint8_t acpi_enable_cmd =3D ACPI_ENABLE;
     static const uint8_t acpi_disable_cmd =3D ACPI_DISABLE;
@@ -509,7 +509,7 @@ static void piix4_pm_realize(PCIDevice *dev, Error **er=
rp)
                                    pci_get_bus(dev), s);
     qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
=20
-    piix4_pm_add_propeties(s);
+    piix4_pm_add_properties(s);
 }
=20
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,



