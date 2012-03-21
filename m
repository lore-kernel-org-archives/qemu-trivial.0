Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAKfc-0006Kp-Rd
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 08:29:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SAKfU-0005wh-VP
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 08:29:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SAKfP-0007FR-UU
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 08:29:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1SAKfH-0007E9-FU; Wed, 21 Mar 2012 08:29:19 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LCSViB023075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 08:28:31 -0400
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LCSU1W023405; Wed, 21 Mar 2012 08:28:31 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 4DF076007D; Wed, 21 Mar 2012 13:28:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: alexey.korolev@endace.com
References: <1330479314.29508.7.camel@nzhmlwks0057.ad.endace.com>
	<1332307597.20383.2.camel@nzhmlwks0057.ad.endace.com>
Date: Wed, 21 Mar 2012 13:28:30 +0100
In-Reply-To: <1332307597.20383.2.camel@nzhmlwks0057.ad.endace.com> (Alexey
	Korolev's message of "Wed, 21 Mar 2012 18:26:37 +1300")
Message-ID: <m3r4wmm93l.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Wed, 21 Mar 2012 12:29:39 -0000

Alexey Korolev <alexey.korolev@endace.com> writes:

>> Hi,
>> 
>> There is a typo in i440FX init code. This is causing problems when
>> somebody wants to access 64bit PCI range.
>> 
>> 
>> Signed-off-by: Alexey Korolev <alexey.korolev@endace.com>
>> ---
>> 
>>  hw/piix_pci.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>> 
>> diff --git a/hw/piix_pci.c b/hw/piix_pci.c
>> index 3ed3d90..aab8188 100644
>> --- a/hw/piix_pci.c
>> +++ b/hw/piix_pci.c
>> @@ -353,7 +353,7 @@ PCIBus *i440fx_init(PCII440FXState **pi440fx_state, int *piix3_devfn,
>>      b = i440fx_common_init("i440FX", pi440fx_state, piix3_devfn, isa_bus, pic,
>>                             address_space_mem, address_space_io, ram_size,
>>                             pci_hole_start, pci_hole_size,
>> -                           pci_hole64_size, pci_hole64_size,
>> +                           pci_hole64_start, pci_hole64_size,
>>                             pci_memory, ram_memory);
>>      return b;
>>  }
>> 
>> 
>> 
> Hi there,
>
> Any chance that someone could have a look and commit this?

Stefan, would you like to take this through your trivial queue?

