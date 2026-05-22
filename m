Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B4CD5BB1
	for <qemu-trivial@archiver.kernel.org>; Fri, 22 May 2026 12:57:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wQPRH-0004lD-D8; Fri, 22 May 2026 08:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1wQKv9-0005Pa-7E
 for qemu-trivial@nongnu.org; Fri, 22 May 2026 04:07:51 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1wQKv6-0002ko-Hw
 for qemu-trivial@nongnu.org; Fri, 22 May 2026 04:07:49 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5a8891f0c51so7394782e87.1
 for <qemu-trivial@nongnu.org>; Fri, 22 May 2026 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779437266; x=1780042066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loYQlF2qxM1tBZE5Eo5pBRl1/ffs/7Vck73oZUWkv6w=;
 b=T076DmjaPHzXosx2zT9hjx1H4T6ooplovn/HFYFmEzVShOKPl8Jz5Bd8/LVuge9RTk
 BW+wnDvn/pcC3H7SklVEsgi1C+AXodSbDzanResuOUfZKmBbDgSNHR9z/z4OrjADH+Me
 FTCLPR1/uR6ReGsfMBO0CICYel99nfrjx1GXFF+AsBq4B8HGT6dzjyd3PhdCECTue27E
 4NNelh7+O51ugI9unuiQ51JibZSEDxLlwDBoWBwiwClIUx7L1JIVlCv9kvvNNFJ/n2l/
 NSV7KfrInNKQwR5LEhDtmezGl9PB/8oK4e9LshzZWxsS0Pp3pSFNKreOJO0fSzT8mG7i
 I0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779437266; x=1780042066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=loYQlF2qxM1tBZE5Eo5pBRl1/ffs/7Vck73oZUWkv6w=;
 b=T5vZGlquKkvoStDijyJohxNG/HofYw74ZAA4Fry2JHMKOJ8owGSnfHMPVp0aHPY//v
 98OY9cbMRe004OvWiRnyG5kkuaPYRZXz/YAIW8j+srUhw7SdiwHRWVNdryWSL/EO2xi5
 adEDtkQrlC/yJ5jtYf7dcql1lNKLxGxCXgwcka0EluwH6l+/q2vHQABbwzS8Voo6Gll7
 UNujr4pPCJ1hBta7tIgwZ3u5RxsXqzgXIbA+tnaQU0NBhp3JS4XIjormPnMPrewYXMbn
 nLmHXCLDu3O40PzgMNLA0jvAv/9ClkBz4f4S6qT7S2ih7X3n8jRm2QQ5cklR8MEUJBZz
 b8NQ==
X-Gm-Message-State: AOJu0YyvnIQRDwvlLcop9EZ3LI3z/7eC1dwC4ZrGGkdPYlVyLUj29tLQ
 2dXndqiV6gnDrqs3sESf4G4f1OGQ9P7RafStT2p7gUw3Zk2DYHUquWsN
X-Gm-Gg: Acq92OH6kKa6nIHI1aySkFqH0zPDr2O81nrdYq6GBrYc/rFH3egrCwe0FRJptP4qh7e
 FrOCcp/SBf3tPRFw7IS9ozoCE9eg4xQN8q2EaR+XNp3d5Rgd9tjQ7HLfZ5Yu5PwhBF2lb3fGUeN
 3+un4Xgs0nnKaFq1DdBEDl9RQTqMT3OB347JOd5tpKCz15X/B5lU1H2btWOOQ3IPH+WPz1SSFic
 f0pnrZ8R3vRwf16BVsl6RDvFBkN3k7epqQJ4sQ6ZEL6YIKQiwBMNMzgcXen+BuHUFUwMNTqe8us
 fabfjDLrys2n+FTU3ojxng41J0Vs370FZXpSoHN5reSagu6uG6wP1e32LHYE236wC38YTbYsHdL
 Wr0uie4oikITMSWAws9RxZ0zZ7AJZUuS6GVAdql9he6+ipfoPgJz9Bsj2ulHOTdZT5Rw5mMueef
 ms5Sex3tdU1lCv6TtcoZuywIM=
X-Received: by 2002:ac2:5586:0:b0:5a2:c6f2:fd5a with SMTP id
 2adb3069b0e04-5aa3239b99fmr558679e87.21.1779437266002; 
 Fri, 22 May 2026 01:07:46 -0700 (PDT)
Received: from machine.. ([37.113.215.232]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aa32cf95c9sm239722e87.78.2026.05.22.01.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 01:07:45 -0700 (PDT)
From: Evgeny Kolmakov <randomjack94dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 kwolf@redhat.com, hreitz@redhat.com, zhangckid@gmail.com,
 lizhijian@fujitsu.com, jasowang@redhat.com,
 Evgeny Kolmakov <randomjack94dev@gmail.com>
Subject: [PATCH 2/2] block/io: Use QEMU_LOCK_GUARD to simplify mutex handling
Date: Fri, 22 May 2026 11:06:44 +0300
Message-ID: <20260522080644.9531-3-randomjack94dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522080644.9531-1-randomjack94dev@gmail.com>
References: <20260522080644.9531-1-randomjack94dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=randomjack94dev@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 May 2026 08:57:13 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Replace qemu_mutex_(un)lock() calls with QEMU_LOCK_GUARD().

Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>
---
 block/io.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index e8fb4ede4d..1020047888 100644
--- a/block/io.c
+++ b/block/io.c
@@ -719,14 +719,12 @@ BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs)
     Coroutine *self = qemu_coroutine_self();
     IO_CODE();
 
-    qemu_mutex_lock(&bs->reqs_lock);
+    QEMU_LOCK_GUARD(&bs->reqs_lock);
     QLIST_FOREACH(req, &bs->tracked_requests, list) {
         if (req->co == self) {
-            qemu_mutex_unlock(&bs->reqs_lock);
             return req;
         }
     }
-    qemu_mutex_unlock(&bs->reqs_lock);
 
     return NULL;
 }
-- 
2.43.0


