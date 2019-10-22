Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iMpUY-00046i-7Z
	for mharc-qemu-trivial@gnu.org; Tue, 22 Oct 2019 04:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMpUV-000423-98
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 04:26:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMpUQ-0004Lg-Cv
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 04:26:07 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47913)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iMpUO-0004Kf-2j; Tue, 22 Oct 2019 04:26:00 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mc1hn-1hjuN00Ng7-00dane; Tue, 22 Oct 2019 10:25:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 0/2] Trivial branch patches
Date: Tue, 22 Oct 2019 10:25:51 +0200
Message-Id: <20191022082553.10204-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kzuY2wXh51v1n+hhHEeiWdtRKrc094DEqYR4R9AIfWNU1eKLfam
 jsLGd4eWbm0ioqL24tWbfVBvG2Ik+YPyDkXTBHIPj7/KVeU+WGfgZtlLJbQWqoBpMG7e0HO
 +RYNUbAfjIBcPCfPMXUCPZNyyM6plNN0TGl/sOdJdfM3EXJ98il+glFu+kEylwwlhHMf6mt
 eW34wzJzzxXl1BKx3Nc2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tHPPXjttYjE=:gj2jxpQE5oqojhcnvlRIcV
 9Wcv75fAH7Kdr1+Qxp7K2X0ooqiLlqh6NKEIOB5CmW+e2ooARoj7BMfvwifV87/AgdAea+qaz
 NWme1J22bmJVqh0wBwAIU0fAzHSRspwACr0ZKdr/Mm/39g9ds/iYseyTm1E+2hI6OtTjXSJH2
 9uJ4m6/+fw5BmC/jIA80GGs+V473kQT2WZ2ywE/AP3p//NETG9BYl8LBCNSy50uYk2XvO7GT6
 dv4vdQlPmoABCNyzRAvmjQR9s5Yst18y/yZwYOWGz2Ol7pz2M0BjVwcOBCa/BPAG6HnujjH3a
 aBcOjP/JDA0Get0qrVZL2LOdqegNaav0fZYhtwXOYBNaBts3VTHshI812orHX3MgYxo3e1zed
 585Id6J/TewqLpNRKzG1BTc+vkyKClFVb85VTa/Umii2Fk18EeglZUfeSpFOWvWHfs/WwXuyh
 ZhT/f8YniCc3rnbYyDiHyL337soQe3U45DxdvsLmQYGI1/q+VPMId3AD2H6gZrrMrwnFJj2aX
 3s1peQ3xmlCG/IYVN04ogU01shpaTCUZetcK3PO3552j1xQF9sRdidKIOuMjeRTK6XgO8mXNr
 NJrZVREDWn9ltk7KWMzYjbuKgB15dZcw+QX9VAlIE2xtESFLhZOHgyjpOxFMVWydbsETDQYb3
 3X0WoEoNhF5TTfmGk5raNA/8V4KVbqk2MuUCuoZAMgN8ZjMCqQ+kHaioKf3Rb92I6wUAzwiCt
 zX9AM97Gbe5lhoDy01j4QR8kswhsvG+zviuEsAq4n4HyCJ34ZkZlAL947HusodI1iTW+1eK1X
 FhxpioWWDulCZvom7snEvvtQnkOHqnewtBGdvAXDi8z8U0r1teqSSpdVsufUNwCXPOSoPIXEA
 uVowQ5ltVQClW7tS9gEDQ98ZsS8/9t3YtmHkidrJI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
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
X-List-Received-Date: Tue, 22 Oct 2019 08:26:09 -0000

The following changes since commit e9d42461920f6f40f4d847a5ba18e90d095ed0b9:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20191018-pull-request' into staging (2019-10-18 14:13:11 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 81864c2e6166c015d30b8d8ae998a5a1238a68e9:

  tests/migration: fix a typo in comment (2019-10-21 18:14:43 +0200)

----------------------------------------------------------------
Documentation update and a typo fix

----------------------------------------------------------------

Mao Zhongyi (1):
  tests/migration: fix a typo in comment

Thomas Huth (1):
  qemu-doc: Remove paragraph about requiring a HD image with -kernel

 qemu-doc.texi            | 4 ----
 tests/migration/stress.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.21.0


