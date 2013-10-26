Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0Em-000276-RF
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Eg-0001uF-8S
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Eb-00085w-9e
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0EN-00083s-Le; Sat, 26 Oct 2013 05:32:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B000E4390F;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 54752213;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: (nullmailer pid 19455 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:20 +0400
Message-Id: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 0/7 for-1.7] Trivial patches for 2013-10-26
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Oct 2013 09:32:51 -0000

This is a 2-week pull request, I haven't asked for pull
a week ago since we had not much stuff happening on
"trivial front".

Please consider pulling.

Thanks,

/mjt

The following changes since commit fc8ead74674b7129e8f31c2595c76658e56221=
97:

  Merge remote-tracking branch 'qemu-kvm/uq/master' into staging (2013-10=
-18 10:03:24 -0700)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 203cea22a3d33ac86d170af74f8c655f119c8c62:

  audio/mixeng_template.h: fix inline declaration (2013-10-26 13:09:34 +0=
400)

----------------------------------------------------------------
Alex Bligh (1):
      audio/mixeng_template.h: fix inline declaration

Eric Blake (1):
      qapi: fix documentation example

Fam Zheng (1):
      .gitignore: ignore qmp-commands.txt

Michael Tokarev (1):
      configure: create fsdev/ directory

Stefan Weil (2):
      misc: New spelling fixes in comments
      misc: Spelling and grammar fixes in comments

WengFan (1):
      docs/ccid.txt: fix the typo

 .gitignore               |    2 +-
 audio/mixeng_template.h  |    4 ++--
 block/iscsi.c            |    2 +-
 configure                |    1 +
 docs/ccid.txt            |    2 +-
 docs/qapi-code-gen.txt   |    2 +-
 hw/ppc/spapr.c           |    2 +-
 qapi-schema.json         |    2 +-
 slirp/if.c               |    2 +-
 target-alpha/translate.c |    2 +-
 tests/test-throttle.c    |    4 ++--
 ui/vnc-enc-zywrle.h      |    2 +-
 12 files changed, 14 insertions(+), 13 deletions(-)


