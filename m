Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGN8-0000ow-4f
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:29:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN5-0000mA-TQ
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN5-0000vx-4F
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:19 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:41071)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gZGMx-0000qH-2I; Tue, 18 Dec 2018 09:29:11 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N2m7Q-1hY0Lm0OIm-01365V; Tue, 18 Dec 2018 15:28:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-block@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Collin Walling <walling@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org
Date: Tue, 18 Dec 2018 15:28:47 +0100
Message-Id: <20181218142851.9477-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5vuoYSTcJ+Mt2ssrtg0RP7m2CXUNr4KLKFhRvnH2vWh/3cCzOLa
	rL3eSUM2sokiKDDI0YTkq8wa88Zzr+7t1fOBwoWXnTWzlGMK+8T5e/0nkWn2HQFw+9Fyrp0
	5MIK207Sr1OPTwrT9XfDEoIneJdG16p2L9vgFOeuBfEyD0KGjuzb69jn6KMKkKcELm25107
	GFwQmcqFK4YSAsPl03JkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lyikioX35w0=:CVH7FXIcKilAciVspqMa7J
	DgtRVPQzdk5wIHq2C4fe0SALL4kb4R5dk3n8rMemgGt9qA2CA4LulBfapILa0gVNb1MxhO81s
	iCrM9t+W60ZGmHhMzeX/PfdwRKUKxM72BTVm0vIyX0G+r2dj4y4qXZf2B7qlTHkp8VHctb6qT
	ALC253ZruIWkNDkqEWGaQPaxUHV2LXRfQ8nkVKKl/r/S99ABptiMtyX0HkEWKVIuRIVmfRjdb
	ZMrf79BQCWhBO7uPb975ghvmh45p6lBgCJL7cpmSZQPKtToFmYa31iMu822rP3rkPqqYeqF05
	WPzKQmHL8WglU/KcutPED8obPvkqIjrAVQEzVS9Ij1jCkx2EE+6eMGtsaviUq9l3YCVJsYtM4
	Qq/+3GdKtNSxM9ZlK6PawhFMEpRSUQRcRNra15o9xiH192yyWZBGeb/ayEcknA1uD2WKIpEJ0
	Ms9Ol63TWgBR/1a/FmqB+2dvyRs41W/XeHxbcg4IkM42x3cwDT7zXAFrd/6dERZslGbTsYE8d
	pagoRc+8CtHAgoxYMcKTZglNQ4P86gMH133to32Myny5WB+VX/uTqaxe0XIh/ApJPQQfEzgQp
	hV6AZqoxKqIR5+4vgEPANMoPqnxIOADSfyI5pFnigOEZ7KdDB6fCs0HGex6tjM0bOr3Y+S/EQ
	WwI7X6eKxmjNc59ILKyq8Ytwcw01xpE2qUGIJ4mH7TspAolQThAhjdjL4PKgdmiKY0C1C+RQi
	VyJulKw6q4xz+Ko5/eHpyM9+JyZKyrt109u5JQO92WV6sZjS86gRgEY5TKQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 0/4] Trivial patches patches
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
X-List-Received-Date: Tue, 18 Dec 2018 14:29:20 -0000

The following changes since commit f163448536e5f7ae8905b14547eab37a41a75f6c:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20181216' into staging (2018-12-17 13:04:25 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to b2322003b6389c7c98104c8626ffa342928ba83c:

  error: Remove NULL checks on error_propagate() calls (2018-12-18 14:57:48 +0100)

----------------------------------------------------------------
Trivial patches (2018-12-18)

----------------------------------------------------------------

Emilio G. Cota (1):
  docs/devel/build-system: fix 'softmu' typo

Markus Armbruster (2):
  vl: Use error_fatal to simplify obvious fatal errors (again)
  error: Remove NULL checks on error_propagate() calls

Roman Bolshakov (1):
  i386: hvf: drop debug printf in decode_sldtgroup

 blockdev.c                   | 4 +---
 docs/devel/build-system.txt  | 2 +-
 hw/s390x/s390-pci-bus.c      | 4 +---
 qga/commands-posix.c         | 7 ++-----
 target/i386/hvf/x86_decode.c | 2 --
 vl.c                         | 7 ++-----
 6 files changed, 7 insertions(+), 19 deletions(-)

-- 
2.19.2


