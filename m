Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087C4CCA468
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Sep 2025 09:58:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3X7V-0003M3-0V; Tue, 30 Sep 2025 05:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <grant@cylo.net>) id 1v3Wlc-0003nG-Hd
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 05:35:28 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <grant@cylo.net>) id 1v3WlT-0001Qe-QV
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 05:35:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso344545166b.3
 for <qemu-trivial@nongnu.org>; Tue, 30 Sep 2025 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cylo-net.20230601.gappssmtp.com; s=20230601; t=1759224913; x=1759829713;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nNQOhBWxAwN+tCfdXUvKDVjrEEM+0houM9LjCgxD5jA=;
 b=0r92mJtCCNVWbPP/1IdmaxiYJn2k6lRAzMfLJwEbn3//XVXbew+E+SrmDfK1XuWqe7
 X5LItx9+34KMVXZSjOafeDXiTaZvFP1LIiLVePPwJAPNTZGrNXvD95MGaygjvuNhXFEm
 yUtltNnzRNkleoKS18DrUaMHqrQBYuAjWz2/DAC7I0qwNMmYRhnl7E9HIIVHBRxBFWI7
 1cImLRCId1IKsT9am4A7d7iUaJNFElNvwinps5AsyeP9+j72NO+F6GjHi2Zs4fi6w+uQ
 bmEiOPwIJKnGiEziSMS8gfh5jXPtLppP75mViUMNBwJHzMetTcIXCYhwTjRGU9NSlnQk
 70Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759224913; x=1759829713;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nNQOhBWxAwN+tCfdXUvKDVjrEEM+0houM9LjCgxD5jA=;
 b=uK24jVEk0GSIJsfEpGz9etjtcVL2yINnQcMJMr9ul17BOvyAqY7D4W5kYnMj3LM0Hc
 HFlzucAfVgS9vUi0ZBzjoQ+goUrL7HUg6Whktcj+fhpEIMaSKavv8wUSvx4i42obMMbN
 rkU4OXZAauaojOLI3RERaSjp3UhXeGKEPnUF9FqLtUJvOs8Ckj5+ETG7z67aqns34/nC
 k013OZOaRbi5sIzd16HYDK28+60vJujyEjh595ll5zfEbQ4tNzBneDaPJaY/co9Oot9s
 2UVw1IMdvgZcAOHTfltdstNHxo4cn64e1sBn0V9TqxuE8n21jPM601LX6jC5MG7p7DjT
 4gFA==
X-Gm-Message-State: AOJu0Yyf7NSFZAW95fzYr/kYCyUisFhDUSzfpPZ9KoEyiZHTUx4htgaN
 tclFk0nYazcTn7OgIXmYHNitL2Jk3Bzo5hvIWZR0kNhjGogKhawxWKuiddKp/fCaQTCKcLS77Ws
 W7Kuva2i5lLmY98xL2KnUot2bDheNCcXV3BV5P/YD
X-Gm-Gg: ASbGncu57gJLriF3mxUuB9mVBqdUNZAMRwp0ApJZh5HN/rD+xmlS8JghH+/BpdCdEau
 5XUwJM3q6P2va0Y9S98WpvlWevj9SY3Z/jQMRmqPjIawwiGsFwwDBwjomZ4eHS13K/d2jbidMei
 4YVZsVCkjuChTNaBBkZj+gTGxI79HU+wLo9XlhP3TQw9+/8azyva/zMFF4IlS2V9TApUuKIddCk
 klpsLB/Pvh4yBINkD81eVe8Mv0++mhqamVhxZubnzdwfBF9
X-Google-Smtp-Source: AGHT+IETbiKODhQQ4PSeYM+Ri5cDLzACI+nQZRsKqqkghSvx6fnazRlqnNHd1cQDZ5eACu+a/O4VsaQuH7++vMgnOj0=
X-Received: by 2002:a17:906:c113:b0:b2a:5fe5:87c7 with SMTP id
 a640c23a62f3a-b34b69423famr2413535666b.12.1759224912627; Tue, 30 Sep 2025
 02:35:12 -0700 (PDT)
MIME-Version: 1.0
From: "Grant Millar | Cylo" <rid@cylo.io>
Date: Tue, 30 Sep 2025 10:35:01 +0100
X-Gm-Features: AS18NWArTSOpfpl9orxCYcoR8gqYDVtoKsv0iifeRLOVtXtYXY3czY2nK8WIj_s
Message-ID: <CANdvy3dH9bBdopj_KUqaLD0Viq7uKn0jPObjqz6H7XvMgRnPrw@mail.gmail.com>
Subject: [PATCH] ui/vnc: Fix NULL pointer dereference in vnc_disconnect_start
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=grant@cylo.net; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:58:03 -0400
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

From 0d1c4ac000a66ef22b4a0cd0c4bedd840192096a Mon Sep 17 00:00:00 2001
From: Rid <rid@cylo.io>
Date: Tue, 30 Sep 2025 10:23:58 +0100
Subject: [PATCH] ui/vnc: Fix NULL pointer dereference in vnc_disconnect_start

When a WebSocket connection fails during the handshake, vs->ioc can be
NULL when vnc_disconnect_start() is called, leading to a segmentation
fault when qio_channel_close() tries to dereference it.

This can be reproduced by sending incomplete HTTP requests to the
WebSocket port:

  for i in {1..100}; do
    (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 <IP> <PORT> &
  done

Add a NULL check before calling qio_channel_close() to prevent the crash.

Signed-off-by: Rid <rid@cylo.io>
---
 ui/vnc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 77c823bf2e..1669ed1b80 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1301,7 +1301,9 @@ static void vnc_disconnect_start(VncState *vs)
         g_source_remove(vs->ioc_tag);
         vs->ioc_tag = 0;
     }
-    qio_channel_close(vs->ioc, NULL);
+    if (vs->ioc) {
+        qio_channel_close(vs->ioc, NULL);
+    }
     vs->disconnecting = TRUE;
 }

-- 
2.39.5

