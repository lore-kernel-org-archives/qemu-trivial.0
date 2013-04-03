Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNF1p-0005FH-AV
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 00:10:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF1l-00059k-3w
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF1j-0007jj-Uu
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:10:25 -0400
Received: from mail-pd0-f175.google.com ([209.85.192.175]:39505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF1j-0007ja-Pd
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:10:23 -0400
Received: by mail-pd0-f175.google.com with SMTP id g10so390240pdj.34
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2013 21:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=o7l55WJAHmDdJovZKpSpHZcXvKVAbMEldV8DyGns0Tg=;
	b=o9Yxc7e2VPS9Tj2DfhBvuDqpVG+ffH1xGNiKm6VTlMOqlLwVnM///7eavPhbwOrsKo
	4EWIVueJcVrTwJ38RbhhyDE9GvAqr9PhXWB9QP/ldnT0DN8DBj4wxV4KwZvotryC9H9j
	f+uJJgdQcCgECKLjyYRbBh5ESaq55oMlJFgq07+Ru5C/GKUgXSAfntXFAj/UXOpU61XI
	6wdLMhzcfradc1+IKJSlYc8DlK0+YyRGWm5yBV/SIwT4LTQvGiEKMNsBvrVT+BAB31/6
	5wlyv1DnyRiWbGHN6r437S4jO0fSntJl8wnJUJNn/PavurUkFI0lDXmoO24I6/plnciy
	Tsog==
X-Received: by 10.66.176.205 with SMTP id ck13mr918538pac.50.1364962223170;
	Tue, 02 Apr 2013 21:10:23 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id mz8sm4261577pbc.9.2013.04.02.21.10.20
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 21:10:22 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed,  3 Apr 2013 14:09:16 +1000
Message-Id: <ef1ea44a6c6f5d9846c3492006094044bbd805c3.1364961975.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQmAsvd+5vT8RRGyphRtIy0l//WiFjJP4B2LMqvBpDvurkULDtTOs3osHepeQS9clRqqJVMb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.175
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 1/4] m25p80: Fix debug messages.
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
X-List-Received-Date: Wed, 03 Apr 2013 04:10:27 -0000

Some dodgy casts were making a mess of these msgs.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index 55e9d0d..34b476b 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
@@ -538,15 +538,15 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
     switch (s->state) {
 
     case STATE_PAGE_PROGRAM:
-        DB_PRINT("page program cur_addr=%lx data=%x\n", s->cur_addr,
-                 (uint8_t)tx);
+        DB_PRINT("page program cur_addr=%lx data=%x\n", (unsigned)s->cur_addr,
+                 (unsigned)(uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr++;
         break;
 
     case STATE_READ:
         r = s->storage[s->cur_addr];
-        DB_PRINT("READ 0x%lx=%x\n", s->cur_addr, r);
+        DB_PRINT("READ 0x%lx=%x\n", (unsigned)s->cur_addr, (unsigned)r);
         s->cur_addr = (s->cur_addr + 1) % s->size;
         break;
 
-- 
1.7.0.4


