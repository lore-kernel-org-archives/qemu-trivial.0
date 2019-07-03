Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hih8V-00007g-Dq
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2019 11:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39913)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hih8Q-00006V-Qv
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hih8M-0007Oe-Vm
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:25:26 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:52003)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hih8L-0007MJ-2k; Wed, 03 Jul 2019 11:25:22 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MsZeX-1iXu6g0mnj-00u1lA; Wed, 03 Jul 2019 17:25:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Amit Shah <amit@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Date: Wed,  3 Jul 2019 17:25:11 +0200
Message-Id: <20190703152513.29166-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gND+3XxiSssqpgSROM9KhdPJJtssIGci3B5o7MLOWAawL6WRIC2
 vTzxATdxPZFSj8jcSJO8u6jsSD1t0SjHREqiFgLxM6EjB8IbzJgoAIRbSEoIPF7/FE8xReb
 6uNTJ6ypGOO7Qt9O4Kor6LCdLCKRnLrSqR1ywtjGQEJqXuPlE9I9coYlphZhReqnVV/NH3z
 zlCw9IEPxDrgnmCfQwGmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5crU/5KEY9w=:TaftfNzQVpFbNdrn0nFxAC
 5PwmyasuWn1lKXvreTyC4/OMGqbigug49ab7OdMVe2iHSwPc3q8xNpQvvc3CwwAZVE7xYM5D1
 Jq+XYpCAfy7lNvu7TqdedUfdv7YwBsIjWf/4f6ag+ZbCc4x3Y3MaxME71SbS8g8w8I/LwwefF
 9yYZaV+6JEVsWljgwIxteLuw1gG4JXjkQWSDnta4yW3qr3IM6SpDjWR33ZHvpqOY+KD2fOqYi
 /OetzrDuTQnd8jldUmhiovbkiddxFoWc4bHBqIPeVpim4t5NI662nLrXpFGK2KNRki3RBAz1f
 Kt2mLaV7hmIVKcU6VnJWPTMKq6eDnf19JVXf3dEdPNmqYplx7P70ELmtQ97aGroAa8bsJpkVc
 trmx5dDJcQwIECzi3p6zegdJMc+oFZ4GnVxDf0dJUi8USBYGvJiAzp6lAt9XaLU/A8mILNkbi
 Clzpo2GqNKhebgwPohHCNkNQ8aiiSCvR40a937Gzx8lkcQPjwcVeYIp+EWApyOlzThiPmkoTH
 ZgRyNk+mjXuFmwf5KXX7vSLn2atDShITy7WwMqGCJqexJR6k/Cikc5EWgqLeCYE+SKQfieLqU
 aLP5z2buGBbUbSXwF96rgP61kjstEDQxP1ut/Y4BbQ+CJBBPjc1LCHaYXvRBAMIQjO+rc+V5q
 rjCYF8v3VzosFiychcR0rL6JlpADWSZY7dBvA/9wiTK1S1BL6H7NXByyV1jX8M5h6/NfCKTgV
 UbfigYVeyKy77kxtWuPJvqptR7uE+fUBunvKdUcOFwKPGNGQIgv0Hep/mls=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL v2 0/2] Trivial branch patches
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
X-List-Received-Date: Wed, 03 Jul 2019 15:25:29 -0000

The following changes since commit 7d0e02405fc02a181319b1ab8681d2f72246b7c6:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-patches-pull-request' into staging (2019-07-01 17:40:32 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 2cd925dac80d708d01f124b26de52fb447a333aa:

  docs/devel/testing: Fix typo in dockerfile path (2019-07-03 17:23:39 +0200)

----------------------------------------------------------------
Fix typo, change virtio-rng default to urandom

----------------------------------------------------------------

Kashyap Chamarthy (1):
  VirtIO-RNG: Update default entropy source to `/dev/urandom`

Liam Merwick (1):
  docs/devel/testing: Fix typo in dockerfile path

 backends/rng-random.c  | 2 +-
 docs/devel/testing.rst | 2 +-
 qemu-options.hx        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.21.0


