Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPN-0007wB-ER
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPL-0007tj-8N
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPK-0005Ow-DR
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:55 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:53648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPG-0005MB-0a; Fri, 06 Oct 2017 19:51:50 -0400
Received: by mail-qt0-x243.google.com with SMTP id n61so6362592qte.10;
	Fri, 06 Oct 2017 16:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=usQ5MEkmPgyhunH0omk3MhdAxO9MqzFxhxZlT6E4f0o=;
	b=AlmuPjOF5vtsybGCXsQi2pgoYObVr8Rzp4sh3RozY370HkpnMcL7tByj7J+JmIh/EZ
	BAS3rDn5mb03lSblZnCvPi3Kd2Dr5OUh8qqc2SSSuA/7N4VzG1/CQ7GjmAY25+37ASnF
	GLm2H1aDnxX/09yiz/z0bTuHSmsR+28NEsmHVhvVCO2mTEup7tm9HwIApaln6DObq9mY
	LvESjNjTi2HL6vWzNXXfGZ9bN/0K1T6BbwOSFVfXr45JPKX2dswSSs4fFf+nQmCj9q0u
	k/n+dSQqlWfydUq+8hR4Pt8/KmR+Q+uMEDuHtm73SpU4g2BmbgnrdB1HzN8orMZEG2MN
	bGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=usQ5MEkmPgyhunH0omk3MhdAxO9MqzFxhxZlT6E4f0o=;
	b=AKGvc6oFgWNkgjNcCrAnW+NDcdbRUecz4S727ktyDott8Yv7Z1a+/MiiGyztivhizc
	Ocmc/HgFJZ+2b0cT6LKKEbxiFS/5eWq/8Ul/I5sKeeKbMevdeUYcKw2xNgp2BVzxlfAc
	xEq2kRxYtNYIc1tdCvfTIpcF4ZBhp0KGfDt737EIxuJk6yg3kKO9U/mFbR/aAXgY+4Da
	R6yjt+7ON/Iyh7lSQKpeEjgu8Pi32nMfnxePiOyfKTMm07H86iRore3B0Z58F2XP9FhW
	uq7goicah3Bk8Q6AsFkiHhvf5EwoQvmALRp/z4eVTDNDmNGJyfegVWeXPxjaTHZna6mp
	xLsA==
X-Gm-Message-State: AMCzsaUcJMCjsRXsD0IP7JuUm11Mg1SMf/kTWEt99Vqe1XWtduhCzRE/
	KZ/raR016lgNv1HGnlC0hqxRJbRx
X-Google-Smtp-Source: AOwi7QDD1I0wSaZByTram0MX2zxRzBFY9DfGb3/tlu+L2Kq+W/ngfcXrNVe/7f5G4FYOGfz7iYHR0Q==
X-Received: by 10.200.37.8 with SMTP id 8mr5394698qtm.77.1507333909487;
	Fri, 06 Oct 2017 16:51:49 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Michael Walle <michael@walle.cc>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:17 -0300
Message-Id: <20171006235023.11952-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 22/88] LM32: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:56 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed milkymist]
---
 hw/lm32/lm32_hwsetup.h | 2 +-
 hw/lm32/lm32_boards.c  | 4 ++--
 hw/lm32/milkymist.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index a01f6bc5df..38ade3db0e 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -58,7 +58,7 @@ static inline HWSetup *hwsetup_init(void)
 {
     HWSetup *hw;
 
-    hw = g_malloc(sizeof(HWSetup));
+    hw = g_new(HWSetup, 1);
     hw->data = g_malloc0(TARGET_PAGE_SIZE);
     hw->ptr = hw->data;
 
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index b0bb3ef58a..a9c74e90d4 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -99,7 +99,7 @@ static void lm32_evr_init(MachineState *machine)
     int timer0_irq                 = 1;
     int timer1_irq                 = 3;
 
-    reset_info = g_malloc0(sizeof(ResetInfo));
+    reset_info = g_new0(ResetInfo, 1);
 
     if (cpu_model == NULL) {
         cpu_model = "lm32-full";
@@ -196,7 +196,7 @@ static void lm32_uclinux_init(MachineState *machine)
     hwaddr initrd_base  = 0x08400000;
     size_t initrd_max               = 0x01000000;
 
-    reset_info = g_malloc0(sizeof(ResetInfo));
+    reset_info = g_new0(ResetInfo, 1);
 
     if (cpu_model == NULL) {
         cpu_model = "lm32-full";
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 4db4d2d533..0335f0b322 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -106,7 +106,7 @@ milkymist_init(MachineState *machine)
     hwaddr cmdline_base = sdram_base + 0x1000000;
     size_t initrd_max = sdram_size - 0x1002000;
 
-    reset_info = g_malloc0(sizeof(ResetInfo));
+    reset_info = g_new0(ResetInfo, 1);
 
     if (cpu_model == NULL) {
         cpu_model = "lm32-full";
-- 
2.14.2


