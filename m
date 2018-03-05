Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHk-0003Xi-F3
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHh-0003Tn-8g
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHf-0006yu-8k
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:01 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:45837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHf-0006yN-38; Mon, 05 Mar 2018 06:27:59 -0500
Received: by mail-wr0-x243.google.com with SMTP id p104so16836962wrc.12;
	Mon, 05 Mar 2018 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zNIFxosKUvR8Oi/HS1kAu70hv6Oe/Ls6+925QAIJ5wU=;
	b=h1mZIl/MCzOouSvDuzBa6gWTRJB++/UVoCmuYTcAfR/DAhUIKjyvSw/itPvhDEKn80
	XKjQEaTihPUAEShFApbyz/2LE1KOgenR4lFQSQAfNMcMhii9UtAXKkpbrGt+G9A5krPW
	KJsN+N/3s6AydtAOk7KMFy9S96CIUCwBXgKfmyrGioIOA2HCejxhHKTCzab1NX11hC0+
	zjqVy94dRjjwGOhzk2mbSU4AJLfCaw6x4WSQ47uBuWxISzdUSKnVyASrHToWukKxDwgn
	zXNkbG7AaLO1FybX/PnW89ubBnZerVdILrrvGUsi3lkyBjFegPrwIKcBH5rV9kthyliY
	LwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zNIFxosKUvR8Oi/HS1kAu70hv6Oe/Ls6+925QAIJ5wU=;
	b=rt5YB4hTokVFNiltS+yEIt15K2Nod+uzRIdOZ9f6sq5kD7xsWUNZMGYtvGnX4U1XX9
	7cjZbDupjHSJ+MZDTJyFHbpVNITs+88lFgxQTjfhZJ32s/fJGgKE/+L6DT1a9Aek/yGv
	ylu6jD5pFqpOdhkeD6hU6LqWLrwl0ZIDeC9Hhr6owPpPm1SBPdbWWfSqqBmyk19R/N2I
	QfKxpRSvVCAdL1NC9gGZW6XPuP1UlbByUgDRhtezfgfu6MqBXvEioF6YppFKzYX96xdt
	QkPFEceIjhRQ69HUvmva5v62xSDnREK49KDZxuczDrDgS6NVqm3myjo4vefIa8iY3eM/
	1P0Q==
X-Gm-Message-State: APf1xPAC0UkasuErbkiOQ8CNy8yKSLoqpiG1rTcdZg7ZBqheNYdkaFOw
	5qowbxrhGHG0AwZMNNku3pVqYurI
X-Google-Smtp-Source: AG47ELu0pcER55hjj8D1wXpERTOCh04JvR2O2dsFzm5owkEpN4stOHEP0D9+zOWsMQ831TGknQkzJQ==
X-Received: by 10.223.160.125 with SMTP id l58mr11643915wrl.264.1520249277929; 
	Mon, 05 Mar 2018 03:27:57 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:57 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>
Date: Mon,  5 Mar 2018 08:27:15 -0300
Message-Id: <20180305112732.26471-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: [Qemu-trivial] [PATCH v2 13/30] hw/xtensa: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:02 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 hw/xtensa/xtfpga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 70686a2eb1..922417af15 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -230,7 +230,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
     const char *dtb_filename = qemu_opt_get(machine_opts, "dtb");
     const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
-    const unsigned system_io_size = 224 * 1024 * 1024;
+    const unsigned system_io_size = 224 * M_BYTE;
     int n;
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.16.2


