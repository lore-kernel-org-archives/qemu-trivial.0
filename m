Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKzM-0006LM-Ef
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 10:18:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paulo.vital@profitbricks.com>) id 1YVHd3-0005rQ-C5
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 06:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paulo.vital@profitbricks.com>) id 1YVHcr-0004iv-VM
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 06:43:13 -0400
Received: from mail-we0-f174.google.com ([74.125.82.174]:34703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paulo.vital@profitbricks.com>) id 1YVHcr-0004ia-QX
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 06:43:01 -0400
Received: by wesx3 with SMTP id x3so822468wes.1
	for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2015 03:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CM0Wiof7/jbq16hlph8ux9JxspK3xg50WS9wTrR4Ijk=;
	b=bCWoU4DtUOnhQkM0O+ecbizsHKjI5CjbfVTZVGBGKeciQkKcx2GM0LJeKe3O5sygGK
	aOwZj+wDnF+MeUZSrMNVSDem95PRnxIKTViCprJSgWjc2YT0b2kIjEMdPUUf5uuLVBoi
	rKCdHNhHQZDw+ewjqzW3oQmu/K3/X3NmjaQS7XorecGUFKH0C+93Fo9sHSsiP+JiQ1TJ
	fzI+2rtEjYnHiwJVkwK91ZPp/RRihe93khg2jJSxmb7Fy3ztdmcTdF5Rl0P7sHJj2bOK
	qQ5czPsmcdO4QgbD8hFKCh3fWwvG99LpDqbjmXGzlmk3zDMzXkgFeDLEdbzUEDJJhwnH
	90Aw==
X-Gm-Message-State: ALoCoQkX9hwd6fmlzy18hn8lba0GxMz/4TqwASq1cOWnBKcF7p+m4vZ3gf2JsnROJklUS8v4Qxbq
X-Received: by 10.194.78.114 with SMTP id a18mr68078159wjx.0.1425984180652;
	Tue, 10 Mar 2015 03:43:00 -0700 (PDT)
Received: from grippen.pb.local ([62.217.45.26])
	by mx.google.com with ESMTPSA id
	ew5sm19657412wic.14.2015.03.10.03.42.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 03:42:59 -0700 (PDT)
From: Paulo Vital <paulo.vital@profitbricks.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 11:42:57 +0100
Message-Id: <1425984177-10608-1-git-send-email-paulo.vital@profitbricks.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.174
X-Mailman-Approved-At: Tue, 10 Mar 2015 10:18:26 -0400
Cc: qemu-trivial@nongnu.org, Paulo Vital <paulo.vital@profitbricks.com>
Subject: [Qemu-trivial] [PATCH] pc-dimm: Add description for device list.
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
X-List-Received-Date: Tue, 10 Mar 2015 10:43:18 -0000

The pc-dimm option presented on device list (by argument "-device \?")
is the unique option that don't have any information about it. This
patch adds a description for the pc-dimm device to help users to
identify it.

Signed-off-by: Paulo Vital <paulo.vital@profitbricks.com>
---
 hw/mem/pc-dimm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index de81b9c..d3f7b5b 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -351,6 +351,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
 
     dc->realize = pc_dimm_realize;
     dc->props = pc_dimm_properties;
+    dc->desc = "Dimm device for Memory Hotplug";
 
     ddc->get_memory_region = pc_dimm_get_memory_region;
 }
-- 
2.1.4


