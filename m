Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofThG-0003A4-7u
	for mharc-qemu-trivial@gnu.org; Mon, 03 Oct 2022 18:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ofTh9-00037f-Mj; Mon, 03 Oct 2022 18:13:51 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ofTh7-00069b-4L; Mon, 03 Oct 2022 18:13:51 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mv3M8-1pWLKU4836-00r0W3; Tue, 04
 Oct 2022 00:13:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/8] Trivial branch for 7.2 patches
Date: Tue,  4 Oct 2022 00:13:37 +0200
Message-Id: <20221003221345.1324140-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+qfZz5LFR2hYoR8/nAGgpX1FLgLbKoc7Tp7IQici3Df9tHNf7B2
 4szTFoFCg1lhUjQkLpki9L1iM3XBk/pIdD8SDPVFgWxgQaxIYDJ6udaxbyPz/ZASP33uy7G
 napHNqBtq162b4mLpxMWYxA4eF3fzeneTUt0/43bcs/gT8fKhZrdEKAzTIo32UrJjTU9QcS
 KsF1RRCT8nIVXtJEtPBog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nH39NoL686M=:34TrOSIZMNpSBYvlCJu6FP
 JdZer7rfGBeKdB1uazktYgCsGMYi3o8CFma/w/sqJnlRsfOIJN0uaw8w/bCEd76HklwYFjSKQ
 7xurIrVBTIz88bcR1Fn8FwHn+u26Fd81diYQufkVSK4qcVh6kOajheQR6W4XxnjxubJReKLzk
 qW2uC88WVZrL+PPDrr9TBViZ3uIQG84YHpmFu9EZ/dOPu2/HBSQMWGYC6bO8V2mCCxbLYenXz
 KiQu83fIpeJd9ANOat3m88iDuI2t9hQTQKAKL3w0Ext1M0v1z44otoSGVJUKd/1Wf7d4UxVrq
 HQOFaK7xv5M/d70/MBaZeUXc+/DKmvYq02B58OV/6LI6t9FWPNtn/5VQXeM6oNvuRPYa7bgbo
 0Uf7yrIkEJ0eMrYRzyfXlIdh2kBBiSvlicZzf/kWtrGCWDC5m2rlb1gorMQqjWQn4ZiqmXIfk
 +HAhH8ZnLfJW+hpTkjqx0EP45mFSOYg2rdaMXAuTQle+NzydKe5M800PWmZGRstS5Nb8v5iCc
 Fy9WEQjDtbdAV2KF470DOq12e/5P4j4NHtIyVsqdTXU8hn3YGEVkls5uCRQExUtevR40DCrJR
 NLD2/FkMZT47DJDn9HtfMe5WmRehoclrONFCoECymV4x8xeApO/z0rpG/tVjQMmkMlnKm9Il/
 jtMbmPuyO7GaZxN2yWUenxUo5dIYVU296qH1HeFHkeu/FUBnpNNv1Rq9UoWjUFDEpSFoAscMG
 jtXIb43eauObHOU4W8cbvtWLjBZhttAi1T4KfGj47a8m8D4LQbUhBI0lrXoLn8sRkXQzzO6rk
 9+gzXXH
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Mon, 03 Oct 2022 22:13:55 -0000

The following changes since commit c8de6ec63d766ca1998c5af468483ce912fdc0c2:

  Merge tag 'pull-request-2022-09-28' of https://gitlab.com/thuth/qemu into staging (2022-09-28 17:04:11 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request

for you to fetch changes up to 4a4a74bf439910e957db42405a3abefdf867516a:

  docs: Update TPM documentation for usage of a TPM 2 (2022-10-04 00:10:11 +0200)

----------------------------------------------------------------
Pull request trivial patches branch 20220930-v2

----------------------------------------------------------------

Bernhard Beschow (1):
  hw/virtio/vhost-shadow-virtqueue: Silence GCC error
    "maybe-uninitialized"

Markus Armbruster (2):
  Drop superfluous conditionals around g_free()
  Use g_new() & friends where that makes obvious sense

Matheus Tavares Bernardino (1):
  checkpatch: ignore target/hexagon/imported/* files

Philippe Mathieu-Daudé (1):
  block/qcow2-bitmap: Add missing cast to silent GCC error

Stefan Berger (1):
  docs: Update TPM documentation for usage of a TPM 2

Tong Zhang (1):
  mem/cxl_type3: fix GPF DVSEC

Wang, Lei (1):
  .gitignore: add .cache/ to .gitignore

 .gitignore                         |  1 +
 block/qcow2-bitmap.c               |  2 +-
 docs/specs/tpm.rst                 | 44 ++++++++++++++++--------------
 hw/mem/cxl_type3.c                 |  2 +-
 hw/remote/iommu.c                  |  2 +-
 hw/virtio/vhost-shadow-virtqueue.c |  2 +-
 hw/virtio/virtio-crypto.c          |  2 +-
 migration/dirtyrate.c              |  4 +--
 replay/replay.c                    |  6 ++--
 scripts/checkpatch.pl              |  1 +
 softmmu/dirtylimit.c               |  4 +--
 target/i386/kvm/kvm.c              | 12 +++-----
 target/i386/whpx/whpx-all.c        | 14 ++++------
 13 files changed, 47 insertions(+), 49 deletions(-)

-- 
2.37.3


