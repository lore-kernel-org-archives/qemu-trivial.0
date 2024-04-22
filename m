Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryrlD-0001Y0-Bi
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2024 07:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ryrl6-0001TR-UE
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 07:22:53 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ryrl4-00074K-7k
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 07:22:52 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so3871675e87.1
 for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2024 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713784968; x=1714389768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcGB7AVbotcMxmI4ZLawBRUBeDiwK/Ghj12lwMkTPi8=;
 b=NVwW5k++2tvXMc4ku6oLxea1FqVPDMzjlSBJKPyTJ5lIh6hya4tzDR8yS9OC6cdyEL
 io+4BjmEkysN02+PYwvbPe92V0VTwiTmeh9Zp6qj0J820UfdBA3d+Kb65uA3QNFLZEpb
 tb1SSinOYOnPYtWnOlHuhBD6P292eexbxio0AqK9mHfBrPs+5fPvxh/k6POqPtHG0LD5
 JSBBuxhq0kjjwwFjc+zTm9UZUTAqbiOZVGK2rXFO2sS93uKflUSgluCL3s3xWdDLf006
 aadWWXHXr5gT0AOk9dVhi6CYM1qlrBzeLiBRtjeP4aZutb/h5dBZVetIrD7uDwcs+yFq
 6JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713784968; x=1714389768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcGB7AVbotcMxmI4ZLawBRUBeDiwK/Ghj12lwMkTPi8=;
 b=IMrlW/Bhy2qWixKhaQ5wDiXR1lccqB6fInnSFt/MLVdKeKwLiLwypi9Tj09LZBr3+j
 jPIRkJTLwX8u0+Dgm/e+vcQkqA4ufCRu36tivgvr6na3F0Mdu/Bo9fSrC2e7OT6mONEF
 jdNm/bNXFHygl3DMYNo7OWtC+8qsfz2LaaHYxnMkKyYnsQC466B5rSLy/scAp3Xca9TW
 FvTE/+n9HTq0VkjRWN2Y1pKbUchvh42AbDL5zfp89PGlsKqRE6cEqc9/TiO1AXTBp1dS
 gBKi74sof4XfFz9kFUynPpD9wgKcgKVlYjuwiruoio3OFijz2iCBUKn1vIYct7Wl4aU5
 eZcg==
X-Gm-Message-State: AOJu0Yy62ND34C+JRKOi8xskqfz3J9MT84K85lJpjHQ3m0ECwKvLbSra
 cRTN35TFNrXSUxw5yVzjU1K7mk9LTS2HSfT8u/bPZzI2FcStpakcgFJCCSKzaZU=
X-Google-Smtp-Source: AGHT+IFFI27TJaHZXHu0GwORSa4xa5Jd+mYvKWqp+VGWcjf8pG9NrTAFMxNwiVi+HpxEWekM6+O4XQ==
X-Received: by 2002:a05:6512:908:b0:516:9fe6:bc91 with SMTP id
 e8-20020a056512090800b005169fe6bc91mr5418100lft.25.1713784968077; 
 Mon, 22 Apr 2024 04:22:48 -0700 (PDT)
Received: from m1.home (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c510e00b00419f572671dsm7983172wms.20.2024.04.22.04.22.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Apr 2024 04:22:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] tests/unit: Remove debug statements in
 test-nested-aio-poll.c
Date: Mon, 22 Apr 2024 13:22:46 +0200
Message-ID: <20240422112246.83812-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 22 Apr 2024 11:22:54 -0000

We have been running this test for almost a year; it
is safe to remove its debug statements, which clutter
CI jobs output:

  ▶  88/100 /nested-aio-poll                      OK
  io_read 0x16bb26158
  io_poll_true 0x16bb26158
  > io_poll_ready
  io_read 0x16bb26164
  < io_poll_ready
  io_poll_true 0x16bb26158
  io_poll_false 0x16bb26164
  > io_poll_ready
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_poll_false 0x16bb26164
  io_read 0x16bb26164
  < io_poll_ready
  88/100 qemu:unit / test-nested-aio-poll        OK

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-nested-aio-poll.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/unit/test-nested-aio-poll.c b/tests/unit/test-nested-aio-poll.c
index db33742af3..d8fd92c43b 100644
--- a/tests/unit/test-nested-aio-poll.c
+++ b/tests/unit/test-nested-aio-poll.c
@@ -30,19 +30,16 @@ typedef struct {
 
 static void io_read(EventNotifier *notifier)
 {
-    fprintf(stderr, "%s %p\n", __func__, notifier);
     event_notifier_test_and_clear(notifier);
 }
 
 static bool io_poll_true(void *opaque)
 {
-    fprintf(stderr, "%s %p\n", __func__, opaque);
     return true;
 }
 
 static bool io_poll_false(void *opaque)
 {
-    fprintf(stderr, "%s %p\n", __func__, opaque);
     return false;
 }
 
@@ -50,8 +47,6 @@ static void io_poll_ready(EventNotifier *notifier)
 {
     TestData *td = container_of(notifier, TestData, poll_notifier);
 
-    fprintf(stderr, "> %s\n", __func__);
-
     g_assert(!td->nested);
     td->nested = true;
 
@@ -62,8 +57,6 @@ static void io_poll_ready(EventNotifier *notifier)
     g_assert(aio_poll(td->ctx, true));
 
     td->nested = false;
-
-    fprintf(stderr, "< %s\n", __func__);
 }
 
 /* dummy_notifier never triggers */
-- 
2.41.0


