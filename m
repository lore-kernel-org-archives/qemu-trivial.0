Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRT-0001NV-Ru
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRR-0001Lc-U6
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRR-0007Bx-2U
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:05 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRM-00078C-Fh; Fri, 06 Oct 2017 19:54:00 -0400
Received: by mail-qk0-x242.google.com with SMTP id w63so11298134qkd.2;
	Fri, 06 Oct 2017 16:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=X/j8jouztJxvilzTDMtGcpYt5nCMgjiiE7X5lnIP9ZM=;
	b=ASIWgNFPpqPvwAuF10Y9Ux9FOadO/rkO99aG70q9KPPNkcG4MWhqND35Rp1qr3axHW
	hBc55TwE2EhfTbcgNCWsRvfQ9xixXFh5ymmSi+fEHrGOhNAGDhNpnTrbI8nt31IVYU1/
	k56ZEHofHaN8qptcEqkKT3FTdCdEY6KZaCelLGWMDQm2VVvuR110xyPGBzqJaeMXIFAv
	9aLLPrUEe5SVlZtFlMYKo/wkp6xg+AtCaEtEyeWo8gwhJvf5vYgnZ/0fR90w9tO/cSZA
	uWQQdE0Yo/h+EhzxWwwnTYlCuWud5EyPSpG/T9VX8L4r2CUdn9uBXbK6cFsDxtMp9JGv
	hcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=X/j8jouztJxvilzTDMtGcpYt5nCMgjiiE7X5lnIP9ZM=;
	b=H07clsoq6j7cSarTuyaXJIB8Ff+GvdlwEDD3au/XSAMS56JCDhJz0Ypd9FaCgyOcoJ
	EX5bG/27hxtL0XypYcbEdIB+UMzpsY/J+J21yqEFZOm7ihThg+IWYSI3tSq1KeQFJNQ6
	lJfh4HHRFNyNQC34zJJmTZRoSn0dh0JM3DdC2sym9Q+IxUfRq+aft1GcXGvgBHw5mBRO
	hQub4FOwYQe9eyQcuyAcBN5Twji0RuNqbiMg1jiDaEimz18SG4orqq5vxdF+LsgNBvNr
	imqTKECACsu2q6ksLThmaCm+wHOePmEUZ6Z6wlbtkOlOCyuy3ZoERd/z3G6FqRXZGWl2
	AdDw==
X-Gm-Message-State: AMCzsaVFvWOw8qIqZYu+lLtuhyG5Xz2SrW2gEg2lS9R3Jte6K/SH+2tR
	crwiNzD7VG2Nc11RVR3msIc=
X-Google-Smtp-Source: AOwi7QAc41mbsM8SbMjHr5T4mbhgwNGbWsYLOiQ7dzYGvl+CF+pm6zuClp28aH3AOpcy4ywiJ+aPTA==
X-Received: by 10.55.127.70 with SMTP id a67mr698885qkd.90.1507334039948;
	Fri, 06 Oct 2017 16:53:59 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:59 -0700 (PDT)
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
Date: Fri,  6 Oct 2017 20:49:54 -0300
Message-Id: <20171006235023.11952-60-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 59/88] ppce500: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:07 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: replaced g_new0() -> g_new() since no bzero() required]
---
 hw/ppc/e500.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index db0e49ab8f..b396fd1a22 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -737,8 +737,6 @@ static qemu_irq *ppce500_init_mpic(MachineState *machine, PPCE500Params *params,
     SysBusDevice *s;
     int i;
 
-    mpic = g_new0(qemu_irq, 256);
-
     if (kvm_enabled()) {
         Error *err = NULL;
 
@@ -756,6 +754,7 @@ static qemu_irq *ppce500_init_mpic(MachineState *machine, PPCE500Params *params,
         dev = ppce500_init_mpic_qemu(params, irqs);
     }
 
+    mpic = g_new(qemu_irq, 256);
     for (i = 0; i < 256; i++) {
         mpic[i] = qdev_get_gpio_in(dev, i);
     }
@@ -808,7 +807,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         machine->cpu_model = "e500v2_v30";
     }
 
-    irqs = g_malloc0(smp_cpus * sizeof(qemu_irq *));
+    irqs = g_new0(qemu_irq *, smp_cpus);
     irqs[0] = g_malloc0(smp_cpus * sizeof(qemu_irq) * OPENPIC_OUTPUT_NB);
     for (i = 0; i < smp_cpus; i++) {
         PowerPCCPU *cpu;
@@ -844,7 +843,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         if (!i) {
             /* Primary CPU */
             struct boot_info *boot_info;
-            boot_info = g_malloc0(sizeof(struct boot_info));
+            boot_info = g_new0(struct boot_info, 1);
             qemu_register_reset(ppce500_cpu_reset, cpu);
             env->load_info = boot_info;
         } else {
-- 
2.14.2


