Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DB0CAC592
	for <qemu-trivial@archiver.kernel.org>; Mon, 15 Sep 2025 19:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uyEs3-0000kZ-7a; Mon, 15 Sep 2025 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aokblast@FreeBSD.org>)
 id 1uyDcM-0006kW-T0
 for qemu-trivial@nongnu.org; Mon, 15 Sep 2025 14:08:00 -0400
Received: from mx2.freebsd.org ([96.47.72.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aokblast@FreeBSD.org>)
 id 1uyDc9-00075b-61
 for qemu-trivial@nongnu.org; Mon, 15 Sep 2025 14:07:57 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R13" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4cQY0Y0qTdz3bhQ;
 Mon, 15 Sep 2025 18:07:41 +0000 (UTC)
 (envelope-from aokblast@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R13" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4cQY0X6Zrmz40qb;
 Mon, 15 Sep 2025 18:07:40 +0000 (UTC)
 (envelope-from aokblast@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1757959661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y5iZOiBz3EKL+JDBDLNnXVa3Tvew1gt5q/PBP92eE7M=;
 b=kO3m8B3lP+45GmjUe0fJqahnXaBkChyxBMk15u8pr7fq7MiSlBRHzpLlFqmRPXnStq+8Ie
 CP31V7QxW89O2WYXC01KjVotGwdmusJ7SGcHazmnSlC8AwaJlcwpui+CJHoX+Dd29Ynl7D
 xsbKcCK2stI4ldIzYM4NetM9LsN1XZrOJB3aOxy6h2ZFJu+IYsfVxq+wqSgEGrnyO5FXvx
 /pHREUyKi92WNPY1HpOL8Zg28iuch97UuBbtGFRlgxB0cNQItyLAlJSlXn3lDb1zlNLGTr
 y7rBqsjwVDx7fwrQE8qupF0aaNQqjNiAkoZ0HoZTw+x96KMzDVDDP816KCdFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1757959660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y5iZOiBz3EKL+JDBDLNnXVa3Tvew1gt5q/PBP92eE7M=;
 b=gJAe9WerhqtCBmNVoffr1WAx3srgM67YatC8mbrSYus0QA9KUaNa64MFk4JtDOdQZ4OH/K
 HYT4Zle3P+77ChtWc9Vl3GTEoocMNQRq4xVfI5JNrtyvzby0DQt8hQgFvQHw/4Kuh16uKH
 ScwhZX9L7ZRph5TC7kAk2uPh+S/2TZ7ZDqIjPgBn8Y5Eygkid5WHPlMrS/mpEPfFHLbm1h
 zL1qU0TljdQO1mLzHKYuNxH4I5dn87CpDAyIeJKkRJSqVn+nthJnZjEUBFREC8rSb/K1Bv
 pN2oB2f7fvCQ2P0nJmn0zPeRCzURxIGKCupJ/hMtRayOIKesQ4NBz3JjKYYJnw==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1757959660; a=rsa-sha256; cv=none;
 b=uR28/0F1Dd0QrGL5g5xcwDVjSJ/80YsfOyZBDp7pVVyKGZn2NR7sfFy0RT2f2ixBuqGFk7
 NjMUmBfOnrhnjsEH8PpWZ9I36jlv7RKzJfNTVgWwp89NV/z2A8ajlXfLo4yVUuuUT0GFpx
 8BSRCk4ZyJTMuDvAe3s7rRRKZL8XYGtb2ZLcDC5z3oVnp8uA8QiFCUT25TxLEAlqIjEy8y
 fM9VXFZXQy+UzdDEWHMLVk4W0T2/qqOw6KDTIApM3Pmpl3wSnYYwpGVSDBPeIQdb5W0Mhj
 pAumcLUXCEkN4EWZyZyx568bczyfeU4RXfyB5nc83xw2oVaq3NzWFAwXjvth7w==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received: from localhost.localdomain
 (2001-b011-3808-f06a-a66b-b6ff-fe3d-469a.dynamic-ip6.hinet.net
 [IPv6:2001:b011:3808:f06a:a66b:b6ff:fe3d:469a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: aokblast)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4cQY0W0FFvz1C6f;
 Mon, 15 Sep 2025 18:07:38 +0000 (UTC)
 (envelope-from aokblast@FreeBSD.org)
From: ShengYi Hung <aokblast@FreeBSD.org>
To: qemu-trivial@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 ShengYi Hung <aokblast@FreeBSD.org>
Subject: [PATCH] wdt_i6300esb: fix incorrect mask for interrupt type
Date: Mon, 15 Sep 2025 14:07:33 -0400
Message-ID: <20250915180733.75054-1-aokblast@FreeBSD.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=96.47.72.81; envelope-from=aokblast@FreeBSD.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Sep 2025 15:28:13 -0400
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

According to Intel 6300ESB Controller Hub Datasheet 14.4.15, the interrupt
type mask should be 0x03 (0b11) instead of 0x11. In the original
implementation, when we want to disable all interrupt by setting the
value to 0x03, we will get 0x01 which is incorrect when we want to read
the value again. However, there is no problem whe considering the correct behavior
since 0x01 is reserved and unused just like 0x03. This patch is just a
fix to return the register value.

Signed-off-by: ShengYi Hung <aokblast@FreeBSD.org>
---
 hw/watchdog/wdt_i6300esb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index bb8a2766b6..3aa01b8d68 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -55,7 +55,7 @@
 /* Config register bits */
 #define ESB_WDT_REBOOT  (0x01 << 5)   /* Enable reboot on timeout          */
 #define ESB_WDT_FREQ    (0x01 << 2)   /* Decrement frequency               */
-#define ESB_WDT_INTTYPE (0x11 << 0)   /* Interrupt type on timer1 timeout  */
+#define ESB_WDT_INTTYPE (0x03 << 0)   /* Interrupt type on timer1 timeout  */
 
 /* Reload register bits */
 #define ESB_WDT_RELOAD  (0x01 << 8)    /* prevent timeout                   */
-- 
2.50.1


