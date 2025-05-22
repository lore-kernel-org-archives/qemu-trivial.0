Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uI4Bl-0008HN-2V
	for mharc-qemu-trivial@gnu.org; Thu, 22 May 2025 07:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uI4Be-0008E7-2q
 for qemu-trivial@nongnu.org; Thu, 22 May 2025 07:34:11 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uI4BY-0008K1-Hh
 for qemu-trivial@nongnu.org; Thu, 22 May 2025 07:34:09 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7c597760323so893379485a.3
 for <qemu-trivial@nongnu.org>; Thu, 22 May 2025 04:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747913641; x=1748518441; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pvtJvKwED2g/sZa1Pk53e57hJmDqDX/ksZLl4/V2mTo=;
 b=fa9nWotXASHcE/BB3lSkmxrgoDHp7wyE4wRgqk2Um99P2NvpCn2l2LS4JxVTbAaR1E
 RQZGsUgTExS+/qudrnQ0ZeBa4CNRma2qfPw4Rcuntlwgyuu9rQUJvD06R0/xDw0WmH8b
 aabQ+dkODmaV6tsQIYroL86Z1HTgJ6xCosemmHbLrZSN2dkt3ZXYTRtHPGaoMvkTE8lO
 fK7plEqY+6+OjU3+3asqmbICjsj+3YTg3x8N4B7BfWVkWoKVBZW+QpWGXam2GoodMzwq
 btK20KGy/kuk4RC6HhJk+eLWgeDe353oU82DOXBCw6bjZWLrKKy/oW/ZArA/7LDz827e
 YcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747913641; x=1748518441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvtJvKwED2g/sZa1Pk53e57hJmDqDX/ksZLl4/V2mTo=;
 b=V3vKdYaAkUUFl3YjyaqHosOydmGf+Q3ZbKMvBLUF5hVGk2uVTAJ84gNVM2bJ7kAYUe
 JOD8mMrDw+kj4qPQsBuZyLMiqipwlE1nGC1TSG3PmUL3869L+Nz/IGmQvfDUh7YEUaHx
 xcgnLIPfbbdwGUI7G+CeuFsmcnzzAwk19AP3+jh7rnLmahlgNgluZxT+qBgk5KSYPaXi
 oyxsCfBssPWLuPEMukdH0So/U4o38D/AuEvpm8UXPXz71MyRDMnADMCDWjSYWFppAM/Y
 Q4jOD7OaUkg3t1LTa331K1nw9o/kHFav5R7fYz3qj0JJ7FLEJL9njxTOKaF6hDYx1XLQ
 siHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfuCcnSqd841mafX7Ku3TkVsQVgU4vb3Ax3H+BtV7vbZENlwUWHDGx1/d0f/8qaAL7BVFTdQYch3lhe04=@nongnu.org
X-Gm-Message-State: AOJu0Yx/kZwKPBNxkN2JgdUIp5VexCgm3LSAuGPHBxAH0GMJFwNcrgxY
 YIIxnQQMNntAJGadH0xyxsXoqsTDUfzMVZnJiI/req6Fr6MVSKaEUuSSEwvG1TtiavaKK81b5iH
 GFAI7
X-Gm-Gg: ASbGncumJfQUuUtLvSali1V/rEccreRKVo+9v2Vhgl3v8YMcuMShrBsvKhErupim5LX
 gomh5QE9b8ebjVnL72A3a4qp9/HCKgWuSx+LScs3pVakvXcbj8HpyzRmkEHhXGOhArjiYzokALZ
 s9tt1StUmmyB8IdFPzC59V2jc6Pi0KamIc9XVZBDIepRp4XofDsZfcsaGDHrxok5vu+wGcjN9Ok
 DVvpUQWFgrtIexjmNI7VQXTR2UEDs0zqRlQViNqf0SQBN+9hfjaVjRrBzHhnASNmhgxMqdPW8j2
 yxTH70qZ853XG5rZ8+LNq+J+7zuLmONyoZVc1QtflLGj/s8/yLPDlSY=
X-Google-Smtp-Source: AGHT+IFo5+kejL+1q9pTU9z+PYylIyDVyGojvS6ukE9jY+rlX+f4ftGNkfHM4KjSbiiKIPQWGIQKrQ==
X-Received: by 2002:a05:6122:88c:b0:52a:cdd8:fc33 with SMTP id
 71dfb90a1353d-52dba614e02mr19310817e0c.0.1747913630748; 
 Thu, 22 May 2025 04:33:50 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:906e:57d5:dca2:1ab3:20de])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab6c0c2sm11514466e0c.42.2025.05.22.04.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 04:33:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] target/riscv/cpu.c: fix zama16b order in isa_edata_arr[]
Date: Thu, 22 May 2025 08:33:44 -0300
Message-ID: <20250522113344.823294-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72c.google.com
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
X-List-Received-Date: Thu, 22 May 2025 11:34:12 -0000

Put it after zalrsc and before zawrs.

Cc: qemu-trivial@nongnu.org
Fixes: a60ce58fd9 ("target/riscv: Support Zama16b extension")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 629ac37501..fe21e0fb44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,8 +127,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
     ISA_EXT_DATA_ENTRY(zabha, PRIV_VERSION_1_13_0, ext_zabha),
     ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
-    ISA_EXT_DATA_ENTRY(zama16b, PRIV_VERSION_1_13_0, ext_zama16b),
     ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
+    ISA_EXT_DATA_ENTRY(zama16b, PRIV_VERSION_1_13_0, ext_zama16b),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
-- 
2.49.0


