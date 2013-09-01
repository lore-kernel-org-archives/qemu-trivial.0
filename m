Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9R6-0002qH-Rh
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:19:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9R0-0002hC-Oo
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:19:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9Qv-0005wo-Sj
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:19:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9Ql-0005ur-8v; Sun, 01 Sep 2013 11:19:11 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4E987400BA;
	Sun,  1 Sep 2013 19:19:10 +0400 (MSK)
Message-ID: <52235AEE.10103@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:19:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Jan Krupa <JKrupa@suse.com>
References: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
	<1377616488-16491-2-git-send-email-JKrupa@suse.com>
	<1377616488-16491-3-git-send-email-JKrupa@suse.com>
In-Reply-To: <1377616488-16491-3-git-send-email-JKrupa@suse.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH 2/3] qemu-char: add Czech keymap file
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
X-List-Received-Date: Sun, 01 Sep 2013 15:19:31 -0000

27.08.2013 19:14, Jan Krupa wrote:
> This patch adds Czech keyboard layout to available keymap files.
>
> Signed-off-by: Jan Krupa <jkrupa@suse.com>
> ---
>   pc-bios/keymaps/cz |   94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 94 insertions(+), 0 deletions(-)
>   create mode 100644 pc-bios/keymaps/cz

This file is useles without a corresponding change to Makefile
(search for KEYMAPS= there).  Please add it there as well (either
in a separate patch or include it into this one).

Speaking of the keymap itself, and of the chars added in patch1,
I for one can't verify these, so I take it as granted.  After
all, this appears to be first attempt to implement cz keymap
in all these years...

Thanks,

/mjt

