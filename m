Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eA6vu-0004te-C2
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 00:16:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6vs-0004sO-Lz
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 00:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6vr-0004ED-Bq
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 00:16:44 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:56707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6vm-0004BM-MM; Thu, 02 Nov 2017 00:16:38 -0400
Received: by mail-qt0-x235.google.com with SMTP id z28so5162935qtz.13;
	Wed, 01 Nov 2017 21:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IoGi8DsguE8cMTmocWbctGUhP30ZC6ehM1mdNKQ9tzk=;
	b=SqPOjm3MVGO6tsHToKdtwgBdwibm81sNE8+wd3vKQkakQoVZz10ZIBXsRf39ooL6gy
	7PsMUnkOZjC5CIluvblrI1HzWM3PTh7akSK0wioNYFO6hrJrKisdX9F+Xm8m/BPIZdI0
	CFLz8cJ/MqgD9GNTfKO6SIB2OBEy/HY2x440j7bcXFSUTtQrcP2jcAOYYEnGfT0QFeq4
	e7OOJEdI8I2uHYkFwgLJA1YrV+bAP5pd+kJZmkKKcXhknKR5qoknygcCTlqPP8TXI5jx
	FWmI4OF7AHv3GCSNoXkbuNrHbT7d8eH6SrMN22ScuHxM9bO5m52KaLJP98WoPc2jSXo0
	DwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IoGi8DsguE8cMTmocWbctGUhP30ZC6ehM1mdNKQ9tzk=;
	b=nSDhJZUYD1M1Po6lUUZZMU4gpgeL4jPe85KJ4gHkrEYd+EWEiJW+Pxc9SfpOdh+Q9c
	h1O1dH/0J1dmd6kL5vec11jRqGAOeeFDXwhbVDTGN5W2nMtHQedve6nbX3aVDETjvJJA
	hh6Z+0T1r+0WDvljGyR6SDG4kHK8i3Bc5mipA2UqdjhlMhBnwIFjjG58m7US4g3zUQvL
	VjeiAGG3Y+28qPhhsdHNirMFfYpFayv4iHtdFC1Pw7l21l2ZtrCZrRV/zP5/dNYHVkh0
	XM1oh5M07ZFlV3wX/L0jrGTrDdsXVwb/Wy1VPqS8TSVZo5WRSGs9kfex+K7NnWJh1+rt
	cQZQ==
X-Gm-Message-State: AMCzsaUPYOBnkowHPJlb9f9EK9ZS99RA28ij6Pi1/qqlWSWV4sUTUsQ2
	yvoMtCk4CI5niwnzS/AsoWVPOWO3
X-Google-Smtp-Source: ABhQp+S/pcQolUNieWM6gkpNfcoPuJo3TYzYNaO5XJi4o9/O7jBv1r9INFBKG66pz0TCA659rK0WMw==
X-Received: by 10.200.55.101 with SMTP id p34mr3327029qtb.27.1509596197981;
	Wed, 01 Nov 2017 21:16:37 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	j40sm1560894qtj.52.2017.11.01.21.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Nov 2017 21:16:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-2-f4bug@amsat.org>
	<871smcss0v.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5ef711ad-506b-e331-e6f9-9287d6500742@amsat.org>
Date: Thu, 2 Nov 2017 01:16:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <871smcss0v.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/88] cocci: script to use
 g_new() & friends
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
X-List-Received-Date: Thu, 02 Nov 2017 04:16:46 -0000

Hi Markus,

On 10/09/2017 04:24 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Imported from Markus Armbruster commit b45c03f
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>?
>>
>>  scripts/coccinelle/g_new.cocci | 101 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>>  create mode 100644 scripts/coccinelle/g_new.cocci
>>
>> diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
>> new file mode 100644
>> index 0000000000..1e57685a6b
>> --- /dev/null
>> +++ b/scripts/coccinelle/g_new.cocci
>> @@ -0,0 +1,101 @@
>> +/* transform g_new*() alloc with size arguments of the form sizeof(T) [* N]
> 
> Confusing.  Sounds like we transform g_new() into something else.  Also,
> wing both ends of the comment, and start with a capital letter.

Ok

> 
>> + *
>> + *   g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> + *   for two reasons.  One, it catches multiplication overflowing size_t.
>> + *   two, it returns T * rather than void *, which lets the compiler catch
> 
> Start your sentences with a capital letter.  Or rather, keep my commit
> message's capital letters intact ;)

Yes :|

> 
>> + *   more type errors.
>> + *
>> + *    Copyright: (C) 2017 Markus Armbruster <armbru@redhat.com>. GPLv2+.
> 
> If you want to put a copyright note into this file, you should stick to
> the common format:
> 
> /*
>  * Rewrite memory allocations to use g_new() & friends
>  *
>  * Copyright (C) 2014-2017 Red Hat, Inc.
>  *
>  * Authors:
>  *  Markus Armbruster <armbru@redhat.com>,
>  *
>  * This work is licensed under the terms of the GNU GPL, version 2 or later.
>  * See the COPYING file in the top-level directory.
>  */

Ok

>> + *    (Imported from b45c03f585ea9bb1af76c73e82195418c294919d)
> 
> Scratch this line.  It's in the commit message, and that suffices.

Ok

>> + *
>> + * See http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg00908.html:
>> + *
>> + *   g_new() advantages (from glib doc):
>> + *   - the returned pointer is cast to a pointer to the given type.
>> + *   - care is taken to avoid overflow when calculating the size of the
>> + *   allocated block.
> 
> Repeats what you just said in the text pasted from my commit message.

Ok

>> + *
>> + *   p = g_malloc(sizeof(*p)) is idiomatic, and not obviously inferior to
>> + *   p = g_new(T, 1), where T is the type of *p.
>> + *   But once you add multiplication, g_new() adds something useful: overflow
>> + *   protection.  Conversion to g_new() might make sense then.
>> + */
> 
> This part doesn't really apply, yet: the semantic patch doesn't deal
> with sizeof(*p).
> 
> Please write a coherent introduction instead of a series of quotations.

Sorry :S I'll try :)

>> +
>> +@@
>> +type T;
>> +@@
>> +-g_malloc(sizeof(T))
>> ++g_new(T, 1)
>> +@@
>> +type T;
>> +@@
>> +-g_try_malloc(sizeof(T))
>> ++g_try_new(T, 1)
>> +@@
>> +type T;
>> +@@
>> +-g_malloc0(sizeof(T))
>> ++g_new0(T, 1)
>> +@@
>> +type T;
>> +@@
>> +-g_try_malloc0(sizeof(T))
>> ++g_try_new0(T, 1)
>> +
> 
> Any particular reason for adding this blank line?
> 
> You add more below, and a comment.  Okay, but I'd commit the script
> exactly as given in commit b45c03f, then add improvements on top.

Yes.

>> +@@
>> +type T;
>> +expression n;
>> +@@
>> +-g_malloc(sizeof(T) * (n))
>> ++g_new(T, n)
>> +@@
>> +type T;
>> +expression n;
>> +@@
>> +-g_try_malloc(sizeof(T) * (n))
>> ++g_try_new(T, n)
>> +@@
>> +type T;
>> +expression n;
>> +@@
>> +-g_malloc0(sizeof(T) * (n))
>> ++g_new0(T, n)
>> +@@
>> +type T;
>> +expression n;
>> +@@
>> +-g_try_malloc0(sizeof(T) * (n))
>> ++g_try_new0(T, n)
>> +
>> +@@
>> +type T;
>> +expression p, n;
>> +@@
>> +-g_realloc(p, sizeof(T) * (n))
>> ++g_renew(T, p, n)
>> +@@
>> +type T;
>> +expression p, n;
>> +@@
>> +-g_try_realloc(p, sizeof(T) * (n))
>> ++g_try_renew(T, p, n)
>> +
>> +// drop superfluous cast
>> +@@
>> +type T;
>> +expression n;
>> +@@
>> +-(T *)g_new(T, n)
>> ++g_new(T, n)
>> +@@
>> +type T;
>> +expression n;
>> +@@
>> +-(T *)g_new0(T, n)
>> ++g_new0(T, n)
>> +@@
>> +type T;
>> +expression p, n;
>> +@@
>> +-(T *)g_renew(T, p, n)
>> ++g_renew(T, p, n)

Thanks for your review :)

Phil.

