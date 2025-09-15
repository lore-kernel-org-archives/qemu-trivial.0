Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF43CAC597
	for <qemu-trivial@archiver.kernel.org>; Mon, 15 Sep 2025 19:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uyEs2-0000kR-Qn; Mon, 15 Sep 2025 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aokblast@FreeBSD.org>)
 id 1uyDSi-000471-AZ
 for qemu-trivial@nongnu.org; Mon, 15 Sep 2025 13:58:00 -0400
Received: from mx2.freebsd.org ([96.47.72.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aokblast@FreeBSD.org>)
 id 1uyDSc-0005KM-6C
 for qemu-trivial@nongnu.org; Mon, 15 Sep 2025 13:57:59 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R13" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4cQXmz6l35z3ZMx;
 Mon, 15 Sep 2025 17:57:39 +0000 (UTC)
 (envelope-from aokblast@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R13" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4cQXmz4WFQz3yfn;
 Mon, 15 Sep 2025 17:57:39 +0000 (UTC)
 (envelope-from aokblast@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1757959059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SknIVfYoLKfZM6oyqJKx4g3R/N0O6lw2+rKEfNzpmvw=;
 b=CJbcjnH3pW2ix0UizLzOhQKAU/zlIiC0NY228IoXaAaVZp9RWQtBI6nCSQxxtkDzUQBDHa
 1/XyDNxctd4+0FNU2umfavJzj9ltQAkA1ijlSxWxO/UuGdlH4dIuqLIlpMzprWiBagHSHo
 o0T+sYmLX/ngiPFVIHPWISPzRFONuOdWIABMjYoipYSgKKu1NKKkpjuTEpmem9bGoyoanI
 dAgdUL4De2OY4oKcsmrJl9SgEzaggwU+EvXG3xZVGFesC3DXZZIaEi3qLTUYkHe5oV/QHs
 TRJl9SmaQFhdaYy0qbpUH/PkeHcyLsf7carIm6qwXPF9l0/+djaJl1CzUc7Gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1757959059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SknIVfYoLKfZM6oyqJKx4g3R/N0O6lw2+rKEfNzpmvw=;
 b=KLeyYnRHcoUFgK7S/XsvstjETN1JfRsgYv1C3iIhNftjAc5XVo/brjqv7G3gxnHo4nihey
 yEti+JkQUTxbIKZk/9u4V1/30YYcrIu1QMflklBaNg55VgmAf4NaJWXLpf+qFb+jjtV/8L
 pEZniIWM1BzDEIGSO86RON7Kng4MNHzrdq+ki8JLWlS1vDbCAeV5EXKFPrX8zGYJU2FKDO
 dJtjUZ8VKFxBKNnkZOOMMhhuCDmDgnza917RRzShCqWMhEGulnkJiU+6T4kXYtiq+GkBTz
 V6GyZTvd3ySBCxV3Go+LtRXWQUbbHMkoqbzrr1+YbNgH/frAsoOC7968k6x8nQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1757959059; a=rsa-sha256; cv=none;
 b=RUc1JCgmiRsOCfqeTgzfhWdmjX04HFB1PBSzgnFvPefJIPY5brZBAo9axm4EASmGuXFoTa
 5EUi40yLpJHWIxImYrOxINVY5ym48JecYB4T5Fm1gMfwwuosNSYUwaet1806qPlh/f3JPb
 sxDwV8T/nUV2eeZZZPoySQJLhI5Bnt6DYwGF3BbKnGMcdujPgIc1QrsaMYN602GLDt44XH
 +eSGoWvG5RHTGDPV82lYvrWTuIGDKmnXK/v7J+rEUUUGBjB9w0lEgfgyrOw2Da4ySIv82Y
 RMknbR78KVFraRmdR8GKdI4dSW/auHh5CBaIEszr1d0LD6QmWySXuBWJ3O8Bfg==
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
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4cQXmy22kqz1Bw4;
 Mon, 15 Sep 2025 17:57:37 +0000 (UTC)
 (envelope-from aokblast@FreeBSD.org)
From: ShengYi Hung <aokblast@FreeBSD.org>
To: qemu-trivial@nongnu.org
Cc: ShengYi Hung <aokblast@FreeBSD.org>
Subject: [PATCH] hid: fix incorrect return value for hid.
Date: Mon, 15 Sep 2025 13:57:30 -0400
Message-ID: <20250915175730.27825-1-aokblast@FreeBSD.org>
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Sep 2025 15:28:12 -0400
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

The return value of hid_keyboard_write is used to set the packet's actual_length
and pass to xhci directly to allow guest know how many byte actually processed.
Therefore, return 1 to indicate a successful transfer or it will be
considered as a wrong xfer.

Signed-off-by: ShengYi Hung <aokblast@FreeBSD.org>
---
 hw/input/hid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index 76bedc1844..de24cd0ef0 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -478,6 +478,7 @@ int hid_keyboard_write(HIDState *hs, uint8_t *buf, int len)
             ledstate |= QEMU_CAPS_LOCK_LED;
         }
         kbd_put_ledstate(ledstate);
+        return 1;
     }
     return 0;
 }
-- 
2.50.1


