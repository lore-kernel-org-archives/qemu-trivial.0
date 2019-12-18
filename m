Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihYxC-00026O-FD
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 08:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihYx3-0001uY-Ug
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihYx2-0007pd-Jh
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:17 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:43969)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ihYwz-0007RE-CV; Wed, 18 Dec 2019 08:01:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MVe1U-1iIIsB22tQ-00RXmI; Wed, 18 Dec 2019 14:01:07 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 0/7] Trivial branch patches
Date: Wed, 18 Dec 2019 14:00:58 +0100
Message-Id: <20191218130105.125981-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B8ZplYw8Glwj/6TNTnw3i/jgYCZxpqTday4Nxs0wogksvukWWMY
 55PWF6TQMB+b+NphNvRtrnYVLpVevgFGnhdjS0YoYTuqIekxUyBTBxUnEqxSaor8O/9uVn1
 pKkZsqj3jDorgb2iRTs0p3jpOfp4ApdvLsV6FRTO47CKKe8u74Mm6wPb+KBGmhE/92gZ3Qv
 M4NYAzhzpxBLu31WZ5hhA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OA/PsERFB7c=:tMyEkbshoBsP+4fcxRK/gm
 P/VdNt7Pi0emnb4sbmHUcjTn8sITNTTk8fuIe166ZRVvUZ0bMmr0n9oF4/fTm05Qp5+Xk8SNH
 dNKhcGN3D61VUnWl2Nwdm4kLSKGf/7LZS+zp09Fw6vpeaedGF4wUzsSRUxfh6SDdWxkwFUCDW
 PW6Lqv8Y6LjxuSOjd4rATzKOYD4pmQsEJ6z6QlwJP8v/J+xIpm3P6XaQAILqiZU97LTOw832Q
 5qt59DbSHk4ox/N9mKHMFEdFjDXbXEFUBfAk/JTTM+A78mOOZZazFAgBKy/Q7pLWQUaH8dx/+
 SHItFqABWeoVkmmEiDk0MjgQSdj4ZTMdSX9Kcgtm6fI0RNU1o4mGkgoV4zjHkzsILcU93I27R
 dcdvypagLNFzjj89x3ZNWDWisu5cE1rTOBvocoC8J8O51HAazfKbPdXBWfO/Mt1WhzYPiRdkG
 DAQDVDlwRMxepiXTWM/SWit29SsEPMeLc0si/4wtQBYfnW8AU8HQOr77UmYwa5e6Cv0vXniA7
 wqE3lnjaDaT2NxvdgMI2rPj0PgEvT5h6f7NKlxU/4fr76PtrTTXeYQOBubm3HvalKvpP/agLH
 5lkXupnzY6e8Xr/3jXnsOvgdEcbWuGUwonVq4SVXBFr9HzTppSCQwJKBQDyB2RFmfvn3GK48t
 Da65+0TvT6K2ALdtPs0Bt6aTqwzWMVVesjMZPhiZbNpNdaBDKowsrrP9Dc1dzPUf0kxJXB/8K
 4piPMd1ChPR3V08zwnfac/O42QRaNGcKIXxmTmESy/9HX9rAyGeFMXitdNW4bPn8F414BdON1
 32QtBvI4mQ4vTKUa5ng84Z9A0cyHaSM6ZlS12+DUaFSvrXgEdZ6CPIh1dCWWQVfHAWpWzpHyD
 gbdeA+2uJO1Ym5vUmENkdctNcVxqIQS+lvzzF8BE4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
X-List-Received-Date: Wed, 18 Dec 2019 13:01:24 -0000

The following changes since commit aceeaa69d28e6f08a24395d0aa6915b687d0a681:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-12-17' into staging (2019-12-17 15:55:20 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 80bc935eaaf93e5b9a4efe97abd7c51d645f2612:

  qemu-doc: Remove the unused "Guest Agent" node (2019-12-18 13:31:01 +0100)

----------------------------------------------------------------
Trivial fixes (20191218)

----------------------------------------------------------------

Han Han (1):
  Revert "qemu-options.hx: Update for reboot-timeout parameter"

Markus Armbruster (2):
  util/cutils: Turn FIXME comment into QEMU_BUILD_BUG_ON()
  test-keyval: Tighten test of trailing crap after size

Philippe Mathieu-Daudé (1):
  MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section

Thomas Huth (2):
  target/sparc: Remove old TODO file
  qemu-doc: Remove the unused "Guest Agent" node

Yury Kotov (1):
  monitor: Remove unused define

 MAINTAINERS         |  1 +
 monitor/misc.c      |  3 --
 qemu-doc.texi       |  1 -
 qemu-options.hx     |  4 +--
 target/sparc/TODO   | 88 ---------------------------------------------
 tests/test-keyval.c |  2 +-
 util/cutils.c       |  8 +++--
 7 files changed, 9 insertions(+), 98 deletions(-)
 delete mode 100644 target/sparc/TODO

-- 
2.24.1


