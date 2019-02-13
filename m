Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtoe8-0004BQ-SJ
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 02:07:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtoe6-00047v-2O
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 02:07:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtodt-0000XU-H2
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 02:07:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtodq-0000OZ-IB; Wed, 13 Feb 2019 02:07:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BC4B15553;
	Wed, 13 Feb 2019 07:07:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 103FE5D9C5;
	Wed, 13 Feb 2019 07:07:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>, pbonzini@redhat.com,
	yang.zhong@intel.com, philmd@redhat.com, qemu-trivial@nongnu.org
Date: Wed, 13 Feb 2019 08:07:19 +0100
Message-Id: <1550041639-10232-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Feb 2019 07:07:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/sparc64: Explicitly set default_display =
 "std"
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
X-List-Received-Date: Wed, 13 Feb 2019 07:07:51 -0000

The sun4uv_init() function expects vga_interface_type to be either
VGA_STD or VGA_NONE and sets up a stdvga device or no vga card
accordingly.
However, the code in vl.c prefers the Cirrus VGA card to stdvga if
it is available and the user and the machine did not specify anything
else.
So far this has not been a problem, since the Cirrus VGA was not linked
into the sparc64 target. But with the upcoming Kconfig build system,
all theoretically possible PCI cards will be enabled by default, so the
Cirrus VGA card might become available on the sparc64 target, too. vl.c
then picks the wrong card, causing sun4uv_init() to abort.
Thus let's make it explicit that we always want stdvga for sparc64 and
so set default_display = "std" for these machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/sparc64/sun4u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index ff24d9b..399f2d7 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -797,6 +797,7 @@ static void sun4u_class_init(ObjectClass *oc, void *data)
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
     mc->ignore_boot_device_suffixes = true;
+    mc->default_display = "std";
     fwc->get_dev_path = sun4u_fw_dev_path;
 }
 
@@ -820,6 +821,7 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1; /* XXX for now */
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
+    mc->default_display = "std";
 }
 
 static const TypeInfo sun4v_type = {
-- 
1.8.3.1


