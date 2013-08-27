Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwK-0006ro-Ci
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKyw-0005Wp-Af
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKyp-0006uw-11
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:14:58 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46277 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>)
	id 1VEKyY-0006rl-8h; Tue, 27 Aug 2013 11:14:34 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4F331A0FED;
	Tue, 27 Aug 2013 17:14:32 +0200 (CEST)
From: Jan Krupa <JKrupa@suse.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2013 17:14:45 +0200
Message-Id: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
X-Mailer: git-send-email 1.6.0.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:39 -0400
Cc: qemu-trivial@nongnu.org, Jan Krupa <JKrupa@suse.com>, anthony@codemonkey.ws
Subject: [Qemu-trivial] [PATCH 0/3] qemu-char: keymap changes for Czech and
	Unicode support
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
X-List-Received-Date: Tue, 27 Aug 2013 15:15:06 -0000

I tried to create keymap for Czech keyboard for QEMU. I found out that
some of the keysyms are missing. I added those specific symbols to QEMU
VNC header files plus wrote the whole keyboard layout.

Another issue I hit during keyboard layout creation process is that keysym
to keycode converter inside QEMU doesn't handle U-prefixed Unicode symbols
which are already used for example in Arabic keymap file (pc-bios/keymaps/ar).
I implemented support for handling these characters.

Jan Krupa (3):
  qemu-char: add Czech characters to VNC keysyms
  qemu-char: add Czech keymap file
  qemu-char: add support for U-prefixed symbols

 pc-bios/keymaps/cz |   94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 ui/keymaps.c       |    3 ++
 ui/vnc_keysym.h    |    8 ++++
 3 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 pc-bios/keymaps/cz


