Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uFcfa-00012D-V8
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2025 13:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFcfS-0000zk-Hq
 for qemu-trivial@nongnu.org; Thu, 15 May 2025 13:46:50 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFcfQ-0004fI-Lx
 for qemu-trivial@nongnu.org; Thu, 15 May 2025 13:46:50 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7423df563d6so1421126b3a.0
 for <qemu-trivial@nongnu.org>; Thu, 15 May 2025 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747331207; x=1747936007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rVsacexuhDTK9h99dudm/8TY6NWVjrdnKMHqsB0i42Y=;
 b=i+7WG0pPC744b8+dGfj4xN+sRj18wcHeTFCmHXnTvZ+HZIqr4Uz4UFOCywiISldzZJ
 +08SS6yBK+kGgcIfF8w/TIm06cwYCB017Vms1HdeCoktLHDtDMH/owVaBc8+LS3hEv1N
 oP8Y5foLU3cN/bFZlzYoH+oSHLMJb5V6/CHwSFylImzovcd3SfVtjcQrLGd86jt0T1Ja
 BsBSay5Pw1Qe88rFZd3zDyk0Lb+herXRa6XRgDI9f8qqeTvbBGVdUB7PDB2gDleUmwct
 gx3VjtsKm8qfK0zyhc7uCNmDrrgcT7aRSYmhA0iJzYnfCzDjB5qA60AcDnkg6i8bEVRY
 idSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747331207; x=1747936007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rVsacexuhDTK9h99dudm/8TY6NWVjrdnKMHqsB0i42Y=;
 b=gsPC0gqerp5/8IudslqGcel3v+px8ekeFk9BARgbD2W62hQrUk88hWgWONC3AGS9U0
 a7gUMsPStN9sLCYDiYgfygoTAuQNM+k4Y6/s82lrY8D5v3UHlfPlPzdURXjFpEyddo0f
 oZVhmASzCOeFDdPrrVuydFpLheFRMoynEWMJDxUgsykDt2kJ/lTxQLO9kkhNZ19ZFJc7
 iEY9J0FZZddgRR5VIy8XD3U1k9i0e+G3f7xtb3efdTBgmZPYZ0+TPiBDcOZnize9HuAK
 w8+V+8up38aQ2mLMNE2KZrDNFDUIfpMwqq1pliX/c+HdMQUNkPcs8jHf6VhAYwyG2fYk
 Kfbg==
X-Gm-Message-State: AOJu0Yz7ZxR1/VdYDp4fkrv+IYwobzHP0mAYryEk4SjfR+bJmY4YA0G0
 /lS0RzDcsnVnLvv2NjSH+m/j9gjRTABhfbKUwEIZzb0Dlw8ZFXk8GRSbKsVxZIbX+c3jS5jOxSg
 16wpE
X-Gm-Gg: ASbGncudaP4twzdEmWmhlHBauMd6ZXobD+Xq957oZEYmrxemOyIc4Vtho21plJ7Oya1
 LWLVYNcYYPqRL/HGc4jX0s0FW9vtTLVr90TxJso9IE0KCdSjyC9oeAr1fUzgVQi2QgPO1GykOti
 iw8NJwvA+HlLdRyYGF80Q14R2UtIa4NkJy9yw3didzeoq2dhuCJaQEauXszG53Yxjj9+9DusxrI
 vc0BpsolGTnPqUaKIaC3VKcYcuknVaQVM3Inyd+7m7V2ZvoK7ojiI8vdtMwpIghXIJx19fIRu+r
 GPc4+OuXMwqvJIykOkBheLixL85+xvgtamumW+P4wTbRxVGfBDA=
X-Google-Smtp-Source: AGHT+IEAYa2bH9UaWLLfI4vADebdaLPcMS2f4ELCGRWN3SnZr75CjPCYFWxaR9waE0NhVC1Ftu6C0g==
X-Received: by 2002:a05:6a00:856:b0:73f:ff25:90b3 with SMTP id
 d2e1a72fcca58-742a98b7f48mr367356b3a.24.1747331206980; 
 Thu, 15 May 2025 10:46:46 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf8e05fsm172370a12.39.2025.05.15.10.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 10:46:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, npiggin@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] system/main: comment lock rationale
Date: Thu, 15 May 2025 10:46:41 -0700
Message-ID: <20250515174641.4000309-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Thu, 15 May 2025 17:46:50 -0000

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/system/main.c b/system/main.c
index 1c022067349..b8f7157cc34 100644
--- a/system/main.c
+++ b/system/main.c
@@ -69,8 +69,21 @@ int (*qemu_main)(void) = os_darwin_cfrunloop_main;
 int main(int argc, char **argv)
 {
     qemu_init(argc, argv);
+
+    /*
+     * qemu_init acquires the BQL and replay mutex lock. BQL is acquired when
+     * initializing cpus, to block associated threads until initialization is
+     * complete. Replay_mutex lock is acquired on initialization, because it
+     * must be held when configuring icount_mode.
+     *
+     * On MacOS, qemu main event loop runs in a background thread, as main
+     * thread must be reserved for UI. Thus, we need to transfer lock ownership,
+     * and the simplest way to do that is to release them, and reacquire them
+     * from qemu_default_main.
+     */
     bql_unlock();
     replay_mutex_unlock();
+
     if (qemu_main) {
         QemuThread main_loop_thread;
         qemu_thread_create(&main_loop_thread, "qemu_main",
-- 
2.47.2


