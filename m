Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qSxvB-0008WI-4R
	for mharc-qemu-trivial@gnu.org; Mon, 07 Aug 2023 06:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qSxv8-0008Uf-2Z; Mon, 07 Aug 2023 06:57:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qSxv6-0001yZ-25; Mon, 07 Aug 2023 06:57:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E9D5218A47;
 Mon,  7 Aug 2023 13:57:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 99BD21BFA2;
 Mon,  7 Aug 2023 13:56:59 +0300 (MSK)
Received: (nullmailer pid 206300 invoked by uid 1000);
 Mon, 07 Aug 2023 10:56:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH trivial for-8.1 0/3] trivial-patches for 2023-08-07
Date: Mon,  7 Aug 2023 13:56:48 +0300
Message-Id: <cover.1691405748.git.mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 07 Aug 2023 10:57:06 -0000

The following changes since commit 9400601a689a128c25fa9c21e932562e0eeb7a26:

  Merge tag 'pull-tcg-20230806-3' of https://gitlab.com/rth7680/qemu into staging (2023-08-06 16:47:48 -0700)

are available in the Git repository at:

  https://gitlab.com/mjt0k/qemu.git tags/trivial-patches-pull

for you to fetch changes up to 6ee960823da8fd780ae9912c4327b7e85e80d846:

  Fixed incorrect LLONG alignment for openrisc and cris (2023-08-07 13:52:59 +0300)

----------------------------------------------------------------
trivial-patches for 2023-08-07

there are 3 trivial bugfixes in there, for 8.1

----------------------------------------------------------------
BALATON Zoltan (1):
      hw/i2c: Fix bitbang_i2c_data trace event

Luca Bonissi (1):
      Fixed incorrect LLONG alignment for openrisc and cris

Michael Tokarev (1):
      stubs/colo.c: spelling

 hw/i2c/bitbang_i2c.c         | 2 +-
 hw/i2c/trace-events          | 2 +-
 include/exec/user/abitypes.h | 8 ++++++++
 stubs/colo.c                 | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.39.2


