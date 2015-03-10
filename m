Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKzM-0006Lo-JR
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 10:18:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paulo.vital@profitbricks.com>) id 1YVIIS-0008IJ-QP
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 07:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paulo.vital@profitbricks.com>) id 1YVIIN-0004XL-N4
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 07:26:00 -0400
Received: from mail-wg0-f46.google.com ([74.125.82.46]:35400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paulo.vital@profitbricks.com>) id 1YVIIN-0004X8-GN
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 07:25:55 -0400
Received: by wggy19 with SMTP id y19so1066743wgg.2
	for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2015 04:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NVbEFVKYLg8KOmYUaPiHsX2Ia3antHhhfVSpsm0Z7WI=;
	b=Gvgy0iMdAVCobxcHfjQJBKk4fOVj5ESVthU+Ta6ExquFSe2FMhFBchf824IpP2b5ec
	BGzLYUyvTeK3XRbwoE1aBt5fK66U3rc9FGZafdBKtTAoaO8wfbk/EjtKSiv6lgWd1CkZ
	ZvR/An1Vlkx5aod1x9HjnotTKJvj9bADyUbjOoAxLJXl4UpjwLDI9k2ElZOw/9nM6Yra
	aN2WX4AjQsa30f1uzXIvuFPfsJet2ophq+vXQwbHeIjGYCA2MBQnhTrvtHR5BZu8j2Gf
	k4EmOc+IBMhCDXiqYP5/zOliEUnqahmTDwu4WggEoi5hfHJR5u2dfiQQwwiSIuFsolFh
	F7Bg==
X-Gm-Message-State: ALoCoQl2N59OEDg/TurCQBbJ2QPj/IAMbJHvddHfy4vPCs02a57/4ndxLxjYBA4kMNTOCyPebqlg
X-Received: by 10.180.208.74 with SMTP id mc10mr112607177wic.38.1425986754805; 
	Tue, 10 Mar 2015 04:25:54 -0700 (PDT)
Received: from grippen.pb.local ([62.217.45.26])
	by mx.google.com with ESMTPSA id l9sm1135129wij.16.2015.03.10.04.25.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 04:25:52 -0700 (PDT)
From: Paulo Vital <paulo.vital@profitbricks.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 12:25:51 +0100
Message-Id: <1425986751-16150-1-git-send-email-paulo.vital@profitbricks.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.46
X-Mailman-Approved-At: Tue, 10 Mar 2015 10:18:26 -0400
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com,
	Paulo Vital <paulo.vital@profitbricks.com>
Subject: [Qemu-trivial] [PATCH V2] pc-dimm: Add description for device list.
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
X-List-Received-Date: Tue, 10 Mar 2015 11:26:02 -0000

The pc-dimm option presented on device list (by argument "-device \?")
is the unique option that don't have any information about it. This
patch adds a description for the pc-dimm device to help users to
identify it.

Signed-off-by: Paulo Vital <paulo.vital@profitbricks.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/mem/pc-dimm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index de81b9c..39f0c97 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -351,6 +351,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
 
     dc->realize = pc_dimm_realize;
     dc->props = pc_dimm_properties;
+    dc->desc = "DIMM memory module";
 
     ddc->get_memory_region = pc_dimm_get_memory_region;
 }
-- 
2.1.4


