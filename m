Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpDAx-0006MD-Nq
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 08:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpDAq-0006HB-RT
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:41:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpDAm-0001cK-5k
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:41:48 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:33732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpDAm-0001c4-1G; Tue, 05 Sep 2017 08:41:44 -0400
Received: by mail-qt0-x231.google.com with SMTP id i50so11422232qtf.0;
	Tue, 05 Sep 2017 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=39Me8lXIy5VBPit/mrAtHHjFrlqa92uxLxXFfC7V2U4=;
	b=M7NaXOeI+STmPpTFY4xOWGR8LBV27kWsG3cfh7sQsEB4WUNHt6q3voIj9iNMPFbM3z
	UzPUEccY2UUPgFaMNESjJLBCOMnpPIricFvjCEgBnBavK/lW5F37im8mr9CIhS/BBQA0
	f/dCa89pNZtmoqfJoH66BhvU1EnQpViiujqfzBlN8HBzJ8FzZlQVd1npdVhX91745vua
	I73I/LiUxWuJSlgLJ41j7oda7obV8sPQAbozsLO4nmkeOexCKz7Isozw6yjY72BHTlvu
	sXlOvf5BnID6kjvfIa+QrNaRDfgUALQTCbL9NG4db3RLYwLEOsho6U5tIvUswz5Jx8yN
	XVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=39Me8lXIy5VBPit/mrAtHHjFrlqa92uxLxXFfC7V2U4=;
	b=Hg90hs/rc+Sz+GWucV2eVFdg1UOzFrX9+qBdR4YJ07a/1c7q0T47Y2qrWz+BadR8PY
	3IUv/sa0AAkyAYtOq/UNVBaQtHDS4awf2U1HRzdz3iyfDb5Snb7EzA0J8dil44mMqgaS
	LACLuSWgjb68WlUf96JT+IMESCPgNqhVg7FOE0zOTlUftkgKhXaFP85hW517w4dPunjm
	BQLeqG9wtDJOgmftGEpqnQm9+genfktz2RUs8zlv95Lj3zjNfMxdzvZzkKCtKCQ3NknC
	hpQCE8/AWbFHXIWnj1g/oTKZfctu7BwddReVNTWvHoxohZcFV2UhpnqRK/MuPD7qRAVx
	gsYA==
X-Gm-Message-State: AHPjjUgPQmXMb30ColOcz78EPN/GrikI67n7QUrAPkK01aj0P9qtB7oH
	ZAlogxPuuQqKNnqKJtd/lA==
X-Google-Smtp-Source: ADKCNb5F82+CASvWVFWnrHuTt8um1ymaR6l8Ksqzj6wTF1yUuIZTXLhD3UljVMDXTSO0HTKKDnORIQ==
X-Received: by 10.200.38.135 with SMTP id 7mr5203725qto.225.1504615303191;
	Tue, 05 Sep 2017 05:41:43 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id a50sm185407qtc.93.2017.09.05.05.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 05:41:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <54c80221-aaf8-48c3-d58d-485003f77988@amsat.org>
Date: Tue, 5 Sep 2017 09:41:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-trivial] [Qemu-devel] clang-tidy: use g_new() family of
 functions
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
X-List-Received-Date: Tue, 05 Sep 2017 12:41:54 -0000

Hi Marc-André,

On 09/05/2017 09:14 AM, Marc-André Lureau wrote:
> Hi,
> 
> I have a series of changes generated with clang-tidy qemu [1] pending
> for review [2].
> 
> It translates calloc/*malloc*/*realloc() calls to
> g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].
> 
> This is the first commit to give you an idea:
> 
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 98fddd7ac1..75affcb8a6 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
>       arm_timer_state *s;
>       QEMUBH *bh;
> 
> -    s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
> +    s = g_new0(arm_timer_state, 1);
>       s->freq = freq;
>       s->control = TIMER_CTRL_IE;
> 
> g_new() advantages (from glib doc):
> - the returned pointer is cast to a pointer to the given type.
> - care is taken to avoid overflow when calculating the size of the
> allocated block.
> 
> But it is also shorter&nicer :)
> 
> I have not included in the first batch the opportunity to also
> translate: alloc(sizeof(*p) * x) to g_new(typeof(*p), x), since it is
> arguably not much nicer. But for consistency, I think it would be good

"avoid overflow when calculating the size" sounds nicer.

> to use g_new(). What do you think?

Dunno if useful, but Juan Quintela had some issue:

http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg00085.html

> 
> I splitted the changes amont the various MAINTAINERS entries, but it
> is still about 70 patches (without the typeof() changes).
> 
> 
> [1] https://github.com/elmarco/clang-tools-extra/
> [2] https://github.com/elmarco/qemu/commits/gnew
> 
> 

