Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5pPA-0004bJ-FT
	for mharc-qemu-trivial@gnu.org; Thu, 05 Sep 2019 06:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i5pP8-0004b7-Nw
 for qemu-trivial@nongnu.org; Thu, 05 Sep 2019 06:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i5pP7-0007wb-IX
 for qemu-trivial@nongnu.org; Thu, 05 Sep 2019 06:54:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i5pP7-0007wR-Aw
 for qemu-trivial@nongnu.org; Thu, 05 Sep 2019 06:54:17 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49DD67BDA6
 for <qemu-trivial@nongnu.org>; Thu,  5 Sep 2019 10:54:16 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id 1so332118wmk.4
 for <qemu-trivial@nongnu.org>; Thu, 05 Sep 2019 03:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9OBKhYZVAKZ9enmCZl2DGXC9sidzhQsl+qMJfNoHVh0=;
 b=qLEaUYsQchsSdg5swOUIhxlyJpxoYomhIdRM0rGL7L5FLMGt9TNePOgXt6iflq6y33
 3uP4dWl5FB2ytgKRaxO/Fommo1xM+lot5ci/Y1X18WgWuaMYjFB67xuJJZtaRgzNBju8
 cGBBgLuqef5aLYnVXfzWgwqTUrdXO0EWaCrIWcnq+lS11TPMJ9ASX4LYJ5axYFs15ed4
 RXwjVwQkfMkgZxBnlKmD6v1395fD7ws15FZeKHrhCEnMerhffkgIwZN+dUcDC6FQ7Ftq
 Z4BnFCMGiBN4HXF0j4jpzrCOhJFyV2wm2Q489DPpf+aUX8RPYMQxB1l/JIvPceTRqQV+
 YcMw==
X-Gm-Message-State: APjAAAVvoZ4w1um9qvBGZwo/tuiNZHP3o/h+5oRgF99+kD93uSXM6pqD
 93Dt4hg5KjJGp7BuLuRUrhjz5z4LzbjTnwFZ6bgBwcPQvGIagyKD50TZi4OByCQKW94zuWrzzUg
 oJoJ2YMsXlwOTHQ3AGg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr2533330wmj.58.1567680855085;
 Thu, 05 Sep 2019 03:54:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEQmMrzVTU7FTSe5rrgaPvKKkELqRO8qOnhzpaFXMtES6064lWpEsJDWpupTujQ0h7u/KpxA==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr2533318wmj.58.1567680854901;
 Thu, 05 Sep 2019 03:54:14 -0700 (PDT)
Received: from [192.168.1.48] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id e15sm1372067wru.93.2019.09.05.03.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2019 03:54:14 -0700 (PDT)
To: Josh Kunz <jkz@google.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org
References: <20190816233422.16715-1-jkz@google.com>
 <5b4df64c-40e4-70cd-753e-f52e2b547c18@vivier.eu>
 <CADgy-2tzD0FVXbKtadSL1JuMWW_TEzFP2ZD0hzA4PUnxh1Xz0g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fe428dbd-a9f4-42c0-bb12-8c14fb3e2489@redhat.com>
Date: Thu, 5 Sep 2019 12:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CADgy-2tzD0FVXbKtadSL1JuMWW_TEzFP2ZD0hzA4PUnxh1Xz0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Support gdb
 'qOffsets' query for ELF
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2019 10:54:20 -0000

Cc'ing Alex.

On 9/3/19 9:19 PM, Josh Kunz via Qemu-devel wrote:
> The `Data` and `Code` flags in `qOffsets` are actually section offsets
> rather than segment offsets. GDB relocates the symbols in those section=
s
> relative to their location in the binary. So we have to use `load_bias`=
.
>=20
> See here for a more detailed description:
> https://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#Ge=
neral-Query-Packets

Maybe we can amend a reference to
http://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#index=
-qOffsets-packet
in the commit.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> On Mon, Aug 26, 2019 at 1:29 AM Laurent Vivier <laurent@vivier.eu> wrot=
e:
>=20
>> Le 17/08/2019 =C3=A0 01:34, Josh Kunz via Qemu-devel a =C3=A9crit :
>>> This is needed to support debugging PIE ELF binaries running under QE=
MU
>>> user mode. Currently, `code_offset` and `data_offset` remain unset fo=
r
>>> all ELF binaries, so GDB is unable to correctly locate the position o=
f
>>> the binary's text and data.
>>>
>>> The fields `code_offset`, and `data_offset` were originally added way
>>> back in 2006 to support debugging of bFMT executables (978efd6aac6),
>>> and support was just never added for ELF. Since non-PIE binaries are
>>> loaded at exactly the address specified in the binary, GDB does not n=
eed
>>> to relocate any symbols, so the buggy behavior is not normally observ=
ed.
>>>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1528239
>>> Signed-off-by: Josh Kunz <jkz@google.com>
>>> ---
>>>  linux-user/elfload.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>
>> As it seems they are text and data segment offsets, why it's not based
>> on info->start_code and info->start_data?
>>
>> Thanks,
>> Laurent
>>

