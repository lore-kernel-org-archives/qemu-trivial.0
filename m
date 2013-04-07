Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOiaQ-00067w-DN
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:56:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiaM-00061T-Bh
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiaK-0001gL-5F
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:56:14 -0400
Received: from mail-pa0-f42.google.com ([209.85.220.42]:46627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiaJ-0001g5-Vj
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:56:12 -0400
Received: by mail-pa0-f42.google.com with SMTP id kq13so2686493pab.29
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=8NHzvneFDSbbYzUsI+28H+3N65WpG6LYY0zWRAwg7oY=;
	b=XREZ8rGtJeC4daXqeBqdW0KfR/Xoy18uTcFbEQm9eL0FYp0huaKZSpd3XXZL41HfOv
	FfySb+qUN9SQN8FKOUauvUs3Jv8wo5hYli16zePKalo36g4xJ5lMVrWoDHEmbV4Gap8g
	9o8sZbbTgDcjogGCeJMscZp2Ip0Aah1CYgfbkyo55KNJUmGxLAfoQr9PfZVLAPv9ihrN
	/ljfxOqquCk8vtYmAjoFIKq+CHk1x/yFT8RzUh6lhJxMv+eQQ+cN6XrsaR8yBs7Q3c5k
	i2uij+MNWXS2/nVUbi6yImkkjIizAkxXHayxJCFIcFW5yuqaUtqqeO9if5T8ZxljP+OI
	YJtg==
X-Received: by 10.66.253.232 with SMTP id ad8mr25918984pad.119.1365314171074; 
	Sat, 06 Apr 2013 22:56:11 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id qh4sm26292423pac.8.2013.04.06.22.56.08
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 22:56:10 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun,  7 Apr 2013 15:53:33 +1000
Message-Id: <5a0fa6a74f61429fc41236f16746d2e81ade2288.1365313801.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnU2LAmyIpke/K4Yb6N4n1w+Zkap5iZnwHSP8S6h9/On+wANukBepvoPoZ+K+k611QBzYYX
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.42
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v2 4/4] m25p80: Add debug message for no bdrv
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
X-List-Received-Date: Sun, 07 Apr 2013 05:56:17 -0000

If there is no backing bdrv, let the debugging developer know about it.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index d853a2e..efcc7f4 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
@@ -606,6 +606,7 @@ static int m25p80_init(SSISlave *ss)
             return 1;
         }
     } else {
+        DB_PRINT_L(0, "No BDRV - binding to RAM\n");
         memset(s->storage, 0xFF, s->size);
     }
 
-- 
1.7.0.4


