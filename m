Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRLiJ-000316-Tg
	for mharc-qemu-trivial@gnu.org; Tue, 09 Sep 2014 09:44:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1XRLiC-0002s9-71
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 09:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1XRLi6-0006st-6c
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 09:44:00 -0400
Received: from cantor2.suse.de ([195.135.220.15]:55741 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1XRLht-0006qk-Te; Tue, 09 Sep 2014 09:43:42 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 928A9AD84;
	Tue,  9 Sep 2014 13:43:39 +0000 (UTC)
Message-ID: <540F040B.8080405@suse.de>
Date: Tue, 09 Sep 2014 15:43:39 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1410233038-15928-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAFEAcA_+MeAyajE=LpvAd3nvSgomucOsEYiipxPNEnGiDzN8Ug@mail.gmail.com>
In-Reply-To: <CAFEAcA_+MeAyajE=LpvAd3nvSgomucOsEYiipxPNEnGiDzN8Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typos and misspellings
	in comments
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
X-List-Received-Date: Tue, 09 Sep 2014 13:44:06 -0000

Am 09.09.2014 10:09, schrieb Peter Maydell:
> On 9 September 2014 04:23, zhanghailiang <zhang.zhanghailiang@huawei.co=
m> wrote:
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 2ab4460..bedef2f 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -541,7 +541,7 @@ static void *spapr_create_fdt_skel(hwaddr initrd_b=
ase,
>>      _FDT((fdt_property_cell(fdt, "rtas-error-log-max", RTAS_ERROR_LOG=
_MAX)));
>>
>>      /*
>> -     * According to PAPR, rtas ibm,os-term, does not gaurantee a retu=
rn
>> +     * According to PAPR, rtas ibm,os-term, does not guarantee a retu=
rn

"..., rtas,os-term does not ..."? (i.e., drop the comma while at it)

>>       * back to the guest cpu.
>>       *
>>       * While an additional ibm,extended-os-term property indicates th=
at
>=20
> OK

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

