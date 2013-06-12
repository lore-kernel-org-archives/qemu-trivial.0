Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmgkG-0005Op-CD
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 04:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmgkC-0005EZ-NY
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 04:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmgkB-0004nH-An
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 04:49:28 -0400
Received: from cantor2.suse.de ([195.135.220.15]:53840 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Umgk5-0004m3-D0; Wed, 12 Jun 2013 04:49:21 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 76E98A51CB;
	Wed, 12 Jun 2013 10:49:19 +0200 (CEST)
Message-ID: <51B8360D.8060603@suse.de>
Date: Wed, 12 Jun 2013 10:49:17 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
	<1370249911-19708-3-git-send-email-stefanha@redhat.com>
	<51AC8B6E.9040002@redhat.com>
	<20130603131132.GA29131@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130603131132.GA29131@stefanha-thinkpad.redhat.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Cam Macdonell <cam@cs.ualberta.ca>,
	Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/2] ivshmem: add missing
	error exit(2)
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
X-List-Received-Date: Wed, 12 Jun 2013 08:49:30 -0000

Am 03.06.2013 15:11, schrieb Stefan Hajnoczi:
> On Mon, Jun 03, 2013 at 06:26:22AM -0600, Eric Blake wrote:
>> On 06/03/2013 02:58 AM, Stefan Hajnoczi wrote:
>>> If the user fails to specify 'chardev' or 'shm' then we cannot contin=
ue.
>>> Exit right away so that we don't invoke shm_open(3) with a NULL point=
er.
>>>
>>> It would be nice to replace exit(1) with error returns in the PCI dev=
ice
>>> .init() function, but leave that for another patch since exit(1) is
>>> currently used elsewhere.
>>>
>>> Spotted by Coverity.
>>>
>>> Cc: Cam Macdonell <cam@cs.ualberta.ca>
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  hw/misc/ivshmem.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
>>> index a19a6d6..5658f73 100644
>>> --- a/hw/misc/ivshmem.c
>>> +++ b/hw/misc/ivshmem.c
>>> @@ -735,6 +735,7 @@ static int pci_ivshmem_init(PCIDevice *dev)
>>> =20
>>>          if (s->shmobj =3D=3D NULL) {
>>>              fprintf(stderr, "Must specify 'chardev' or 'shm' to ivsh=
mem\n");
>>> +            exit(1);
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>
>> However, I prefer exit(EXIT_FAILURE) rather than exit(1), to make it a
>> bit easier to grep for known failure exits.  Libvirt has a syntax
>> checker (taken from gnulib) that enforces such a style, if qemu would
>> like to adopt that style.
>=20
> I like EXIT_FAILURE too but the rest of the file inconsistently uses
> exit(1) and exit(-1).  I decided exit(1) was the least evil but the
> longer term fix is to return instead of exiting.

QOM realize would solve that, but similar to virtio the PCI qdev initfn
actually does something (allocating the config region among others) so
faces the same design questions of how to best inherit QOM methods as
currently being discussed. Shouldn't hold up a bug fix like this one.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

