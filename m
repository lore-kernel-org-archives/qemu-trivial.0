Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDVlI-0003Q0-Hm
	for mharc-qemu-trivial@gnu.org; Tue, 01 May 2018 09:56:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlG-0003PW-2U
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlB-0007te-8v
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:06 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34481)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fDVlA-0007qc-VY; Tue, 01 May 2018 09:56:01 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue007 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0MVFW5-1eqZwv22xx-00YQmW; Tue, 01 May 2018 15:55:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue,  1 May 2018 15:55:43 +0200
Message-Id: <20180501135547.12414-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:reXoixhmhe8XnwG5u18x1PiwSZhrTaO97dvReQGNYQwjirb75n6
	3/+WRgEYZ0npEJWw3xKKKkl8DqWIJL7pQI2Nfy5kBMWGet5wUHmlrcN6dGLml8meWgrKmKp
	WracKJNr1YeiX0S77FHlRU4EY0x50gUHhDHbYbLx2f0IHyRyAP6/6Jn0GAh8I4LDq46uqbH
	aISoyqSUHEie+t8w2+sAw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:UouQhuw7yw8=:RDNOxit20L+7iCs5b4uuXa
	6JrB7ThpbFWdnggv2XLJ+iiM3MeSqMv6lHyZ62CQxs61wD27wMW8EtyLMXcRk4J3WrVNBGJKf
	pYoo4DSEiRp+ebOc/UYgbZTrkOiHMYiJp6jl1is0t6Hdw5JqBEU0V8EZJOY9k7vGiehqf++xa
	spYfSP4hjUF8KzSojvXOJskOCfpi+gJwfpouiyOn1RV5/iGrmUWrFq/KG3/gZvUarNfYWzs7N
	n+PP5/AqJvI31aAkvPCjENYlqE5HPhaEi6cgE6vnSExAlx8078gXHXZN5U6O1Cc9oVPJQf4vI
	3lpyYrAD3fmgW0k1A6lJ1jIxs2tKFi7YXHGMez8Xg0FZpLs7ftutC87wdydhwzp43/4Q/VdNq
	XcSYDz557o37znB6pop6o5fqTVqsSQ/m5PcthvnKXQfNP9G8y7t0IUfwd8P1sJXib6eBWta7p
	WcJEoTAAQrpBpWx62h7UZbc2twRdkAmfsDJSHhndo6zgASOwjsiXWAGiJjwODunfUfKfPCepN
	CJa6ddoJGwUG36jKBtwTK44w6XKjBIQ4gQ9coakewKrJCtd735Bq7mACxKzzyQcKSsmh6Eg8V
	vpG9ksQLX3/3sFWZY+mcaU+t531nTG9josIhTlAIFSKrKfqog9/QpSYWWc2icRVrFUOqh+CGo
	ysWMji5OxUPwoCHNFK0DbGB861r9iaDcNLF/AbgmKRQ03Ujr8i8+CKgmHcmw67yhJPFCc2OA0
	7ljcV/j4Al9u9uKT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 0/4] M68k for 2.13 patches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2018 13:56:07 -0000

The following changes since commit c2c768500f17fc8cdcfa44d169f089953bb22748:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-2.13-pull-request' into staging (2018-04-30 10:43:41 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu-m68k.git tags/m68k-for-2.13-pull-request

for you to fetch changes up to 83dc62f6ed6b4f2afce71d579a630441cca0957c:

  hw/m68k/mcf5208: Fix trivial typo in board description (2018-05-01 15:37:54 +0200)

----------------------------------------------------------------
Some fixes for m68k CPU emulation
including the trivial one from Thomas for mcf5208 (m68k hardware)
----------------------------------------------------------------

Laurent Vivier (2):
  m68k: Fix floatx80_lognp1 (Coverity CID1390587)
  m68k: remove dead code (Coverity CID1390617)

Pavel Dovgalyuk (1):
  m68k: fix subx mem, mem instruction

Thomas Huth (1):
  hw/m68k/mcf5208: Fix trivial typo in board description

 hw/m68k/mcf5208.c       |  2 +-
 target/m68k/softfloat.c | 46 ++++++++++++++++------------------------------
 target/m68k/translate.c |  4 ++--
 3 files changed, 19 insertions(+), 33 deletions(-)

-- 
2.14.3


