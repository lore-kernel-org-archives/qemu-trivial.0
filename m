Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZlGu-0008Pr-Ed
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:52:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlGr-0008Nj-Q1
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlGr-0000v7-02
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:52:09 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37266)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlGj-0000oa-EX; Mon, 24 Jul 2017 17:52:01 -0400
Received: by mail-qk0-x241.google.com with SMTP id q130so11133781qka.4;
	Mon, 24 Jul 2017 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8e0pCFaD9iatH53lWgNwxJ0rDth9XBQ3UVDTp9MUY6g=;
	b=S1VMWxDJ457v/mHlDS3pN6J1Zd0k2FOGfcxL3/9ugDwkkjD3wIQlpOrNLabKYlGH0+
	xqOrGoK9kjhCdX+6UmD1J4yvAEVkfwFJr4cFFh51Kdf6kBVRpqU8rHMWBFPb/KCQKBAX
	7gQH9EhfbNLL+o42HR511/BWLNqsDBsPVJcddBnqxpqW72qUTxsGsapccaqjGwpTEYuG
	DXMLOSvmJNIC7zp2sFQaH/etjUdkU7Opdu/+xy9xVpKS4v03IO54i1SYKcIGNm8GVjst
	CE0FZXc/3kT99SLGXITG0fBuaOTQVrTZZu5dXSFk9xo26gon8UbC4rqSFmBVRZjamdIQ
	lUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8e0pCFaD9iatH53lWgNwxJ0rDth9XBQ3UVDTp9MUY6g=;
	b=SJqYnBAxlTeKhjPwIUPQcaLHkpCFcc6gFeluki3MQRHVkkwa4ge85P9MhhI97LOkrd
	us4rm4OTW3tU6vdTbZeC6X+els7VKyTHkXEV9CYiFo4cA46lAh2YsyJGtedEwHtvIBRh
	1WPnggtqutbz6naGsZRB7prf/ZOCC42qhCS3EMBY0Vu9z7Zmw707oPu5VuCVWDjJ0AkV
	DdMwwi/9o1Y57JfYNuw9731hI6ULLZO/5eI5b2TAenqw/JgTN5Eh4ZKPEp47Dn7dQCtH
	592f++zV/soxg/RdsbZNMkEJhDIlvLBtmdNGstTJ4Td7vHWj+2Pcah9SXNJAlmSn2uUi
	iXgA==
X-Gm-Message-State: AIVw113K4foSTKP56jbkeX4BW/qo5pVpPSAs32SuSWMaO6yDRk8PYnxP
	+axrJXCK9sxHIZMvRGyb6Q==
X-Received: by 10.55.170.205 with SMTP id t196mr20621148qke.106.1500933120672; 
	Mon, 24 Jul 2017 14:52:00 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t21sm9162703qte.97.2017.07.24.14.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 14:51:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-33-f4bug@amsat.org>
	<CAFEAcA9d5SE-+=YxJ_dwjvkpxs2R0QJszESExGoG2y+Bnyk2aA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <30a8ec15-315a-9bb4-5d7e-5c6b8da4e129@amsat.org>
Date: Mon, 24 Jul 2017 18:51:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9d5SE-+=YxJ_dwjvkpxs2R0QJszESExGoG2y+Bnyk2aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 32/35]
 timer/pxa2xx: silent warning about out-of-bound memory access
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
X-List-Received-Date: Mon, 24 Jul 2017 21:52:11 -0000

On 07/24/2017 06:01 PM, Peter Maydell wrote:
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Unlikely to happen.
>>
>> hw/timer/pxa2xx_timer.c:145:19: warning: Out of bound memory access (accessed memory precedes memory block)
>>          counter = counters[n];
>>                    ^~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/timer/pxa2xx_timer.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
>> index 68ba5a70b3..d47f463636 100644
>> --- a/hw/timer/pxa2xx_timer.c
>> +++ b/hw/timer/pxa2xx_timer.c
>> @@ -139,7 +139,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, int n)
>>       if (s->tm4[n].control & (1 << 7))
>>           counter = n;
>>       else
>> -        counter = counters[n];
>> +        counter = counters[n & 7];
>>
>>       if (!s->tm4[counter].freq) {
>>           timer_del(s->tm4[n].tm.qtimer);
>> --
> 
> This looks rather odd, because we use a mask to guard
> the counters[] array index, but we do an access into
> another 8-element array with n both immediately
> above and immediately below that.
> 
> It's not actually possible to call this function
> with n not between 0 and 7 -- if the static
> analyser can't figure that out does adding an
> assert at the top of the function help it out?

Yep, I'm keeping patches with "static analyzer hints" for 2.11 unless 
there is interest in having them in 2.10 (this patch now included in 
that 2.11 series).

Thanks,

Phil.

