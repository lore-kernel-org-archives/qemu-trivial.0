Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE52CA5FF5
	for <qemu-trivial@archiver.kernel.org>; Mon,  5 Oct 2026 21:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xDqbW-0006zM-3O; Mon, 05 Oct 2026 17:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yundi.eric.xu@gmail.com>)
 id 1xDpmV-0001sg-Gr
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2026 16:59:31 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yundi.eric.xu@gmail.com>)
 id 1xDpmU-0007Zf-00
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2026 16:59:31 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-92ed3993c1eso131925685a.1
 for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2026 13:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791233969; x=1791838769; darn=nongnu.org;
 h=content-transfer-encoding:content-type:content-language:cc:to
 :subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kOIV1zUG+2y+LCYyabP7QEGAPX4iveRbB6Db8e+t6T4=;
 b=VMPHkHTQgcs9e1HZdB+0xwPt5qUPlwL3NI9/GMYYhVmaCKMSbMSyuJLqZpcqbsdAyM
 y8AjNTVH6DAIaXglBPISO/84bFX8zRAuLGFyYhkwDLk2cj6pen1eheHWd3zfZ0px1yrl
 ZJYdq0nIUPGXFj47YdBZNPpgBSd/peI2lMGUbcyTe59iN2CN8KzdCWOb0xnYuyZlkjFv
 eoNjs7JkxGMqirT9rWxVN/MiAqCWk7v2H54C/lHg9Uvz5OCbm+7bYKFEktZ5Og4V0pii
 eQ5v5R+W2Ibztg9bOIU7SbP5rSRvL8ns5PKZt52uQTYCTVnnXaIG07Z7+W4ZdRi2sx2Y
 cBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791233969; x=1791838769;
 h=content-transfer-encoding:content-type:content-language:cc:to
 :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kOIV1zUG+2y+LCYyabP7QEGAPX4iveRbB6Db8e+t6T4=;
 b=QzbFlE09gM1+92izopw518ZhsbgPQj2u90x8qg7Nsf08Od6089sSFvWC2C+QI8a5vi
 E+EfSs4k/eJIqxLsobZm+dlFJ2V4wdpAHpcEZi95vTtmkqES8Cm0UihZ/t836TIdxM8e
 ejHih4u/ny1sqzo2xFVS5gm0mJBSEfYzTLfmubmzJ4jXsrtqsZsxwDa0KVhQvlSY9xES
 FHUhsyEoeq/fwOCFZ40M7pNWx6cXlhNtssMko3h1L81uLOCI2l16WO+KHfaFiSuJy/b4
 mBheuCTEoGUeRmlVw+2qfg6qPdTW0Z2C5K6bfBSsZ2ZGTdw15VOx09xPSM5GErovuwKz
 W1xg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfllLKRuavO7T/PIxjqOXaVoSfFXjxVYi5R4vnRMz2gOfCvPBtKt3+94e+8yOQJRUtXzvxEeAyOlUKsgk=@nongnu.org
X-Gm-Message-State: AFuF++nhyX3C1TF1bC2/MSYGKZ3wvQ8QScrxzf1/uQt8ORu1rcazr2YL
 n/W8v2pxKreoF/mEMmuEzolRs9oftg5Q37B8+UgVlyAJ5o/3JMvEIKAv
X-Gm-Gg: AYBFou0n+H5GbkIDANsE4rvNgasK1bEuVdOqrvvsQ/9cRUHdxOPWvzvxMDGYxvayszk
 PrjeclnA1cxFvFm//XfvPTiONMS9sAaQOluoSQpJolyawexcxcsEy2Zkh8VWN+0+f4au9ItZjwr
 JCQtZuF8uhqKYvbv7B3Z727Pq9I5STHNqIUG33ahotMzmCTV/saLUmFtwMsdw9vmfbAQMTMTj3J
 lS9RL4aCBt2iqP4Dxbc3g66AXokyDkJ1vWCmdghH9wq4NiidT+skF+L2cBI3ocxhr4H8M7kCECJ
 DkXfdgbT+XaED/cmzp11KNFWyjvQ9OaYLLCAQJyfZUpfNHxTOf5sjZkAncVOvXJ3zjAj3+ENy4m
 LtiKhEfYB0bmkPEzRC48W9gJLyui66Mm0FxiR0dxNaUVUbslT9RCP/U4yJF0dK+bNLQP2Ovpsf0
 CQrtYXODhxDprqWIMDH3d32PMr4Nra845LElADHpf5bkU/Ac6y6wlrT0GM71XSUAlY9dd/qS3oL
 6dNjesI6O2TTKrn4OzBrDMCkvZQUzdZa1zJQ2ot3YvAUjPlXfPAM6LSTS27DN06j9AJDiaB7dHj
 o4OdHQmFnMnBPqta/M9NUQ==
X-Received: by 2002:a05:620a:2626:b0:93c:c4b9:9b12 with SMTP id
 af79cd13be357-93e50e4a6d3mr1335716485a.4.1791233968642; 
 Mon, 05 Oct 2026 13:59:28 -0700 (PDT)
Received: from [192.168.20.246]
 (host-183-232.ilcmi2.champaign.il.us.clients.pavlovmedia.net.
 [66.253.183.232]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93cca21d8fcsm978835085a.26.2026.10.05.13.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 13:59:28 -0700 (PDT)
Message-ID: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
Date: Mon, 5 Oct 2026 15:59:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yundi Xu <yundi.eric.xu@gmail.com>
Subject: [PATCH] hw/display/apple: Fix obsolete PGDevice function
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-trivial@nongnu.org,
 Yundi Xu <yundi.eric.xu@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=yundi.eric.xu@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Oct 2026 17:52:12 -0400
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

PGNewDeviceWithDescriptor is obsolete. Replace with
PGCreateDeviceWIthDescriptor.

Signed-off-by: Yundi Xu<yundi.eric.xu@gmail.com>
---
  hw/display/apple-gfx.m | 17 +++++++++++++++++
  1 file changed, 17 insertions(+)

diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index be0061b9db..e730909c7e 100644
--- a/hw/display/apple-gfx.m
+++ b/hw/display/apple-gfx.m
@@ -767,7 +767,24 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
  
      s->cursor_show = true;
  
+    /*
+     * PGNewDeviceWithDescriptor() was deprecated in macOS 15.2 and removed
+     * in 27.0.
+     *
+     * It is replaced by PGCreateDeviceWithDescriptor(), which is available in
+     * >=15.2
+     */
+#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 270000
+    s->pgdev = PGCreateDeviceWithDescriptor(desc);
+#elif __MAC_OS_X_VERSION_MAX_ALLOWED >= 150200
+    if (@available(macOS 15.2, *)) {
+        s->pgdev = PGCreateDeviceWithDescriptor(desc);
+    } else {
+        s->pgdev = PGNewDeviceWithDescriptor(desc);
+    }
+#else /* (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200) */
      s->pgdev = PGNewDeviceWithDescriptor(desc);
+#endif /* (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200) */
  
      disp_desc = apple_gfx_prepare_display_descriptor(s);
      /*

---
base-commit: f7ada39edacaa5c26b30e98b94017b0b2ccbcf94
change-id: 20261001-fix-pgcreatedevicewithdescriptor-3ec303c2500a

Best regards,
--
Yundi Xu<yundi.eric.xu@gmail.com>


