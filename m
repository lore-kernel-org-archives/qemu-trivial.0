Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1v-0005Ls-Ki
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1q-0005Hl-ET
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1p-0002Rv-40
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:42 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1k-0002Nm-6n; Fri, 28 Jul 2017 18:46:36 -0400
Received: by mail-qt0-x244.google.com with SMTP id p3so13992515qtg.5;
	Fri, 28 Jul 2017 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NXS3zLRx6Z0/iNslPyd3NAgDZZ0Eck4Sl3MeWjYCNrw=;
	b=uhW2L40ByH9Y3HSQ2hCLfuWRp8NbVkQe1vxVoh14+pIpZGD/OFCLMmcFBHoeo6LbCT
	Fh1gPPaL+VNagv9hSZY9LGuNC/K90gTLZd7AoDS4LkaoHdvTIa1LMDf0ZB/RJhPw5ux5
	OkyCv9iWb87AMqo6QCkcAntGFX8vp9GeYMizePFRcwehAU2j5h+iRAr/GKttLk2BMmXp
	sAsthXOW66ljt+dbjTKQEBheSTBgz/zcshy536yzuKr2AIKEqqUM67CczqvL+QhDPTM+
	ouVydvjOfEhhk2sg7hcooOAdZ6uP6kPb8m4Jzl5/T/MxxGZllUCKdCQGWhKr52ic7r4u
	lvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NXS3zLRx6Z0/iNslPyd3NAgDZZ0Eck4Sl3MeWjYCNrw=;
	b=fennzokakLXPF/6XtTZzxJCmKRiIVNoxBwgAYLUadqK7KrZNsMcBfz/DD8pW+ntaEu
	64VfmZeGl8KtOgVOz6qk+PqLt/R37FJDl9ZliLO5iiRqj/OM++lb4gnlU2KwKZWfUZbz
	3irZdCJvg9Cxx3NfnWF2zncWDgC5SyUFRG363ldM+BEMg9pTYdyHXFecrGARqfHFque8
	6eOzOJoN3O+awyZWdXabG0aPg4nu03R6tSnoHrIn0bN0J+NiU4Hf7iUHuWicWD06T61H
	T4yKdRMBH5VcOTSJyfCXYwcDKWmaxrmai1VckkmpUCGTo++49aA/bqpzzyzpxopjU8+m
	3Xhg==
X-Gm-Message-State: AIVw111uhA5yjud5Mle9wkCnWtyy0zNIBAl5wJUhotVXKXkOe3rur0kp
	5tmuI3RVytYanVPhsist7g==
X-Received: by 10.200.39.100 with SMTP id h33mr13307836qth.62.1501281995658;
	Fri, 28 Jul 2017 15:46:35 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 19:46:08 -0300
Message-Id: <20170728224608.3598-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 for 2.10 8/8] docs: fix broken paths to
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:43 -0000

With the move of some docs/ to docs/devel/ on ac06724a71, some references were
not updated.

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


