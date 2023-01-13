Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGQFb-0003dw-Ev
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jan 2023 15:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFV-0003bU-M7
 for qemu-trivial@nongnu.org; Fri, 13 Jan 2023 15:02:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFT-0006na-LK
 for qemu-trivial@nongnu.org; Fri, 13 Jan 2023 15:02:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id e3so12827273wru.13
 for <qemu-trivial@nongnu.org>; Fri, 13 Jan 2023 12:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
 b=yd4VADnGyYvVFjVhslN7ei4pR2/ws5LjuJs2oC+/TPQwbLiF5yqCT2x52JRaKi90YM
 vzWOlm0PglcWAc/1dFqVVsE/tFZXNvTRdIC9VUdoKdGJdVvRF7UPN3BXgTpBcjkQUKYi
 tFSJNfvsCbUXwyCgKriCu4ECgcVSgJjiOB6hGx5VAmp8tQptqZLHzssIXpf3ZyTSmuFA
 uIcPRyUBULU5vZqBRLckMXZ61riXRDVoHC+BBuBGDzSU07w0OXq8ug/Se6CcxNpUn+CD
 pGdnd/uQuvQ78L5358ClrXKo/lq3pyDDrMKZw3cv/pbQ80KkD3iTlHFZ5AF+Tpu+tdtW
 rwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
 b=tS1pCJrGnVEuQVNdoe18w1wCfZbfZpNwioGF2qLXL6tectM+fLHbUrZYgfdn+zZZwf
 Hijy22Rl4eczyd3FUQSCCDlBDVyhMbAiqH3Ug8QxjKOtt+Un4AlIfGqS5bv1vm10jxw9
 x6jxFaIc95M2wYZAG1WeYYeeiz8iW8vUaaa/Az/SYOGDyx8cQKheQoV/GLw4blMrxJg9
 CeNSpgWO2Px/pBxbK1NxyDx1/97WvVKW6DoP2uKOrKTbviRaMMD0kpN4ZtXsS9Q102EH
 hQ/QOmyJcoHDLetzgfSN1tzk7HNYSv3y/Wf7CMNYVNr4Ne1M+QlrN6Z/QBgUmeXz1KRm
 o9QQ==
X-Gm-Message-State: AFqh2kqRUUfup2MhAxCm+q5Fi5A+V/mxdJxHllBBKTv/ouP2hJQu2KO0
 Bf+4mp/BcKSH9lmxZpqxZxFf8w==
X-Google-Smtp-Source: AMrXdXuBIERP/Bw1eawhj9893t9imJZXn55wjrjHY+h7hvCDUlfjObxAF4hWxyJduBzxqZuuZ/FoKw==
X-Received: by 2002:a5d:530f:0:b0:2bb:dd87:3485 with SMTP id
 e15-20020a5d530f000000b002bbdd873485mr15258163wrv.30.1673640118403; 
 Fri, 13 Jan 2023 12:01:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adffbce000000b002bddd75a83fsm2591341wrs.8.2023.01.13.12.01.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:01:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/or-irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Fri, 13 Jan 2023 21:01:37 +0100
Message-Id: <20230113200138.52869-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 20:02:03 -0000

Missed during automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/or-irq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index f2f0a27381..131abc2e0c 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -37,8 +37,7 @@
 
 typedef struct OrIRQState qemu_or_irq;
 
-DECLARE_INSTANCE_CHECKER(qemu_or_irq, OR_IRQ,
-                         TYPE_OR_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
 
 struct OrIRQState {
     DeviceState parent_obj;
-- 
2.38.1


