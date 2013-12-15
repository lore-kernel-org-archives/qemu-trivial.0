Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VsGmy-00025U-Ub
	for mharc-qemu-trivial@gnu.org; Sun, 15 Dec 2013 13:51:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VsGmp-0001ul-Sk
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 13:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VsGmi-00060z-B7
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 13:51:31 -0500
Received: from cantor2.suse.de ([195.135.220.15]:52614 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VsGmT-0005yv-E0; Sun, 15 Dec 2013 13:51:09 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 73CF1ABC7;
	Sun, 15 Dec 2013 18:51:08 +0000 (UTC)
Message-ID: <52ADFA17.2000109@suse.de>
Date: Sun, 15 Dec 2013 19:51:03 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
	<8761qqn496.fsf@moxielogic.com>
In-Reply-To: <8761qqn496.fsf@moxielogic.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Anthony Liguori <aliguori@amazon.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] ping.. Re: [PATCH moxie] Fix bug in
	tlb_fill.
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
X-List-Received-Date: Sun, 15 Dec 2013 18:51:39 -0000

Hi,

Am 15.12.2013 05:10, schrieb Anthony Green:
>=20
> This patch still needs to be applied.  There was some follow-up
> discussion on this patch back in May, but none of it negates the fact
> that this patch needs to be applied.

It introduces a tab, please fix.

Apart from that I believe I reported some inconsistencies between
targets in that function, so "all targets except moxie do it conditional
to FOO" may be a convincing explanation independent of the bug you were
discussing that may or may not be otherwise workaroundable.

And since this is purely in target-moxie I would suggest to simply send
a pull as target maintainer once you have someone trustworthy's
Reviewed-by and it doesn't break `make check`, similar to how it's done
for OpenRISC.

And as usual the warning that I have a patch lying around that changes
the cpu_loop_exit() argument to CPUState, but I may not get to rebasing
that until the holidays, so no imminent conflict.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

