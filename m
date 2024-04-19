Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rxk4i-0000BS-T9
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2024 04:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxk4h-0000Au-Ln
 for qemu-trivial@nongnu.org; Fri, 19 Apr 2024 04:58:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxk4f-0000x4-V9
 for qemu-trivial@nongnu.org; Fri, 19 Apr 2024 04:58:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-418bbc690e1so15065275e9.2
 for <qemu-trivial@nongnu.org>; Fri, 19 Apr 2024 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713517103; x=1714121903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BKGnDSSkETE4kYg5rHuJqJW6r4gB+zCGK3fj66YrvhQ=;
 b=Zy0bHAt22Nu1nhFzRatLyZ2oYj+YCp5g4KF+C425E+gBoCsSK+Fb/CXd0VhVKu+o8r
 5+q1PWTzT/YwYZaEGkQyBawsv1wha6FrRY05lLLlX3SiRTixULUacQpOYk+z76bnmaRd
 HO76lGn/wBnFj6MuH9PsfQS8ZoTRQn05EniegjssdymCuoG+QCWDV8bBSYbFw4TSiruB
 yoSVxm8Vn0grrIlmQbq3nuO10ae0wcFRwxvMon6nxzmA9adzwX6FhodRNfofxNCdZOO1
 5DR+UzNoxoRDpEwIiaw9WswMBc17wQT9czO2V4lGwX1g96tUuMBpUADAyg+xdHl4tG7I
 Wisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713517103; x=1714121903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKGnDSSkETE4kYg5rHuJqJW6r4gB+zCGK3fj66YrvhQ=;
 b=dy1nbopjmU0pED209o+CaDsH/H9aB2GJQXGfMSQRnLJh/T5Ld2g6iOkvzg70CzWwAb
 IJbeFaHbZJoWDrIGGRwFc8/4sU2f0gXJheSBU9Z4rEHClDg0EKFC64G1SyrjxGWzfPYO
 2o27vfMvehXrlUN7Y7d0LNkRJGbDJNPcgV9+tyiT6qLWSttUor7uUQIzVQyXLGbFoUCM
 ick33tO94joA2PiU4mxZMwmxtgllU0K/ymA5xHBGRRqteNqA4i/Wdi+RU/vKm4E+RzIf
 XarcIO3Y25k0qJv/WYpCD/DW5Z8B2dlEyfHdLnHIRFm7/g4LqaleaAEitVMBY6e6bNpn
 Vcvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzRykIATWcqgsixobUrLbFtCd4m+L5O/gWZNZ5DdojPH5j4z5LqL1aEIESBZxT5B6xe7FyNAX920ELcbLgxJDG42WnzyfMcA==
X-Gm-Message-State: AOJu0Ywj+CSfHfDBfxiIAjoMSPTKnWWfcJTGoW4FJaTg36RcuPBHiR7x
 BE/WoVs/XkCrMQl2OrA1FTW8ZQKyTu56irY/cNePivnokR2c1h7iU/x+fKH6uaKgzAzeWmv7Kdh
 cRh0=
X-Google-Smtp-Source: AGHT+IHE5qTGHzxoM7dYmmCZgebYbEQvbGkNhwpoq5tXeR6JCDeLitZDsRb5RPq+Lx3epFiMpg1GiQ==
X-Received: by 2002:a05:600c:154f:b0:417:fbc2:caf8 with SMTP id
 f15-20020a05600c154f00b00417fbc2caf8mr965221wmg.23.1713517103161; 
 Fri, 19 Apr 2024 01:58:23 -0700 (PDT)
Received: from localhost.localdomain ([176.176.143.233])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c154700b004190d7126c0sm1248827wmg.38.2024.04.19.01.58.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Apr 2024 01:58:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tests/unit: Remove debug statements in test-nested-aio-poll.c
Date: Fri, 19 Apr 2024 10:58:19 +0200
Message-ID: <20240419085819.47606-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 19 Apr 2024 08:58:27 -0000

We are running this test since almost a year; it is
safe to remove its debug statements, which clutter
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


