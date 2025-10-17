Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDFBCCD19A
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 11:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9iip-0000h2-Nz; Fri, 17 Oct 2025 07:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iin-0000gr-Ae
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iig-0005zb-Tl
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so13869325e9.1
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 04:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760700837; x=1761305637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QgCkk09CDJJJoCNRPQ1vxRSlp7Quspprhx550Eoot8g=;
 b=fBjCZbB3J1YfueMrMCOpakYax2Ilty1RPkjqOOG6i2oxNBIBs+aFaEVsH/Pu+A1BiE
 1YqV27nyx3etIIJjKfcMixqf46m6bwUjPIbi41xbKvOg5u5DSRzlcqyuX7yZMgBfB/E6
 0EqJk7EOKMArs0vuV161sBuWc6DOG5aBHmyyZ3z3IwSMsAck0f9prwIlDbh0Yo8GLfxz
 M8M5p1kN6p2LoMkDICZRRex5PsSoyIAL+ei6b+BuQROisJjaepJOmRAApwkNHbiFAfC0
 hkcnSdeOkhjTEuWLxRocLax50M1amQqYxpgl263H2OwkdrW+KwexKOOIgNJ/nPEqK/EY
 EGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700837; x=1761305637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QgCkk09CDJJJoCNRPQ1vxRSlp7Quspprhx550Eoot8g=;
 b=BefrrHNWr/fvK/meQBVvgmcTUPc9TYfRxgMIcI3Tf/qmp/Ba/Sq8bc0UXeuuYdPgod
 2iQq5/iBGF8rDR6myQUv+5kGt/lByVlhe4Yo3ZOCKG3FLsjMWEpg24Rcz+9ok/fIwcc4
 XG8H5e6FqNGzMZgF4Ckv8pPv25EVFfgkwQ9P0QKoBtjpiXBh0xuWjoJMnUF5t5FPbbcn
 jxk4lf/TxYNHBbB00e80DRBBwGav4NPjiGt2KsIt/OHb3MsRiRxwERXNMN1j6jvV/M8r
 R7Cw+Tq5rNd1joDb/jsFtqgjlDVtLjFmuX2J3nW6b6EUgO0kxnxPpp4B1aDgFvA/22HN
 Z64g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZXCKUAYNAWZdcBDb2CfoDjAdqlCdCWUUoPPKuFnDWkyXOAWx/t3rewZQr91EHmIfS7McyLT6Ozh2/+LY=@nongnu.org
X-Gm-Message-State: AOJu0YxGzMo1D33mdkqCE7nYcFTwarQgMQjOiAcE85eZ/Ci+u7z70BQu
 AA1U85cHgaLq6ory7y2XC/3A4Ifgcs75fxB1ZUnsJ1222PFDmifVupUH
X-Gm-Gg: ASbGnct8fUPvQbiEfMwP94yK+rIelzap5vcgsFkqlEYMNRWnK7t/vnNIRFohgBdC2yq
 TyIdQhmOsfBIiB7V8RfoXe1WE9M+sGVXPdAqbHn+ZaAVso4pqiyB3Y9cIKkDRutg/aen8b/rTv9
 FBR7bJ2XaCOEOqpvfM2iX71ZvaPVYgBtRvzOC4p1NQVzvTl7FNGQDh3SXnZ4kWtWX1k1pZ/mvWn
 sg093gxiq2ZsQAyYVL4g29eKLdnrDV1TqdRiOjMezlSahJPR3g/NEgQQf81IdS4LvpLEyIXNzin
 dyDyPTyLTahvSiYrb9U7au3/AIzRFibRe4qmQ+7dqQOQVsUQ4yTIJj0ZTgia8Zx8YBOWMNFilfg
 PNwZ5C5hpZoAdoiV3pc4K70cuod0skUMK2xEsqMNJ5siZaipFFUb59Kl+IFgv4x0bnWkIZhXcXx
 nhqqVcIV8VsYlTqqwLhvTqyBTvSaCx1c+k
X-Google-Smtp-Source: AGHT+IF3ZWc6BVs/qnp6JVjeRuVjtLvXZFrwRaO7n86z12z++IOhhL2xCPtbec14Mlr9CpeaMcgcwA==
X-Received: by 2002:a05:600c:1d9b:b0:471:a3b:56d with SMTP id
 5b1f17b1804b1-4711792006bmr28578385e9.34.1760700836583; 
 Fri, 17 Oct 2025 04:33:56 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm80395435e9.13.2025.10.17.04.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:33:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <laurent@vivier.eu>, kvm@vger.kernel.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/8] Trivial patches, mostly PC-related
Date: Fri, 17 Oct 2025 13:33:30 +0200
Message-ID: <20251017113338.7953-1-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x331.google.com
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

This series mostly contains PC-related patches I came up with when doing=0D
"virtual retrocomputing" on my via-apollo-pro-133t branch [1] which include=
s=0D
improved tracing and type safety. The remaining patch resolves duplicate co=
de=0D
in the test of DS1338 RTC which is used in e500 machines.=0D
=0D
[1] https://github.com/shentok/qemu/tree/via-apollo-pro-133t=0D
=0D
Bernhard Beschow (8):=0D
  hw/timer/i8254: Add I/O trace events=0D
  hw/audio/pcspk: Add I/O trace events=0D
  hw/rtc/mc146818rtc: Convert CMOS_DPRINTF() into trace events=0D
  hw/rtc/mc146818rtc: Use ARRAY_SIZE macro=0D
  hw/rtc/mc146818rtc: Assert correct usage of=0D
    mc146818rtc_set_cmos_data()=0D
  hw/i386/apic: Prefer APICCommonState over DeviceState=0D
  hw/ide/ide-internal: Move dma_buf_commit() into ide "namespace"=0D
  tests/qtest/ds1338-test: Reuse from_bcd()=0D
=0D
 hw/ide/ide-internal.h            |  2 +-=0D
 include/hw/i386/apic.h           | 33 +++++------=0D
 include/hw/i386/apic_internal.h  |  7 +--=0D
 target/i386/cpu.h                |  4 +-=0D
 target/i386/kvm/kvm_i386.h       |  2 +-=0D
 target/i386/whpx/whpx-internal.h |  2 +-=0D
 hw/audio/pcspk.c                 | 10 +++-=0D
 hw/i386/kvm/apic.c               |  3 +-=0D
 hw/i386/vapic.c                  |  2 +-=0D
 hw/i386/x86-cpu.c                |  2 +-=0D
 hw/ide/ahci.c                    |  8 +--=0D
 hw/ide/core.c                    | 10 ++--=0D
 hw/intc/apic.c                   | 97 +++++++++++++-------------------=0D
 hw/intc/apic_common.c            | 56 +++++++-----------=0D
 hw/rtc/mc146818rtc.c             | 20 ++-----=0D
 hw/timer/i8254.c                 |  6 ++=0D
 target/i386/cpu-apic.c           |  4 +-=0D
 target/i386/cpu.c                |  2 +-=0D
 target/i386/kvm/kvm.c            |  2 +-=0D
 target/i386/whpx/whpx-apic.c     |  3 +-=0D
 tests/qtest/ds1338-test.c        | 12 ++--=0D
 hw/audio/trace-events            |  4 ++=0D
 hw/rtc/trace-events              |  4 ++=0D
 hw/timer/trace-events            |  4 ++=0D
 24 files changed, 136 insertions(+), 163 deletions(-)=0D
=0D
-- =0D
2.51.1.dirty=0D
=0D

