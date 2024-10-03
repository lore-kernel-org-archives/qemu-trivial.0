Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swMuU-0001dn-81
	for mharc-qemu-trivial@gnu.org; Thu, 03 Oct 2024 10:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMuR-0001Wh-Kp
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 10:34:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMu4-0005Xd-PN
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 10:34:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso13437005e9.2
 for <qemu-trivial@nongnu.org>; Thu, 03 Oct 2024 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727966043; x=1728570843; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UIRX407hgwnjoisfCwDQ2w8aP49x/yvTbjNOX9wTl3E=;
 b=TkNE+wyLuWvcFblOMlDMZ0WaKl5JbACyp40yKaH8HhgKqNhqJHSTVeBcKbBXHh/LAB
 5skHg5z3zUDZHyALiibGu6wsgpjWOHDttU0VYfhJ9mgMhmrdEx3UPUKOTOI9nevGGqAk
 0eht8hBxBpgw8SvqqGBJ/4HfrXLtA0Zq4S9+5s1HAwqnpBsNoTpu6+0HZVwbUJefmp7D
 5O6Kaeqt5qDORd64XFm648GFPoXu5tvbtUx+O0nArPa8RryTpwAlO2Idhh+VzdTrjqBI
 0oUzcbxUEJc8RbLbRHv9e+XRMW1/8OPU+Wq2X0wBMzQtUHFNjGduMWWWE6qKP2j0G/0Q
 Uljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727966043; x=1728570843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIRX407hgwnjoisfCwDQ2w8aP49x/yvTbjNOX9wTl3E=;
 b=UXOgIXrVqbosU1NvA20XyhzVqpk66Os8wvHYCrAQr4VpaJMT5LshQJLpZP/dP1uYgD
 FqVa/7QjzmBWcOP9MPmY27wo9EtTC9NOD3B0E/6pUhNaDRh7j5Vl/YgqSLSz9X3p5sCR
 2m0zYlIYfKEvmuBrQdUI3Z/x6J/Rc4zUIfRh2RjG1EYd80gkxhFDF/IvBpUVEJFo0azj
 /S79QO31zMv4AsUSg6Jty8G1g5QhiEbzcgB1FEBtgHoZNItVx9gx+3uKrqJDAN+esPKj
 XrZLgQOuh8sXQsuzPNCdv58NC2OUjNWRE5F5Vau8/wTcNPTTOTmsDipFNbyw0c6vkyn4
 nNbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa5oLOrEGOHQiDXakDjccXiC3Rkis/wLZ67EYwpr4h20LP8jdsGx7W3AWkn+bqubddpVRYk/BWa9hx6pw=@nongnu.org
X-Gm-Message-State: AOJu0YxDM1mIDpi6ODupnMv2f6jiRXM2PJp454A9vcvslgRQ8WGJ0HTl
 pjmMsbDxDtVVFAKWVJ21OoaJIPbdEwlJNHNfMp0pc0j8l1RYCLFaOlRZCXZCvGs=
X-Google-Smtp-Source: AGHT+IH5Oab/LMrXmkgKAmiBX/RJxfN/EnTesdfRW7PHSph6xQVoiEOu7INodxafGdGtJ8vpQ1fVcA==
X-Received: by 2002:a05:600c:1d88:b0:42c:a387:6a6f with SMTP id
 5b1f17b1804b1-42f777c365fmr61672515e9.20.1727966043067; 
 Thu, 03 Oct 2024 07:34:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f802a01fesm16925865e9.32.2024.10.03.07.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:34:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] docs/devel: Mention post_load hook restrictions where we
 document the hook
Date: Thu,  3 Oct 2024 15:34:01 +0100
Message-Id: <20241003143401.1676548-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Thu, 03 Oct 2024 14:34:28 -0000

Accessing another device in a post_load hook is a bad idea, because
the order of device save/restore is not fixed, and so this
cross-device access makes the save/restore non-deterministic.

We previously only flagged up this requirement in the
record-and-replay developer docs; repeat it in the main migration
documentation, where a developer trying to implement a post_load hook
is more likely to see it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This came up in an IRC discussion.

 docs/devel/migration/main.rst | 6 ++++++
 docs/devel/replay.rst         | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/docs/devel/migration/main.rst b/docs/devel/migration/main.rst
index 784c899dca6..c2857fc2446 100644
--- a/docs/devel/migration/main.rst
+++ b/docs/devel/migration/main.rst
@@ -465,6 +465,12 @@ Examples of such API functions are:
   - portio_list_set_address()
   - portio_list_set_enabled()
 
+Since the order of device save/restore is not defined, you must
+avoid accessing or changing any other device's state in one of these
+callbacks. (For instance, don't do anything that calls ``update_irq()``
+in a ``post_load`` hook.) Otherwise, restore will not be deterministic,
+and this will break execution record/replay.
+
 Iterative device migration
 --------------------------
 
diff --git a/docs/devel/replay.rst b/docs/devel/replay.rst
index effd856f0c6..40f58d9d4fc 100644
--- a/docs/devel/replay.rst
+++ b/docs/devel/replay.rst
@@ -202,6 +202,9 @@ into the log.
 Saving/restoring the VM state
 -----------------------------
 
+Record/replay relies on VM state save and restore being complete and
+deterministic.
+
 All fields in the device state structure (including virtual timers)
 should be restored by loadvm to the same values they had before savevm.
 
-- 
2.34.1


