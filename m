Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC84C55171
	for <qemu-trivial@archiver.kernel.org>; Sun,  2 Aug 2026 16:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wqZ3f-00012l-Mv; Sun, 02 Aug 2026 12:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carenas@gmail.com>) id 1wqZ3X-00012T-Vc
 for qemu-trivial@nongnu.org; Sun, 02 Aug 2026 12:28:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carenas@gmail.com>) id 1wqZ3U-0007ar-93
 for qemu-trivial@nongnu.org; Sun, 02 Aug 2026 12:28:54 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cfff5f88dbso28907875ad.3
 for <qemu-trivial@nongnu.org>; Sun, 02 Aug 2026 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785688129; x=1786292929; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wvIV2D9CwTPjq+SLKzWCeXxWYQj/eq+lteTGR6E/cIM=;
 b=C9e6mhIZha61m0CmcvFYKISHpEjbZwwxvJfmkzMotmh/2ofaJZJW6MVt27sQSgO6Q0
 jEnnvV57z/sY6WbG/TyJ05SOK2TQ9MGE1ODz/9wAqMMXTlQxpxBnyA/xgnV65Ag/Z3d+
 +z3kOuTua7Azz9W1OoMxUdBNNl5SOzfucB61CN/ztAsUqFJIIqTDA+gB6ypIPhv/gyxJ
 Z39Qt66s7OXxi4qlf+mUvB2SvcWHAUiQghONyKLVWeetbumz4owov/H/11mZ4G/nK1dt
 mw77N0tVBba1jqEh65bDPV7PoO12e/8hvn0FNvfVGdnnzdGtFraeQl+K+DAYIDcjUUW8
 /uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785688129; x=1786292929;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wvIV2D9CwTPjq+SLKzWCeXxWYQj/eq+lteTGR6E/cIM=;
 b=KR3SKJICqvGpIWILkUdMLXrR8mofO4c8PhK8qPvE5zfZD8rxnhiD77dVKELqk/bXFU
 jU20y3m9SspnlkfqO4T7m3aM3oZLE/XR+pVRpdZFAVNPT1X6RJdh77rVUZFrcrpO2HeF
 6jeKV5DpxFYFSJwybv2WMsVynScI59PC2xjwaGq6TMSsIq0wlU9/Q0VtKc/0m5CE/PDL
 cIMZOo5Vmesy3mUnfh5biH6Q1heHRvC92myz0zmgsu4NZIlNX63NVR4WbPINK328dkuu
 x2J/VCxHlyD9lIjHQZ3S9tclL3oVqx7dbc8mtRZumKlBqe+x+tswPzyA3m4FFqKZNBjH
 yLGQ==
X-Gm-Message-State: AOJu0YzKb91NI50Cbc5NNmCIp2u1KidzkEvXJ9FSnB4v/G4fwHnERpR/
 oCyEsQYStGphkti9+gTCwKs3sQxJnRGKxLQ9EDPEDDYO7vBdtzIqHKWg/QtYCg==
X-Gm-Gg: AR+sD12/7KPl+ENBScKfrRTMNhVxiSOGfYWSjVhvh3mjSU3y+be0zdlCZIJRXzIlfSM
 Y0mEiR9xa4uAXY/ZK5qFsPd1kRwv/1sNjVqBun3eaeDEXQgIhS5AQs2VBOoDbO/QkelJPjeF6Qo
 iCd7YL5fqnLBjaGd24Z+/ztGi6c75FDma0P45NtkFszrw3WadIMNkDloTezZ8hsBt1QYxTRdKcK
 e0/FILoZJYdWe965LFY49U9OfDt+cFJ7jAdbuFVFcopI+E67EVc5SnPfyKrZuIhaB6TC4ZX69UP
 VHEn20khSlxUpuAIe8tx51RuygP60c0qJtJ+U3LQAttJMDDO+GPeDPbCi3IOVkQxO8CnPZwB/sJ
 nTq+mX9GIdwMBi8y7r2CGTlKlqd4LEym1bei2t5+94xJLr62P3zO38GNoahSjRdmrcgwmvgku5X
 7g6+iTc1vBwI6jPYgkBx0WPQlba08YcpPS3cTSTfluIMb8tzxk63gCzuRsJKLxpqvc8UShPMkRY
 4v0Y3oF8mTlglMP94orVFRbFIEP2yjb1xL56oxZNbaBysKXwOGkO4Uy7a5YwcaXRlcdVlhIG6oT
X-Received: by 2002:a17:903:26c4:b0:2c9:97a8:8c17 with SMTP id
 d9443c01a7336-2d05247261dmr78458095ad.42.1785688129028; 
 Sun, 02 Aug 2026 09:28:49 -0700 (PDT)
Received: from localhost.localdomain ([135.180.175.184])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3153e1886e7sm32462103eec.26.2026.08.02.09.28.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 02 Aug 2026 09:28:48 -0700 (PDT)
From: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
To: qemu-trivial@nongnu.org
Cc: clg@kaod.org,
 =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
Subject: [PATCH] hw/arm/aspeed: avoid sign mismatch on sscanf for uart property
Date: Sun,  2 Aug 2026 09:28:28 -0700
Message-ID: <20260802162828.16880-1-carenas@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=carenas@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

using "%u" with sscanf() was likely meant to indicate that a
negative value was unexpected, but with a signed variable it
could result in undefined behaviour.

use "%d" and check for a negative input explicitly.

Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a48c442058..a9238e6217 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,7 +327,7 @@ static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
     int uart_first = aspeed_uart_first(sc->uarts_base);
     int uart_last = aspeed_uart_last(sc->uarts_base, sc->uarts_num);
 
-    if (sscanf(value, "uart%u", &val) != 1) {
+    if (sscanf(value, "uart%d", &val) != 1 || val < 0) {
         error_setg(errp, "Bad value for \"uart\" property");
         return;
     }
-- 
2.50.1 (Apple Git-155)


