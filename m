Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPl-0008Ff-Oy
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPe-0008AL-7m
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPb-0005i9-FP
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:14 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPX-0005dM-Ag; Fri, 06 Oct 2017 19:52:07 -0400
Received: by mail-qt0-x242.google.com with SMTP id o52so34323323qtc.9;
	Fri, 06 Oct 2017 16:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wpv8EGIq3j7qi+6pArxULtJw2EKh1Du6IsovEPutuLs=;
	b=Wu2QJhbs8nhdYfcroDVS+z3fr4VgOy9Shr8Wfbe306M7G2WftJqjenM6tYWrTVvkBs
	EAFDcpZxCy7nNxnL8s6/rjIWLxODRKyWSll8fxZlsQznFW4IMct/bz1lryZWcgkaZGxw
	81fk1zK3HQGDk4VhjmsibA2ItQH9/63e2cRxE3fQQOgNPCq0xVJL9q4lInGleCauEIYl
	Lr8Hq7Z14DxCUfx/VvCOZ8HW+Xbbyjf+n4A+O3X/A+0So3GZVzpYs1TSsMFPBdHuCNau
	6voM8NuWA4PZQrsjLQFQWfwaQkX0kMAbfYUhsxbAoMICJeoQ75f4FQnu58OyRB+dyVFM
	tZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wpv8EGIq3j7qi+6pArxULtJw2EKh1Du6IsovEPutuLs=;
	b=Wy4vhEK0H5YpwAr9Dg9HruJ9AB8mzxxyQEGte8JnoJFsD+pSuJQ0blEcPQIh1grQLq
	ftY3cOgNjU6Oh93T5VdOGNYtoaDAk7tGIYJJ0RkQC8Pwu/qfmReuArY+yH+oTaRI96sX
	e1qAb5BR1B1xUFbROB48F1VP8H1yG7C9W/vDL7NETEyUl92B03eRYEX8dUD5jnvTdlVh
	ig4W3OrV2/hFS5tDgNm/79Wgn5/mWsWer+cfdQ6MBooRT5K2l0uud2q9Vj+bWadYIM3D
	10pYI2dTyJfemwCAbJiHevwilO7Dp7Dk8A9vB9LmsqLCF6+ohti7Tt7xTDjmQqzEIuFX
	pKfA==
X-Gm-Message-State: AMCzsaVQC2IqAHgvmnsWk1VJXdaP0k2HS4NJzRuXuFM3iuUojGnlVnW/
	v+KCQnO5KX9SE/Vx4KKPVoo=
X-Google-Smtp-Source: AOwi7QCfG62t0e2P7AjL9jCsYL3DovkTIFpR1ZiDFN07ba3AP/yMaFRd6YCaAY8iANjvY19KgsUuFQ==
X-Received: by 10.200.23.36 with SMTP id w33mr5651652qtj.50.1507333926782;
	Fri, 06 Oct 2017 16:52:06 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:22 -0300
Message-Id: <20171006235023.11952-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 27/88] SH4: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:15 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed R2D]
---
 hw/sh4/r2d.c        | 4 ++--
 hw/sh4/sh7750.c     | 2 +-
 hw/timer/sh_timer.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 16b9ed2db2..92d1fb99d7 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -186,7 +186,7 @@ static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
 {
     r2d_fpga_t *s;
 
-    s = g_malloc0(sizeof(r2d_fpga_t));
+    s = g_new0(r2d_fpga_t, 1);
 
     s->irl = irl;
 
@@ -249,7 +249,7 @@ static void r2d_init(MachineState *machine)
     cpu = SUPERH_CPU(cpu_generic_init(TYPE_SUPERH_CPU, cpu_model));
     env = &cpu->env;
 
-    reset_info = g_malloc0(sizeof(ResetData));
+    reset_info = g_new0(ResetData, 1);
     reset_info->cpu = cpu;
     reset_info->vector = env->pc;
     qemu_register_reset(main_cpu_reset, reset_info);
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 166e4bd947..49c49c110b 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -728,7 +728,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
 
-    s = g_malloc0(sizeof(SH7750State));
+    s = g_new0(SH7750State, 1);
     s->cpu = cpu;
     s->periph_freq = 60000000;	/* 60MHz */
     memory_region_init_io(&s->iomem, NULL, &sh7750_mem_ops, s,
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 9afb2d048c..46f3eb9647 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -192,7 +192,7 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
     sh_timer_state *s;
     QEMUBH *bh;
 
-    s = (sh_timer_state *)g_malloc0(sizeof(sh_timer_state));
+    s = g_new0(sh_timer_state, 1);
     s->freq = freq;
     s->feat = feat;
     s->tcor = 0xffffffff;
@@ -313,7 +313,7 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base,
     tmu012_state *s;
     int timer_feat = (feat & TMU012_FEAT_EXTCLK) ? TIMER_FEAT_EXTCLK : 0;
 
-    s = (tmu012_state *)g_malloc0(sizeof(tmu012_state));
+    s = g_new0(tmu012_state, 1);
     s->feat = feat;
     s->timer[0] = sh_timer_init(freq, timer_feat, ch0_irq);
     s->timer[1] = sh_timer_init(freq, timer_feat, ch1_irq);
-- 
2.14.2


