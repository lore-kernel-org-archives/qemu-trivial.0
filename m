Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmvY1-0002DM-56
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 20:37:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Umv7w-0004Bi-5S
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 20:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Umv7u-0001wI-8D
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 20:10:56 -0400
Received: from cantor2.suse.de ([195.135.220.15]:60366 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Umv7o-0001uH-8V; Wed, 12 Jun 2013 20:10:48 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B8825A535C;
	Thu, 13 Jun 2013 02:10:46 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=koi8-r
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <51B90D81.1020000@ozlabs.ru>
Date: Thu, 13 Jun 2013 02:10:43 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF248D0E-36D7-403D-83BF-8F966459D299@suse.de>
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
	<9CFAF006-9051-4997-9213-1BD87191EE9E@suse.de>
	<51B90D81.1020000@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Wed, 12 Jun 2013 20:37:52 -0400
Cc: qemu-trivial@nongnu.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] spapr: add yet another maintainer
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
X-List-Received-Date: Thu, 13 Jun 2013 00:10:57 -0000


On 13.06.2013, at 02:08, Alexey Kardashevskiy wrote:

> On 06/13/2013 12:33 AM, Alexander Graf wrote:
>>=20
>> On 12.06.2013, at 16:27, Alexey Kardashevskiy wrote:
>>=20
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>> MAINTAINERS |    1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 13c0cc5..1e00bb1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
>>> sPAPR
>>> M: David Gibson <david@gibson.dropbear.id.au>
>>=20
>> David should get removed here then, no?
>=20
> Well, at least sometime he is a qemu-ppc maintainer :) Don't know and =
I am
> not the one to decide.

Yup, hence David should send a patch to remove himself and add you =
instead, if that's what he sees fit. Otherwise I'd like a patch from =
David removing himself only for now.


Alex


