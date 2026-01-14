Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECBD39013
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Jan 2026 21:33:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vg8UH-0008DY-Lt; Wed, 14 Jan 2026 16:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vg8Ty-000815-Dd
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 16:32:56 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vg8Tv-0004cc-V1
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 16:32:50 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8765b80a52so57130166b.2
 for <qemu-trivial@nongnu.org>; Wed, 14 Jan 2026 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768426366; x=1769031166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YDTcPZtVYw3MtG62eS7y+SIW0mtoLWrmocC3dD9mQTc=;
 b=i0MSUwh0LHqEj5gQWx8Xc+QfQNyGxhzCovFbmO1eOQOBDR5x1KDxPVRwvgtgkPeJmT
 eviSgMR4S4/XS8fl+66otN3io5fg89qMl9KMn7E51QZceyImKS76cTqjOxq/rwaZIw/9
 9Cv4yb2qI/fnrjD7ubKzrYmgAnm7IpFn9VF0hiJU1BnEpTORdPWugcX0sXgDQtKl9xuG
 FkZVy6s/Yp3QmtaurAUVaXnWR0vp7PZAOStU87YFxChn5RcsVaxqFaL+wYc7yzDS2F39
 Ody3s7qslGfBXKzTct0FYpiugDlBM8aqj/HoP8qy5ag9rTqJlOWrntsnKJgiVKSwCCaG
 +MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768426366; x=1769031166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YDTcPZtVYw3MtG62eS7y+SIW0mtoLWrmocC3dD9mQTc=;
 b=F7NH/XhXCKQwQkowx1LdDo8yfoWIWbXcO0dMhdPf2vU1Q0AVNhm/Ng7hKMLLHRKux4
 iGHVJMjEnbSWc/Z+NwnkO44k1GIqZ/YVEOvrZROSXDU+KnxyTHUzlPxJZcMu0LQaIOSI
 I5RCy9KCHnP9xFNX7zpiC4OogaUf0pHyZPahYNHInvdxwDI1YKgeOZyPkbe1eW5wuO9A
 3WQA4lz+H7Z6YsWIts5/N/o7n6U/BrCWdMdvN7yHd1p05gQqr8UcoH1MuuePQp0vvNqU
 vR8BTvlJ71ikulYhol5n/V6BERsgdf8hQfcI4n9DrNFiCMVFCJSVvDfWyRfpQ3CtRcXG
 0NPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXktu0af6XHx5GrN/6BQD1hfaRwFbNWbDmOXBfYO+t5M3v8y1DhaA+vgLc3lr7WCECkiO88SP7TUlbdCo=@nongnu.org
X-Gm-Message-State: AOJu0YwRj1vJEVES7v2/xTWbqT1ORZZ2BDKilJxu2rUwbByWwCvtOHsy
 QIhj/KLQmmtr6vFFVD6d8C6WzJtIOrV/c9YJbM8E4z5M43i+e6ggDBq3
X-Gm-Gg: AY/fxX7TALfDWM35AOaBzh9Vnq9WDAnS5aknHAeJGK23JSOFBQ6VD9HrH+jkCQF8q+c
 kIYOECO8l4193Me5u4aDo/2kHKPmaudtoEzKtCVDzZov8l2Dr/yt5HiHsV1kHr3iMZLmeaqLiPi
 ORMXq14aVQEHUIo7/ZkziY7r819cnItOwlUqMEIJsHaBhvNMcSFESlc22mfPIWDq4jLAoVWdmR9
 D263b9/rEbOUbVkdKCgM5fCco7Njet8gtjkPjo6+fB0nLqhT+w6xj1fqhwlaIg2Qeyy5AgA4l9D
 lCmTN2WKEvqn8WKwVMTRakHlldIBmYRixHh/qtOLcA5558G0pmkfhmHubhkbhYh0+cHvknamaZV
 6tdrmXFM2GVPRdBhls26oZ11ef5sEAe1x1g8IVcEttDAgWVLq4ZK2NCqvKZeTGps3qFJIaLEYQq
 4v8Vc5VCSe1t5UA2h/eHDphnuKps6BwrdVh3TCTldMEpETBtLB1ZoUZvikGGXVfPMITfavDg==
X-Received: by 2002:a17:906:9f84:b0:b83:972a:6af6 with SMTP id
 a640c23a62f3a-b87677dfb73mr279483866b.44.1768426365466; 
 Wed, 14 Jan 2026 13:32:45 -0800 (PST)
Received: from archlinux (dynamic-089-012-235-150.89.12.pool.telefonica.de.
 [89.12.235.150]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87124e1a1esm1081252566b.48.2026.01.14.13.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 13:32:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 0/2] imx8mp-evk trivial patches
Date: Wed, 14 Jan 2026 22:32:25 +0100
Message-ID: <20260114213227.3812-1-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

This series contains just some quality of life improvements for imx8mp-evk=
=0D
machine's CLI usage. The first patch removes the need to pass "-smp 4 -m 6G=
"=0D
and the second one does not suggest passing redundant "-cpu host" when usin=
g=0D
KVM.=0D
=0D
Bernhard Beschow (2):=0D
  hw/arm/imx8mp-evk: Provide some defaults matching real hardware=0D
  docs/system/arm/imx8mp-evk: Avoid suggesting redundant CLI parameters=0D
=0D
 docs/system/arm/imx8mp-evk.rst | 4 ++--=0D
 hw/arm/imx8mp-evk.c            | 2 ++=0D
 2 files changed, 4 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.52.0=0D
=0D

