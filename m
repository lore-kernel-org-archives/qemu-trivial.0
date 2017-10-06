Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPW-00084I-CU
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPT-00081F-73
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPR-0005W5-1Z
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:03 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPM-0005R9-N4; Fri, 06 Oct 2017 19:51:56 -0400
Received: by mail-qt0-x243.google.com with SMTP id 6so25228654qtw.3;
	Fri, 06 Oct 2017 16:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IlupekmdMehNOyZOIzX0vzWTT9G633om1/4fAaAqlmM=;
	b=uOKH/QZJq/J6RSKgm8Lqe0yt+HzaOHbdTSBvt7wNPyIXuNemh1Yx5jEtWnlWxY/L94
	Eb+2jeMuDxLEQxw02vIm7l9x8xSETxWXO7FSxnSediYg4j2GMyWP7YYQ26kFalPILqzh
	q2U5wfpos/S301p5q6n6h+c5fro+fiR6DqILwqrBEUnAyS0+YywoTwqZOJDyoHMh01Hg
	5xPB5CZHDn/rMt7Lwg9/qlqhh3lsA7lSKD9zVb4Af1P0A2vc2S0VRUMC/d9Lg9qh/UpS
	EbWeoJjdrO1wOApLWWS0AcTZKNh4CVdW+xAIj02SAJcbZMCe+zxJSgkVHT8O90Rr1IHC
	NyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=IlupekmdMehNOyZOIzX0vzWTT9G633om1/4fAaAqlmM=;
	b=AgBHuNN3zuldn+NSrkLWWNtwOuyumJRp6OPeEBwJIatP3p1BnBolKyxjCLTIZc48Ln
	PR003uptL/HagHyq3TaGTkCjMFBgIGxAQhPcF82FnonAnmR8im0FaRz1ycTnweIGpO7m
	gp12F+eNQer3KQ90omIV7Suq3Eg4Maa5uZNDxZYsz3nu9jWxHF+2lY7S0LibOJs5sYvl
	8QfEfbVNOs+cDCii05nvUFplkn4vbnhbmp/EwLvmMGE6xs/dXVgjx0k9vJfbU509s/Jg
	xjqZXv42zR2fHtw2kro1f6M8OlHm6P3wytZ8hnmIerOFA+SMowy3om77PJ1AkxnQ2kkJ
	VyFA==
X-Gm-Message-State: AMCzsaW1KSaMkKf5dl8CDL1Mvktv3dn3zQWpIAU7lDqEiJ3XEoXG06sC
	hIIWNK8YO+4APqtr4uqvLmZVMKPmRUE=
X-Google-Smtp-Source: AOwi7QAvMRVKrOttmg6j0znLi98J2BlYZY4Qf/NWjzk0LMsDNvGcOvd6dE73Xbxu411mdjhkck7f3w==
X-Received: by 10.200.33.235 with SMTP id 40mr5325636qtz.185.1507333916173;
	Fri, 06 Oct 2017 16:51:56 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:19 -0300
Message-Id: <20171006235023.11952-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 24/88] MIPS: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:04 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed malta + mipssim + r4k]
---
 hw/mips/mips_malta.c         | 2 +-
 hw/mips/mips_mipssim.c       | 2 +-
 hw/mips/mips_r4k.c           | 2 +-
 target/mips/translate_init.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 2adb9bcf89..0eda20e120 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -555,7 +555,7 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *address_space,
     MaltaFPGAState *s;
     Chardev *chr;
 
-    s = (MaltaFPGAState *)g_malloc0(sizeof(MaltaFPGAState));
+    s = g_new0(MaltaFPGAState, 1);
 
     memory_region_init_io(&s->iomem, NULL, &malta_fpga_ops, s,
                           "malta-fpga", 0x100000);
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index a092072e2a..b2696faba1 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -166,7 +166,7 @@ mips_mipssim_init(MachineState *machine)
     cpu = MIPS_CPU(cpu_generic_init(TYPE_MIPS_CPU, cpu_model));
     env = &cpu->env;
 
-    reset_info = g_malloc0(sizeof(ResetData));
+    reset_info = g_new0(ResetData, 1);
     reset_info->cpu = cpu;
     reset_info->vector = env->active_tc.PC;
     qemu_register_reset(main_cpu_reset, reset_info);
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 1272d4ef9d..233455d6e7 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -196,7 +196,7 @@ void mips_r4k_init(MachineState *machine)
     cpu = MIPS_CPU(cpu_generic_init(TYPE_MIPS_CPU, cpu_model));
     env = &cpu->env;
 
-    reset_info = g_malloc0(sizeof(ResetData));
+    reset_info = g_new0(ResetData, 1);
     reset_info->cpu = cpu;
     reset_info->vector = env->active_tc.PC;
     qemu_register_reset(main_cpu_reset, reset_info);
diff --git a/target/mips/translate_init.c b/target/mips/translate_init.c
index 8bbded46c4..9778776677 100644
--- a/target/mips/translate_init.c
+++ b/target/mips/translate_init.c
@@ -806,7 +806,7 @@ static void mmu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     MIPSCPU *cpu = mips_env_get_cpu(env);
 
-    env->tlb = g_malloc0(sizeof(CPUMIPSTLBContext));
+    env->tlb = g_new0(CPUMIPSTLBContext, 1);
 
     switch (def->mmu_type) {
         case MMU_TYPE_NONE:
@@ -839,7 +839,7 @@ static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 
 static void mvp_init (CPUMIPSState *env, const mips_def_t *def)
 {
-    env->mvp = g_malloc0(sizeof(CPUMIPSMVPContext));
+    env->mvp = g_new0(CPUMIPSMVPContext, 1);
 
     /* MVPConf1 implemented, TLB sharable, no gating storage support,
        programmable cache partitioning implemented, number of allocatable
-- 
2.14.2


