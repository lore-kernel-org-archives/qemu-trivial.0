Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgE8a-0007kv-MA
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 16:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hgE8W-0007kk-7T
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 16:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hgE8O-0000pN-6m
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 16:03:16 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44207)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hgE8H-0000jB-OM
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 16:03:11 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLz3X-1hxTrl1UFl-00HxEF; Wed, 26 Jun 2019 22:02:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Date: Wed, 26 Jun 2019 22:02:48 +0200
Message-Id: <20190626200252.30220-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J4z0zesVEL2KoUQPlh8qoaHWhyBnXCdbzFB7xJLWT7ygyRTg93Z
 4v2VN80V5nUVS2CAhIIQCUGnbyaRpK8F891aIZgj1uUVO1cGxonKWHkr3z6cpq4hd6Her60
 mE3zjEGDtO/yfmIa9M/gQWdyRMCf4/nlC6mhjJoG6iUJZWkVKrc/Z+91IM5GwOsHyteuWjP
 p/Sfc2epeNVXfnfGtmeOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Nv1RcIuKDU=:vCeYhgBfRb+nciuqOYAlqm
 Ci48+G8AT1LiWMpCREAfuCmyB0azJf62qb9qXHh6bB19T077bH+9ohX3O5fSCvucUsfAoHXRr
 6OgvU8tZtwx+j/lyb+en0NkojxYJVGiw3Jp+w4SXRgGR6a2o6D/bld8GDeCs3uWYBl5E2o8gt
 zKrfBpaApZeIh5fTZhvqbDvGljKD7jhILnP3CFG0+qx99Z9KaP1aSDZizwcvRbfuWlXNeUzRe
 43rlYey1tL22Lb2bu7jwdnn2FxwJ7koZ1OZTp9sFAHxqTIeonRzLM0ptKzraHLeLYCFDLlEZ+
 ZYA5EvK2ZhMMW54FRmbnmxGzZLAFjj8qDq2+lfa4RZWLjllC7oZWNLmVh7o+G/RsFbEnigMsm
 625fdJerH1jWybckSkq+4Y5Z2kPYbZKoCBNS7I5SkiaYC5YEB1eps0AlMJ5gRI+3/+r6dleS+
 ew/uIUn+kk/q69F5+OCwYtYOzyHjuIoNwNqo9H2FaSGp5v6RV5Xo8EYMZ6kRysznwsIN4dXL+
 yfCJ2vFgdWT946RiFzZvjo69n6XdBrePPtHDgs6sJ/pZzzFEw7u7Rmb1z3QJYm9FgKWyxvjFJ
 UQxRxkr1W1vtlX1VB2cCExVwCWMC4V9n9YqUSTGswP5+w0nG7oF71+xlizNS5LyQ7BS6o//iL
 oIqgqAj9hJrXYqFGdjiDvpPxpa/xmRbTZp9vf31znIVv7ztOaGLOj7EZJlTtr6JDQ3ziBh33E
 BR/ioY409ZBSdzxPAXas8Nb2pgQyfLWBepKv+aaHqbTUVFtZ04RHQ4OPQ/A=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 0/4] Trivial patches patches
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
X-List-Received-Date: Wed, 26 Jun 2019 20:03:22 -0000

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to b827891d73778eaf962b0536f955194cf4faa424:

  MAINTAINERS: Change maintership of Xen code under hw/9pfs (2019-06-26 18:30:03 +0200)

----------------------------------------------------------------
configure improvements and fixes
MAINTAINERS update

----------------------------------------------------------------

Antonio Ospite (2):
  configure: set source_path only once and make its definition more
    robust
  configure: disallow spaces and colons in source path and build path

Daniel P. Berrangé (1):
  configure: use valid args testing sem_timedwait

Greg Kurz (1):
  MAINTAINERS: Change maintership of Xen code under hw/9pfs

 MAINTAINERS |  3 ++-
 Makefile    |  4 ++++
 configure   | 13 +++++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.21.0


