Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if2u5-0005Z6-2x
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 09:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tz-0005RF-Ss
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:23:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tx-0003IW-V4
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:23:43 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52735)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1if2ts-0003AT-OP; Wed, 11 Dec 2019 09:23:37 -0500
Received: by mail-wm1-x342.google.com with SMTP id p9so7296955wmc.2;
 Wed, 11 Dec 2019 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjRgIZ5qePVVbis5wVrr7iekZjJDuuFlCCqKYtN7ZTM=;
 b=WEfaMqGCuUlAbbxFYkO+RkiTtHeG8X+1D2/TZe01d5Pv6HxDHUMHO7tONfyG/qNnsr
 bUQr07YzwT2kbYLCEfwMGfwKeWlhZFtXeaUSgjTs3evCS2EfQPhkL5vrEeu7om4ojIDU
 +qnuMwqTi/wWRnHXpTBDjo7bDePQgZ7m3btSrwNuwaRARrS3XqwG8cfItcX5uhal7R4f
 vZrTd8KSmnwJuj857261waDF07emNMPDHrmFVflNUwZdyFdC0avK7IGH3pB8JXSO5Zy7
 puChf/BUoNmptO/iKvzWeFiAJwy8UHGsUuW6MU1PjvHuCFALw9PLrPagpp7RBgoAE54L
 AF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WjRgIZ5qePVVbis5wVrr7iekZjJDuuFlCCqKYtN7ZTM=;
 b=ZFxIeI5CkfdmrpxRjUdujnRPCizSvPyRFiNwPUI31eaXLUrT092Zww9iILjYQWFWtc
 Mv8IvP7PscWJDcO3kK2l63S0SUshBc2Io6XxbgsHo7TJ2wBkPE9IgVMVqYVwqhIsAVo0
 5msAiMM3EVyMig9oNuEfXP8wtNaILpYMzoyZdPdNRbz93Dovs+nWkkiIyoWQl7usAIJg
 FOO9G5CJocQA2ARWmbiuVzlQNtIQ+DYomJGgayTfenkNKNEb2+XfmQyfd3U6p8olCwXA
 V+0+q9lqytJaMi31hO0BIrhXy94fEf4drxk/jsrwWToR9+lknS2uNOQbEHO8wgiD8ICl
 Cw5w==
X-Gm-Message-State: APjAAAX475TJDVySAIGNzmKS7lADGLZqTswznXJ1wETVMke8QoIt+ht1
 prQybbRMNsrzPIXKZfAup/CearLS
X-Google-Smtp-Source: APXvYqySPGzmde3Kor2ZWDovZXS+gGeYpLbPi2/kwDQHXfKGMj44DpLt7N6V05b9T5++KqtYRUznZQ==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr83046wmf.60.1576074215437;
 Wed, 11 Dec 2019 06:23:35 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g23sm2503783wmk.14.2019.12.11.06.23.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 06:23:34 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] migration: fix maybe-uninitialized warning
Date: Wed, 11 Dec 2019 15:23:25 +0100
Message-Id: <1576074210-52834-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2019 14:23:47 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../migration/ram.c: In function ‘multifd_recv_thread’:
/home/elmarco/src/qq/include/qapi/error.h:165:5: error: ‘block’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
  165 |     error_setg_internal((errp), __FILE__, __LINE__, __func__,   \
      |     ^~~~~~~~~~~~~~~~~~~
../migration/ram.c:818:15: note: ‘block’ was declared here
  818 |     RAMBlock *block;
      |               ^~~~~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/ram.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5078f94..7dd7f81 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -864,15 +864,17 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     p->next_packet_size = be32_to_cpu(packet->next_packet_size);
     p->packet_num = be64_to_cpu(packet->packet_num);
 
-    if (p->pages->used) {
-        /* make sure that ramblock is 0 terminated */
-        packet->ramblock[255] = 0;
-        block = qemu_ram_block_by_name(packet->ramblock);
-        if (!block) {
-            error_setg(errp, "multifd: unknown ram block %s",
-                       packet->ramblock);
-            return -1;
-        }
+    if (p->pages->used == 0) {
+        return 0;
+    }
+
+    /* make sure that ramblock is 0 terminated */
+    packet->ramblock[255] = 0;
+    block = qemu_ram_block_by_name(packet->ramblock);
+    if (!block) {
+        error_setg(errp, "multifd: unknown ram block %s",
+                   packet->ramblock);
+        return -1;
     }
 
     for (i = 0; i < p->pages->used; i++) {
-- 
1.8.3.1


