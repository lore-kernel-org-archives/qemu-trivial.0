Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWmAq-0006su-26
	for mharc-qemu-trivial@gnu.org; Sat, 03 Dec 2011 04:46:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RWmAn-0006jL-Ms
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2011 04:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RWmAm-0007gl-PX
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2011 04:46:21 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:54569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RWmAk-0007eA-Ty; Sat, 03 Dec 2011 04:46:19 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1F74C728188A; Sat,  3 Dec 2011 10:45:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 9GpWbzyYdsEG; Sat,  3 Dec 2011 10:45:26 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8E970728188C; Sat,  3 Dec 2011 10:45:26 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  3 Dec 2011 10:45:25 +0100
Message-Id: <1322905525-354-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_Convert_keymap_file_to_UTF-8?=
	=?utf-8?q?_encoding?=
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
X-List-Received-Date: Sat, 03 Dec 2011 09:46:22 -0000

Most QEMU files either are pure ASCII or use UTF-8.
Convert this keymap file which still used ISO-8859-1 to UTF-8.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 pc-bios/keymaps/is |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/pc-bios/keymaps/is b/pc-bios/keymaps/is
index 21dc1fd..935ac1d 100644
--- a/pc-bios/keymaps/is
+++ b/pc-bios/keymaps/is
@@ -1,4 +1,4 @@
-# 2004-03-16 Halld=F3r Gu=F0mundsson and Morten Lange
+# 2004-03-16 Halld=C3=B3r Gu=C3=B0mundsson and Morten Lange
 # Keyboard definition file for the Icelandic keyboard
 # to be used in rdesktop 1.3.x ( See rdesktop.org)
 # generated from XKB map de, and changed manually
--=20
1.7.0.4


