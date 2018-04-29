Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fCgwV-0001pB-Hq
	for mharc-qemu-trivial@gnu.org; Sun, 29 Apr 2018 03:40:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1fCgwR-0001oE-7B
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2018 03:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1fCgwQ-0001Ov-5O
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2018 03:40:15 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:44135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1fCgwL-0001Jc-Qd; Sun, 29 Apr 2018 03:40:09 -0400
Received: by mail-wr0-f194.google.com with SMTP id o15-v6so5267188wro.11;
	Sun, 29 Apr 2018 00:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-transfer-encoding;
	bh=f0KuBZjm9IxQAFPEbEhzZkiL5/LHtah1sPwh/eEoqNg=;
	b=R++Zqh2/H3oaUvosjkcqQvHFeY76wZO0RkLNUBIaSvWWEhzso8jwq4jB6qLBDfRqcV
	2kutLtAIoK53clWIoYdLot12UBlw37+TqC4/NTS8HcXq1qmAW8EWbdCg7MYOx2r38oVW
	N4jWA7nxV6s0Mx4IJdYQY3kW9x+4aSspFq7apnPpKD/bp1myjC+0RuJyFuwf4icCCyzh
	TL05HXe37yv4PbFl8CHTGMSMGQAL8ABB0nNb/FnkS0/xmGKISBJvJXrzS14cGTGIPOnr
	rpq55NE3syLm/7G0T3M+ciFTDpaR7emf2EdYUffmKWk2x81iWPI+Ny5bUlb6B3Z1UaJn
	Wrvg==
X-Gm-Message-State: ALQs6tAEj30mrvtg8wU04xA3vHi4KMGs0EqjEnwPvA6VtV+x75R2Y3il
	Bb6QxYl+Amww1NAjdQu6kPmHEmG3
X-Google-Smtp-Source: AB8JxZqXtfncIa/id+jMJi/6Cy5pjHLrPTuMdbsLl4relbntoUMZlZH0fg19dgZHsQBniZhqxWG+9g==
X-Received: by 2002:adf:c328:: with SMTP id
	n37-v6mr6033200wrf.91.1524987608169; 
	Sun, 29 Apr 2018 00:40:08 -0700 (PDT)
Received: from thl530.multi.box (p5791DD24.dip0.t-ipconnect.de.
	[87.145.221.36]) by smtp.gmail.com with ESMTPSA id
	p35-v6sm6490479wrb.12.2018.04.29.00.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Apr 2018 00:40:07 -0700 (PDT)
Date: Sun, 29 Apr 2018 09:40:02 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Message-ID: <20180429094002.3293c9de@thl530.multi.box>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.194
Subject: [Qemu-trivial] [PATCH] hw/m68k/mcf5208: Fix trivial typo in board
 description
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
X-List-Received-Date: Sun, 29 Apr 2018 07:40:16 -0000

It's the MCF5208 evaluation board, not the MCF5206 eval board.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/mcf5208.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 7aca58542e..ae3dcc98c3 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -315,7 +315,7 @@ static void mcf5208evb_init(MachineState *machine)
 
 static void mcf5208evb_machine_init(MachineClass *mc)
 {
-    mc->desc = "MCF5206EVB";
+    mc->desc = "MCF5208EVB";
     mc->init = mcf5208evb_init;
     mc->is_default = 1;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m5208");
-- 
2.14.3

