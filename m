Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHW-0003FX-Ll
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:27:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHU-0003DI-Kf
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHT-0006pS-Tl
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:48 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:53728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHT-0006ob-NH; Mon, 05 Mar 2018 06:27:47 -0500
Received: by mail-wm0-x244.google.com with SMTP id t74so15135680wme.3;
	Mon, 05 Mar 2018 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HWu4zfgqj+IE9bUlNuRpeEiJ0RZoPakBogAwh1rfYsM=;
	b=F9QkeguVOjRAF70tGtdFImAGYQE+bxeRI3Pvbf4CdA1pd0aRjnAuoha2YQP1Kp9K6c
	7DWymquwB2R2wdAbQfvs41SQUl13OAP9qEZCoD34lC+rIkX0CPhQdOIpYDAUGjH6gxLH
	NktuSC22cysRSHsJfB1QO4jC9xYwL5umbCEztoKXFRgWkLsuEIakyyeLr8M9qtjneOok
	WUUb32whNQmOvywFr5gR5mp2NxnXEoPKe7aBH7MOicHqy1xrnLfo5bNw6GOJHCm2dL6D
	AAzq57YQh2Hg1StjMWrS0q7wfQomMgV22z2Xk9nmNkJpzR5oKDddXoJM+XrYExcdLcOn
	WL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HWu4zfgqj+IE9bUlNuRpeEiJ0RZoPakBogAwh1rfYsM=;
	b=oQh0WrR1K8ruDyhUrkvxxvuFQDKikwGofHfhkdHsT2A+5v+HZZsQGCEX3eSX3+R7sK
	XJ0JcGyjrC610eJneE3OCi9KSaIVXF/EEKTMtiaZ3rl/SqNy07Pwcy3W9MNGLChz2fZD
	cwtA+bTnqDOzobnlCXAi69aREFP0sWtXufOKPOkm5hHMWmdxUDxZKJzaaDr0M3sbDuNB
	6LctPnvytpbG4di1SawyYLrtEQwBKEipclu4M0m0Rj47APoHleGUevYqb67no+I37CIA
	qVFAuH1P310vfRIBfRZvbV/mdh0dAS+Mz2KivXmkDoZEd7VRzXwzTyOOb1sXSmTI589N
	6f7w==
X-Gm-Message-State: AElRT7FKmJQEtuMusdwjHqmBi0TlM0Ip5RjbI35FeeEtpUQPhnrLvFgn
	xUcONsJSzSq7CwY0SKpLRscEw6D/
X-Google-Smtp-Source: AG47ELt8ZmkOY4IvNlQ4Mq1kfB4I8xaU/TNiCjt9Z7bSDXBDGuZ772lmDYQBBf45ZHWbblPt+WbIWw==
X-Received: by 10.28.154.213 with SMTP id c204mr7564305wme.64.1520249266339;
	Mon, 05 Mar 2018 03:27:46 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:45 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>
Date: Mon,  5 Mar 2018 08:27:07 -0300
Message-Id: <20180305112732.26471-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-trivial] [PATCH v2 05/30] hw/mips/r4k: constify params_size
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
X-List-Received-Date: Mon, 05 Mar 2018 11:27:49 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/mips_r4k.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 830ee7732c..2556786def 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -79,8 +79,9 @@ typedef struct ResetData {
 
 static int64_t load_kernel(void)
 {
+    const size_t params_size = 264;
     int64_t entry, kernel_high;
-    long kernel_size, initrd_size, params_size;
+    long kernel_size, initrd_size;
     ram_addr_t initrd_offset;
     uint32_t *params_buf;
     int big_endian;
@@ -128,7 +129,6 @@ static int64_t load_kernel(void)
     }
 
     /* Store command line.  */
-    params_size = 264;
     params_buf = g_malloc(params_size);
 
     params_buf[0] = tswap32(ram_size);
@@ -143,7 +143,7 @@ static int64_t load_kernel(void)
     }
 
     rom_add_blob_fixed("params", params_buf, params_size,
-                       (16 << 20) - 264);
+                       (16 << 20) - params_size);
 
     g_free(params_buf);
     return entry;
-- 
2.16.2


