Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7gWo-0001Qq-7U
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 01:45:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T7gWl-0001Im-Lk
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 01:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T7gWk-0002R2-Lb
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 01:45:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1T7gWf-0002Pr-HU; Sat, 01 Sep 2012 01:45:45 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q815jh6Y014977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sat, 1 Sep 2012 01:45:43 -0400
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q815jgJ6004902; Sat, 1 Sep 2012 01:45:42 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 74C5820062; Sat,  1 Sep 2012 07:45:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
References: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
	<50412E4D.9010204@suse.de>
Date: Sat, 01 Sep 2012 07:45:41 +0200
In-Reply-To: <50412E4D.9010204@suse.de> ("Andreas =?utf-8?Q?F=C3=A4rber=22?=
	=?utf-8?Q?'s?= message of "Fri, 31 Aug 2012 23:36:13 +0200")
Message-ID: <871uimi9dm.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Alexander Graf <agraf@suse.de>
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
X-List-Received-Date: Sat, 01 Sep 2012 05:45:52 -0000

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 31.08.2012 22:21, schrieb Stefan Weil:
>> Report from smatch:
>>=20
>> ppc405_uc.c:209 dcr_read_pob(12) error: buffer overflow 'pob->besr' 2 <=
=3D 2
>> ppc405_uc.c:232 dcr_write_pob(12) error: buffer overflow 'pob->besr' 2 <=
=3D 2
>>=20
>> The old code reads and writes besr[POB0_BESR1 - POB0_BESR0] or besr[2]
>> which is one too much.
>>=20
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>=20
>> As this code was wrong for more than 5 years, there is no urgent need to
>> fix it now for QEMU 1.2.
>>=20
>> Regards,
>>=20
>> Stefan Weil
>>=20
>>  hw/ppc405_uc.c |   16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/hw/ppc405_uc.c b/hw/ppc405_uc.c
>> index 89e5013..b52ab2f 100644
>> --- a/hw/ppc405_uc.c
>> +++ b/hw/ppc405_uc.c
>> @@ -191,7 +191,8 @@ enum {
>>  typedef struct ppc4xx_pob_t ppc4xx_pob_t;
>>  struct ppc4xx_pob_t {
>>      uint32_t bear;
>> -    uint32_t besr[2];
>> +    uint32_t besr0;
>> +    uint32_t besr1;
>>  };
>>=20=20
>>  static uint32_t dcr_read_pob (void *opaque, int dcrn)
>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>
> We could alternatively leave besr[2] and access it with hardcoded 0..1.

Minimally invasive fix would be besr[dcrn !=3D POB0_BESR0].

[...]

