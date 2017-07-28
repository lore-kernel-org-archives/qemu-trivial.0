Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2n-0002kH-QW
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2j-0002i6-LI
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2i-0002E8-LM
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:17 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2g-0002CG-Fc; Thu, 27 Jul 2017 21:26:14 -0400
Received: by mail-qt0-x242.google.com with SMTP id t37so8524508qtg.2;
	Thu, 27 Jul 2017 18:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EPLInQPgf9R6MIqEODhnLeB4K0s2mr7RuiNy5aOIRvY=;
	b=TjDBrQw+mBnK5uhq24clnHK/skQowVmhDSYTc1027WV1eMUxpUgkvn9HY+cEdS4yoT
	pR6RWytskSDMDK7hPswE8CN0RWyx1/JqKoY2mAsYx4enEJbmHja9ynv9zJ4iGkLvH/+E
	wXg0b8Y2Tzw6oRMctmNaUtk1VQLbTowS7+we/aXOZBRyMXk1rsAPu0gV1MWBiuUZdbCK
	B98PDtRVG+wB2Kq1cC1j9BdwqluQGv8eKHs29KAL5PAJ1WfngsD/iCOqNS8JRXgTPDNh
	WiP664vxjOzndErd8OR/qWlhb7ghgE8VjOVnC+TYfurkl0cFCKu1o7D/bXzvMuHup0bO
	m/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EPLInQPgf9R6MIqEODhnLeB4K0s2mr7RuiNy5aOIRvY=;
	b=X8Hnj/WdEGYG0abB2VOAkwxGhiOHEkjGIStAU9F/iTEUhN91llz/61cfTYa61W6TEH
	/xzATpcb74/AG/vzZ0YIGcxLzBcLzFXNj4ygFRq1cCFvamxNUQ2EZknLGSuFngVICZ6x
	3Yt3SxSfGF/UoXG8YeijxQp7BqbEGZrnSdBOazzIj+Inwhnp0zNDAWArjIyLMgajkqcm
	b8nn4SHSPQ8Bl7DAEa4NjQ/e94ijhOTATELSYX8n9zOEFrjJMBLk0azlRDVxJ2JaNo0v
	PkaWKq33SE5WakdVWAZrneNcQIzmMQ75Jndft2bAEgoEnrSnUAqnT+wFhyQhQjIF76MO
	J8Wg==
X-Gm-Message-State: AIVw112nT6QL0PMWwj1LoC9Y7XXkIDpHEhQXOMtBXrOJ6SnPyXPn3OJP
	vjg1j+zz/6vUjZ8awO+vSA==
X-Received: by 10.200.46.41 with SMTP id r38mr8912086qta.316.1501205173896;
	Thu, 27 Jul 2017 18:26:13 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.26.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:26:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 22:25:42 -0300
Message-Id: <20170728012542.29975-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH for 2.10 8/8] docs: fix broken paths to
 docs/spin/
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:20 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/spin/aio_notify.promela        | 6 +++---
 docs/spin/aio_notify_accept.promela | 4 ++--
 docs/spin/aio_notify_bug.promela    | 4 ++--
 docs/spin/tcg-exclusive.promela     | 2 +-
 include/block/aio.h                 | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/spin/aio_notify.promela b/docs/spin/aio_notify.promela
index fccc7ee1c3..a8f032560d 100644
--- a/docs/spin/aio_notify.promela
+++ b/docs/spin/aio_notify.promela
@@ -8,15 +8,15 @@
  * the WTFPL will do.
  *
  * To simulate it:
- *     spin -p docs/aio_notify.promela
+ *     spin -p docs/spin/aio_notify.promela
  *
  * To verify it:
- *     spin -a docs/aio_notify.promela
+ *     spin -a docs/spin/aio_notify.promela
  *     gcc -O2 pan.c
  *     ./a.out -a
  *
  * To verify it (with a bug planted in the model):
- *     spin -a -DBUG docs/aio_notify.promela
+ *     spin -a -DBUG docs/spin/aio_notify.promela
  *     gcc -O2 pan.c
  *     ./a.out -a
  */
diff --git a/docs/spin/aio_notify_accept.promela b/docs/spin/aio_notify_accept.promela
index 9cef2c955d..491f36a59c 100644
--- a/docs/spin/aio_notify_accept.promela
+++ b/docs/spin/aio_notify_accept.promela
@@ -8,13 +8,13 @@
  * the WTFPL will do.
  *
  * To verify the buggy version:
- *     spin -a -DBUG1 docs/aio_notify_bug.promela
+ *     spin -a -DBUG1 docs/spin/aio_notify_bug.promela
  *     gcc -O2 pan.c
  *     ./a.out -a -f
  * (or -DBUG2)
  *
  * To verify the fixed version:
- *     spin -a docs/aio_notify_bug.promela
+ *     spin -a docs/spin/aio_notify_bug.promela
  *     gcc -O2 pan.c
  *     ./a.out -a -f
  *
diff --git a/docs/spin/aio_notify_bug.promela b/docs/spin/aio_notify_bug.promela
index b3bfca1ca4..49c69cee3d 100644
--- a/docs/spin/aio_notify_bug.promela
+++ b/docs/spin/aio_notify_bug.promela
@@ -8,12 +8,12 @@
  * the WTFPL will do.
  *
  * To verify the buggy version:
- *     spin -a -DBUG docs/aio_notify_bug.promela
+ *     spin -a -DBUG docs/spin/aio_notify_bug.promela
  *     gcc -O2 pan.c
  *     ./a.out -a -f
  *
  * To verify the fixed version:
- *     spin -a docs/aio_notify_bug.promela
+ *     spin -a docs/spin/aio_notify_bug.promela
  *     gcc -O2 pan.c
  *     ./a.out -a -f
  *
diff --git a/docs/spin/tcg-exclusive.promela b/docs/spin/tcg-exclusive.promela
index c91cfca9f7..50a084c5c4 100644
--- a/docs/spin/tcg-exclusive.promela
+++ b/docs/spin/tcg-exclusive.promela
@@ -9,7 +9,7 @@
  * the WTFPL will do.
  *
  * To verify it:
- *     spin -a docs/tcg-exclusive.promela
+ *     spin -a docs/spin/tcg-exclusive.promela
  *     gcc pan.c -O2
  *     ./a.out -a
  *
diff --git a/include/block/aio.h b/include/block/aio.h
index e9aeeaec94..386d7f24dc 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -104,7 +104,7 @@ struct AioContext {
      *
      * Note that event_notifier_set *cannot* be optimized the same way.  For
      * more information on the problem that would result, see "#ifdef BUG2"
-     * in the docs/aio_notify_accept.promela formal model.
+     * in the docs/spin/aio_notify_accept.promela formal model.
      */
     bool notified;
     EventNotifier notifier;
-- 
2.13.3


