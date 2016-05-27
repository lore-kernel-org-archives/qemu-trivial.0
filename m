Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6CRF-0003Nz-14
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2016 03:44:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b6CRD-0003Kb-5h
	for qemu-trivial@nongnu.org; Fri, 27 May 2016 03:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b6CR8-0002vN-Vi
	for qemu-trivial@nongnu.org; Fri, 27 May 2016 03:44:06 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:48640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>)
	id 1b6CR8-0002rR-PZ; Fri, 27 May 2016 03:44:02 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b6CQu-0003kN-Rj from Talha_Imran@mentor.com ;
	Fri, 27 May 2016 00:43:49 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.75]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Fri, 27 May 2016 08:43:47 +0100
From: "Imran, Talha" <Talha_Imran@mentor.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: "agraf@suse.de" <agraf@suse.de>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-ppc] [PATCH] target-ppc/fpu_helper: Fix efscmp*
	instructions handling
Thread-Index: AQHRscef+z7Sxn9EH0yrhnham0zp9Z/L/EQAgAB2qwE=
Date: Fri, 27 May 2016 07:43:46 +0000
Message-ID: <3052678E9DA67D4CB879A6625EE420753DD7A3D1@EU-MBX-02.mgc.mentorg.com>
References: <1463659895-16281-1-git-send-email-talha_imran@mentor.com>,
	<20160527013714.GP17226@voom.fritz.box>
In-Reply-To: <20160527013714.GP17226@voom.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] target-ppc/fpu_helper: Fix
 efscmp* instructions handling
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
X-List-Received-Date: Fri, 27 May 2016 07:44:08 -0000

=0A=
On 05/27/2016 06:37 AM, David Gibson wrote:=0A=
> On Thu, May 19, 2016 at 05:11:35PM +0500, Talha Imran wrote:=0A=
>> With specification at hand from the reference manual from Freescale=0A=
>> http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf , I have foun=
d a fix=0A=
>> to efscmp* instructions handling in QEMU.=0A=
>>=0A=
...=0A=
>> Signed-off-by: Talha Imran <talha_imran@mentor.com>=0A=
>=0A=
> Does this patch supersede the earlier patch you posted for efcmp=0A=
> instructions on e500v1?  Or is it in addition to that patch?=0A=
>=0A=
[talha]: Yes, it supersedes the earlier patches. This is a better solution.=
=0A=
=0A=
>> ---=0A=
>>  target-ppc/fpu_helper.c | 2 +-=0A=
>>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
>>=0A=
>> diff --git a/target-ppc/fpu_helper.c b/target-ppc/fpu_helper.c=0A=
>> index b67ebca..6fd56a8 100644=0A=
>> --- a/target-ppc/fpu_helper.c=0A=
>> +++ b/target-ppc/fpu_helper.c=0A=
>> @@ -1442,7 +1442,7 @@ static inline uint32_t efststeq(CPUPPCState *env, =
uint32_t op1, uint32_t op2)=0A=
>>  #define HELPER_SINGLE_SPE_CMP(name)                                    =
 \=0A=
>>      uint32_t helper_e##name(CPUPPCState *env, uint32_t op1, uint32_t op=
2) \=0A=
>>      {                                                                  =
 \=0A=
>> -        return e##name(env, op1, op2) << 2;                            =
 \=0A=
>> +        return e##name(env, op1, op2);                                 =
 \=0A=
>>      }=0A=
>>  /* efststlt */=0A=
>>  HELPER_SINGLE_SPE_CMP(fststlt);=0A=
>=0A=
=0A=

