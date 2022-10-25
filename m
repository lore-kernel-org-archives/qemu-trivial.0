Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onEhg-0003H7-GR
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2022 03:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onEhZ-0003A5-Bx; Tue, 25 Oct 2022 03:50:21 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onEhX-0005RP-G4; Tue, 25 Oct 2022 03:50:21 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mzi3l-1p04eP1Jtx-00veZ3; Tue, 25
 Oct 2022 09:50:16 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/11] Trivial branch for 7.2 patches
Date: Tue, 25 Oct 2022 09:50:04 +0200
Message-Id: <20221025075015.3116812-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dc4UKg/Uiem+73wlv+YPryZwMbDr+e3y71yhtdzaDZTJpxNLWPl
 14exfw2QqQiCl5RP67+4iDLmmsiSLrzVUfETsd2AMJNk5p+FbDKt/KuHeDbY9/DjFPdnrU/
 b1O0ufHOCE/QEFVlKOO8zOjGSGe3bRggAPOsw0OAFN//k4PM4nAvxZULBS9TSI+sy8UKkvI
 ZsrkuvnL2Jv3cb98Uziiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OT2mff0NQO8=:mnQUzmgRi18A73VbgP+muk
 50TsXEJouw5pIBq3UTWXcERt/ItK5FeQDuFME/ifX7GNTwvsD4jpU7AtEhHoBLlI6fhnAWElu
 yGn0br0d9Bq9yVMuZOQGDCQ8Rp3Hn2Ob2K2FPeifgC1sym96+U1Ta54Tzc+f9aSjus00HuZsv
 KCfaWnTWjJ3fGzLPGGzKbMIU5Lm3k82X+kzB9FXX3mfrFC6XeGL3sMVf3plRnZ/1Er2cngiSg
 zT55fVO0mS+wtvM3YBot+ZpTQOxfZ1uSl9G28knEeiuj051yf1QM/ByqrHP4r1ggHaQbtx88+
 XIIkdhW8PqwdQIzW49LhA3FA32s3UeRmZ+JhOX/JW5/vMYiNCNzUtBchMhtjkeGxKqkHMTLd4
 plwy7AHY3kxfAeWZP9kX5g3sxq5ysWSzFFlBjho6p+tInpduoYXr7Zxvchp7aLP01BbbXpe9p
 ExDLknGvx8PwCqBWDqf1rYsdr0HG/i1mIlbkMF8CjN6Z6huhSqqixWYEHAR48NWP7qWOrzNwe
 uECHDwTlUUrNTM/hrR+EczMQwc/JynP+4zWdov6cpZ3Zofe9hTnZ4JcwjjEhs4+JwqYs75k8g
 AWh8jjRFNbBK0ZhXqdA+JNDSOcjElIM2HgxAd0h/ajNNNn9pME+nl6lQeoAEBoFJdArnZ/ILW
 iVg4t9a9RnZfmwqrqgcGOtgDYNRrN8lojGc85hpHmRy/Aiw4pvrhbNvjszrJH53MMv56UcYAS
 JUoZgPAuP2zQpIX4/3HXhytSM7d3s+o08sY9KwBaAQ/e7fLYs6p6LgPUmN4DbM3l6ElGg2QRu
 OUYpgG1
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Oct 2022 07:50:23 -0000

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request

for you to fetch changes up to 046ab3b80891f4aa6d0cfd7db15c622b1933e598:

  accel/tcg/tcg-accel-ops-rr: fix trivial typo (2022-10-24 13:43:42 +0200)

----------------------------------------------------------------
Trivial branch pull request 20221025

----------------------------------------------------------------

Bin Meng (3):
  tests/qtest: migration-test: Fix [-Werror=format-overflow=] build
    warning
  tests/qtest: vhost-user-test: Fix [-Werror=format-overflow=] build
    warning
  treewide: Remove the unnecessary space before semicolon

Markus Armbruster (2):
  hw/core: Tidy up unnecessary casting away of const
  Drop useless casts from g_malloc() & friends to pointer

Matheus Tavares Bernardino (1):
  accel/tcg/tcg-accel-ops-rr: fix trivial typo

Peter Maydell (1):
  include/hw/scsi/scsi.h: Remove unused scsi_legacy_handle_cmdline()
    prototype

Volker Rümelin (1):
  ui: remove useless typecasts

Wang, Lei (1):
  .gitignore: add multiple items to .gitignore

dinglimin (1):
  vmstate-static-checker:remove this redundant return

lu zhipeng (1):
  elf2dmp: free memory in failure

 .gitignore                        | 3 +++
 accel/tcg/tcg-accel-ops-rr.c      | 2 +-
 contrib/elf2dmp/main.c            | 1 +
 hw/9pfs/9p.c                      | 2 +-
 hw/arm/nseries.c                  | 4 ++--
 hw/char/exynos4210_uart.c         | 2 +-
 hw/core/sysbus-fdt.c              | 5 +++--
 hw/display/blizzard.c             | 2 +-
 hw/dma/pl330.c                    | 2 +-
 hw/misc/cbus.c                    | 6 +++---
 hw/net/can/can_sja1000.c          | 2 +-
 hw/nvram/eeprom93xx.c             | 2 +-
 hw/timer/renesas_cmt.c            | 2 +-
 hw/timer/renesas_tmr.c            | 8 ++++----
 hw/usb/ccid-card-emulated.c       | 2 +-
 hw/virtio/virtio-pci.c            | 2 +-
 include/hw/elf_ops.h              | 2 +-
 include/hw/scsi/scsi.h            | 1 -
 scripts/vmstate-static-checker.py | 1 -
 target/i386/kvm/kvm.c             | 3 +--
 target/i386/whpx/whpx-all.c       | 5 ++---
 target/riscv/vector_helper.c      | 2 +-
 target/rx/op_helper.c             | 4 ++--
 target/s390x/kvm/kvm.c            | 2 +-
 tests/qtest/migration-test.c      | 4 ++--
 tests/qtest/vhost-user-test.c     | 4 ++--
 ui/console.c                      | 2 +-
 ui/gtk.c                          | 2 +-
 ui/vnc-enc-hextile.c              | 4 ++--
 ui/vnc-jobs.c                     | 2 +-
 ui/vnc.c                          | 2 +-
 31 files changed, 44 insertions(+), 43 deletions(-)

-- 
2.37.3


