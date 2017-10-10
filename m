Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1ufA-0000EM-MI
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2017 09:33:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e1uf2-0000BC-NU
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 09:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e1uey-00015p-Rt
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 09:33:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1e1ueo-00011U-QY; Tue, 10 Oct 2017 09:33:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DC59C057FA8;
	Tue, 10 Oct 2017 13:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4DC59C057FA8
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-166.ams2.redhat.com
	[10.36.116.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A40BF77718;
	Tue, 10 Oct 2017 13:33:07 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Laurent Vivier <lvivier@redhat.com>
Date: Tue, 10 Oct 2017 15:32:41 +0200
Message-Id: <20171010133241.11330-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 10 Oct 2017 13:33:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] pc: remove useless hot_add_cpu initialisation
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
X-List-Received-Date: Tue, 10 Oct 2017 13:33:35 -0000

Since 4458fb3a79 (pc: Eliminate pc_default_machine_options()),
hot_add_cpu is set in pc_machine_class_init(), so we don't
need to set it in pc_q35_machine_options(), pc_i440fx_machine_options()
and xenfv_machine_options(), except to clear it in
pc_i440fx_1_4_machine_opt().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/i386/pc_piix.c | 2 --
 hw/i386/pc_q35.c  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9ff79b1fd9..caf166aede 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -428,7 +428,6 @@ static void pc_i440fx_machine_options(MachineClass *m)
 {
     m->family = "pc_piix";
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
-    m->hot_add_cpu = pc_hot_add_cpu;
     m->default_machine_opts = "firmware=bios-256k.bin";
     m->default_display = "std";
 }
@@ -1123,7 +1122,6 @@ static void xenfv_machine_options(MachineClass *m)
     m->desc = "Xen Fully-virtualized PC";
     m->max_cpus = HVM_MAX_VCPUS;
     m->default_machine_opts = "accel=xen";
-    m->hot_add_cpu = pc_hot_add_cpu;
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv", pc_xen_hvm_init,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 6c4ec4be4e..da3ea602e1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -295,7 +295,6 @@ static void pc_q35_machine_options(MachineClass *m)
 {
     m->family = "pc_q35";
     m->desc = "Standard PC (Q35 + ICH9, 2009)";
-    m->hot_add_cpu = pc_hot_add_cpu;
     m->units_per_default_bus = 1;
     m->default_machine_opts = "firmware=bios-256k.bin";
     m->default_display = "std";
-- 
2.13.6


