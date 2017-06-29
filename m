Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQchH-0003FU-CI
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 12:53:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dQchE-00033y-P2
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dQchE-0006Iv-4N
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:53:36 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:37006
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1dQch8-0006Fy-SH; Thu, 29 Jun 2017 12:53:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id A5FC7DA62B1;
	Thu, 29 Jun 2017 18:53:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UZvFhhZeKIih; Thu, 29 Jun 2017 18:53:29 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (pD9E016EC.dip0.t-ipconnect.de
	[217.224.22.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id EDCCFDA606E; 
	Thu, 29 Jun 2017 18:53:28 +0200 (CEST)
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, qemu-devel@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170629010300.2848-1-f4bug@amsat.org>
	<20170629010300.2848-6-f4bug@amsat.org>
	<9403a3d0-41f6-add2-04fd-12034fe7699a@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <ecb12a15-5b0c-67ef-18ad-e627b591148e@weilnetz.de>
Date: Thu, 29 Jun 2017 18:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9403a3d0-41f6-add2-04fd-12034fe7699a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 5/8] tcg/tci: enable
 bswap16_i64
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
X-List-Received-Date: Thu, 29 Jun 2017 16:53:37 -0000

Am 29.06.2017 um 18:29 schrieb Eric Blake:
> On 06/28/2017 08:02 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> remove some copy/paste leftover, code seems sane.
>>
>=20
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Double-sob seems odd.

Maybe that double SOB can be cleaned by qemu-trivial (cc'ed).

>=20
>> ---
>>  tcg/tci.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>=20
> Otherwise,
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20

Note from the author: it's not a copy/paste leftover, but was
there on purpose: that code part was simply never executed
before, and I only removed the TODO() statements from tested
code.

So you are the first one who found a test case. Congratulations.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


