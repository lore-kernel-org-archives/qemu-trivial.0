Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPn-0008HV-Fe
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPh-0008Cw-3B
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPg-0005mY-DP
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:17 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:49206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPe-0005ku-Bq; Fri, 06 Oct 2017 19:52:14 -0400
Received: by mail-qt0-x243.google.com with SMTP id o3so34345993qte.6;
	Fri, 06 Oct 2017 16:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AJvTXN+YRve7u3eta4Gx0S6cLKojq4z3L9TSPeZB220=;
	b=Ex5efKQ9eRAl2DMKYFNUxWN4y0ROkwChSR4ZAM+Fezk6alXT+khCJTw1WJlog3q2EN
	3tUCklz0mzNU8zK6ztSDoRDrdIbE0/ut5dehM8veXdKr/+Y4QDcO101007L7g/bE67jr
	3EsuZ7mgRtIyL8i4320HWzAVO60rMGORIVbwqHq0Aivx8TbP7sy4pc0QJ7Zt1MvvbwqZ
	6iDylKEgoFfqfJaVa9tsrgBVOJbAq2vhGcrztGNlovTfhIvCGi4IiNdeY9w5cFDA/QhC
	V1VjtarZ2ISxTxxAmnGpYpQfHCiK1+A45P0oO7clYVJievsaUoggkrSxxzyswHvKMcvZ
	GjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AJvTXN+YRve7u3eta4Gx0S6cLKojq4z3L9TSPeZB220=;
	b=o+5D9aH0UrOo8QE2TjBuCTsiNeLjPB7la5ezH4wofeKB3H4pNaJxtBZ2KWnfHo4xXP
	pHTwdkrZ5GtsLBP5Us3hwpuMvcGm+k+iww629jyGjdsY9boU2d+jiM4PGhhDbpzI66Np
	i97ag1/uwPSxVIgwNIq/VWeyD/YlJwUnz1+kuh9e+Sv2/j/Qen89+cp4JPXnDL0pD56A
	L6qePL1chzYiQ2KtCsRTezXZt3YDA0E99WedOdb+1MWwNwQ0HfmZhIJkigJtjXEW2XZb
	1gbxI13Ul2wOgplU134pcaWDj2QS/b4Myy9Fr1I1k67wXGGjMBlxTRzyagC5Q+6VVPFU
	dZwQ==
X-Gm-Message-State: AMCzsaWpoKzlNy90n54JYu7TX3NuVsJKVk8IRWmuvziwuwnOe17axdWM
	0ot+ghzo+jvihUhBm2xSHPA=
X-Google-Smtp-Source: AOwi7QAheWUmuO5bz2zFGZviwc2UeZhh72gkcmtBPAYnyNDhfmtFIcf5OtTZFRostt81Yi1BYvZkfw==
X-Received: by 10.200.45.89 with SMTP id o25mr5471537qta.337.1507333933815;
	Fri, 06 Oct 2017 16:52:13 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:24 -0300
Message-Id: <20171006235023.11952-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 29/88] SPARC: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:20 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: split of disas/sparc.c change]
---
 hw/sparc/leon3.c     | 2 +-
 hw/sparc64/sparc64.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index ec2816bf94..05e7adefb8 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -132,7 +132,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     cpu_sparc_set_id(env, 0);
 
     /* Reset data */
-    reset_info        = g_malloc0(sizeof(ResetData));
+    reset_info        = g_new0(ResetData, 1);
     reset_info->cpu   = cpu;
     reset_info->sp    = 0x40000000 + ram_size;
     qemu_register_reset(main_cpu_reset, reset_info);
diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index 097d529ff1..6f2197fc13 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -160,7 +160,7 @@ static CPUTimer *cpu_timer_create(const char *name, SPARCCPU *cpu,
                                   QEMUBHFunc *cb, uint32_t frequency,
                                   uint64_t disabled_mask, uint64_t npt_mask)
 {
-    CPUTimer *timer = g_malloc0(sizeof(CPUTimer));
+    CPUTimer *timer = g_new0(CPUTimer, 1);
 
     timer->name = name;
     timer->frequency = frequency;
@@ -368,7 +368,7 @@ SPARCCPU *sparc64_cpu_devinit(const char *cpu_model,
                                     hstick_frequency, TICK_INT_DIS,
                                     TICK_NPT_MASK);
 
-    reset_info = g_malloc0(sizeof(ResetData));
+    reset_info = g_new0(ResetData, 1);
     reset_info->cpu = cpu;
     reset_info->prom_addr = prom_addr;
     qemu_register_reset(main_cpu_reset, reset_info);
-- 
2.14.2


