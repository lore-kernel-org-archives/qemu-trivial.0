Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7h5k-0003jx-7s
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 02:22:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1T7h5h-0003aV-72
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 02:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1T7h5g-0004Rt-8F
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 02:21:57 -0400
Received: from cantor2.suse.de ([195.135.220.15]:52098 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1T7h5b-0004RK-MA; Sat, 01 Sep 2012 02:21:51 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id C5F58912E4;
	Sat,  1 Sep 2012 08:21:49 +0200 (CEST)
References: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
	<50412E4D.9010204@suse.de> <871uimi9dm.fsf@blackfin.pond.sub.org>
In-Reply-To: <871uimi9dm.fsf@blackfin.pond.sub.org>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8
Message-Id: <0CD423D9-2A2E-46E5-B0B3-63D6E044436A@suse.de>
X-Mailer: iPhone Mail (9B206)
From: Alexander Graf <agraf@suse.de>
Date: Fri, 31 Aug 2012 23:23:02 -0700
To: Markus Armbruster <armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ppc405_uc: Fix buffer
	overflow
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
X-List-Received-Date: Sat, 01 Sep 2012 06:21:58 -0000



On 31.08.2012, at 22:45, Markus Armbruster <armbru@redhat.com> wrote:

> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>=20
>> Am 31.08.2012 22:21, schrieb Stefan Weil:
>>> Report from smatch:
>>>=20
>>> ppc405_uc.c:209 dcr_read_pob(12) error: buffer overflow 'pob->besr' 2 <=3D=
 2
>>> ppc405_uc.c:232 dcr_write_pob(12) error: buffer overflow 'pob->besr' 2 <=
=3D 2
>>>=20
>>> The old code reads and writes besr[POB0_BESR1 - POB0_BESR0] or besr[2]
>>> which is one too much.
>>>=20
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>=20
>>> As this code was wrong for more than 5 years, there is no urgent need to=

>>> fix it now for QEMU 1.2.
>>>=20
>>> Regards,
>>>=20
>>> Stefan Weil
>>>=20
>>> hw/ppc405_uc.c |   16 +++++++++++-----
>>> 1 file changed, 11 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/hw/ppc405_uc.c b/hw/ppc405_uc.c
>>> index 89e5013..b52ab2f 100644
>>> --- a/hw/ppc405_uc.c
>>> +++ b/hw/ppc405_uc.c
>>> @@ -191,7 +191,8 @@ enum {
>>> typedef struct ppc4xx_pob_t ppc4xx_pob_t;
>>> struct ppc4xx_pob_t {
>>>     uint32_t bear;
>>> -    uint32_t besr[2];
>>> +    uint32_t besr0;
>>> +    uint32_t besr1;
>>> };
>>>=20
>>> static uint32_t dcr_read_pob (void *opaque, int dcrn)
>>=20
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>=20
>> We could alternatively leave besr[2] and access it with hardcoded 0..1.
>=20
> Minimally invasive fix would be besr[dcrn !=3D POB0_BESR0].
>=20
> [...]

I don't think the change is important enough for these stylistic questions :=
). I'll just apply it once I'm back to a real internet connection.

Alex=

