Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XAwFr-0005kc-KK
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jul 2014 03:18:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XAwFl-0005Zr-KJ
	for qemu-trivial@nongnu.org; Sat, 26 Jul 2014 03:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XAwFg-00070Q-Gv
	for qemu-trivial@nongnu.org; Sat, 26 Jul 2014 03:18:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XAwFS-0006v6-Ol; Sat, 26 Jul 2014 03:18:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 38EAC4543E;
	Sat, 26 Jul 2014 11:18:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 23BA86BD;
	Sat, 26 Jul 2014 11:18:22 +0400 (MSK)
Received: (nullmailer pid 17843 invoked by uid 1000);
	Sat, 26 Jul 2014 07:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 26 Jul 2014 11:18:20 +0400
Message-Id: <1406359101-17791-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL for-2.1] Trivial patch for 2014-07-26
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
X-List-Received-Date: Sat, 26 Jul 2014 07:18:54 -0000

There's just one trivial patch this time, fixing another
occurence of "allows to" in help text.  Please consider
applying for 2.1.

Thanks,

/mjt

The following changes since commit c60a57ff497667780132a3fcdc1500c83af5d5c0:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2014-07-25 16:58:41 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-07-26

for you to fetch changes up to 2f47b403bd494b6717ef14c0d278d4b2d364b382:

  qemu-options: fix another allows-to for -net l2tpv3 (2014-07-26 11:16:44 +0400)

----------------------------------------------------------------
trivial patches for 2014-07-26

----------------------------------------------------------------
Michael Tokarev (1):
      qemu-options: fix another allows-to for -net l2tpv3

 qemu-options.hx |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

