Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S2zj6-0000Ie-8Z
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2012 01:42:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1S2zj3-0000B7-7K
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2012 01:42:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1S2zj1-0002Na-Gv
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2012 01:42:52 -0500
Received: from smtp1-g21.free.fr ([212.27.42.1]:41369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1S2zix-0002Li-7u; Thu, 01 Mar 2012 01:42:47 -0500
Received: from [192.168.0.10] (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 23CAE9400F4;
	Thu,  1 Mar 2012 07:42:38 +0100 (CET)
Message-ID: <4F4F1A5F.7060004@reactos.org>
Date: Thu, 01 Mar 2012 07:42:39 +0100
From: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1330555499-11726-1-git-send-email-hpoussin@reactos.org>
	<4F4ED6F9.30109@codemonkey.ws>
In-Reply-To: <4F4ED6F9.30109@codemonkey.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.27.42.1
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pc: make user-triggerable
 exit conditional to DEBUG_BIOS define
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
X-List-Received-Date: Thu, 01 Mar 2012 06:42:54 -0000

Hi,

I've no idea what installer is trying to do with this port, or what=20
device it is probing.

We can maybe add a runtime switch to exit Qemu or not. What do you think=20
of '-vgabios-backdoor' which, if specified, does the exit ?

Otherwise, which solution do you propose?

Regards,

Herv=C3=A9

Anthony Liguori a =C3=A9crit :
> On 02/29/2012 04:44 PM, Herv=C3=A9 Poussineau wrote:
>> The port 0x501 is (at least) used by SCO Xenix 2.3.4 installer.
>=20
> For what?  What device would normally be there?
>=20
> I don't want to disable this by default.  My regression suite depends o=
n=20
> this as an exit mechanism.
>=20
> Regards,
>=20
> Anthony Liguori
>=20
>>
>> Signed-off-by: Herv=C3=A9 Poussineau<hpoussin@reactos.org>
>> ---
>>   hw/pc.c |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/hw/pc.c b/hw/pc.c
>> index 12c02f2..113a38a 100644
>> --- a/hw/pc.c
>> +++ b/hw/pc.c
>> @@ -565,7 +565,10 @@ static void bochs_bios_write(void *opaque,=20
>> uint32_t addr, uint32_t val)
>>           /* LGPL'ed VGA BIOS messages */
>>       case 0x501:
>>       case 0x502:
>> +#ifdef DEBUG_BIOS
>>           exit((val<<  1) | 1);
>> +#endif
>> +        break;
>>       case 0x500:
>>       case 0x503:
>>   #ifdef DEBUG_BIOS
>=20
>=20


