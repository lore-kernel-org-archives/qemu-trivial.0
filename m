Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qbpZi-0008Lz-Ah
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2023 17:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3eePwZAsKDDIQcZhcbZSkWgUccUZS.QcaeSai-hfWjWOZbcbUbi.cfU@flex--coltonlewis.bounces.google.com>)
 id 1qbmuw-0000LB-I7
 for qemu-trivial@nongnu.org; Thu, 31 Aug 2023 15:01:22 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3eePwZAsKDDIQcZhcbZSkWgUccUZS.QcaeSai-hfWjWOZbcbUbi.cfU@flex--coltonlewis.bounces.google.com>)
 id 1qbmur-0007CD-5y
 for qemu-trivial@nongnu.org; Thu, 31 Aug 2023 15:01:20 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d7493fcd829so951544276.3
 for <qemu-trivial@nongnu.org>; Thu, 31 Aug 2023 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693508473; x=1694113273; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=w6Yyv6ujwYagqpF1MJSJZ41XD5zmN9Sx2XGwawvqoDw=;
 b=I1uMVX3xT9y++A0jPNmoj45DVODdFg+kKtnDe1mnULEs54vu/fuDamfxLrsaGAjYsz
 Hg5JURC0FujBbnwfut9dS/NX+k6QZMvpx61r1m3Vc3oTtVLBk4XDgSI4GZGl772fuJfT
 ttCssU+6rYBA3v9Sq1bWG1Mr1vVZsblw6p1CeFzTkCg2x55Trjx5bunTaYYlsV+nc+w0
 rkm+QnzhTsS4sv/2AoRsPh3RcZXCxnpppC8fX6sMxSguHE3XEgQHLKUFk5+PQtv83/RB
 eym0pPIE+bVVk1XlFGCKs7h+2p1nZHiW9cP0fKKBoqRa9ixp4i4G/h/gYIxMuODP7rMk
 +hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693508473; x=1694113273;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w6Yyv6ujwYagqpF1MJSJZ41XD5zmN9Sx2XGwawvqoDw=;
 b=E45O9QgIWQf1jYeSBkM9QoDLfqGdolxFPo654NQhhH1h5bYYujrjKSoBt+zw3Jcpuj
 pOxSoSJmkB2uA4iDaiR5sB8f46Hf7fLPq0fgljxs/zmuKVtMqK71SZ1GlkpUYQikiL8B
 nZDM6tPwTam0dsD+9QmIjJ7k+tOUlk553UJhbR0XlYfLPKv8yXDm9o3J2uWFyrXVV1VQ
 mVD4pRAX1ADlEKz099t4bc6P/3LfrLL09fYbgs7GltBpbof0wZwNL2OcnY7iQGY9Z2bF
 S0KJfQm8oWKgeyT1YRA6MRkdu1u+AzV4wJREfSKbNjSpKHbEbyzQgrXdYDErwqBAsVE8
 SlNw==
X-Gm-Message-State: AOJu0Yzk1L6L1pWJanz2XkBqigOoVPCP/4zIWi8+joxdx0hfmudiThUl
 tSWqzXZlBF6RjwGct2oVAcZYXj+JsAnStlQrqQ==
X-Google-Smtp-Source: AGHT+IFrm46z1+VKEBXajhS2fuBCkEVRUtADiWBUaJPEsNV5LP51XsSIh3ik+2gqnsiJ8Ue1OyrqzsGWmZectdqWXA==
X-Received: from coltonlewis-kvm.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:11c9:b0:d20:7752:e384 with
 SMTP id n9-20020a05690211c900b00d207752e384mr16197ybu.3.1693508473694; Thu,
 31 Aug 2023 12:01:13 -0700 (PDT)
Date: Thu, 31 Aug 2023 19:00:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230831190052.129045-1-coltonlewis@google.com>
Subject: [PATCH] arm64: Restore trapless ptimer access
From: Colton Lewis <coltonlewis@google.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>,
 qemu-trivial@nongnu.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3eePwZAsKDDIQcZhcbZSkWgUccUZS.QcaeSai-hfWjWOZbcbUbi.cfU@flex--coltonlewis.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 31 Aug 2023 17:51:37 -0400
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
X-List-Received-Date: Thu, 31 Aug 2023 19:01:23 -0000

Due to recent KVM changes, QEMU is setting a ptimer offset resulting
in unintended trap and emulate access and a consequent performance
hit. Filter out the PTIMER_CNT register to restore trapless ptimer
access.

Quoting Andrew Jones:

Simply reading the CNT register and writing back the same value is
enough to set an offset, since the timer will have certainly moved
past whatever value was read by the time it's written.  QEMU
frequently saves and restores all registers in the get-reg-list array,
unless they've been explicitly filtered out (with Linux commit
680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
restore trapless ptimer accesses, we need a QEMU patch to filter out
the register.

See
https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
for additional context.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4d904a1d11..2dd46e0a99 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
  */
 static const CPRegStateLevel non_runtime_cpregs[] = {
     { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
+    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
 };
 
 int kvm_arm_cpreg_level(uint64_t regidx)
-- 
2.42.0.283.g2d96d420d3-goog


