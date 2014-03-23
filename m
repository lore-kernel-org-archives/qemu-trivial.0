Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRiHp-0004Xu-Fp
	for mharc-qemu-trivial@gnu.org; Sun, 23 Mar 2014 09:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReiq-0002OS-Df
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReih-0003sB-Ru
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:40 -0400
Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232]:53507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WReiK-0003lV-Jp; Sun, 23 Mar 2014 05:29:08 -0400
Received: by mail-pd0-f178.google.com with SMTP id x10so4099732pdj.23
	for <multiple recipients>; Sun, 23 Mar 2014 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ig9bVdfNGZ5o3ZAV+OoXS9SZjqqTIUELzSP/HhjX4Dw=;
	b=KUYbULPmYr7bBVHjp9rKh9wvt/cnWMQ1+TXlDbDOKwq7U0T56JqsW2jc3FyUWkMtIv
	xNcqTtfGIZ9JIG9tU1o1M3VgCiawQVpxYwdlwgQzTHDs7YwF2cJCDDk+YaIQ2zJ6F+ga
	YIsvs7wJvjjZQ/DfQ4ldP7Cz6qJiOkNBynA8Fn9plx4N7oTOI2qZLtmgKCo0uLkjtFcx
	kk4SYMLrHx5Kokk+Sv8wkqQFim1bzvFvQYleikmPJ6ezjVaPMJmFeLlxJrFdMibrDKS/
	2gI8dnoKGpHjQyWVoboRAiMdFFNZoL0bwgh8NFVrqow0UHQM4MCF/+6EoMAplx/jgWhQ
	0bDg==
X-Received: by 10.68.233.200 with SMTP id ty8mr64014591pbc.1.1395566947750;
	Sun, 23 Mar 2014 02:29:07 -0700 (PDT)
Received: from prasad-desktop ([117.195.29.155])
	by mx.google.com with ESMTPSA id j3sm21092816pbh.38.2014.03.23.02.28.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 02:29:05 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id A3BA3A00626; Sun, 23 Mar 2014 14:58:50 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Sun, 23 Mar 2014 14:58:41 +0530
Message-Id: <1395566923-5074-4-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::232
X-Mailman-Approved-At: Sun, 23 Mar 2014 09:17:59 -0400
Cc: peter.maydell@linaro.org, stefanha@redhat.com, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH 4/6] hw/timer/grlib_gptimer: remove
	unnecessary assignment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Mar 2014 09:29:51 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 hw/timer/grlib_gptimer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 7672d3a..d655bb2 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -328,7 +328,6 @@ static void grlib_gptimer_reset(DeviceState *d)
 
     unit->scaler = 0;
     unit->reload = 0;
-    unit->config = 0;
 
     unit->config  = unit->nr_timers;
     unit->config |= unit->irq_line << 3;
-- 
1.8.1.2


