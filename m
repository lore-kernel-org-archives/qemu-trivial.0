Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF03C5CFCF
	for <qemu-trivial@archiver.kernel.org>; Wed, 12 Aug 2026 13:49:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wu9Ko-0002T5-2D; Wed, 12 Aug 2026 09:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>) id 1wu74z-0006rD-4W
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2026 07:25:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <den@openvz.org>) id 1wu74w-0005fJ-3u
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2026 07:25:03 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-472326ca506so447493f8f.2
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2026 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz.org; s=google; t=1786533900; x=1787138700; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DQSkUcg1XDS9Ba2uGaX42dvSCDf/Me0rEMoUd/1hjq4=;
 b=LzbwvCnzU8vWqAUGWd2YKj01sH3GepPnrxtSbRNFccAJhV37m26aLhOcl84XBUH9Gu
 6nEYTogBteG8vCZ5uBqHKYwAV4eTm9eShYBhnWXiPFT20xEryxzGiUKAve76dueSy9/Y
 tpaM4I6GMcJKKmhr3KVJVyfiTpVrjUAhDiNHNx3XKFMdYux6UUFCTsepAzpAV7e8daBA
 NS1hyj80DE65uDOM0229Ymgvgi5tPjI0UYBmLQU3hu+jJeTYJqd9I/JJFVk8T85ROGV2
 N5t8xU3/w1cqb11F9hQrGuFVkSVnZPASkgjliOklapgngtuEOdMLYeeOVonQsGUGI031
 HNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786533900; x=1787138700;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DQSkUcg1XDS9Ba2uGaX42dvSCDf/Me0rEMoUd/1hjq4=;
 b=N5e9rHky+TPufv0BgaVy4YuSgJvnwag/qoa0tPy12NePhsjaWleNKFmRpUlLAAls/A
 6Mqw0F622+IZK0ar8Y9BbntCf2JT80H1OLeU0Yk4gAu2CUioTIZhIaW9JK2aib55RWKC
 bg/3keYyyEB6bELebC7HU7lBrMkVVcHkutC9bC7VBesRavCtqBTyWS57NiRL+HfzwsAe
 Fb9kXiRB2LdWH/r+UNdTG55zT0QU0L6GcXKkUiN/UYb+LtR8xh2Zc91g6tpsr/uIIEC2
 dZ4psjHKyS4cDF4dVc28fXMmUMZSHiASZcupLgPnldJTIVe2uvVsn/CdqXajOVMiZq+g
 22Mw==
X-Gm-Message-State: AOJu0Yxv15gTLe9XupgtUWTJ+y2HQtR3fKqVYgoNDqgI2qSIsTX0PNI+
 bFEnn7fs+nFxEKs1rntq/X4qvjipppUUgkyD4kI0R64Nsk6aWBJOpcJevWljqfiw5zE=
X-Gm-Gg: AR+sD13zNTkZGY5TY0XjPwSlsFJcqyNZ4vw5u5sI0Xd1GU7k0VZJh1MqWjoJ5psCIi7
 bJiwPpwq+bMIBF5pcRYeM3k8SnHj2gh64jKQKkyZdD9bbx+thJ/G9WCXNo29vAPKyiYXmtRTCHy
 3H7GagL20RENXtCk3PrCZVrm1DvB+IVpYtxLpVwf0Z7QVzH/ZOSPrOBIRq0TVa83pK1X8xkU4FN
 ximMyod1m/fG3z+QgbPRRqBN9AMMrUdrQSKoa3wCZyTohtrbuSyo5oIuZxjKAmd3auruHEm+lNF
 TQ2+nyDkH5hwnkQGMWUbcnhy2kHvkt6Qbm98tCY9tAaZ13B5y1dBTUhMDnUx0KsvsKT1DBMFZAq
 sUnq9qdmUCbqLTEVJhvhdfGA4l4EnjbMCm6E8MnEOXWslA2hjzxJt7N11wI0er/8lYquc7HRj3y
 eazx7Xm2NzvXPMZxAUDcXkej3ubRKNAobIJeYNlj+chG0x+j/9HaX+WcbNkg==
X-Received: by 2002:a05:6000:2890:b0:477:47c6:36e5 with SMTP id
 ffacd0b85a97d-48152c784eamr5157265f8f.25.1786533899567; 
 Wed, 12 Aug 2026 04:24:59 -0700 (PDT)
Received: from athena.sw.ru ([2a06:5b06:b600:300:89f2:ad10:d9bb:681e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e400sm7041627f8f.21.2026.08.12.04.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 04:24:59 -0700 (PDT)
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Denis V . Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] mailmap: map the last From-munged author back to a real
 identity
Date: Wed, 12 Aug 2026 13:24:56 +0200
Message-ID: <20260812112456.970371-1-den@openvz.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=den@openvz.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Aug 2026 09:49:32 -0400
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

qemu-block@nongnu.org rewrote the From: header of commit b67e353863
("block: drop force_dup parameter of raw_reconfigure_getfd()") for
DMARC reasons, so it landed in git attributed to the list instead of
to its author, whose real address is in the Signed-off-by trailer.
Map it like the other munged identities collected in that section.
This was the last one left unmapped, so 'git log --format="%aN"' no
longer reports any author 'via' a list.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
CC: Alex Bennée <alex.bennee@linaro.org>
CC: Eric Blake <eblake@redhat.com>
CC: Michael Tokarev <mjt@tls.msk.ru>
CC: Laurent Vivier <laurent@vivier.eu>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index e5dc644623..08f0fa9e11 100644
--- a/.mailmap
+++ b/.mailmap
@@ -68,6 +68,7 @@ Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-devel@nongnu.org>
 Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-trivial@nongnu.org>
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com> Andrey Drobyshev via <qemu-block@nongnu.org>
 BALATON Zoltan <balaton@eik.bme.hu> BALATON Zoltan via <qemu-ppc@nongnu.org>
+Denis V. Lunev <den@openvz.org> Denis V. Lunev via <qemu-block@nongnu.org>
 
 # Next, replace old addresses by a more recent one.
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> <akihiko.odaki@daynix.com>
-- 
2.53.0


