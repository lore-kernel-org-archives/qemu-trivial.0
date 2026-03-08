Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2A1EA8545
	for <qemu-trivial@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzKqX-0007Cp-Sj; Sun, 08 Mar 2026 16:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqW-0007Bz-DS
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqU-00043z-OF
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so5413900f8f.3
 for <qemu-trivial@nongnu.org>; Sun, 08 Mar 2026 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002125; x=1773606925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/7XgWxKgyE/WQ+XgF0P4RAkLFP5Q5Xqwf/wEtAP3zBA=;
 b=kF35cJxV/TLy7HaEamErFteAPcAPsTqaqzS75dcgsoF8HTkIws1mqlY5xaYIaaHFGO
 8a5xC9weOxqca8uHB9x/nZgAD4eQIn9N/Jes4X4MedMVWLxM6M24ziHEHqHwGzSB7KJj
 Mk2uobvOCeY94ATo3K/TDIQ9qGhRuOiLGswN9QS+lnfJwqhL9oVKwk5Fm2FzoVU8rmEy
 n/Q/aGzlQPRhrpbuUiGQ3wFi+cPuM579j1EHzQWhDTmc09wd1VSRwlX66OcrcAhqG9Hn
 uyVUXp6f/qKODC2R1ssM1sPsYJJDxqrf7f8UzWpKi18NBru7qnFiYghdTI6g91rIpXfi
 uYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002125; x=1773606925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7XgWxKgyE/WQ+XgF0P4RAkLFP5Q5Xqwf/wEtAP3zBA=;
 b=donwpit0FgRhAmocBEzdIBrkezDSICwAU0Tep2EPq+DG1w1tovxgEiHpXna7v6ZhWb
 qus8QfQ9JYSwDgwSWAwAOsQYu1v3vyps6kjPUBfXzLAdz2xoEX8/M30jpldr3npCtzx+
 Dtd6/tRYcxlfZiLdj6TfaqK/EUaKBQKTU9ZIuLbRyxYsaSmB8tWfZE7ZJBMNZO7ELCy7
 46Oe95ugjmB70oI4l/MPOjXt1dOqGIeKiacwDhZcb0tf1qFNr2VhXbub8JONmqHq6n0+
 4dI+37q4fNbGVJX+DPc7tUI8YiAHoTB9VQ5x1irwKgzzjW++PC6MZXGUIB/w+JfvwsV0
 v7kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDLCkY1x+Afg6yPt9HrFUphIDMclTK0pJOAwOAwXJlmM+LqdHOrRjncDgw5CxNaModA7r6+sRFs87JtmI=@nongnu.org
X-Gm-Message-State: AOJu0YxELHxjtodnEutj/5NiYaQJ/sOqliTs+5hELM6GYXQOq9exTZ34
 N+ycuj8oWSGHt8dXP01+YrV/H+qkuEcF5d8S/hnxxr0tFLxy5gW6GsmO
X-Gm-Gg: ATEYQzzArwkH2aOXbP1OWAK+YtdbMBbdxigFum1Y4tmM1bnRDj2Nwx1vCC4rCztaD4X
 ZoJ9wOiPIoRon6+4gGTTWfbW4B6BQq7ixITgz834pIrfxu5RqbMVQpM1/MsJlV8f9V5uRifiW0L
 KieHggc341Ef7QfO9hO3p1ihbRDMXbKfTwU5FdUbcwyYpg4HVquYWaLFiT2cTm/sxxQcSRz4igo
 9V3hZvbIQ++ANjbjD4WQl+Mfff+YTaCLtOTs9wyxss3TCZUEfSu3ZNs1BC/prWR/cfUimvih4uA
 MOpBiIxFGoUaQvvkm2wBC9eGyvXEG/deCbEZhYNgZOeVc89bOV0mot632YvrnY/lNYROLOLHxQE
 cp/UAdFK5e36QeP63TqBAJAdafQwm2QAPdQdSEMwZ21/Gzn4AIXyviz4Bt2eVFcEc+T6PiEXP8B
 I+q7NOYGpDcn67TnJac8cllySFHnMO7vrdnsVdAPV0Pt76oOsREte6WZKNmtBkdVhyvdGNOk2r5
 pXFtk9eDRVwTRrwlycuxcoz3Jgqogg=
X-Received: by 2002:a05:6000:603:b0:439:b59e:5e69 with SMTP id
 ffacd0b85a97d-439da348049mr15177586f8f.8.1773002124992; 
 Sun, 08 Mar 2026 13:35:24 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:24 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/5] Trivial cleanup
Date: Sun,  8 Mar 2026 21:35:11 +0100
Message-ID: <20260308203516.160103-1-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

This series contains some low-hanging fruit fixes I came up with when
investigating Rust for QEMU, especially QOM object lifecycle vs. the Drop trait.

I noticed that no finalize methods were called in Rust sysbus devices when QEMU
quits, and neither are its C variants. What is probably missing in the first
place is a

  object_unref(object_get_root());

at the end of qemu_cleanup() in runstate.c (see TODO there). Adding it before
this series won't clean up machines since their refcount won't reach zero. With
this series applied this additional line will cause various issues when quitting
QEMU, allowing the problem to be investigated. Fixing it is beyond the scope of
this series (and my time budget).

Testing done:
* `make check`
* Run imx8mp-evk with a Buildroot image

Bernhard Beschow (5):
  hw/arm/fsl-imx8mp: Do not create redundant unimplemented devices
  hw/arm/fsl-imx8mp: Fix parent of ocram memory region
  hw/arm/imx8mp-evk: Fix reference count of SoC object
  system/vl: Fix reference count of machine object
  Revert "sysbus: add irq_routing_notifier"

 include/hw/core/sysbus.h | 1 -
 hw/arm/fsl-imx8mp.c      | 3 ++-
 hw/arm/imx8mp-evk.c      | 4 ++--
 hw/core/sysbus.c         | 6 ------
 system/vl.c              | 1 +
 5 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.53.0


