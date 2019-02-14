Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDii-0004WE-Uq
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDif-0004Uq-Qj
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:54:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDie-00009t-Pd
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:54:13 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:40995)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDie-0008SZ-9J; Thu, 14 Feb 2019 04:54:12 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MlwBh-1hKzkN0THH-00j45q; Thu, 14 Feb 2019 10:54:04 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, 
	pbonzini@redhat.com, kraxel@redhat.com, mst@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-2-dgilbert@redhat.com>
	<87e9683c-1363-3777-f92a-af73e1ed3748@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f71ebf01-c653-dea9-4cb6-3743e91fc990@vivier.eu>
Date: Thu, 14 Feb 2019 10:54:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <87e9683c-1363-3777-f92a-af73e1ed3748@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vSUauR3ur/n9jcntLzdnNNzuWF2uiqF99YHqh0L1uPCdWTwGSRu
	hrML7SIEdnq9XwXFTDwPHv20IbYedQOS4JCPL58/K9Gt4yhP26cY0pJEiuKj4skduBOQnjb
	xUDbE/+KnXCklbBVLzM9EQNfDsPlIXqwwIREiaDSkNqUI9G9j6Qee5bc/bCwxAf233XpYwH
	sn+HViR/JRfteW0pWVY9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oFTEU9T9U7U=:LL2mE8ukvcVd/paVKjCqV0
	z+5YYGrRPp9+rvayXeNpFQ0S/cqjqErqliOWeL9opS2Cbb84Tb82jXJ8HdvvAGZ35Crmoo23K
	6cOiRPQMyffh5qSO3VOuatMG27MbiKcV5coMW9LJpbhziU73fCyMBDhhwwPyDV6Ht/AkbF5LC
	wA8Rf0TSd1GGfpfyDIsBreuieEYDGpdyn7JzUL58hHAsZDMd59sRAg/dDb8gQCp14TSm8vTDK
	m6KLCTic7ty+RTAXM47UfOHj+UHmGeuvsRdKx0Qc6H6pLHULwbZw0+pOlQtLgKcFr9w+ODihp
	uqqyGwSS2zLP40Z8eGCD5cXeeiOs5EroLGgfl2Z8UJ5ilmwRcprGmMJSLp/Sa4cKDW0hgg7+I
	z4Vrt88I0YGd1oGSo6QBQt9FBbhyU6m/Dwv2/QWSx2oshzVSvtbwjwYFuD3VBRpSZIXbiKpd6
	r0MK5C9Vh4t6LCsbVmyE79DgxtGbJBCSCjW/k20bqrNkvHwHQ46afS65nXoulitA15AI7V3Nx
	bTNTMpb3G4ZqffT5/b3gJPa7aVj5IhFzWzmD/NorukVHfmcPKW0hL4vT7FxWZmeKH4uwSUkxT
	+hFa3v7Xo37OwwKVs7lp2s6HlYdYGlGs3f6Eq1mAM+N/1uHayO5u8tl8FkKoWIp1TYI3n4Mt6
	VS2q+tBn61X2KvnS5PP4huiQbjljFRRcYSlDYCxHVusNkJ+kI+ZW7wuEq2k1j7dzAQsJMoGWO
	0W/IoAXJE49dtXbIVrGav6i6VrhJjjzoZoPsIOfRDnS/wue4p2MxE43w6DQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] pckbd: Convert
 DPRINTF->trace
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
X-List-Received-Date: Thu, 14 Feb 2019 09:54:16 -0000

On 12/02/2019 15:10, Philippe Mathieu-Daudé wrote:
> On 2/12/19 2:47 PM, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Per https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03186.html
> this one already has:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 


Applied the one from 2018-10
(20181016112232.23241-1-dgilbert@redhat.com), as it is identical and has
the R-b, to my trivial-patches branch.

Thanks,
Laurent


