Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B7ECFA46B
	for <qemu-trivial@archiver.kernel.org>; Sun, 23 Nov 2025 14:18:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vNAur-0006n1-Qu; Sun, 23 Nov 2025 09:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lobanov-vla@yandex.ru>)
 id 1vNAc2-0002HU-Op
 for qemu-trivial@nongnu.org; Sun, 23 Nov 2025 08:58:47 -0500
Received: from forward101b.mail.yandex.net ([178.154.239.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lobanov-vla@yandex.ru>)
 id 1vNAbx-0001CE-Ff
 for qemu-trivial@nongnu.org; Sun, 23 Nov 2025 08:58:45 -0500
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c1e:3990:0:640:454b:0])
 by forward101b.mail.yandex.net (Yandex) with ESMTPS id 763FEC007A
 for <qemu-trivial@nongnu.org>; Sun, 23 Nov 2025 16:58:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id VwarcfWLd4Y0-uoggyZ84; 
 Sun, 23 Nov 2025 16:58:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1763906314; bh=EC2g+WOM0cVQDJgv3Gp+iAhBoHH8v63UnNVUnkonNLc=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=FcOYSrhQY+ZAQSXiae+jFRoUVNijR9kJ7H6fiEDSNFXqviNTK4r0I3zt26oFz0c3c
 SCpn4MT5Ri4YZOboOIkt/w4iDG4KF1dY6SzNwYRxrth6snTn/bAKs5J4e+2HVoUjDF
 Muu2lgL2etK5HHF32yDux1a4xgHSRidS0f54UPPg=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Vladimir Lobanov <lobanov-vla@yandex.ru>
To: qemu-trivial@nongnu.org
Cc: Vladimir Lobanov <lobanov-vla@yandex.ru>
Subject: [PATCH] block/curl: Set User-Agent header
Date: Sun, 23 Nov 2025 15:58:30 +0200
Message-Id: <20251123135830.83970-1-lobanov-vla@yandex.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.148;
 envelope-from=lobanov-vla@yandex.ru; helo=forward101b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Nov 2025 09:18:13 -0500
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

Add a User-Agent header identifying QEMU and its version when making
HTTP requests through the curl block driver. Some web servers and WAF
solutions (e.g., Amazon CloudFront) reject requests without a User-Agent
header, returning 403 Forbidden errors.

Signed-off-by: Vladimir Lobanov <lobanov-vla@yandex.ru>
---
 block/curl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/curl.c b/block/curl.c
index 4e77c93b46..1d9fedbac6 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu-version.h"
 #include "block/block-io.h"
 #include "block/block_int.h"
 #include "qobject/qdict.h"
@@ -468,7 +469,9 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
         if (!state->curl) {
             return -EIO;
         }
+        g_autofree char *user_agent = g_strdup_printf("QEMU/%s", QEMU_VERSION);
         if (curl_easy_setopt(state->curl, CURLOPT_URL, s->url) ||
+            curl_easy_setopt(state->curl, CURLOPT_USERAGENT, user_agent) ||
             curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYPEER,
                              (long) s->sslverify) ||
             curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYHOST,
-- 
2.39.5 (Apple Git-154)


