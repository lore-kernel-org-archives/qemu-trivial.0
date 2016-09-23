Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnS1R-0006m8-Bm
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 11:04:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnS1O-0006kD-VN
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 11:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnS1L-0004KQ-PX
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 11:04:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bnS1A-0004Ez-QJ; Fri, 23 Sep 2016 11:04:00 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB8C4C093565;
	Fri, 23 Sep 2016 15:03:59 +0000 (UTC)
Received: from [10.36.116.56] (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NF3uv9031361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 23 Sep 2016 11:03:57 -0400
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <huth@tuxfamily.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Fabien Chouteau <chouteau@adacore.com>
References: <c1a178ce-1c5e-2c26-0f55-6a4fbfe21a83@tuxfamily.org>
	<51fce155-aaab-c4ac-b00b-02678dd827b4@ilande.co.uk>
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
From: Thomas Huth <thuth@redhat.com>
Message-ID: <541206e5-8f76-8e78-b9cb-3a0c1513b83f@redhat.com>
Date: Fri, 23 Sep 2016 17:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <51fce155-aaab-c4ac-b00b-02678dd827b4@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 23 Sep 2016 15:04:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] MAINTAINERS: Add some SPARC machine
 related files
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2016 15:04:16 -0000

On 23.09.2016 16:05, Mark Cave-Ayland wrote:
> On 19/09/16 20:58, Thomas Huth wrote:
>=20
>> And while we're at it, remove Blue Swirl from the list
>> of maintainers. Blue has apparently been inactive for
>> quite a while now, so I assume he's unfortunately
>> not available as maintainer anymore.
>>
>> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
>> ---
>>  MAINTAINERS | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a9fab46..c6297c2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -650,22 +650,27 @@ F: hw/sh4/shix.c
>>  SPARC Machines
>>  --------------
>>  Sun4m
>> -M: Blue Swirl <blauwirbel@gmail.com>
>>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>  S: Maintained
>>  F: hw/sparc/sun4m.c
>> +F: hw/dma/sparc32_dma.c
>> +F: hw/dma/sun4m_iommu.c
>> +F: include/hw/sparc/sparc32_dma.h
>> +F: include/hw/sparc/sun4m.h
>> +F: pc-bios/openbios-sparc32
>> =20
>>  Sun4u
>> -M: Blue Swirl <blauwirbel@gmail.com>
>>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>  S: Maintained
>>  F: hw/sparc64/sun4u.c
>> +F: pc-bios/openbios-sparc64
>> =20
>>  Leon3
>>  M: Fabien Chouteau <chouteau@adacore.com>
>>  S: Maintained
>>  F: hw/sparc/leon3.c
>>  F: hw/*/grlib*
>> +F: include/hw/sparc/grlib.h
>> =20
>>  S390 Machines
>>  -------------
>=20
> No issue with the sun4m/sun4u changes, however shouldn't the OpenBIOS
> binaries be handled separately by the OpenBIOS project rather than by
> the SPARC maintainers? (I guess technically that is currently also me,
> but generally I do a pull request that updates all SPARC/PPC binaries i=
n
> one go)

Unless you explicitely want to add an "OPENBIOS" section to MAINTAINERS,
I think it's currently OK to assign these files to the SPARC machines,
since both is handled by you (SPARC machines and OpenBIOS binaries).
(openbios-ppc might get more problematic, though... but that's not so
easy to assign it to a specific machine anyway since it is shared
between Old World and New World machines, so we might need a separate
solution for openbios-ppc later anyway)

 Thomas


