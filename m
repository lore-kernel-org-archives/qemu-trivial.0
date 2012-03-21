Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAKlL-0001XU-Ek
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 08:35:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SAKlE-0001CZ-9A
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 08:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SAKl5-0008V6-UZ
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 08:35:27 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51000 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SAKkz-0008Tz-Lm; Wed, 21 Mar 2012 08:35:13 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 4CCE594056;
	Wed, 21 Mar 2012 13:35:12 +0100 (CET)
Message-ID: <4F69CB00.10002@suse.de>
Date: Wed, 21 Mar 2012 13:35:12 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1330479314.29508.7.camel@nzhmlwks0057.ad.endace.com>
	<1332307597.20383.2.camel@nzhmlwks0057.ad.endace.com>
	<m3r4wmm93l.fsf@blackfin.pond.sub.org>
In-Reply-To: <m3r4wmm93l.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: alexey.korolev@endace.com, qemu-trivial@nongnu.org,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typo in i400FX chipset
	init code
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
X-List-Received-Date: Wed, 21 Mar 2012 12:35:33 -0000

Am 21.03.2012 13:28, schrieb Markus Armbruster:
> Alexey Korolev <alexey.korolev@endace.com> writes:
>=20
>>> Hi,
>>>
>>> There is a typo in i440FX init code. This is causing problems when
>>> somebody wants to access 64bit PCI range.
>>>
>>>
>>> Signed-off-by: Alexey Korolev <alexey.korolev@endace.com>
>>> ---
>>>
>>>  hw/piix_pci.c |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/hw/piix_pci.c b/hw/piix_pci.c
>>> index 3ed3d90..aab8188 100644
>>> --- a/hw/piix_pci.c
>>> +++ b/hw/piix_pci.c
>>> @@ -353,7 +353,7 @@ PCIBus *i440fx_init(PCII440FXState **pi440fx_stat=
e, int *piix3_devfn,
>>>      b =3D i440fx_common_init("i440FX", pi440fx_state, piix3_devfn, i=
sa_bus, pic,
>>>                             address_space_mem, address_space_io, ram_=
size,
>>>                             pci_hole_start, pci_hole_size,
>>> -                           pci_hole64_size, pci_hole64_size,
>>> +                           pci_hole64_start, pci_hole64_size,
>>>                             pci_memory, ram_memory);
>>>      return b;
>>>  }
>>>
>>>
>>>
>> Hi there,
>>
>> Any chance that someone could have a look and commit this?
>=20
> Stefan, would you like to take this through your trivial queue?

Not without fixing up the commit message, please. CC'ing mst since this
is a PCI issue and not some random unmaintained area of code.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

