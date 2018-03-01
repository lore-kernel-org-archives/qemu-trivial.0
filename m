Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1erPGU-00070M-GH
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2018 09:32:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1erPGQ-0006yX-Tr
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 09:32:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1erPGP-0000TM-Tt
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 09:32:54 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:60457
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1erPGN-0000Se-Ju; Thu, 01 Mar 2018 09:32:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 652A68139B;
	Thu,  1 Mar 2018 15:32:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1ixqvoxnpLG; Thu,  1 Mar 2018 15:32:50 +0100 (CET)
Received: from localhost.localdomain (unknown [10.10.8.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id E50BB8139A;
	Thu,  1 Mar 2018 15:32:49 +0100 (CET)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mark.cave-ayland@ilande.co.uk, jcd@tribudubois.net
References: <1519898536-19027-1-git-send-email-frederic.konrad@adacore.com>
	<1625eda8-021b-b7bc-2c41-f87724b95efa@amsat.org>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <10413292-41b2-761c-9d2f-dc34c66eab9e@adacore.com>
Date: Thu, 1 Mar 2018 15:32:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1625eda8-021b-b7bc-2c41-f87724b95efa@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-trivial] [PATCH] grlib_apbuart: always enable tx and rx
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
X-List-Received-Date: Thu, 01 Mar 2018 14:32:57 -0000

Hi Phil,

I see your point. But I tend to prefer modifying the uart than
having a bunch of hand assembled code in the machine.

Note that the result is the same.

Thanks,
Fred

On 03/01/2018 11:49 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Frederic,
>=20
> On 03/01/2018 07:02 AM, KONRAD Frederic wrote:
>> We often use a bootloader for this board. So lets set the uart in a st=
ate
>> which it can emit characters as if we were using a bootloader.
>>
>> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
>> ---
>>   hw/char/grlib_apbuart.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
>> index bac11be..a8020ea 100644
>> --- a/hw/char/grlib_apbuart.c
>> +++ b/hw/char/grlib_apbuart.c
>> @@ -265,8 +265,8 @@ static void grlib_apbuart_reset(DeviceState *d)
>>  =20
>>       /* Transmitter FIFO and shift registers are always empty in QEMU=
 */
>>       uart->status =3D  UART_TRANSMIT_FIFO_EMPTY | UART_TRANSMIT_SHIFT=
_EMPTY;
>> -    /* Everything is off */
>> -    uart->control =3D 0;
>> +    /* Enable Tx and Rx as the bootloader would do */
>> +    uart->control =3D UART_RECEIVE_ENABLE | UART_TRANSMIT_ENABLE;
>=20
> I don't think this is the correct approach, as we want to reflect the
> real hardware behavior here.
>=20
> I think the correct QEMU-way is add a tiny asm bootloader in ram in
> leon3_generic_hw_init(), which enables the UART.
> See write_bootloader() in hw/mips/mips_fulong2e.c for example.
>=20
> Regards,
>=20
> Phil.
>=20
>>       /* Flush receive FIFO */
>>       uart->len =3D 0;
>>       uart->current =3D 0;
>>

