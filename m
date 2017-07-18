Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXTj9-0008VI-PK
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 10:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dXTj8-0008TW-CP
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 10:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dXTj7-00009e-HW
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 10:43:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dXTj2-0008Tp-12; Tue, 18 Jul 2017 10:43:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B23FFC04B30E;
	Tue, 18 Jul 2017 14:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B23FFC04B30E
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B23FFC04B30E
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FE9560BE6;
	Tue, 18 Jul 2017 14:43:44 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu trival <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-20-f4bug@amsat.org>
	<CAJ+F1CJL8krrmFwCgqx6qZepkNZbcvTJrkOEVcsWiHurCBcUZw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3b25ec9f-5711-de4c-eade-eecef96b6379@redhat.com>
Date: Tue, 18 Jul 2017 16:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJL8krrmFwCgqx6qZepkNZbcvTJrkOEVcsWiHurCBcUZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Jul 2017 14:43:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 19/29] disas: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 14:43:55 -0000

On 18.07.2017 13:07, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org> wrote:
>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osd=
ep.cocci
[...]
>> diff --git a/disas.c b/disas.c
>> index d335c55bbf..8b59448286 100644
>> --- a/disas.c
>> +++ b/disas.c
>> @@ -151,7 +151,7 @@ static int print_insn_objdump(bfd_vma pc, disassem=
ble_info *info,
>>      info->read_memory_func(pc, buf, n, info);
>>
>>      for (i =3D 0; i < n; ++i) {
>> -        if (i % 32 =3D=3D 0) {
>> +        if (QEMU_IS_ALIGNED(i, 32)) {
>>              info->fprintf_func(info->stream, "\n%s: ", prefix);
>>          }
>>          info->fprintf_func(info->stream, "%02x", buf[i]);

This looks wrong to me. QEMU_IS_ALIGNED should be used for addresses and
similar things. This part here is about pretty printing a hex dump.

The code should likely be converted to use qemu_hexdump() instead, I gues=
s.

 Thomas

