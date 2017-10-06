Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRL-0001Fx-Nq
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRK-0001Cl-3f
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRJ-000766-4t
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:58 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRF-00072I-Ds; Fri, 06 Oct 2017 19:53:53 -0400
Received: by mail-qk0-x242.google.com with SMTP id z14so12861819qkg.3;
	Fri, 06 Oct 2017 16:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NDdpqTJ9kavxct9lmQyVZokOhYs81BGK+YxWb7wEQC4=;
	b=ngGORyaZBCCMAiILpLaqxk0bhC7phEfOYssvQk014pnsPfCiPyAvKpNthPJfSJq390
	d23l20N2JoOYXTD4IQIGrV1Da4oGSvT8ahkiIikzPSv+In43zEorCByGxex0qtRDyvKk
	Xqosb4/xlesAOJ+vH1EEJbS2deBDPJPpR580AcExEZrnhIf9NqQn1EAibNxRJHg03fN0
	jYMluDkuXtsGhAG8hZTfQ8ij8peGRjfJDRdijn/kU0+gRii5slKmBfvEtuB+mzDPWI8x
	65EITMmU8LDvr542T3u2Hsq4ypukVuZoz0QlB8nS3bJ40DtZZEYWZ2Bu02FCn07uMgKN
	hy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NDdpqTJ9kavxct9lmQyVZokOhYs81BGK+YxWb7wEQC4=;
	b=qWkRHH6QmPrmHbw4HqxPV1WqHE+AZoDepKMfUwFIbS3RKEONKB4elyHUZBovuulBXU
	koVihQqxi8gpUkLFNY8LcMnp5P51HAHahr+B1SKcwhXqMLQEnwUu0jhkGCjPoLpzfW77
	gClLeY/AYBnTlU71xgNwAL9wCUVz/2/+/DEwgDPcvlAP356MXfbHMe4y/IE521LPwDd9
	8wUabYKsT4x11V0GOYE5TX7Igvzn1Ku0CIpBmVn4K4sguiPK0NtMuwIdBg84kr0KVRYC
	gWCoaPA1nEgz2tFORsTcNc8byAKmcDrxX8Hmgawu5g/1TEwcjyl0TJ91pr/GDs9EK0lz
	cr5w==
X-Gm-Message-State: AMCzsaXGXW8T/hQVAF0hr7AWTZdwdqKZEYLdWcci+1XhaPjsw50ICOGc
	5pYjoIoueXvjfBVM3L0dUls=
X-Google-Smtp-Source: AOwi7QCI98LTIAHAFhLy6jvtobeWtPA2y8OAOL4P9xY3Usrpl8+QpVLWX4RHYJ1P/qHTC6I+fCyovA==
X-Received: by 10.55.56.14 with SMTP id f14mr739381qka.286.1507334032844;
	Fri, 06 Oct 2017 16:53:52 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:52 -0300
Message-Id: <20171006235023.11952-58-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 57/88] ppc: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:59 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: replaced g_new0() -> g_new() in mac_newworld.c, added virtex_ml507]
---
 hw/intc/heathrow_pic.c | 2 +-
 hw/ppc/mac_newworld.c  | 5 ++---
 hw/ppc/mac_oldworld.c  | 2 +-
 hw/ppc/virtex_ml507.c  | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c
index 171f5ed814..90c1e6a4b1 100644
--- a/hw/intc/heathrow_pic.c
+++ b/hw/intc/heathrow_pic.c
@@ -201,7 +201,7 @@ qemu_irq *heathrow_pic_init(MemoryRegion **pmem,
 {
     HeathrowPICS *s;
 
-    s = g_malloc0(sizeof(HeathrowPICS));
+    s = g_new0(HeathrowPICS, 1);
     /* only 1 CPU */
     s->irqs = irqs[0];
     memory_region_init_io(&s->mem, NULL, &heathrow_pic_ops, s,
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 6d0ace20ca..59cded95b8 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -295,7 +295,7 @@ static void ppc_core99_init(MachineState *machine)
     memory_region_init_io(unin2_memory, NULL, &unin_ops, token, "unin", 0x1000);
     memory_region_add_subregion(get_system_memory(), 0xf3000000, unin2_memory);
 
-    openpic_irqs = g_malloc0(smp_cpus * sizeof(qemu_irq *));
+    openpic_irqs = g_new0(qemu_irq *, smp_cpus);
     openpic_irqs[0] =
         g_malloc0(smp_cpus * sizeof(qemu_irq) * OPENPIC_OUTPUT_NB);
     for (i = 0; i < smp_cpus; i++) {
@@ -339,8 +339,6 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    pic = g_new0(qemu_irq, 64);
-
     dev = qdev_create(NULL, TYPE_OPENPIC);
     qdev_prop_set_uint32(dev, "model", OPENPIC_MODEL_KEYLARGO);
     qdev_init_nofail(dev);
@@ -353,6 +351,7 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
+    pic = g_new(qemu_irq, 64);
     for (i = 0; i < 64; i++) {
         pic[i] = qdev_get_gpio_in(dev, i);
     }
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index bc7c8b7bd7..50ad9c56cb 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -232,7 +232,7 @@ static void ppc_heathrow_init(MachineState *machine)
     memory_region_add_subregion(sysmem, 0xfe000000, isa);
 
     /* XXX: we register only 1 output pin for heathrow PIC */
-    heathrow_irqs = g_malloc0(smp_cpus * sizeof(qemu_irq *));
+    heathrow_irqs = g_new0(qemu_irq *, smp_cpus);
     heathrow_irqs[0] =
         g_malloc0(smp_cpus * sizeof(qemu_irq) * 1);
     /* Connect the heathrow PIC outputs to the 6xx bus */
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index ed9b406fd3..ed6e054611 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -104,7 +104,7 @@ static PowerPCCPU *ppc440_init_xilinx(ram_addr_t *ram_size,
     ppc_dcr_init(env, NULL, NULL);
 
     /* interrupt controller */
-    irqs = g_malloc0(sizeof(qemu_irq) * PPCUIC_OUTPUT_NB);
+    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
     irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
     irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
     ppcuic_init(env, irqs, 0x0C0, 0, 1);
-- 
2.14.2


