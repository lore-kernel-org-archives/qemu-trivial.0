Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfvcI-0005gU-HI
	for mharc-qemu-trivial@gnu.org; Wed, 08 Apr 2015 15:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuL5-0001ng-JL
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuL4-0001Qi-JZ
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:35 -0400
Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233]:34476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>)
	id 1YfuKz-0001Ls-2N; Wed, 08 Apr 2015 14:04:29 -0400
Received: by pdbqa5 with SMTP id qa5so66109307pdb.1;
	Wed, 08 Apr 2015 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nfy9kgtZINvioooskD6K8MDG38S5/Fy5UuB62MlD+vU=;
	b=JXJKktE6rGJU33OWSYmVFOE/i2hLYkb/iRnoj0BhedzJmBNRJICPikecUDDWe7Mgim
	lAYubl1gqtqYHB8m/9tw+64TFashi62mQzD5dTfJ3R94vBlgJvSO3P5FEsXl0Y+dSilI
	XoIRrCZNaES/PbSiyDoPlJNporSSHyQ4UwFI4G2zOO3aOVqxpnXd9oY3S1fUtgYlgUMj
	PfY7WNgO7PoN8vq0NvcKYJ4CLgA6h92zaW6+SS5LErYjWpjWpeT+Fgv2DKyQkqlDeOPI
	uUMqRBcqylrhNcgHMaKapd8aw5wufVbRUpvV5EBjYYTBvxcjyIbTfZE1+EoGfMeYbtZ/
	h7IQ==
X-Received: by 10.70.39.99 with SMTP id o3mr37405780pdk.10.1428516268399;
	Wed, 08 Apr 2015 11:04:28 -0700 (PDT)
Received: from localhost.localdomain (118-167-152-188.dynamic.hinet.net.
	[118.167.152.188])
	by mx.google.com with ESMTPSA id w1sm11968593pdp.25.2015.04.08.11.04.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Apr 2015 11:04:27 -0700 (PDT)
From: Chih-Min Chao <cmchao@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Apr 2015 02:04:14 +0800
Message-Id: <1428516254-23054-6-git-send-email-cmchao@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::233
X-Mailman-Approved-At: Wed, 08 Apr 2015 15:26:23 -0400
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PATCH 5/5] hw/display : remove 'struct' from
	'typedef QXL struct'
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
X-List-Received-Date: Wed, 08 Apr 2015 18:04:36 -0000

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 hw/display/qxl.c   | 2 +-
 ui/spice-display.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index b6d65b9..0cd314c 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -696,7 +696,7 @@ static inline void qxl_push_free_res(PCIQXLDevice *d, int flush)
 
 /* called from spice server thread context only */
 static void interface_release_resource(QXLInstance *sin,
-                                       struct QXLReleaseInfoExt ext)
+                                       QXLReleaseInfoExt ext)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
     QXLReleaseRing *ring;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 6767d08..32263a3 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -536,7 +536,7 @@ static void interface_get_init_info(QXLInstance *sin, QXLDevInitInfo *info)
     info->n_surfaces = ssd->num_surfaces;
 }
 
-static int interface_get_command(QXLInstance *sin, struct QXLCommandExt *ext)
+static int interface_get_command(QXLInstance *sin, QXLCommandExt *ext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     SimpleSpiceUpdate *update;
@@ -563,7 +563,7 @@ static int interface_req_cmd_notification(QXLInstance *sin)
 }
 
 static void interface_release_resource(QXLInstance *sin,
-                                       struct QXLReleaseInfoExt rext)
+                                       QXLReleaseInfoExt rext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     SimpleSpiceUpdate *update;
@@ -586,7 +586,7 @@ static void interface_release_resource(QXLInstance *sin,
     }
 }
 
-static int interface_get_cursor_command(QXLInstance *sin, struct QXLCommandExt *ext)
+static int interface_get_cursor_command(QXLInstance *sin, QXLCommandExt *ext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     int ret;
-- 
1.9.1


