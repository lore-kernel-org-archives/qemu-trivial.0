Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EBDCCD195
	for <qemu-trivial@archiver.kernel.org>; Sun, 19 Oct 2025 21:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAaYt-0007KS-Ev; Sun, 19 Oct 2025 17:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaYr-0007Jv-LV
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:29 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaYp-0001yk-Jd
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:29 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63c2d72582cso3764271a12.1
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 14:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760907805; x=1761512605; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/5xsUG6WLPbZparIfWCrq5hzPBogw4t3aogUtWePXKU=;
 b=DGlxWXhLN2BWQTVlJYrKNtwIJAUI57YDQ08K1XzUGuzHbc40chRSGOPH8ZB4/0Qk6Z
 qbUHP/hkmPgygPoo7Cc1JSyRJEcikh5iXxjfmSYqjSgmxyFR9nWCXCXHqa9eViXp5gT7
 dAAAv9ahW3FrQPd7a2aEpW2o7WveXFzsid9npPAhcsFYEzOrNhEpuwanwUEzlrUaAgeI
 mhb/WmK9bz5G+q8AlIF3xJVvxXBEMKc/YB5Adp9/n5zhTpzD2n/HcFJCPIJXdESqAzzH
 f7/7A9cXtFPCy8DUzKhbMoKD4Dz3enARkSls/IZft501tMbNHtSEpyl5HQFlNcO6rSgg
 6IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760907805; x=1761512605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/5xsUG6WLPbZparIfWCrq5hzPBogw4t3aogUtWePXKU=;
 b=cnloQ7e2AkMPqCgK1SR1dFtoXkWt/6S/cvKiHQ8L8bn0KCCqkoQApCCXwX/F9xJjuq
 eJUqR/ou2FKWRqwyiDmR/Y1Lm0jq3IcWtTs4CyvwEFP9nfhXMEQMxM9sRRhDnnNJDy1c
 zXjk1mTicuRxo6s22hCaZ2RUOXhaFSA/oev7wdYjW2vp+gFQK7qsPGUyW+n6xCU8Fc9f
 zB3Cn0x0Bes1zhUJrDKlOCpnebPFtuS+evkmJ6qzCnTo8HvjFvlCx3aTnFFJOtIodeBH
 6dPieVQlIGrsfB1J4v2fPqDXKV6FU0UtJBwa3ZpOWg0/IzXPtsaaJb9+yC4ksP1vw2es
 tOfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc7LaFrJXigYw5zFOMROLhuMjn3OcwvZ4BydqvFs39Q4b8BWZyW2DWRihjDLkP7493te4rdZG4jVGEjQs=@nongnu.org
X-Gm-Message-State: AOJu0Yz3ZW0tBgg3apwxfvCeU71v2mdg0T1xRXbXAFpO6y8ft+jQd1MS
 cec8pD1Kfja7cNpvUa93y0DRJavDdarUieHUMUqZ1aNsDWu6ubwPkQvO
X-Gm-Gg: ASbGncvHkxmFnqYgJe9cAe3atEiRGbO7T7+mVj9ZTkt60XOl9uMHCqKJy01HtyH3VKF
 wsIxpPPOApQF/7GLlw3kD13JaJ/fmOdQm3zs1Gf0YMoRvSvCfbid4S1vEGCjkcPYkQZiGrljcZH
 OhfV6SdiYWNDsP+KaL1SgQsrFNHnZiaVgDhwJ9rHCFaI6W0Tn1Yvo9d0uLfNWD8GlLfR50HIFw1
 EKAtSNDwyhSRBByRcouMlUbQKvS1Jg7NOs/8f9lUoWNRtx4RsGLZ2zQRjfDfOCIJmUQUMoeKPR4
 v/tUu3lblm9/WHSoI6/YX2FQ/2ZEyybMPBWMgLg/Lw/Y3l8Oozr3bMbQTqiuPa/EoJCIHTZJUSj
 bmVtUPvNMRYI9djRIv2jVcV+oEpW+/a/CxGVgYwNZmpu3O/xaTvVc58kqIbTsKmfHLc2Fj0iF8B
 /rOisD2JBCyX+S+sGxs+SGEvwdyjQf9r5YHpLD/p6xLpFnvoFC1KOkG2lpwW4IzcplkcEn
X-Google-Smtp-Source: AGHT+IH4tgIuX3U2EOesYznwiJ9M1OqncIKIcgC99vfyI7Cx11Blbd3601WSC9drtYlUz8URQ5BAng==
X-Received: by 2002:a05:6402:42c1:b0:63b:edcd:3d52 with SMTP id
 4fb4d7f45d1cf-63c1f650d74mr12149784a12.15.1760907805205; 
 Sun, 19 Oct 2025 14:03:25 -0700 (PDT)
Received: from archlinux (dynamic-002-245-026-170.2.245.pool.telefonica.de.
 [2.245.26.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f003sm5107655a12.27.2025.10.19.14.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 14:03:24 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 00/10] Cleanup patches, mostly PC-related
Date: Sun, 19 Oct 2025 23:02:53 +0200
Message-ID: <20251019210303.104718-1-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
"virtual retrocomputing" with my via-apollo-pro-133t branch [1]. It include=
s=0D
improved tracing and reduced usage of cpu_get_current_apic(). The remaining=
=0D
patch resolves duplicate code in the test of DS1338 RTC which is used in e5=
00=0D
machines.=0D
=0D
v3:=0D
* Don't remove cpu_get_current_apic() since it is needed in=0D
  apic_mem_{read,write} (the local APIC memory regions aren't per CPU)=0D
=0D
v2:=0D
* Remove some redundant APIC_COMMON(cpu->apic_state) casts=0D
* Resolve cpu_get_current_apic()=0D
=0D
Testing done:=0D
* make check=0D
* Work with recent x86_64 Linux distribution running on WHPX=0D
=0D
[1] https://github.com/shentok/qemu/tree/via-apollo-pro-133t=0D
=0D
Bernhard Beschow (10):=0D
  hw/timer/i8254: Add I/O trace events=0D
  hw/audio/pcspk: Add I/O trace events=0D
  hw/rtc/mc146818rtc: Convert CMOS_DPRINTF() into trace events=0D
  hw/rtc/mc146818rtc: Use ARRAY_SIZE macro=0D
  hw/rtc/mc146818rtc: Assert correct usage of=0D
    mc146818rtc_set_cmos_data()=0D
  hw/ide/ide-internal: Move dma_buf_commit() into ide "namespace"=0D
  hw/i386/apic: Prefer APICCommonState over DeviceState=0D
  hw/i386/apic: Ensure own APIC use in apic_msr_{read,write}=0D
  hw/intc/apic: Pass APICCommonState to apic_register_{read,write}=0D
  tests/qtest/ds1338-test: Reuse from_bcd()=0D
=0D
 hw/ide/ide-internal.h                |   2 +-=0D
 include/hw/i386/apic.h               |  37 ++++----=0D
 include/hw/i386/apic_internal.h      |   7 +-=0D
 target/i386/cpu.h                    |   4 +-=0D
 target/i386/kvm/kvm_i386.h           |   2 +-=0D
 target/i386/whpx/whpx-internal.h     |   2 +-=0D
 hw/audio/pcspk.c                     |  10 ++-=0D
 hw/i386/kvm/apic.c                   |   3 +-=0D
 hw/i386/vapic.c                      |   2 +-=0D
 hw/i386/x86-cpu.c                    |   2 +-=0D
 hw/ide/ahci.c                        |   8 +-=0D
 hw/ide/core.c                        |  10 +--=0D
 hw/intc/apic.c                       | 126 ++++++++++-----------------=0D
 hw/intc/apic_common.c                |  56 ++++--------=0D
 hw/rtc/mc146818rtc.c                 |  20 ++---=0D
 hw/timer/i8254.c                     |   6 ++=0D
 target/i386/cpu-apic.c               |  18 ++--=0D
 target/i386/cpu-dump.c               |   2 +-=0D
 target/i386/cpu.c                    |   2 +-=0D
 target/i386/hvf/hvf.c                |   4 +-=0D
 target/i386/kvm/kvm.c                |   2 +-=0D
 target/i386/tcg/system/misc_helper.c |   4 +-=0D
 target/i386/whpx/whpx-apic.c         |   3 +-=0D
 tests/qtest/ds1338-test.c            |  12 +--=0D
 hw/audio/trace-events                |   4 +=0D
 hw/rtc/trace-events                  |   4 +=0D
 hw/timer/trace-events                |   4 +=0D
 27 files changed, 158 insertions(+), 198 deletions(-)=0D
=0D
-- =0D
2.51.1.dirty=0D
=0D

