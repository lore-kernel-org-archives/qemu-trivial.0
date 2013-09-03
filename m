Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGoco-000422-5n
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 07:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGoch-0003lE-3d
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 07:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGocb-0000iy-4P
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 07:18:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGocN-0000J2-LV; Tue, 03 Sep 2013 07:17:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2BB8D40431;
	Tue,  3 Sep 2013 15:17:46 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id B5678215;
	Tue,  3 Sep 2013 15:17:45 +0400 (MSK)
Message-ID: <5225C559.2030601@msgid.tls.msk.ru>
Date: Tue, 03 Sep 2013 15:17:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com> <52259F6E.3000205@suse.de>
In-Reply-To: <52259F6E.3000205@suse.de>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	liguang <lig.fnst@cn.fujitsu.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: remove dead function
	tlb_update_dirty
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
X-List-Received-Date: Tue, 03 Sep 2013 11:18:21 -0000

03.09.2013 12:35, Andreas F=E4rber wrote:
> I also don't understand why qemu-trivial is suddenly picking up Stefan'=
s
> arm translation patch, it used to be for unmaintained areas only. But
> arm is not my problem.

Which patch you're talking about?  Is it "target-arm: Report unimplemente=
d
opcodes (LOG_UNIMP)" ?  If yes, that one appears to be trivial as it just
adds some logging before failing an instruction and should not conflict
with other work being done in this area.  Perhaps I was too aggressive
while picking up the backlog.  We should just draw the line *somewhere*, =
--
eg, it sure is possible to reject spelling fixes for maintained areas
from -trivial (like this arm tree), - will this be productive?

This change (cputlb: remove dead function) appears to be "trivial enough"
for me (after looking at the usage history of this function), and I'd
pick it up without this Andreas's request, too.

As for the "suddenly" - it's not really suddenly, it's because it
has been Cc'd to -trivial (by someone who submitted lots of good
trivial patches before) and actually looks trivial, too.  And also
because subsystem maintainer added his Reviewed-by, apparently (or
hopefully) after noticing it's submitted to -trivial.  I also Cc'd
both maintainers in my notice that it's been applied to -trivial.

Speaking of linux headers sync, I did that once indeed, but don't think
it was a good idea.  It is "trivial" in a sense that it just makes
headers in qemu to be the same as in current kernel (this is easy to
verify), and the tree - at least in some configuration - compiles.
But indeed, the side effects might be quite a bit unexpected and
"non-trivial" - in other words, it is a "trivial change with
non-trivial possible consequences".

HTH.

/mjt

