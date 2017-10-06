Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQh-0000co-JE
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQd-0000aN-7q
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQc-0006Vz-Fs
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:15 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:48143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQa-0006Tg-7f; Fri, 06 Oct 2017 19:53:12 -0400
Received: by mail-qt0-x243.google.com with SMTP id d13so33659950qta.5;
	Fri, 06 Oct 2017 16:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AwzxV1u+FMFWfMxm8oAn6a2MVILBkbhR53tGYP/q+ms=;
	b=YA5rd6aG69gS+uQ1/Ya/BtTe5PHGRUQElyajU/1zKuyK8pymK396xMPy1E1wHo8bbc
	EZ5bDzABKJpYoFOAwi3QPVtQQLU8NZm0Yvsrwlt9r+SlfmuVyapVLPDgjxiE82mOJfUS
	i6a1KLC+YI3wuLfry76brqwPoWMQAkKLpIMiYy7nQHqbnFnRTWO9Tm+yLvM8jSXYcmdE
	Ilhvky+jdORVpcWC3G2+IIP/42Is6vHLH4dFbqUrXm0A0/I/XN62IL/WgdJWSzKpDoEl
	0Fq2EnmUDYXGzrNI0Cto0XLGd/LUTSVaz9QaqVaPc6jRN8JQroFvTDEUUYsrGBP5FJnJ
	AecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AwzxV1u+FMFWfMxm8oAn6a2MVILBkbhR53tGYP/q+ms=;
	b=l6ipSrhFo7VCFSTBa6WAtVnSjNp4XarWbqKXYukB2Ugf1hCEg3qyoUm2T4akc9T5eE
	SBqibNgGQinrDkczedqutDIhX0mC+mF34QFRiA3HG5dvHygVlpdX7LtyRSl/MNj7Ze46
	+1/enKmsyIA68feZNz1aB58zVzZSST5H0EUt3E9oNumR+Xo9etPUB+brmV+VWDTUqMJQ
	Z60RPMARTiPNywlp+Iop9BGq4+lv5ytnKCqPhRcQYxcJ0rpVntUn8jEcc0u2gehIKm98
	sLwt8jNwy2nGV80akuEdIYTfJRE5gW+qCAd/Nn9x3TrUXObaX+YCFz179SOmyL7V6mFr
	GVHQ==
X-Gm-Message-State: AMCzsaWbLcoD8FIatnX/afmbc/DNxtpNSK/w0e6PWbMTM4Yy24thiH87
	GUfB2c0C+GvrnWaHGnEukuM=
X-Google-Smtp-Source: AOwi7QCG8KLe7wxrfd/gMfRTsBfKIhWQEv3k24U0hdikJ9ahcGX2qGd4liY/cofkhZGjVwQzwc02tg==
X-Received: by 10.237.48.236 with SMTP id 99mr5560935qtf.316.1507333991686;
	Fri, 06 Oct 2017 16:53:11 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:41 -0300
Message-Id: <20171006235023.11952-47-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 46/88] hw/display/vga: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:18 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Gerd: should those files go under Graphics section in MAINTAINERS?

 hw/display/vga-isa-mm.c | 6 +++---
 hw/display/vga.c        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 51ccbccc41..7af72864df 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -105,12 +105,12 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
 
     s->it_shift = it_shift;
-    s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
+    s_ioport_ctrl = g_new(MemoryRegion, 1);
     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
                           "vga-mm-ctrl", 0x100000);
     memory_region_set_flush_coalesced(s_ioport_ctrl);
 
-    vga_io_memory = g_malloc(sizeof(*vga_io_memory));
+    vga_io_memory = g_new(MemoryRegion, 1);
     /* XXX: endianness? */
     memory_region_init_io(vga_io_memory, NULL, &vga_mem_ops, &s->vga,
                           "vga-mem", 0x20000);
@@ -130,7 +130,7 @@ int isa_vga_mm_init(hwaddr vram_base,
 {
     ISAVGAMMState *s;
 
-    s = g_malloc0(sizeof(*s));
+    s = g_new0(ISAVGAMMState, 1);
 
     s->vga.vram_size_mb = VGA_RAM_SIZE >> 20;
     vga_common_init(&s->vga, NULL, true);
diff --git a/hw/display/vga.c b/hw/display/vga.c
index ed24ef7076..bdefa60f30 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2236,7 +2236,7 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
     *vga_ports = vga_portio_list;
     *vbe_ports = vbe_portio_list;
 
-    vga_mem = g_malloc(sizeof(*vga_mem));
+    vga_mem = g_new(MemoryRegion, 1);
     memory_region_init_io(vga_mem, obj, &vga_mem_ops, s,
                           "vga-lowmem", 0x20000);
     memory_region_set_flush_coalesced(vga_mem);
-- 
2.14.2


