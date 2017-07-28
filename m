Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2a-0002YY-Qd
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2Y-0002WL-VS
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2X-00026m-Th
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:06 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2V-00025E-Ly; Thu, 27 Jul 2017 21:26:03 -0400
Received: by mail-qt0-x241.google.com with SMTP id t37so8524313qtg.2;
	Thu, 27 Jul 2017 18:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XHM01nqtY7BsyY9UcHuUddGygVhFy6gT1CTYk64HMf4=;
	b=mTX6ITTC1m27TS9yNVTRNlMRl8M5CVkP/HhDvVaF7XWRnxytteqnIr5hQn6C2FGYAK
	sGoUvZsMbY4V9lOVxjomw1jo+gaBt0YGAxaVE8LXS8lY8eS0kG1ckA/X7Nnx0KekjFJM
	2U0SsNIwH5DyeDB1WLIKr4SGCFUuCcIp7ni2WSs+BPneYwx1VK1Zdm78kxdSSRXMhI/R
	YyfdZWmHv1ZRRsqDppq532lqJA9BJklgUvn6bGS4kcAAJgcnTgU+EcFyWCeoqH/MJftN
	02vfgn3xwhbYI7D1yqs0N/5MOtiC2tyow08rrRNNsYvHRuzHHIHF/BFCZkT1USYgogZQ
	zf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XHM01nqtY7BsyY9UcHuUddGygVhFy6gT1CTYk64HMf4=;
	b=elNsjXjpYI2izzfKqr6MkiodZ5rSEZSEqZWF4x55koZM8xFlHHtOrsVY1O3IDiIIPL
	+PexGFd1tl7c2HxGkju44fZSm2PPCZp51lQvht281W1sGDQXjcnF2U3H6aYJ09unkNos
	ui0khuM4/Y8+93lMoVfXnfi+R2KxBwWNeufOxeZHm9yda7vUAhoT24y+iMK5Jx9TTtQb
	6PdPVHDqMNOZTUBdSNM6RNP1bZ+WJl2hvkN2NDNiWUN04Ba3SqTTdyGOCitXGNs2VhFT
	CFMcnTTXZlRl7Uwaco07ArR6goiXTDVzrA+m0bn6YVAW4XDxW9XtvUKLP4WUQafKmBL0
	YZKg==
X-Gm-Message-State: AIVw111/77szXq4RkAzQKzPmCt8WT3kpX3gVxX/upB+HhHpoWTK3PvTF
	2n1wLdQTFA7ovA==
X-Received: by 10.237.63.92 with SMTP id q28mr9105842qtf.49.1501205163133;
	Thu, 27 Jul 2017 18:26:03 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.26.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:26:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 22:25:38 -0300
Message-Id: <20170728012542.29975-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 4/8] docs: fix broken paths to
 docs/devel/atomics.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:08 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/lockcnt.txt | 2 +-
 include/qemu/atomic.h  | 4 ++--
 tcg/README             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/lockcnt.txt b/docs/devel/lockcnt.txt
index 2a79b3205b..7c099bc6c8 100644
--- a/docs/devel/lockcnt.txt
+++ b/docs/devel/lockcnt.txt
@@ -145,7 +145,7 @@ can also be more efficient in two ways:
 - on some platforms, one can implement QemuLockCnt to hold the lock
   and the mutex in a single word, making the fast path no more expensive
   than simply managing a counter using atomic operations (see
-  docs/atomics.txt).  This can be very helpful if concurrent access to
+  docs/devel/atomics.txt).  This can be very helpful if concurrent access to
   the data structure is expected to be rare.
 
 
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index e07c7972ab..b6b62fb771 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -8,7 +8,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
- * See docs/atomics.txt for discussion about the guarantees each
+ * See docs/devel/atomics.txt for discussion about the guarantees each
  * atomic primitive is meant to provide.
  */
 
@@ -427,7 +427,7 @@
  * sequentially consistent operations.
  *
  * As long as they are used as paired operations they are safe to
- * use. See docs/atomic.txt for more discussion.
+ * use. See docs/devel/atomics.txt for more discussion.
  */
 
 #ifndef atomic_mb_read
diff --git a/tcg/README b/tcg/README
index bf49e8242b..03bfb6acd4 100644
--- a/tcg/README
+++ b/tcg/README
@@ -446,7 +446,7 @@ when MTTCG is enabled.
 The guest translators should generate this opcode for all guest instructions
 which have ordering side effects.
 
-Please see docs/atomics.txt for more information on memory barriers.
+Please see docs/devel/atomics.txt for more information on memory barriers.
 
 ********* 64-bit guest on 32-bit host support
 
-- 
2.13.3


