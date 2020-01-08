Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipDnB-0005WF-Mq
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 11:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDn9-0005VV-Fe
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDn8-0001iI-B6
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:02:43 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:34921)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDn8-0001gz-1e; Wed, 08 Jan 2020 11:02:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M277h-1ir8Wz0iYT-002XWE; Wed, 08 Jan 2020 17:02:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Subject: [PULL 0/5] Trivial branch patches
Date: Wed,  8 Jan 2020 17:02:28 +0100
Message-Id: <20200108160233.991134-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:han+nQkylqe3A/S2HyNMjDndNNoLes/6ZXbcmTOqTLGOql7VtAZ
 vFG+8g/DmLaIK00zox4v8ZHUrBHbbBi1VIZW10zTM3fTLgR4uvpL4GdyJ8N381+U4L2QREp
 kpgj3Ol/tdUHYgqTiWdjH+023REbGh+hAfkCefv/8loJmOMxsO/5y/iwtIlYhhC6CtPsW+l
 9kHo02yTnD0Sl8wR0QJjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UAiyEN2Cc2A=:FBcDX6ha6plWvQaSp6P//S
 PWh3vGUu+H2Q5WlNMT31qZiYJDzsLfrr//SEz2hXLdxNDftTeTIcW9HH0soV30Tu9xWFBW1JB
 MWZ2FZHtE3syVyRsrU3fgv3UgN+/ANmjBcKSTwdHIwwOOS5uWDhy3fjD+pHNDhRH8cfQHCIsX
 ez5bSPAn41qrcQlF9z0VQgv6OYnVHMWGvx1QMs02gn4mKYA75Jun6tZhh6cbrmmHDGoSwiw/P
 3kG4ZKbzzxLYn9XmjHjYZahnl+CuB6Xuj2PvnYD9qo+xy0JiFpCa9ploNDCgy5Dm2qflwDADt
 QJ8tMoqrh/mhlIEumuKJtgm89oJGzvNUKsp0NMCxzR0C9mZ+U9pMovfa77l70UHXiaitD0AAD
 Wp4nrH3n8KWRJaERuX/cZtBzXzXJN05/iVd5CFe/fFENZvd7wx9qpUJH7hcONVawJK/t7TXcB
 XWIXIRC2hs/qSWXIXxRD+ceY64ZkrwcykOjDv/ZSsdObQhr2FspvlArl3Znfi7Jbsn8x3NBG2
 CrNpxkxH4inNtcBCXSDHNU9ASW+a2dx83FhibVnYNxH7QKXgG68k3p4YSw953Fu4DKLf8KDHV
 UUpZldV78b4nJO6sxy3r7h2umUD8QUnJx91Y+e64mx2KAFSmTyg7rH61shDNJjXKWHtfts8O0
 xlC2kKhQ0iGHaitwSga+oTa279qKXqwK84nodunLyy6/p/a3IjT3fCMaOCluFEcRtu9uDDfcc
 Zzdxu+eX8inGtwqI4BKLK8cNjoifOzMb5E3FqAClEp8oEeeVVkjTlVTESzfsOgeeDgWkhxtXz
 qM0Hr/VYqKYGp5MGowsSQYmkNF1AkyHywm8px4VMYhwqik9rVOG5E2E+j0oaDP1Y68sBpQS46
 lPVer/PeySBo7BLO5TdUnFs1GwojAkuuld1bK7EyY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2020 16:02:44 -0000

The following changes since commit 035eed4c0d257c905a556fa0f4865a0c077b4e7f:

  Merge remote-tracking branch 'remotes/vivier/tags/q800-for-5.0-pull-request' into staging (2020-01-07 17:08:21 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to adb464ff671d124010953aad48dd9194cedc6ff6:

  vl: fix memory leak in configure_accelerators (2020-01-08 16:12:39 +0100)

----------------------------------------------------------------
Fix some uninitialized variable warnings,
some memory leak warnings and update MAINTAINERS file.

----------------------------------------------------------------

Chen Qun (1):
  vl: fix memory leak in configure_accelerators

Pan Nengyuan (3):
  util/module: fix a memory leak
  nbd: fix uninitialized variable warning
  arm/translate-a64: fix uninitialized variable warning

Yuval Shaia (1):
  MAINTAINERS: Update Yuval Shaia's email address

 MAINTAINERS                |  2 +-
 nbd/server.c               | 10 +---------
 target/arm/translate-a64.c |  2 ++
 util/module.c              |  1 +
 vl.c                       |  1 +
 5 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.24.1


