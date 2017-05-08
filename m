Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7m6t-0006U8-0p
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 13:06:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1d7m6q-0006SI-M9
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 13:06:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1d7m6p-0003Jh-Qm
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 13:06:08 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:32791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1d7m6i-0003Ii-T2; Mon, 08 May 2017 13:06:00 -0400
Received: by mail-yb0-x244.google.com with SMTP id d72so2297681ybh.0;
	Mon, 08 May 2017 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qEtAxOvRbcjBFEa88Gx78vntBV0801+gV/ZGZsMx/Vk=;
	b=cVlzTsYZcBf7yoZc3aFb/HceKDM0a3Z2hqZE4wBDBQDUPgXAKJcf6d68O8rz7eoGIm
	JTbeD9gYiZl/PP2H8eJS43URVBGUFLCqSMrtZN8K1YhieDMcpKzv7DMu0OlWnFF90x7m
	hEWo9+I7mq4S8i4BGnHS+QDZRn+4aRSeiPoqfcq0D1XR1nzTpUCDOBDcD3n8QXNoC1ya
	pce5aHuAttAFJ791InTy1+k3vKzEVJMTJwP7oDIJc624ygc2yzNBOuOk16QWcFiMNgnu
	BGSl6aidFvqlSvLyi/GSnabdqXxCemO8yWE6wDb+tEUDizBSi3cxbyYzUBxbztmyM/Wg
	x7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qEtAxOvRbcjBFEa88Gx78vntBV0801+gV/ZGZsMx/Vk=;
	b=f2KLqLvDfTBbwOZKM7ot1ZGF/+fEiZzXBDMovFtx42lz/u7xOw+fUlgCsFY828Lyl2
	qCf7xzkqc3p7T1sDBqpHCe29ZE5NJFLESWICe/RHkhp26t+pX/h785uAS92kU0fmTEn5
	6ncpz1p1P3Wuyhw9ZWIbtBszc6TDwPuSkFAEeOc3L5+89E8bAckbPbG/RGLFYf/dYmKK
	8NiGD7HaRy/Jvmm9UlVp/O87eEGwtyDoRjp8hbSFthCAdtu+VsabCDbeA+z18ypx/bxf
	kXNdXjXM3OccL9V8M9xi3nySd4T9SmkhXeMdvNwO/XYbdI+M6MMQ9MfOlJZyJxxw2MF2
	zasw==
X-Gm-Message-State: AODbwcDKfd1kmvAEwLPysLIZhAU+u6aabUW1uKaINl6OvQ+urBlT7kBS
	zMyiAyY1/wW0mkTZNWBQ2HrbY0uYwg==
X-Received: by 10.37.78.132 with SMTP id c126mr10762923ybb.138.1494263160044; 
	Mon, 08 May 2017 10:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.44.138 with HTTP; Mon, 8 May 2017 10:05:59 -0700 (PDT)
In-Reply-To: <87r2zz8oep.fsf@linaro.org>
References: <20170508073529.23449-1-pbonzini@redhat.com>
	<87r2zz8oep.fsf@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 8 May 2017 10:05:59 -0700
Message-ID: <CAMo8BfKZeZe26qOfuJm0ib-3PhYY0X--ZiFGbT6vSjr9RqJsaA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xtensa: use
 g_malloc/g_new/g_free
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
X-List-Received-Date: Mon, 08 May 2017 17:06:09 -0000

On Mon, May 8, 2017 at 6:32 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
>> index d2d1d3a6fd..97307728f7 100644
>> --- a/hw/xtensa/sim.c
>> +++ b/hw/xtensa/sim.c
>> @@ -41,13 +41,13 @@ static void xtensa_create_memory_regions(const Xtens=
aMemory *memory,
>>                                           const char *name)
>>  {
>>      unsigned i;
>> -    char *num_name =3D malloc(strlen(name) + sizeof(i) * 3 + 1);
>> +    char *num_name =3D g_malloc(strlen(name) + sizeof(i) * 3 + 1);
>
> It seems a little sketchy using the size of the storage type as a proxy
> for the number of bytes used by the format specifier in a format string.
> In this sort of situation I'd just use Glib and stop worrying about it:

Ok, I'll send a patch doing it that way.

--=20
Thanks.
-- Max

