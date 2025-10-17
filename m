Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF69FCCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:15:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCa-0004hb-9d; Fri, 17 Oct 2025 10:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCX-0004fZ-IK
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCM-0005eg-U6
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-426ff4f3ad4so948731f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710365; x=1761315165; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gzW3ekQZ7Psj0DsMhnvdQfGfYGGMgoTsdSCNvzg/jEU=;
 b=lpCx423vz/ClH8LDX+PMyW+IKJ3kL1pnR5TYpSXsuXCe4Ksx+mRtJ8OWDch0NOjrLP
 3pzeEBWg390IJW3qbIqSH1nzULOF5L2UFUkcU+BPdk5b5bjXDeaLG9RstOlsDURW6gz4
 1vhR3b/hYwB38V+ehNR5YoPBGlXkXi/XxEbpJDgRJuMOHcJtbOftQLPMNAFgxX6NmzcW
 v0X6JZ/7WmeH5xL6kv7ZEfPyRYLVtSYMLuNgVoRmLi/GnRd3Ilcr+6xbQz/xzRfALGIi
 Mxf7B2ZkgKipeysq5bv5kyR8mbSNKUMe75r62vf//409H6QXrPveG5x4ZJjMBlF/IhFc
 rZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710365; x=1761315165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gzW3ekQZ7Psj0DsMhnvdQfGfYGGMgoTsdSCNvzg/jEU=;
 b=GR0fuSeBm7YMqTXRBMEFn3A1vhyrCdBXwq2RXwRD+3a+XdCwmACOh8X+KnVAocmtBu
 v9ui1MkeiilMzww5RVLUHy96n9FGsLEjdBSvSk58sE/YqlC23WazxQrJSjnAj5wAWzED
 kEYqKBDM9HbvWqncDKYn3lbIioUH2P/TQ1oFmJ8IN279I/pjk14veNmt+o4zz0dNt6vg
 gLMfC+j+LLub+ZHTB+LEOzzRJyDxtbRvY6GEDvCcY3qcDKHHZ1dgNFaDk8558Ql0L0Zz
 ROmSPf/CD0gp9Ygeqv0a70nkYgHhzxjagyTYCBvjfYBTKNUx+C8pkyYMzi1oIMSNgOs8
 gX/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvZ3mYgwt0Vf/QNC+tt0R65GT+4N9hYoZn0wYyRd3ZehNhi/qG1rITd8zAqh1Y10emPhHDvCoYZkUoxSs=@nongnu.org
X-Gm-Message-State: AOJu0YwBBdXvTE4IFe5xQ7B14Tat30hWE/R4MHr72PhJnB9ujMLL32om
 00R8QWgNtr3O6zutd/Me+ACLUg6hP1kJXH4kKrEm+GAeuGLmBRfdQOtn
X-Gm-Gg: ASbGnct86fpMVLoUbSMmhnSLUXjq8Hlrvy9wo4vTj+ago31X6exOT6Kxev12ugglEor
 SFPnyMahnVyeESrgzTH2LlrcZ1YyZBzO+4T331OJgUaRhQrQbPPZggL1C72srzX0HJa4WtC94LJ
 Y7q0l7eDozv7PlagZ+KhDyEKevZPzOOiA+J8s6CvsyraRnCWt7Wo8f37TASVgciRsUmLBZMDZCO
 gbsnSDxsUiFz096duFjxsCGNcNWG9ImvMNm8bYmXIw34q94usY0tJr81YbsCB/NC85ty1xxRCZc
 EFNQE1EEY5MF07Oda/GAQFDeTQ6DBK51EKMpUGInhgMEzF0MV+gwjatUGBmiH/f28jzsWIydcqh
 Q52WUeHBvtGCBarFk1pjbn26IJDYDOB1nwouhDm6/h4yHA/hPmIJ8B/iMhhcq9qgkf1xC715043
 KTsM4H9ApexeQhWmZYbQvop7Yz19YHCMxu
X-Google-Smtp-Source: AGHT+IGeuxOJBWpmVCX3U1tHBDipCkpzrypzvQWf6sOPwcugLBzMa9b7CCp6AGBV0FZ+Pn8TPlDLZw==
X-Received: by 2002:a05:6000:25c7:b0:427:854:787 with SMTP id
 ffacd0b85a97d-4270854085bmr1487022f8f.51.1760710364350; 
 Fri, 17 Oct 2025 07:12:44 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/11] Cleanup patches, mostly PC-related
Date: Fri, 17 Oct 2025 16:11:06 +0200
Message-ID: <20251017141117.105944-1-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
improved tracing and removal of cpu_get_current_apic(). The remaining patch=
=0D
resolves duplicate code in the test of DS1338 RTC which is used in e500=0D
machines.=0D
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
Supersedes: 20251017113338.7953-1-shentey@gmail.com=0D
=0D
Bernhard Beschow (11):=0D
  hw/timer/i8254: Add I/O trace events=0D
  hw/audio/pcspk: Add I/O trace events=0D
  hw/rtc/mc146818rtc: Convert CMOS_DPRINTF() into trace events=0D
  hw/rtc/mc146818rtc: Use ARRAY_SIZE macro=0D
  hw/rtc/mc146818rtc: Assert correct usage of=0D
    mc146818rtc_set_cmos_data()=0D
  hw/ide/ide-internal: Move dma_buf_commit() into ide "namespace"=0D
  hw/i386/apic: Prefer APICCommonState over DeviceState=0D
  hw/i386/apic: Ensure own APIC use in apic_msr_{read,write}=0D
  hw/intc/apic: Ensure own APIC use in apic_register_{read,write}=0D
  hw/i386/x86-cpu: Remove now unused cpu_get_current_apic()=0D
  tests/qtest/ds1338-test: Reuse from_bcd()=0D
=0D
 hw/ide/ide-internal.h                |   2 +-=0D
 include/hw/i386/apic.h               |  38 +++++----=0D
 include/hw/i386/apic_internal.h      |   7 +-=0D
 target/i386/cpu.h                    |   4 +-=0D
 target/i386/kvm/kvm_i386.h           |   2 +-=0D
 target/i386/whpx/whpx-internal.h     |   2 +-=0D
 hw/audio/pcspk.c                     |  10 ++-=0D
 hw/i386/kvm/apic.c                   |   3 +-=0D
 hw/i386/vapic.c                      |   2 +-=0D
 hw/i386/x86-cpu.c                    |  10 ---=0D
 hw/ide/ahci.c                        |   8 +-=0D
 hw/ide/core.c                        |  10 +--=0D
 hw/intc/apic.c                       | 116 +++++++++------------------=0D
 hw/intc/apic_common.c                |  56 +++++--------=0D
 hw/rtc/mc146818rtc.c                 |  20 ++---=0D
 hw/timer/i8254.c                     |   6 ++=0D
 target/i386/cpu-apic.c               |  16 ++--=0D
 target/i386/cpu-dump.c               |   2 +-=0D
 target/i386/cpu.c                    |   2 +-=0D
 target/i386/hvf/hvf.c                |   4 +-=0D
 target/i386/kvm/kvm.c                |   2 +-=0D
 target/i386/tcg/system/misc_helper.c |   5 +-=0D
 target/i386/whpx/whpx-apic.c         |   3 +-=0D
 tests/qtest/ds1338-test.c            |  12 +--=0D
 hw/audio/trace-events                |   4 +=0D
 hw/rtc/trace-events                  |   4 +=0D
 hw/timer/trace-events                |   4 +=0D
 27 files changed, 146 insertions(+), 208 deletions(-)=0D
=0D
-- =0D
2.51.1.dirty=0D
=0D

