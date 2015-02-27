Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhV-0002zx-Md
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhN-0002e7-9B
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:51:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFh8-0007VO-3A
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:51:01 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:59893)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFh7-0007UF-AO; Fri, 27 Feb 2015 02:50:46 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCJ70326; Fri, 27 Feb 2015 15:50:34 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:26 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:12 +0800
Message-ID: <1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54F021CB.00A2, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fd2379d87aa203f93797cea9390b87ef
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 2/9] arm: fix memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 07:51:06 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/arm/digic_boards.c | 1 +
 hw/arm/highbank.c     | 1 +
 hw/arm/vexpress.c     | 1 +
 hw/arm/virt.c         | 1 +
 4 files changed, 4 insertions(+)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 2a4b872..79c453a 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -113,6 +113,7 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
             error_report("Couldn't load rom image '%s'.\n", filename);
             exit(1);
         }
+        g_free(fn);
     }
 }
 
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index a92cdc3..ddd10dc 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -282,6 +282,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
             if (load_image_targphys("sysram.bin", 0xfff88000, filesize) < 0) {
                 hw_error("Unable to load %s\n", bios_name);
             }
+            g_free(sysboot_filename);
         } else {
            hw_error("Unable to find %s\n", bios_name);
         }
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 5933454..3b194b4 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -576,6 +576,7 @@ static void vexpress_common_init(MachineState *machine)
             error_report("Could not load ROM image '%s'", bios_name);
             exit(1);
         }
+        g_free(fn);
     }
 
     /* Motherboard peripherals: the wiring is the same but the
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 69f51ac..5988423 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -565,6 +565,7 @@ static void create_flash(const VirtBoardInfo *vbi)
             error_report("Could not load ROM image '%s'", bios_name);
             exit(1);
         }
+        g_free(fn);
     }
 
     create_one_flash("virt.flash0", flashbase, flashsize);
-- 
1.7.12.4



