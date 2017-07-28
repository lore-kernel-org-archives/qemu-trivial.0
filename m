Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1k-0005Dd-HS
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1f-0005Bl-HR
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1e-0002Kg-Jv
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:31 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1a-0002Go-An; Fri, 28 Jul 2017 18:46:26 -0400
Received: by mail-qt0-x242.google.com with SMTP id t37so10914289qtg.2;
	Fri, 28 Jul 2017 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=irDRHfVH3gUYA4Vfn5uAnz6gt/MHs0HGKwlsozqNCJE=;
	b=R+lZzMdPl5kyA+Xscfdu3sO92N+/PjVXQNBDIw+krfQv+LZ0Botc2QTjd7AklqXvIZ
	xhjxfQvio9up0bLkyYIX2rmJlBvbiGaXwC6uim08VdVfdE5n/lJ529lNijCGf7MCVYbG
	Kz/XXm6C9fyRgQYHmfzqMH57QIqNNTbpL5Pl6DqN1ji0fOX3bpAjBcfTDrrxpeyd0qnE
	M19XtuHyVKuZjKwGITVBj0UP4CjNWR+URiTm3jp08cY3RuAx1Hf63d11OdgRJ1RMH3Ze
	y/EVsgJet/6baBRv3PTtqfyEtFlgCwBhrgz0IMWYIih6IqM+1E+Ko2A6UiZ3XUU3Sv4S
	b4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=irDRHfVH3gUYA4Vfn5uAnz6gt/MHs0HGKwlsozqNCJE=;
	b=ItPlfyhqsrkQAQxU/hOqhwkuhAcfeAe/mbiVmYrff4epdfvgJJSD3I+x+j8L17RvxG
	6+hHWPVGGG8PGHuXTQDUOsOB8zIU94U37/vXvwXCk49MroF06uzWn4GfnJ9BKtMAagif
	XazYYRrzh1wcKhfe5FN4V1ap2vQn5MWZxodCjYZs+C9O1wFADafIOnNaH8NqYC+E1nkz
	8zykMMWKyBhdM4W6D46b6JyCSU0bw4ck8zkwMrjKmhNo/BNpOprIznLYqNMfA/bpDnK7
	frA1Xlz6aJKyxLdBXO76FT2b+hhU7QAh+3Bq60Usu3wYyyZt1USn48WIplbdFnQsVODd
	RwCg==
X-Gm-Message-State: AIVw1119bNSSjL2XbQ/JDviDs1QpAI9Ut60QDpF8cFjhPl/4FpkZhs7d
	jlWJ0sVbVrKnGw==
X-Received: by 10.200.0.65 with SMTP id i1mr13391736qtg.193.1501281985816;
	Fri, 28 Jul 2017 15:46:25 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 19:46:04 -0300
Message-Id: <20170728224608.3598-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 for 2.10 4/8] docs: fix broken paths to
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:35 -0000

With the move of some docs/ to docs/devel/ on ac06724a71, a couple of
references were not updated.

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


