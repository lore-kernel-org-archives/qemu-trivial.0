Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3i5J-0003IG-5I
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2013 03:41:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3i5C-00037P-Ms
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 03:41:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3i58-000825-05
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 03:41:30 -0400
Received: from hall.aurel32.net ([2001:470:1f0b:4a8::1]:56964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1V3i57-00081t-Ol; Mon, 29 Jul 2013 03:41:25 -0400
Received: from anguille.univ-lyon1.fr ([134.214.4.207] helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <aurelien@aurel32.net>)
	id 1V3i55-0007b4-Nt; Mon, 29 Jul 2013 09:41:23 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1V3i50-0003A3-63; Mon, 29 Jul 2013 09:41:18 +0200
Date: Mon, 29 Jul 2013 09:41:18 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130729074118.GB2102@ohm.aurel32.net>
References: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
	<20130728223710.GF10155@hall.aurel32.net>
	<51F6080B.30904@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <51F6080B.30904@msgid.tls.msk.ru>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f0b:4a8::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Remove assignment to a
 variable which is never used
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
X-List-Received-Date: Mon, 29 Jul 2013 07:41:36 -0000

On Mon, Jul 29, 2013 at 10:13:31AM +0400, Michael Tokarev wrote:
> On 29.07.2013 02:37, Aurelien Jarno wrote:
> >On Thu, Jul 25, 2013 at 10:10:31PM +0200, Stefan Weil wrote:
> >>This assignment causes a compiler warning for compilations with the compiler
> >>option -Wunused-but-set-variable (which is included with -Wextra).
> >>
> >>Removing it allows using -Wextra for QEMU code without suppressing too many
> >>extra warnings.
> >>
> >>Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >>---
> >>  target-mips/op_helper.c |    1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >>diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> >>index 5cf1c3f..b828375 100644
> >>--- a/target-mips/op_helper.c
> >>+++ b/target-mips/op_helper.c
> >>@@ -1735,7 +1735,6 @@ target_ulong helper_evpe(CPUMIPSState *env)
> >>  void helper_fork(target_ulong arg1, target_ulong arg2)
> >>  {
> >>      // arg1 = rt, arg2 = rs
> >>-    arg1 = 0;
> >>      // TODO: store to TC register
> >>  }
> >
> >Thanks, applied.
> 
> FWIW, you're applying this (and "linux-user: correct argument number ..")
> 3 days after I sent a pull request for trivial-patches which includes
> these patches.

Sorry about that, I haven't seen it was applied to this tree.

> Should I rebase and re-issue my pull request now?

Git is smart enough to handle that, you don't need to redo the pull
request, which btw I have pulled.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

