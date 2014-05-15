Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wl0IZ-0008Gu-Ed
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 14:22:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Wl0IS-00083t-Sl
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 14:22:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Wl0IO-0006X2-3Z
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 14:22:24 -0400
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:63213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Wl0IE-0006VI-B2; Thu, 15 May 2014 14:22:10 -0400
Received: by mail-qg0-f45.google.com with SMTP id z60so2362514qgd.4
	for <multiple recipients>; Thu, 15 May 2014 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cd61w/51YmXtn4zc8SGnRDL/ZCMVStQKiAeTvq3MKYo=;
	b=ZpRkZ5BuEebsqzISX7+MYu7AGwrOgmUm0HgI/JhXJ9IcTHrvLcbRaW86XoA3lbksW2
	DBbToKKcg0YFoX8nOqDJgk8CsjV/k2ObVWRAXG+HSxawA490Nmr8UbQvk5U4zi+CrYvF
	74esRaYHdY8evVp6/aDounTP2BgiVGFyOMlpVDkZCgqQsbv7hi551iXBo6FtAFfs486K
	b8jVsBYVMKX5x+uzWtBaBytoChs7XFLxmDcWs2X5pXg0Zx+qdnOAJ93Ah0oIkY3fbMcZ
	HgVsvKrk/VAuo0+5hROFXsIQyaTwGSmi2bbqMyXr05dlHoIaxupGzdroafAIVwaHjAny
	jG0g==
X-Received: by 10.224.69.130 with SMTP id z2mr2289403qai.87.1400178129242;
	Thu, 15 May 2014 11:22:09 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id f3sm9034793qag.7.2014.05.15.11.22.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 May 2014 11:22:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <537505CD.1020105@twiddle.net>
Date: Thu, 15 May 2014 11:22:05 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1399051958-9459-1-git-send-email-peter.maydell@linaro.org>
	<5363E860.6060307@twiddle.net>
	<CAFEAcA8UPr1Y8W067Hn7aJB0E1qoWKV3-xDF=DHFVKH+8BHMbw@mail.gmail.com>
In-Reply-To: <CAFEAcA8UPr1Y8W067Hn7aJB0E1qoWKV3-xDF=DHFVKH+8BHMbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] bswap.h: Rename ldl_p, stl_p,
 etc to ldl_he_p, stl_he_p, etc
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 May 2014 18:22:30 -0000

On 05/15/2014 11:13 AM, Peter Maydell wrote:
> On 2 May 2014 19:48, Richard Henderson <rth@twiddle.net> wrote:
>> On 05/02/2014 10:32 AM, Peter Maydell wrote:
>>> We have an unfortunate naming clash between the functions
>>> ldl_p, stl_p, etc defined in bswap.h (which have semantics
>>> "load/store in host endianness") and the #defines of the same
>>> name in cpu-all.h (which have the semantics "load/store in
>>> target endianness").
>>>
>>> Fortunately it turns out that the only users of the bswap.h
>>> functions are all within bswap.h itself, so we can simply
>>> rename them to include a _he_ infix for "host endianness".
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> Frankly I'm surprised that the only users of these functions
>>> are the ones within bswap.h itself, but it's a lucky escape
>>> from having to audit an enormous pile of code...
>>>
>>> We had talked about changing the "target-endian" accessors
>>> to be ldl_te_p &c, but given the uses aren't tangled together
>>> as I feared they would be, I'm not sure we can justify the
>>> global function rename.
>>
>> I'm surprised too, but... good news, I guess.
>>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
> 
> Anybody care to suggest a submaintainer tree this should
> go in via?

Trivial?  Ha, ha, only serious.


r~


