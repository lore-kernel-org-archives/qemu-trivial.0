Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwDkr-0006Bx-Ei
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 17:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDkp-0006Ak-7P
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:20:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDko-0006UN-Hl
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:20:43 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:39910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gwDkk-0006Pd-Bo; Tue, 19 Feb 2019 17:20:40 -0500
Received: by mail-ed1-x543.google.com with SMTP id p27so10618619edc.6;
	Tue, 19 Feb 2019 14:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=7ULve1EEwfa6MZIXA5DBi0S6rioKyDUp1ZiMc45G6zw=;
	b=sEe0ex0kQf8gFtoXm93Hy0axs3t8ivOoyyPJ21M+P3TSKAEZRL+1sgG/uIj7F8WjQ+
	0BBm/9kj95QZveQf/dVoGTqmMId9AaevNCLKIghP3ryyiE0ecq2UItlGpPmOnOWlb3kI
	KtW82uQNPQge+P2HTWhgNL8r+2L2gGXNqb8g7KXjeFNJmdk6HgME21a0ME1t3Udukq+Z
	Yiojrrfe8C/+szMmRl1APkOvbbTQrHNYKPQ0COD8NIKO3RLTxR6eAgqXeM8vOVtA9x3W
	/VCksHaPzjY+R0i1LW6DRXFQC3p4o6CZVeej6USj7FvEMXKvWrMfulxOiEFI9kuTtGBZ
	zKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=7ULve1EEwfa6MZIXA5DBi0S6rioKyDUp1ZiMc45G6zw=;
	b=J3cV0I9tgzKAIeE2fQBIODCjNJI8+a8ecXUy1n++dZwjoOafsQnlX9Onp6uQvOMuA5
	3j11GT/Q10Z/a/cNvQy5DeiUU8DtsRHLYmeWN2CjMCRSuB2UwJSO4hhmcj+E6799syKy
	vVT+5A1+VFgN60lyG2wPNPuC5zm7cQIOOdVrg+saz2p5CV7wBtTH2rgsYIMACR6jSJje
	YxsoNbKK91OWRjUanbS/cjBMUt2uVhr1Dg+X1B7VFXYj8GyTkJEIT3Xm9MqdpVwMSzxs
	Xk3mPU0zAEMJr3wJeFyVaZCoFTQyeYwjQ86VyyuNErPzfKqs1CrOJD/UNOhZLpDqOhAD
	Rv6Q==
X-Gm-Message-State: AHQUAub79CqCxqzeao75IM4WQphLAqbv6SRe2cRYjQPhlAYXtRiTpuIz
	NbkGJThp8RQd6qcXfFUV4eg=
X-Google-Smtp-Source: AHgI3IYmtjgebV/DFHnbEnu8YMj08qGO1Z1op4Ezr9daVkRyrceYwjehfySU33B3ohH30CtgScYtuw==
X-Received: by 2002:a50:a8c6:: with SMTP id k64mr24052137edc.138.1550614829164;
	Tue, 19 Feb 2019 14:20:29 -0800 (PST)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id j6sm5256818edd.43.2019.02.19.14.20.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:20:28 -0800 (PST)
Date: Tue, 19 Feb 2019 22:20:28 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, imammedo@redhat.com, mjt@tls.msk.ru
Message-ID: <20190219222028.y3wt6bgihmx73ptw@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
	<ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
	<77cf32b1-6a4a-33c5-4b3c-8ba3245a4b23@redhat.com>
	<2e584c55-5b40-4a29-b0ae-e53039e38a7d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e584c55-5b40-4a29-b0ae-e53039e38a7d@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] CODING_STYLE: indent
 example code as all others
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
X-List-Received-Date: Tue, 19 Feb 2019 22:20:44 -0000

On Tue, Feb 19, 2019 at 07:55:31PM +0100, Philippe Mathieu-Daudé wrote:
>On 2/19/19 6:56 PM, Eric Blake wrote:
>> On 2/19/19 11:38 AM, Philippe Mathieu-Daudé wrote:
>> 
>>>> +    if (a == 1) {
>>>> +        /* Reads like: "If a equals 1" */
>>>
>>> I guess you found a bug in the documentation :)
>>>
>>> Since 8c06fbdf36bf4d the style asked is:
>>>
>>>     We now require Linux-kernel-style multiline comments:
>>>         /*
>>>          * line one
>>>          * line two
>>>          */
>>>
>>>> +        do_something();
>> 
>> We only require winged multiline comments when the comment is actually
>> multiline.  In this case, the comment is a one-liner, and is just fine
>> as written.
>
>Hmm I have a series where I moved code and changed from /* one line */
>to the multi-line style, I wonder why and remember checkpatch errors.
>Maybe a side-effect from what b94e809d3e fixed.
>
>Anyway, Wei do you mind adding a multi-line example here too?
>

A multi-line example for multiline comments?

This looks not relavant to this sectioin. I am afraid I will not add
this example here. Sorry for that.

>With/without multi-line example:
>Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
>Thanks!
>
>Phil.

-- 
Wei Yang
Help you, Help me

