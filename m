Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAD0C87FD2
	for <qemu-trivial@archiver.kernel.org>; Mon, 11 Aug 2025 09:44:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ulP4O-0007Xe-2v; Mon, 11 Aug 2025 05:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulP4L-0007Wy-Ch
 for qemu-trivial@nongnu.org; Mon, 11 Aug 2025 05:43:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulP4F-0002tj-OJ
 for qemu-trivial@nongnu.org; Mon, 11 Aug 2025 05:43:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so2430949f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Aug 2025 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754905423; x=1755510223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DBszhYKDJyGQ61hGjyZwJt6B5WU1RFKrIu3tVde7pzY=;
 b=oQotGLm0qba885BDn38b9CmC33iXhoPbofkfzh7QFxVFXOHzD4LnU5GWqbCnAmId7U
 EJhaN7CPQ1rFGQUkYzSzz5bsEbjiRVPQmzfCBN9+gNdeV+2a8fDR2fxHbepKIlHhNYDL
 sbnrRg341hDhER2qiLRKnP6LX81M3Imhwp9C1uqVacMTobaieP8mcp4bzvw9xgh3kVdt
 OX5X2FoFr7+cHfYalpExyjeIxf3okdlOr01a7nYwMQljKzS79TYwlh3JET+oTGRYZjDC
 Dh1NMNvJehSiwLmhTVskS57YOYwTyxlCzF3z2BD1xOdmkIRIrzZgMwH6O8qxsM22+SLJ
 ogpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754905423; x=1755510223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DBszhYKDJyGQ61hGjyZwJt6B5WU1RFKrIu3tVde7pzY=;
 b=PAkoAoH2Og3Uvm1LtE5TRXvAs8MsOMyqsz/TbsBKapuuWy03olJ1EuqeFjmLEip+fQ
 jsjOs15npqWSkS/kmjjFGlqoFTigZ5xMw40vl76+toQtpg7uFZu8GfsgZq45FkGCimHn
 Imet0KxsIOeVqA+aLtQU/X+d/+nTZ0LM94fhGyN7q1b0HaCLiZxRFhlAlKx2TbFSq43t
 787FEiAtlDBz0m6+/JqmM2QLJ9I/WHw8Plfh9rDtRwLz6Bdp3ygCEm5xrSNTjUtxhus+
 UON2gcofT2yMHgYHVJ+gcUjw9fsYR+y9au7TyFEUHGn2t7RAbJkmAwnXgTyre5S9vNFZ
 J9AA==
X-Gm-Message-State: AOJu0YzuRCpjyN76oI7jsCIi4v/DH5kdjv8XWNxfQNKiKumOHQUWNnFT
 8m6MqPTt+qmGZ/Tyc4p6BtJFpFnWnTpUx9PQqhVX4mKQZhjwfGzbFfLqiDqco4VIblg=
X-Gm-Gg: ASbGnct2odjE/TLCSSG1q7Lu7Dd5QkEIvu226LDp60ltkKwTYXameB/wT/2LTnOsnws
 4NkqmJt+MZHkC2Xk42amWmLN4wQjGd/PIoMYttFJcX98FNRkKkIKL7Ssz91H9bkrpGdbUdot0vE
 /hf1qLPH44ehBYrQKEtxL7Q8xP4W9MvccfHrl82RCbm5OaVu+1Td/hScaDgtQerh8L7AewGl2Lt
 jUiyWswRWL9bVUm/1Hk5prc3jPpXTPhD6HC6za1e5Mbm5m1fL1z7HxVqix09XjdGjHhIkvuL7qT
 6hueVsZHlJ7CTJas0ZpVf2jMuTmJ49svu2i0duPxooYL6QH7bopsoAxGJu+AhimrbeygKXxMi9S
 h0fdmUAMChGLbplFiQu4GszaHkDmfvQbVfg1vQS9dUusc2by+PufS9jrG3Kv2Z6OTkpeS+BaX/5
 LInybIe4k=
X-Google-Smtp-Source: AGHT+IEEgI43zGiWMGmhqJr2+eJ2vkv6qQaOnhPa1LlXmpGoVArx7R4XRCC31dOSwc58VDg9RJhRkA==
X-Received: by 2002:a05:6000:1448:b0:3b7:9d87:97ad with SMTP id
 ffacd0b85a97d-3b900b735d4mr8606844f8f.37.1754905423106; 
 Mon, 11 Aug 2025 02:43:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b95f4sm39879714f8f.23.2025.08.11.02.43.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 02:43:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] scripts/coverity-scan/COMPONENTS.md: Add a 'plugins' category
Date: Mon, 11 Aug 2025 11:43:41 +0200
Message-ID: <20250811094341.91597-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Cover the TCG plugins files under their own Coverity category.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/coverity-scan/COMPONENTS.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 72995903ff9..95805b536bc 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -147,6 +147,9 @@ tcg
 system
   ~ .*/qemu(/system/.*|/accel/.*)
 
+plugins
+  ~ .*/qemu(/contrib|/tests/tcg)?/plugins/.*
+
 (headers)
   ~ .*/qemu(/include/.*)
 
-- 
2.49.0


