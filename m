Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzPK-0003sL-6e
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPH-0003qq-OW
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:51:40 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPF-0006Vb-Ur
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:51:39 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso5216932e87.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725969095; x=1726573895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o0EfI1A/UvauZ83BL14nXZ+tiWTTtTokFBoS4sXlOCg=;
 b=pDo4dfVMgt+TyC9nK3SdSA5Hv5C0qq8THwVq7G0S2x3icnQmGkfGOdZJVzsMxjR5UW
 8i8PjHwXonPqg5J6dQoPNPctvTXa0QHc6VPfrzbD7lilBHBUycz6yuWQujOsdYQrPXpv
 AMBoRZfJmrH0GI4OJNmPHeVrK8FQThNtnco54Y1GLqnLf8h7nKx4OxhNJn2sp/LbJryy
 LHYXWiAySZDnE1+Yy18VQqjIlFMUUrCsTB2EkGI5w/ulP7RhYX/YMSu0+/geq4ps3DPx
 IOO/GWOfPrgeZ+8hLcnJ6Ms47ogIkkKLAQjoS06iCZoZHiTDrl0lntD7qGqr6kuA8IXx
 xMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725969095; x=1726573895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0EfI1A/UvauZ83BL14nXZ+tiWTTtTokFBoS4sXlOCg=;
 b=kJq8Os5sm5dpZwtlPle4H3HypjjwBQMe5Dtn+xWvOmNbShkf4z1CBvKCvJHJg20VOl
 I7Uya4Nv8kl7P91GQxtzZGpACGji54Eo3a1qD7bXMamHFUVSh3BUZQlUIlJ9sikSUsLY
 7oWTkve3IoYzg7YlpVDQHWUNs2eLQrPjd2wB6n8xZR2Z3dyshxxo01yiUGa0zmUK/iJr
 2k2mHP5zvrGeg9Kz1PPfZqieDj+8d1zeui1ZO19Fhx+h6yXoJFIsS2CSnfh4b0svqX+/
 WRjvUdAPSFpg9ixZ1bRxyv6BZJvTXeR2QMhy/EINyjY3psOyp1RBsvToX+Om6keaKfHW
 HGgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZZgv5Vb+Bzkz34ys61P2HfIsy3SWYEBVbV1zv62xy7uvgSIsP1i9kxnK40zAbo5/4JvU8W8ASAgxcI/A=@nongnu.org
X-Gm-Message-State: AOJu0YzynOTMQ+t65eovgQ6SHEke5aULlsd6xDUnXt+9v5gDND7/gYVk
 5LHp1WtAjaglztz0ZF8UL9HiaE+4Npp64r/ORy9RfsaDMW1Fysnq9ah3VOWgi/0=
X-Google-Smtp-Source: AGHT+IHm1rGXb188G58Hp/pHYhQkmzhgHMYhdit50oVw56sXkxZvj4nku2LHy2pVyaxPFd0pC2usWw==
X-Received: by 2002:a05:6512:398c:b0:536:542e:ce1f with SMTP id
 2adb3069b0e04-536587ae0d6mr10797166e87.18.1725969095429; 
 Tue, 10 Sep 2024 04:51:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cefa24sm479414166b.178.2024.09.10.04.51.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:51:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] license: Fix typos and update deprecated SPDX tags
Date: Tue, 10 Sep 2024 13:51:26 +0200
Message-ID: <20240910115131.28766-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 11:51:40 -0000

- Fix a pair of typos

- Upgrade the deprecated GPL-2.0+/LGPL-2.0+ SPDX tags
  to GPL-2.0-only / GPL-2.0-or-later / LGPL-2.0-or-later.

Philippe Mathieu-Daudé (5):
  NSIS: Simplify license description
  tests/functional: Correct typo in test_netdev_ethtool.py SPDX tag
  license: Update deprecated SPDX tag LGPL-2.0+ to LGPL-2.0-or-later
  license: Update deprecated SPDX tag GPL-2.0+ to GPL-2.0-or-later
  license: Update deprecated SPDX tag GPL-2.0 to GPL-2.0-only

 include/gdbstub/syscalls.h              | 2 +-
 include/gdbstub/user.h                  | 2 +-
 include/qemu/crc-ccitt.h                | 2 +-
 target/alpha/cpu-param.h                | 2 +-
 target/arm/cpu-param.h                  | 2 +-
 target/cris/cpu-param.h                 | 2 +-
 target/hppa/cpu-param.h                 | 2 +-
 target/i386/cpu-param.h                 | 2 +-
 target/m68k/cpu-param.h                 | 2 +-
 target/microblaze/cpu-param.h           | 2 +-
 target/mips/cpu-param.h                 | 2 +-
 target/openrisc/cpu-param.h             | 2 +-
 target/ppc/cpu-param.h                  | 2 +-
 target/riscv/cpu-param.h                | 2 +-
 target/s390x/cpu-param.h                | 2 +-
 target/sh4/cpu-param.h                  | 2 +-
 target/sparc/cpu-param.h                | 2 +-
 target/sparc/insns.decode               | 2 +-
 gdbstub/gdbstub.c                       | 2 +-
 gdbstub/syscalls.c                      | 2 +-
 gdbstub/system.c                        | 2 +-
 gdbstub/user-target.c                   | 2 +-
 gdbstub/user.c                          | 2 +-
 hw/nvram/fw_cfg-acpi.c                  | 2 +-
 hw/virtio/virtio-acpi.c                 | 2 +-
 linux-user/alpha/syscallhdr.sh          | 2 +-
 linux-user/arm/syscallhdr.sh            | 2 +-
 linux-user/hppa/syscallhdr.sh           | 2 +-
 linux-user/i386/syscallhdr.sh           | 2 +-
 linux-user/m68k/syscallhdr.sh           | 2 +-
 linux-user/microblaze/syscallhdr.sh     | 2 +-
 linux-user/mips/syscallhdr.sh           | 2 +-
 linux-user/mips64/syscallhdr.sh         | 2 +-
 linux-user/ppc/syscallhdr.sh            | 2 +-
 linux-user/s390x/syscallhdr.sh          | 2 +-
 linux-user/sh4/syscallhdr.sh            | 2 +-
 linux-user/sparc/syscallhdr.sh          | 2 +-
 linux-user/x86_64/syscallhdr.sh         | 2 +-
 linux-user/xtensa/syscallhdr.sh         | 2 +-
 qemu.nsi                                | 4 +++-
 scripts/kernel-doc                      | 2 +-
 tests/functional/test_netdev_ethtool.py | 2 +-
 42 files changed, 44 insertions(+), 42 deletions(-)

-- 
2.45.2


