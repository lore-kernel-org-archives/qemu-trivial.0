Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwFEE-00040A-MK
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 18:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gwFED-0003zx-2d
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 18:55:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gwFEB-00046k-92
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 18:55:08 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gwFEA-00046G-SC
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 18:55:07 -0500
Received: by mail-wm1-f65.google.com with SMTP id y15so4596208wma.0
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 15:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e9wVLzDcirlvJd0Da8Dz3L6hjaZZsUmf+jlYJVlKf8s=;
	b=NY5D0XCeEIDUoZ0vdUf3VpQI7pLVb7jhbeFwft65AoYsv5XVlsmC7oT7Qbm/NMoEGG
	b0tU85nRUjOSvtQk5SEjw5DvB4nlcH2Gt4jUy1Vrlk6rKheGjeHDfsnaqcAz995kWpqX
	mWbeoLFdnLVa/oDh2vC1qD72i2P1nKEeHTA9OyK37fp66bJqTwuPV1QLjlbYab9oV9xN
	3SKsGfoybgQYcpljpzWqRRYryO8Wwo7aXXL2ebhcM8irDBAATL4OKgs8pFipPZSOOc0e
	co3MJhYK35DmNxwqXCabi0CjK5D+WfCGYaBJ/OuKmp1C/cTpjm8X3BU99EIUyIyCLvN9
	JO6w==
X-Gm-Message-State: AHQUAuaY4sfWAukBMsPNaxtah2wvIXsrvDjiqCNpEI+BEayX+WI8iEsK
	vleymAXJR5uMobLN5KL4aa+t6Q==
X-Google-Smtp-Source: AHgI3IboorBza0oSljLIc88ipV1t0+GO5u0caKWRWcyuvA8qzodnpqDwzrVnouDO4BnuYuBq68Qzmw==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr4347852wmj.13.1550620504182; 
	Tue, 19 Feb 2019 15:55:04 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	c18sm21354040wre.32.2019.02.19.15.55.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 15:55:03 -0800 (PST)
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Eric Blake <eblake@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, imammedo@redhat.com,
	mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
	<ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
	<77cf32b1-6a4a-33c5-4b3c-8ba3245a4b23@redhat.com>
	<2e584c55-5b40-4a29-b0ae-e53039e38a7d@redhat.com>
	<20190219222028.y3wt6bgihmx73ptw@master>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <58531fe2-edd9-0be9-6136-074a7226e8b5@redhat.com>
Date: Wed, 20 Feb 2019 00:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190219222028.y3wt6bgihmx73ptw@master>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
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
X-List-Received-Date: Tue, 19 Feb 2019 23:55:10 -0000

On 2/19/19 11:20 PM, Wei Yang wrote:
> On Tue, Feb 19, 2019 at 07:55:31PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/19/19 6:56 PM, Eric Blake wrote:
>>> On 2/19/19 11:38 AM, Philippe Mathieu-Daudé wrote:
>>>
>>>>> +    if (a == 1) {
>>>>> +        /* Reads like: "If a equals 1" */
>>>>
>>>> I guess you found a bug in the documentation :)
>>>>
>>>> Since 8c06fbdf36bf4d the style asked is:
>>>>
>>>>     We now require Linux-kernel-style multiline comments:
>>>>         /*
>>>>          * line one
>>>>          * line two
>>>>          */
>>>>
>>>>> +        do_something();
>>>
>>> We only require winged multiline comments when the comment is actually
>>> multiline.  In this case, the comment is a one-liner, and is just fine
>>> as written.
>>
>> Hmm I have a series where I moved code and changed from /* one line */
>> to the multi-line style, I wonder why and remember checkpatch errors.
>> Maybe a side-effect from what b94e809d3e fixed.
>>
>> Anyway, Wei do you mind adding a multi-line example here too?
>>
> 
> A multi-line example for multiline comments?
> 
> This looks not relavant to this sectioin. I am afraid I will not add
> this example here. Sorry for that.

No worries, R-b stands.

>> With/without multi-line example:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Thanks!
>>
>> Phil.
> 

