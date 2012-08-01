Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwV1c-0002Z0-GD
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 05:15:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SwV1Z-0002Qq-T0
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 05:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SwV1V-0007mz-Os
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 05:15:25 -0400
Received: from cantor2.suse.de ([195.135.220.15]:42635 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <hare@suse.de>)
	id 1SwV1J-0007jG-Cc; Wed, 01 Aug 2012 05:15:09 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 9C241A39CE;
	Wed,  1 Aug 2012 11:15:08 +0200 (CEST)
Message-ID: <5018F39C.6090904@suse.de>
Date: Wed, 01 Aug 2012 11:15:08 +0200
From: Hannes Reinecke <hare@suse.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120601 Thunderbird/13.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de> <87y5m06jx1.fsf@codemonkey.ws>
	<5017FD81.3040707@redhat.com> <50185960.9050700@suse.de>
	<5018DCEB.9060208@redhat.com> <5018E0BE.3000706@suse.de>
	<5018E25E.4010801@redhat.com>
In-Reply-To: <5018E25E.4010801@redhat.com>
X-Enigmail-Version: 1.4.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] megasas: Update function
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
X-List-Received-Date: Wed, 01 Aug 2012 09:15:27 -0000

On 08/01/2012 10:01 AM, Paolo Bonzini wrote:
> Il 01/08/2012 09:54, Hannes Reinecke ha scritto:
>> On 08/01/2012 09:38 AM, Paolo Bonzini wrote:
>>> Il 01/08/2012 00:17, Hannes Reinecke ha scritto:
>>>> Ad 2: no, the SAS address for the devices is _not_ the WWN.
>>>> The WWN is the ID of the LUN, whereas the SAS address is the ID of t=
he
>>>> Target. So to be correct we would need to generate unique SAS addres=
sed
>>>> per target which needs to be different from the WWN.
>>>
>>> Oh, that's even easier then, just delete all the get_wwn stuff and us=
e
>>> HBA address + 1 + sdev->id.
>>>
>> Which HBA address?
>=20
> The HBA SAS address. :)
>=20
Ah.

I've now send a new patch fixing things up.
Hopefully it gains Anthonys approval.

Anthony, I'm dead sorry but didn't manage to type your e-mail
address correctly.
Hope it doesn't fall through the cracks because of this ..

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
GF: J. Hawn, J. Guild, F. Imend=C3=B6rffer, HRB 16746 (AG N=C3=BCrnberg)



