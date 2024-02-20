Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsa-0000RR-6m
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsZ-0000Q7-4Z
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:31 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsW-0008Ek-3W
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:30 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so5298280a12.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419205; x=1709024005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oYRntaNNMgPCCT0SX7UleETmeevTDso1L5CoXCo2/4=;
 b=YdmdMeXFVFsik+IorgnDv1Rfftp5D1jHNwHI+T0DElK5He75N+DihWNTfVvMyNHaP7
 k+5oj/64mIS4Kd+Ym6q7qbvC4qV6SwZQoYf6sGQrT7qsArJ6YnH5JvvfFqhvzPCvvWic
 F7573fOQG6Q8PhYnvvgtg2jafdaxPZm94rRt5dOP5++oqBZ4kTwAOHylrPLuEX1NLI5a
 gz13NLl4Q6393iBC/jeY2fyBvuW0ZajLjaVJRDOFkbykkVvQkZ17YeSmhRlsjjkmmfkf
 F1lvVO7ivSoOErTxMQFynxQ8g9ScnaqL3dMC0lyl5wAbrrztA5HQh+U/QAtlRgU+HpQT
 iAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419205; x=1709024005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7oYRntaNNMgPCCT0SX7UleETmeevTDso1L5CoXCo2/4=;
 b=GuvdjZRyepTUR0rTJq1Ay92DUrp2XpCnii82E8YX2H11wNAyd+R5IplNIAuoeevumD
 Pt4O6DCBrXOzzBihBjkb+lE0BZLo3Hqo15rjM8t6cATMzCPc6k2s0b+ZlMHvKxiPEF02
 86cLgjl9L78JOWp7yYs6eJ50lh+srDNfThX7sQc1GpmizvYOf4AbsG9X8JaYkjW5AhwC
 OdRpTFPr4X8mf00mrLWDxxTeyuKPdnLNlgoo5V95UgRj5s0csyH6XHRksIkqcouA/4rZ
 5VHxJQ8pi3Jlu4CNuG+xiOR5NhCc7eZax9bP7ZnqVH/6UmUvfGDB6Nb3U9S+/4rQqd/r
 fmvQ==
X-Gm-Message-State: AOJu0YxNg3YYiYFq70qSct+bCn79Ehk25XQ2DEXLsWwxhwZa+GtO9uk3
 bD46n+ubZxdHg6xo9Km7cCdDUNaVzm0ZT2vU2xZpO97IGWdMp7S1hCT6ag9b+ABvKC8GuyoTWut
 ZQ40=
X-Google-Smtp-Source: AGHT+IF8Ry0+Beac6Sx8cCpRJ1SkbxslngVsRNPeqT9w56ggTuQWHIkBuMu0GrqaICsOmH09ZkIb5w==
X-Received: by 2002:a17:906:ae55:b0:a3e:ff4d:6302 with SMTP id
 lf21-20020a170906ae5500b00a3eff4d6302mr834173ejb.9.1708419205351; 
 Tue, 20 Feb 2024 00:53:25 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:25 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v1 14/21] pc-bios/README: correct typos
Date: Tue, 20 Feb 2024 10:52:21 +0200
Message-Id: <300815e3494a5f016137a09f331bc4137f1ed9ff.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:31 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 pc-bios/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/README b/pc-bios/README
index 4189bb28cc..b8a0210d24 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -67,7 +67,7 @@
   and enable the use of well-known bootloaders such as U-Boot.
   OpenSBI is distributed under the terms of the BSD 2-clause license
   ("Simplified BSD License" or "FreeBSD License", SPDX: BSD-2-Clause). OpenSBI
-  source code also contains code reused from other projects desribed here:
+  source code also contains code reused from other projects described here:
   https://github.com/riscv/opensbi/blob/master/ThirdPartyNotices.md.
 
 - npcm7xx_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for Nuvoton
-- 
γαῖα πυρί μιχθήτω


