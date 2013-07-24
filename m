Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1z7Y-0007SL-3J
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 09:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V1z7W-0007Po-Fv
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:28:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V1z7V-0006PX-Ck
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:28:46 -0400
Received: from cantor2.suse.de ([195.135.220.15]:57717 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V1z7R-0006Nq-F9; Wed, 24 Jul 2013 09:28:41 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1BCADA3B99;
	Wed, 24 Jul 2013 15:28:40 +0200 (CEST)
Message-ID: <51EFD685.7010403@suse.de>
Date: Wed, 24 Jul 2013 15:28:37 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAPyFy2BLhkY6hRhadiwP8xeqAyTBLNuG2rT+GuT+bNUQj5EZ5g@mail.gmail.com>
In-Reply-To: <CAPyFy2BLhkY6hRhadiwP8xeqAyTBLNuG2rT+GuT+bNUQj5EZ5g@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial 0/5] trivial patches
 for 2013-07-19
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
X-List-Received-Date: Wed, 24 Jul 2013 13:28:47 -0000

Am 24.07.2013 14:24, schrieb Ed Maste:
> On 19 July 2013 05:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> This is another trivial-patches pull request.  This time
>> we have just 5 patches accumulated in two (!) weeks period.
>> Please consider apply.
> ...
>> Michael Tokarev (2):
>>       slirp: remove mbuf(m_hdr,m_dat) indirection
>=20
> Any idea when this might get pulled?  The FreeBSD build is broken
> until this slirp fix makes it in.

What problem are you seeing? The pull is already merged apparently.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

