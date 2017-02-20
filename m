Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfjXE-00066P-0m
	for mharc-qemu-trivial@gnu.org; Mon, 20 Feb 2017 03:41:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1cfjXB-00064y-9E
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 03:41:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1cfjXA-0008OK-Bu
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 03:41:25 -0500
Received: from ssl.serverraum.org ([213.133.101.245]:46717)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1cfjX5-0008Kb-OM; Mon, 20 Feb 2017 03:41:20 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0454923F16;
	Mon, 20 Feb 2017 09:41:07 +0100 (CET)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1487580067;
	bh=7faUVtjBZT3NZ8kv/ClSUbUtd9/vxQtkwbZq/5D8Bn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SCMXrsvNhkY8c90F3hs5p4/a/0hUT2zmuKVXDoDMxf6jJxpQspnmo2zkA8x0H4O/q
	tvFAY1dMORvkQkOyrdUDr98rx5tX6Kr5/tdbWWdaz0dA9hoUM6bDmM92HSR5ZdaKCa
	VeF83Q1RnlriU7kbaGDcCHQNPqzM1+PbVGBDWrSs=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 20 Feb 2017 09:41:06 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, patches@linaro.org, =?UTF-8?Q?Philippe_Mathie?=
	=?UTF-8?Q?u-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
In-Reply-To: <920b1c87-c1d8-9f73-6dad-cd6debafadd3@amsat.org>
References: <1487266008-13492-1-git-send-email-peter.maydell@linaro.org>
	<920b1c87-c1d8-9f73-6dad-cd6debafadd3@amsat.org>
Message-ID: <9f6cca837f4502e31ebb7d04e3394eaf@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.5
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-trivial] [PATCH] lm32: milkymist-tmu2: fix a third
 integer overflow
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
X-List-Received-Date: Mon, 20 Feb 2017 08:41:26 -0000

Am 2017-02-18 00:00, schrieb Philippe Mathieu-Daud=C3=A9:
> On 02/16/2017 02:26 PM, Peter Maydell wrote:
>> Don't truncate the multiplication and do a 64 bit one instead
>> because the result is stored in a 64 bit variable.
>>=20
>> This fixes a similar coverity warning to commits 237a8650d640 and
>> 4382fa655498, in a similar way, and is the final third of the fix for
>> coverity CID 1167561 (hopefully!).
>>=20
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Michael Walle <michael@walle.cc>


>=20
>> ---
>> Third time lucky -- I checked and this is the last of these
>> multiply lines.
>>=20
>>  hw/display/milkymist-tmu2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
>> index 7528665..59120dd 100644
>> --- a/hw/display/milkymist-tmu2.c
>> +++ b/hw/display/milkymist-tmu2.c
>> @@ -293,7 +293,7 @@ static void tmu2_start(MilkymistTMU2State *s)
>>      cpu_physical_memory_unmap(mesh, mesh_len, 0, mesh_len);
>>=20
>>      /* Write back the OpenGL framebuffer to the QEMU framebuffer */
>> -    fb_len =3D 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
>> +    fb_len =3D 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
>>      fb =3D cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 1);
>>      if (fb =3D=3D NULL) {
>>          glDeleteTextures(1, &texture);
>>=20


