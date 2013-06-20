Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpaXZ-0003cZ-JN
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jun 2013 04:48:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1UpaXW-0003ZZ-Rl
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 04:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1UpaXV-0006Kf-Ar
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 04:48:22 -0400
Received: from cantor2.suse.de ([195.135.220.15]:50544 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1UpaXR-0006GG-SR; Thu, 20 Jun 2013 04:48:17 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9729BA50E4;
	Thu, 20 Jun 2013 10:48:15 +0200 (CEST)
References: <1371676109-16313-1-git-send-email-sw@weilnetz.de>
	<44C4E791-957F-4B61-BE3D-DDB1E3F2238D@suse.de>
	<51C28EB0.3040508@msgid.tls.msk.ru>
Mime-Version: 1.0 (1.0)
In-Reply-To: <51C28EB0.3040508@msgid.tls.msk.ru>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Message-Id: <FF3884BC-C32C-439A-AAD1-56043E7BA70A@suse.de>
X-Mailer: iPhone Mail (10B142)
From: Alexander Graf <agraf@suse.de>
Date: Thu, 20 Jun 2013 10:48:15 +0200
To: Michael Tokarev <mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pseries: Fix compiler
	warning (conversion of pointer to integral value)
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
X-List-Received-Date: Thu, 20 Jun 2013 08:48:24 -0000



Am 20.06.2013 um 07:10 schrieb Michael Tokarev <mjt@tls.msk.ru>:

> 20.06.2013 01:40, Alexander Graf wrote:
>>=20
>> On 19.06.2013, at 23:08, Stefan Weil wrote:
>>=20
>>> This kind of type cast must use uintptr_t or target_ulong to be portable=

>>> for hosts with sizeof(void *) !=3D sizeof(long).
>>>=20
>>> Here the value is assigned to a variable of type target_ulong.
>>>=20
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>=20
>> Acked-by: Alexander Graf <agraf@suse.de>
>>=20
>> I suppose this one goes through the trivial tree?
>=20
> Anything which goes to -trivial can be applied directly or
> into some other subsystem tree first.  When I send a pull
> request I rebase trivial tree ontop of current master and
> filter out anything which has been already applied, so that's
> not an issue.  The only possible issue is when you applied
> it to some other tree, and -trivial pull request were handled
> before that other tree - how that will be handled by git?
>=20
> Will it complain (so that the situation should be resolved
> manually), will it apply nothing or will it appy an empty
> patch?  (the patch signature will be different, with
> different S-o-b.)  I think I've seen empty commits before
> in qemu tree, with the same subject/author as some previous
> commit.

It depends on how you handle the tree. I rebase ppc-next too, so the commit w=
ould simply vanish.

I'll apply it to ppc-next as well then.


Alex


