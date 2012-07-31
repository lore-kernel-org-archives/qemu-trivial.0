Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwIsT-0006Mg-N6
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 16:17:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SwIsR-0006Es-0B
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 16:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SwIsP-0002eu-TL
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 16:17:10 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46320 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <hare@suse.de>)
	id 1SwIsM-0002Xn-W8; Tue, 31 Jul 2012 16:17:07 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 9D2989FB23;
	Tue, 31 Jul 2012 22:17:04 +0200 (CEST)
Message-ID: <50185960.9050700@suse.de>
Date: Wed, 01 Aug 2012 00:17:04 +0200
From: Hannes Reinecke <hare@suse.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120601 Thunderbird/13.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de> <87y5m06jx1.fsf@codemonkey.ws>
	<5017FD81.3040707@redhat.com>
In-Reply-To: <5017FD81.3040707@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmU=?= =?UTF-8?B?cg==?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] megasas: Update function
	megasys_scsi_uninit
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
X-List-Received-Date: Tue, 31 Jul 2012 20:17:12 -0000

On 07/31/2012 05:45 PM, Paolo Bonzini wrote:
> Il 31/07/2012 17:15, Anthony Liguori ha scritto:
>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>>
>>> Am 31.07.2012 16:50, schrieb Paolo Bonzini:
>>>> Il 31/07/2012 16:46, Andreas F=C3=A4rber ha scritto:
>>>>>>> Why would megasas be in master but not compiled/linked?
>>>>>> Because Anthony objected to how it picks the initiator WWN.
>>>>> Ah, anything keeping us from fixing that? :)
>>>>
>>>> Exact knowledge of the requirements, basically. :)
>>>
>>> I.e. waiting on feedback about numeric constraints from Hannes? :)
>>> Or waiting on general direction from Anthony?
>>> How to make progress there for 1.2 / Soft Freeze?
>>
>> You cannot build guest visible state by casting pointers.
>>
>> I'm really disappointed that this hasn't been resolved yet.  If it's n=
ot
>> resolved before the soft freeze, I think we ought to revert the megasa=
s
>> patches completely.
>
> Hannes, can you give a quick yes/no on the approach of the attached
> patch?  The address of the HBA is given by a wwn property or, in the
> lack of one, by an increasing index similar to the one used for MAC
> addresses.  The address of the disks is also given by a wwn property or=
,
> in the lack of one, by combining the HBA address with the target number=
.
>
Sorry for not answering earlier, but real life interfered
(customer escalations et al ...)

Anyway, Paolo, your approach is partially correct.
Ad 1, yes, we should be having a property for setting the SAS address of=20
the HBA. So that's okay and can go in. Anyone concerned with uniqueness=20
can then set it as appropriate.

Ad 2: no, the SAS address for the devices is _not_ the WWN.
The WWN is the ID of the LUN, whereas the SAS address is the ID of the=20
Target. So to be correct we would need to generate unique SAS addressed=20
per target which needs to be different from the WWN.
However, megasas does not need to present SAS addresses here; we can set=20
the interface to PCI-E (instead of SAS) and just use the LUN number.
Sadly I've yet to figure out the code for PCIE.
(Doing it correctly involves staring a binary output and figuring the=20
meaning of bits. Did I mention I don't have documentation for that beast?=
)
That's what's stalled the patch for now.

I see to have a patch cooked up tomorrow.

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
GF: Markus Rex, HRB 16746 (AG N=C3=BCrnberg)




