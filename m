Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZIF1-0001yx-SU
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jul 2017 10:52:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dZIEz-0001xQ-28
	for qemu-trivial@nongnu.org; Sun, 23 Jul 2017 10:52:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dZIEy-0005l8-9V
	for qemu-trivial@nongnu.org; Sun, 23 Jul 2017 10:52:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dZIEt-0005hx-TE; Sun, 23 Jul 2017 10:52:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05E704E4CB;
	Sun, 23 Jul 2017 14:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 05E704E4CB
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 05E704E4CB
Received: from [10.36.116.31] (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1153760BEE;
	Sun, 23 Jul 2017 14:52:06 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu trival <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-20-f4bug@amsat.org>
	<CAJ+F1CJL8krrmFwCgqx6qZepkNZbcvTJrkOEVcsWiHurCBcUZw@mail.gmail.com>
	<3b25ec9f-5711-de4c-eade-eecef96b6379@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a49428cc-88e9-dbd8-3d2f-207acbef68f9@redhat.com>
Date: Sun, 23 Jul 2017 16:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3b25ec9f-5711-de4c-eade-eecef96b6379@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sun, 23 Jul 2017 14:52:10 +0000 (UTC)
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
X-List-Received-Date: Sun, 23 Jul 2017 14:52:18 -0000

On 18/07/2017 16:43, Thomas Huth wrote:
> On 18.07.2017 13:07, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>
>> On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
>> <f4bug@amsat.org> wrote:
>>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_os=
dep.cocci
> [...]
>>> diff --git a/disas.c b/disas.c
>>> index d335c55bbf..8b59448286 100644
>>> --- a/disas.c
>>> +++ b/disas.c
>>> @@ -151,7 +151,7 @@ static int print_insn_objdump(bfd_vma pc, disasse=
mble_info *info,
>>>      info->read_memory_func(pc, buf, n, info);
>>>
>>>      for (i =3D 0; i < n; ++i) {
>>> -        if (i % 32 =3D=3D 0) {
>>> +        if (QEMU_IS_ALIGNED(i, 32)) {
>>>              info->fprintf_func(info->stream, "\n%s: ", prefix);
>>>          }
>>>          info->fprintf_func(info->stream, "%02x", buf[i]);
>=20
> This looks wrong to me. QEMU_IS_ALIGNED should be used for addresses an=
d
> similar things. This part here is about pretty printing a hex dump.
>=20
> The code should likely be converted to use qemu_hexdump() instead, I gu=
ess.

qemu_hexdump only works with FILE*.

But I agree that QEMU_IS_ALIGNED looks weird here.  I think it should
mostly be used when the argument is a pointer, to hide the cast.  Uses
for non-pointer arguments should be decided on a one-by-one basis; "is
the first argument an address" is definitely a good thing to consider.
Another might be "is the second argument a variable", because "i % n =3D=3D
0" is less efficient than "(i & (n - 1)) =3D=3D 0".

Paolo


Paolo

