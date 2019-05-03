Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWDu-00084s-G0
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:19:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWDr-000839-RN
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWDq-00015T-Sr
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:19:23 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39871)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWDo-00010S-Is; Fri, 03 May 2019 07:19:20 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M4384-1hMWDQ3I3M-0006tJ; Fri, 03 May 2019 13:18:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri,  3 May 2019 13:18:20 +0200
Message-Id: <20190503111832.30316-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oF4eB/eiUU74kK7uJJHtrGiB6zVz+E7dOmC5/9PXAC0QCkSa7nS
	Rt5WCpOz1Nv3JetaLJ09lpB8Wkaj7tMqqBK8UCtVLxr/PwLtfxWKyGQJVL764e+A3lFTSEE
	2Twh88F5MdXcy+io2jg21sK1ZyDPjnpmCHw2E71htSJkjaLnEqIdCgMRy9y1ZStP/+IHeOZ
	ZKbDGY92Q4pOM5a3FMS2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eQdT8VKM/OY=:PX1p5N04E4WSpf+iRLcsD6
	npl95+0WcDG0x/ZjHU0Th7x+gfOulIAo7yaoTzPZNMroiqiuYIvexhReHgFLfDnNFv/4p8L2l
	Uph2GVHsub316HXlYtx05uUp1I1b4wkT10QSpYkci30pLJrQo/o3tE0L3AjzgOwt7LxTVAIYK
	i7IODN+fjBC94Hpeu7Id/fH527HsK0gH5veln1UW9QDFuZ+sFInAFZj+07Z+fHpOELW/s0yER
	7jRWFAf5xJvR9nlIvcMbizBl8EY20DvmiV+1TJvNceQBK1kVCzs8dS3ecvzP9bQsGeWsTSiek
	0LHT41Lp/VvvLewwFc4z7cnBvFPtFjXlQbqQ5XfMHK0QeYKP/Tqwj8MC6DhLehRslNYH6qp+V
	trcJ5SR2ykwovGNHBOwRFUkUIL7xPvTYWmkayQZ9P2HO0RLNnElN+tfrWpiXkYmuKBeutM/dg
	bc48qLLQuFEVEAgOP1HU7nJBqBvWHykH7UheE3yA0vtuFwCsrZDFUkHynIuLj9pfPlLWPcnxa
	570ELq21yjPlt2BbEu3TZcYaNT+jCqUOU1HQBEoeov8tr3NRh21Qzb915W+G4wcIXTvJTb518
	mlVec4sAbZAZHcguvdbXHSRE6vNLmspq0WfSFHA/q6gYxjIUHD3qTXqi06a8PBquQrnpD0UQe
	GZGuVKQcyZQomLXN3dNvROT1UVHeP2u3x1WZpyaxPfo3D/OkfHcbh4Ko1d91qO6Q4Ka8/0S7O
	uDlOVdQpa41+n6N8de8P2fK2e0PJKTHj9rRUULUqRGVvDgLmDmvFy/NzHU8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL v2 00/12] Trivial branch patches
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
X-List-Received-Date: Fri, 03 May 2019 11:19:24 -0000

The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea26511e41df:

  Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request' into staging (2019-05-02 12:04:51 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 2d2023c3b99edb33ad4bb9791f70456ea1a1c049:

  sockets: avoid string truncation warnings when copying UNIX path (2019-05-03 13:03:04 +0200)

----------------------------------------------------------------
Pull request trivial branch 2019-05-03

----------------------------------------------------------------

Aruna Jayasena (1):
  Header cleanups

Daniel P. Berrangé (1):
  sockets: avoid string truncation warnings when copying UNIX path

Dr. David Alan Gilbert (1):
  configure: fix pam test warning

Marc-André Lureau (1):
  doc: fix the configuration path

Philippe Mathieu-Daudé (3):
  hw/net/pcnet: Use qemu_log_mask(GUEST_ERROR) instead of printf
  Makefile: Let the 'clean' rule remove qemu-ga.exe on Windows hosts
  hw/sparc/leon3: Allow load of uImage firmwares

Stefan Weil (1):
  Update configure

Thomas Huth (1):
  net: Print output of "-net nic, model=help" to stdout instead of
    stderr

Wei Yang (3):
  CODING_STYLE: specify the indent rule for multiline code
  CODING_STYLE: indent example code as all others
  qom: use object_new_with_type in object_new_with_propv

 qemu-ga.texi              |  4 ++--
 configure                 |  5 ++---
 Makefile                  | 11 +++++----
 include/exec/cpu-common.h |  3 ---
 hw/net/pcnet.c            |  4 +++-
 hw/sparc/leon3.c          |  4 ++++
 net/net.c                 |  7 +++---
 qom/object.c              |  2 +-
 util/qemu-sockets.c       | 12 ++++++----
 CODING_STYLE              | 47 +++++++++++++++++++++++++++++++++++----
 10 files changed, 74 insertions(+), 25 deletions(-)

-- 
2.20.1


