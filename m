Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WcdDR-0004gt-P7
	for mharc-qemu-trivial@gnu.org; Tue, 22 Apr 2014 12:06:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WcdDK-0004We-30
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 12:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WcdDE-0007kr-5Z
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 12:06:30 -0400
Received: from cantor2.suse.de ([195.135.220.15]:39495 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WcdD1-0007Ov-64; Tue, 22 Apr 2014 12:06:11 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D16C3AC4E;
	Tue, 22 Apr 2014 16:06:09 +0000 (UTC)
Message-ID: <53569371.6010404@suse.de>
Date: Tue, 22 Apr 2014 18:06:09 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <5353B7F9.4060803@gmail.com> <5355349E.6060601@redhat.com>
In-Reply-To: <5355349E.6060601@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, aliguori@amazon.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] vl: Avoid to close
 stdout after finish 'writeconfig' option
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
X-List-Received-Date: Tue, 22 Apr 2014 16:06:36 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 21.04.2014 17:09, schrieb Eric Blake:
> On 04/20/2014 06:05 AM, Chen Gang wrote:
>> After finish 'writeconfig' to stdout (with '-'), we want to
>> copy/past the related information mannually, not for redirection
>> ('readconfig' does not support '-').
>>=20
>> So we can not close the stdout, or next options which may use
>> stdout will not be displayed.
>=20
> Grammar, and awkward to read.  May I suggest:
>=20
> vl: avoid closing stdout with 'writeconfig'
>=20
> 'writeconfig' supports output to stdout (with '-'); when that
> happens, we must not close stdout, or further command line options
> that also use stdout will be impacted.  (Although 'writeconfig' was
> copied from 'readconfig', the latter does not have the problem
> because it does not support reading from '-')

Eric, did you intentionally request to change "Avoid" to lowercase?
I was once pointed to https://wiki.gnome.org/Git/CommitMessages as a
template, and starting an English-language heading with an uppercase
letter seems natural, with anything else being too lazy to press Shift.

Personally I find -writeconfig the most straightforward way to
indicate it's an option, just like () makes clear something is a
function. The original subject had an explicit "option", that got lost
for v2.

Regards,
Andreas

- --=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVpNxAAoJEPou0S0+fgE/NBEP/RbA40p75QIWuDBM31PXXZNo
lrIxfLkb9QVvN7ALUsGOEn6Y1bNQWuItfq5YBN0oDDBxWKSHaU2ou8M3TUWIX6S8
ENLPFJzsVGbzsb4pkP0yMMWZdbs+8AChDJ+oZxgtz6eBf90ERYLarL/t8UjnZos4
wKU3alo2j9xf2OfMpqEHvtxcFc9URDZWKjElPLkZDPn5rFEwcaVGu78rDtjNQIU4
z7Ebc7li29Yppz9MrQ6QoXtU5ZGygPlzZ90G5UZc4v0H0u4ObyYInrWbxqryVp2H
k+X173VVpJtPzlhzDkBJPdnwqhoExq7x/n2ujZicRyL95+8ZeoH2kteMRP0eHZYV
TDLOkIq2FXklccn91FVVCk6GfLKLdcgZMotaxYD1EIxp7I9NlzpB0d1EVCgClWMx
AgZ6StOhYt4+72BaLDOT602FHdsVSEnCqsQeBxoDhKWLwKLklKi59vzDGn+wH0Ap
fY33zIW4+YAiXDv3vQg+1k8iG7BauO3cHDVQfbRMzU5zgWORMsm1lsnEv0b3x9YH
PhuG9Ve9J2zrbBQEBe0zx98CyB0tp8L/8w5TUVD3EEmQA9YZP5y7I8WU8mOnvgRa
Rpu3JF6U3KBO99VF0Yyd3K1mTcG4yJzGfxdLdiTIkSDbEV/jc5aoJFltldZWWpsl
DigKmE0VxCFolXJsIsiX
=3D810z
-----END PGP SIGNATURE-----

