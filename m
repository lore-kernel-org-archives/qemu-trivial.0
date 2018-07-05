Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eU-0004Ra-54
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eS-0004PZ-60
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eP-00055I-4d
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:36 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:46857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eO-000551-W1; Thu, 05 Jul 2018 11:58:33 -0400
Received: by mail-qt0-x242.google.com with SMTP id h5-v6so7495259qtm.13;
	Thu, 05 Jul 2018 08:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H03p4Tf4TqrUAQvbNZhv9R3wgc4aoBhieQxGlIlZdp0=;
	b=Zd1a9b2lzHjBC3JptLmQ7ejZd92lVpQpsCGH9wYQ8uSG1AcBrCXVbA1svaBn/mX/rF
	3dUZAcEzjTXsyEsMO1swr4qJL1nfxV3mNttHSzxjTZk2hCB9MDQdMr4ISzMuidHQdgjx
	+1GwwtwYUJ6OkujPbsAgAn5Tbx3hthmJCCL7SrwnkNCjgkum5QqKb531A83/3BaH2ApX
	/pNQXQHsMlfhvcgbdvHG5xW+RteYXsbC7hGhPz9zFn8rTTqFONKJ+bQ9D8LkiT6qbatx
	JVL2WabzOD6qxPzBpjk8JOl2u9PpHm2DZ2zabaQ4wgE8AbJpcjX3u9lu/O3nNcrWbsWz
	vTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=H03p4Tf4TqrUAQvbNZhv9R3wgc4aoBhieQxGlIlZdp0=;
	b=YvAWwJyGlbQZVRRrGqaaznwRbb9KVLUe/BcjTK81ICBubFierX9iJi2EQczF6m2Aep
	q4HuECYjK6k3GDIsN8CRdVp1u1xmrCm4KdLtvbMEE9hTOY8Rx2xLOfqQ24pwp6KG7YhB
	plWNGID+qX0InAZ+ReggwId8NuUK4wwr3kvEUMyowo0QZ3Vlih2TwZQiDFFls+kcI/lo
	TjuQy8DjosbjmznuodpS6ZSEWzMIKQ15CeNvIgcI2EmC632xrKFbCJnzUelp+/l2pWNQ
	3xkuS9+nEWtRp1K4TtRVlo5aV/FBa5AsBPkqdyooBH+MibAp58wzEZPL1tVFUSPUz6+F
	Uhlg==
X-Gm-Message-State: APt69E2p1X1pOoq0HxYIBpgF9+0BYP8+LlIS0MCPgxSVqkLL4P0/lp0a
	69NoyDW2amDzGuaxQI08HopUH4KT
X-Google-Smtp-Source: AAOMgpcwxKc4NT8U6TZpUxEewTdX/wU0EDG1MBR7h+ocVs/+1qLBz/dq5p5p5ZzL9VtoV1Xgx7CiyQ==
X-Received: by 2002:a0c:f20b:: with SMTP id
	h11-v6mr5684236qvk.190.1530806312238; 
	Thu, 05 Jul 2018 08:58:32 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org (open list:X86)
Date: Thu,  5 Jul 2018 12:58:07 -0300
Message-Id: <20180705155811.20366-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 3/7] xen: Use the PCI_DEVICE macro
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:37 -0000

TYPE_XEN_PT_DEVICE is a subclass of TYPE_PCI_DEVICE, the clean way
to access the PCIDevice pointer is using the PCI_DEVICE() macro.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/xen/xen_pt_config_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index aee31c62bb..47f9010c75 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -358,7 +358,7 @@ static uint64_t xen_pt_get_bar_size(PCIIORegion *r)
 static XenPTBarFlag xen_pt_bar_reg_parse(XenPCIPassthroughState *s,
                                          int index)
 {
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     XenPTRegion *region = NULL;
     PCIIORegion *r;
 
@@ -469,7 +469,7 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTRegion *base = NULL;
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     const PCIIORegion *r;
     uint32_t writable_mask = 0;
     uint32_t bar_emu_mask = 0;
@@ -543,7 +543,7 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTRegion *base = NULL;
-    PCIDevice *d = (PCIDevice *)&s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     uint32_t writable_mask = 0;
     uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
     pcibus_t r_size = 0;
@@ -1587,7 +1587,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
                                  const XenPTRegGroupInfo *grp_reg,
                                  uint32_t base_offset, uint8_t *size)
 {
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     uint8_t version = get_capability_version(s, base_offset);
     uint8_t type = get_device_type(s, base_offset);
     uint8_t pcie_size = 0;
-- 
2.18.0


