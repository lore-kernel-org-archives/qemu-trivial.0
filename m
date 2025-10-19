Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EA6CCD195
	for <qemu-trivial@archiver.kernel.org>; Sun, 19 Oct 2025 21:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAaZG-0007W4-Vh; Sun, 19 Oct 2025 17:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaZF-0007V8-7r
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaZB-00023i-Ki
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:52 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so697459066b.3
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760907827; x=1761512627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQnslZlvL/ycghWXR/jv6T9Aq0fKGJTc5vHN36t+VJw=;
 b=LpY0szDXKHb2hGm8477/xrqtA7rDzKAFs4rNIwDeFuWjyrx+k+zxTnAKVhCU3RWxpb
 lGeAOZIA58LiORMaiSbfDp+6/QlOTjbgFw61oIvuq4zHMfkhF3Ue6ST4mD+VPFzRGwDk
 MFRWd4lYmjnQP0GmP94+cMKB1EZ63ycgnjURQ2kPcHJHq9L4BDmU/3WCtUKPbNHfdi8m
 dFYCY3iWslhUXXpz4l1LqWXL7rzih/H7hD5iZVVSO2yvw2IWQusFT9tRmu39KE6V4Pdl
 0+pqqRnPVUUGP1un3UL2Q2A58M//qrAuv8OlK/PvHOOLysuHyiQOBX+BqqnP9VSkknrQ
 Jcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760907827; x=1761512627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQnslZlvL/ycghWXR/jv6T9Aq0fKGJTc5vHN36t+VJw=;
 b=osPuwgvy2hrm8E33cdm4UUD/ky7Dz/y05DuDGfvOX5PhK0qAYeg63WWRWP2xHnaVth
 UwGLktxIHH4rvViCME38a8qV3LSdr3uH3k3iLxd9INpLx3xzm0OXx4ib3hfQx+k+C0uR
 Hh5hipEj52MwY30I1k5GtsG9J1XROK99YgryTfQn2z4y2zx4TbloSOBhOOw/8a1qxVmM
 ZL4pP9kkG7Lk67T6D52CSC1o8GHOgc/L0MnaFMtsJW5p3qlC92c27euwQa0NawJ2WBsC
 xrA9LNirytcWS/Y3UaOd4RJBrpyfrVbugZS73yyRc3DtwjHMNputH0XFATpVTPpPL/AO
 Hgog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTg5L2MeOodDpl/IKOAf9ed1eaZWViW3imUy2HNqLY9zcHXg4Fi2LE61QNZ2KiP9jpduUGk6mgRH+Yf50=@nongnu.org
X-Gm-Message-State: AOJu0YyxBtblJ/MPLcPCSunXjAhI27MMKv9w+yLkQdw0iXiksbmGrzE1
 ctHSzzwamU8AQVO0FUC8eZYs3VYhtp+0lPpl0XQ622nB6MVsGI49U752
X-Gm-Gg: ASbGnctOJ26XHBw4IMkGgTTlgtw5Nrn8LgUxrluzkZ4ych7mVeQohYsZ4XtKmG36nXR
 OfNUkXHRzBM+isgVtHvp28Ta9fKZhAZaBCXG/H4cwB/CsGQ67QaWcbHlaJp4Dh42MJ+H+5cIXoQ
 IEpyxy26mf05ClovYj+Bm14jgPj//LS3fKWwZgywz9PAtcN52LaTrl9br45EPm81ArYUoGbU3yA
 lEErhxCcdpCvDWjWhTF7pU9on/cLBSvJSsirE458eZ3SCbdQIT2Iagsv4wVPlFEAj9u6F6yHWup
 28uhvbzS/4yt0oGtyEkjwpNfhmbDIfk/sikJkUnbwImADpDP1xNKZFHL3R0hMzumwyDJwUtvgRd
 p7y008SoP0D9PyMlgmfL9tMloHzruowJcndviraxW8lC4y/O9RIiudkqqrBqq7c/eJar2oWRPeL
 IvpOXmW9iYgRfEyyq0N9EEmXBXuqBa3OJOXbBc3r95EgFMii5Tk70eZ5VjkK4QV5P2BPb6
X-Google-Smtp-Source: AGHT+IFxPtXo9vzXd3rOAqwwxaNDvJIFsK7Eo1zA6M2lE6v+t/sNoVY4Repet5YBzuRnemWgklColw==
X-Received: by 2002:a17:907:c06:b0:b3c:bd91:28a4 with SMTP id
 a640c23a62f3a-b6473045139mr1262880766b.28.1760907826411; 
 Sun, 19 Oct 2025 14:03:46 -0700 (PDT)
Received: from archlinux (dynamic-002-245-026-170.2.245.pool.telefonica.de.
 [2.245.26.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f003sm5107655a12.27.2025.10.19.14.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 14:03:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 10/10] tests/qtest/ds1338-test: Reuse from_bcd()
Date: Sun, 19 Oct 2025 23:03:03 +0200
Message-ID: <20251019210303.104718-11-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251019210303.104718-1-shentey@gmail.com>
References: <20251019210303.104718-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

from_bcd() is a public API function which can be unit-tested. Reuse it to avoid
code duplication.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 tests/qtest/ds1338-test.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index d12424d27f..b8d0e65ec4 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -18,16 +18,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bcd.h"
 #include "libqtest.h"
 #include "libqos/i2c.h"
 
 #define DS1338_ADDR 0x68
 
-static inline uint8_t bcd2bin(uint8_t x)
-{
-    return ((x) & 0x0f) + ((x) >> 4) * 10;
-}
-
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
 {
     QI2CDevice *i2cdev = (QI2CDevice *)obj;
@@ -39,9 +35,9 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     i2c_read_block(i2cdev, 0, resp, sizeof(resp));
 
     /* check retrieved time against local time */
-    g_assert_cmpuint(bcd2bin(resp[4]), == , tm_ptr->tm_mday);
-    g_assert_cmpuint(bcd2bin(resp[5]), == , 1 + tm_ptr->tm_mon);
-    g_assert_cmpuint(2000 + bcd2bin(resp[6]), == , 1900 + tm_ptr->tm_year);
+    g_assert_cmpuint(from_bcd(resp[4]), == , tm_ptr->tm_mday);
+    g_assert_cmpuint(from_bcd(resp[5]), == , 1 + tm_ptr->tm_mon);
+    g_assert_cmpuint(2000 + from_bcd(resp[6]), == , 1900 + tm_ptr->tm_year);
 }
 
 static void ds1338_register_nodes(void)
-- 
2.51.1.dirty


