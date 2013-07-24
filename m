Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1ypx-0007uX-WA
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 09:10:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1ypu-0007sg-Rk
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1ypt-0008Vd-Li
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:10:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1ypn-0008UO-CJ; Wed, 24 Jul 2013 09:10:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F22E442B6C;
	Wed, 24 Jul 2013 17:10:18 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id B260150E;
	Wed, 24 Jul 2013 17:10:18 +0400 (MSK)
Message-ID: <51EFD23A.8010405@msgid.tls.msk.ru>
Date: Wed, 24 Jul 2013 17:10:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1374225073-12959-3-git-send-email-mjt@msgid.tls.msk.ru>
	<51EFCC2E.5040804@suse.de>
In-Reply-To: <51EFCC2E.5040804@suse.de>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial 2/5] slirp: remove
 mbuf(m_hdr, m_dat) indirection
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
X-List-Received-Date: Wed, 24 Jul 2013 13:10:37 -0000

24.07.2013 16:44, Andreas F=E4rber wrote:
> Am 19.07.2013 11:11, schrieb Michael Tokarev:
>> ---
>=20
> NACK, this commit in the pull request is lacking Signed-off-bys!
>=20
> The original patch (attachment in reply to "slirp: reorder include to
> fix FreeBSD build failure") had a misspelled "Signed-off-By" from mjt.
> Michael, can you please re-add that and submit a v2 pull?

It has been applied some days ago, so it is too late to add a s-o-b
now.  Which is indeed missing, not intentionally.

Oh well.

/mjt

