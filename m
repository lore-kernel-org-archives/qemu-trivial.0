Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvXZx-00038z-28
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2025 04:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tvXZu-000384-Ap; Fri, 21 Mar 2025 04:18:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tvXZr-0007Wk-2T; Fri, 21 Mar 2025 04:18:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6B91D10549C;
 Fri, 21 Mar 2025 11:16:48 +0300 (MSK)
Received: from gandalf.tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C73C91D0FCA;
 Fri, 21 Mar 2025 11:17:51 +0300 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
 id BBB3056BA5; Fri, 21 Mar 2025 11:17:51 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	qemu-trivial@nongnu.org
Subject: [PULL 0/3] Trivial patches for 2025-03-21
Date: Fri, 21 Mar 2025 11:17:48 +0300
Message-Id: <20250321081751.1999498-1-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 21 Mar 2025 08:18:07 -0000

The following changes since commit 1dae461a913f9da88df05de6e2020d3134356f2e:

  Update version for v10.0.0-rc0 release (2025-03-18 10:18:14 -0400)

are available in the Git repository at:

  https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches

for you to fetch changes up to a028e04c89ea782f03c78db438239cfb7a47b4e9:

  mailmap: Update email address for Akihiko Odaki (2025-03-21 11:15:18 +0300)

----------------------------------------------------------------
trivial patches for 2025-03-21

There's nothing exciting here, -- there was almost no trivial stuff
lately.

----------------------------------------------------------------
Akihiko Odaki (1):
      mailmap: Update email address for Akihiko Odaki

Laurent Vivier (1):
      docs: Explain how to use passt

Michael Tokarev (1):
      Makefile: "make dist" generates a .xz, not .bz2

 .mailmap                    |   1 +
 Makefile                    |   6 +--
 docs/system/devices/net.rst | 100 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+), 3 deletions(-)

