Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctwfM-0001Q9-Af
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 09:32:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctwfK-0001Ok-8x
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 09:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctwfJ-0005ES-0A
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 09:32:34 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ctwfD-0005AL-RT; Fri, 31 Mar 2017 09:32:28 -0400
Received: by mail-pg0-x242.google.com with SMTP id 81so17498313pgh.3;
	Fri, 31 Mar 2017 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:reply-to:subject:references:to:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eVtMudJe1E1aUGxv7qp3i3iBlFJvE16KKfIoZJxYLFQ=;
	b=sXxDiXAJQOkt0gTedaMK0IzL9/r2Bns2Lc4NT1A+EjaZfVABNws339hQiNsgmsE0Gh
	Izeg1ESrZhjhjte3sp9+396vT5fMIIgbAtReFStwWImhsF0ax6a3bRY3wrCuf6By721Y
	P9tBW3jFAHRhQZX4rPbVKGGRnfCTdiqb5xhfJg8kL/J8uzJB54+4iVPfS1Nuc42x87Bc
	RxvYOqPwgVBFM+3NEu+Y1Q4dBELoTsFgQd5Q6Pq6O0++6kxBSH52MvIEhOUH7sFlFOO7
	CySRtJSdLJoqXlCN/5cnAVYchGmgNcPTV7LuFTkD7iEgerHLcl8AWDFM++Er2+Q3hkHI
	2w1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=eVtMudJe1E1aUGxv7qp3i3iBlFJvE16KKfIoZJxYLFQ=;
	b=GVrawJRR61vxeJqIQpDm3RvwraTGnlRzoqKw/qv01H+1epL1Z0lrSj0ZmWBVhJ1orJ
	AkGgo7Qbnlf8OPX8JTCw8Xk/gmJ4SBQtIobCeMlsTC17R0LmEnggWlvY4YOughxgOnvP
	RbypdJiUyrBhRsyap3jiXMsmXEsBJAggHPFTkT4RPLQfnezDi/5zhQCXCqudAH6k3Fha
	cpXM6T7ZknCizZAeXq5UZsZcyHBjlrxGe/h9D+TQH9bcMEzF3xxp20VRkOnzqYkBr2p4
	tWaXk+Nqw3ExN5g6ONFvDI53FiI+SHT2SnDZ0aTYOn5iI53oPItbKbktkbkMHpkyxHNh
	Y/CQ==
X-Gm-Message-State: AFeK/H0ZclsNuTjOD72rq9+AwcpDzBoLoOKKdmAurqVmfoJ3ny4t6jZ7+FMRimvYligiZw==
X-Received: by 10.84.191.165 with SMTP id a34mr3668670pld.62.1490967146726;
	Fri, 31 Mar 2017 06:32:26 -0700 (PDT)
Received: from serve.minyard.net ([47.184.141.54])
	by smtp.gmail.com with ESMTPSA id
	78sm4087468pfm.134.2017.03.31.06.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 06:32:25 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [IPv6:2001:470:b8f6:1b:a51b:cbe7:9200:1565] (unknown
	[IPv6:2001:470:b8f6:1b:a51b:cbe7:9200:1565])
	by serve.minyard.net (Postfix) with ESMTPSA id 32C905F8;
	Fri, 31 Mar 2017 08:32:24 -0500 (CDT)
Reply-To: minyard@acm.org
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
	<0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
	<71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
	<f99214c2-6a18-5ab0-c6af-75590cc8d5fd@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Corey Minyard <cminyard@mvista.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <f0dd4986-add0-b3d5-745e-e56ca0d23a22@acm.org>
Date: Fri, 31 Mar 2017 08:32:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f99214c2-6a18-5ab0-c6af-75590cc8d5fd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
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
X-List-Received-Date: Fri, 31 Mar 2017 13:32:35 -0000

On 03/30/2017 03:00 PM, Eric Blake wrote:
> On 03/30/2017 02:10 PM, Corey Minyard wrote:
>
>>> Already reviewed by me, so now I'm just adding commentary: Is this still
>>> 2.9 material?  It silences a build warning under clang, although I
>>> didn't analyze whether the unpatched code actually caused an observable
>>> behavior bug or just compiler noise.
>>>
>> I don't believe the code has a bug, going through all the uses there is
>> no expression used as a parameter or set used in an expression.
> Actually, let's re-read the clang warning, posted by Ed - we DO have an
> expression used as a parameter:
>
>> Found via Clang warning: logical not is only applied to the left hand
>> side of this bitwise operator [-Wlogical-not-parentheses]
>>
>>                                !IPMI_BT_GET_HBUSY(ib->control_reg));
>>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> expanded from macro 'IPMI_BT_SET_HBUSY'
>>                                         (((v & 1) << IPMI_BT_HBUSY_BIT)))
>>                                            ^ ~
> But we STILL have to audit to see if that expression used as a parameter
> causes a bug:
>
>          if (IPMI_BT_GET_HBUSY(val)) {
>              /* Toggle */
>              IPMI_BT_SET_HBUSY(ib->control_reg,
>                                !IPMI_BT_GET_HBUSY(ib->control_reg));
>          }
>
> with the expectation that it will toggle the bit.  But does it really?
>
> Unpatched, it expands to this:
>
> (ib->control_reg) = (((ib->control_reg) & ~IPMI_BT_HBUSY_MASK) |
>    (((!IPMI_BT_GET_HBUSY(ib->control_reg) & 1) << IPMI_BT_HBUSY_BIT)))
>
> Everything left of the | is okay, but to the right, this further expands to:
>
> (((!(((ib->control_reg) >> IPMI_BT_HBUSY_BIT) & 0x1) & 1) <<
> IPMI_BT_HBUSY_BIT))
>
> Since the inner expression of IPMI_BT_GET_HBUSY(ib->control_reg) is
> properly parenthesized and always 0 or 1, it boils down to either:
>
> (!0 & 1) << shift // 1 & 1, results in changing the HBUSY from 0 to 1
> (!1 & 1) << shift // 0 & 1, results in changing the HBUSY from 1 to 0
>
> so we actually achieve the toggle we wanted.  If I'm reading it
> correctly, the clang warning is asking if we instead meant:
>
> (!(0 & 1)) << shift // !0, results in changing the HBUSY from 0 to 1
> (!(1 & 1)) << shift // !1, results in changing the HBUSY from 1 to 0
>
> which, perhaps surprisingly, would have the same end results for all our
> inputs (but ONLY because the value we are passing to ! is already
> limited to the range of 0 and 1).
>
> Post-patch, we are changing to an expansion of:
>
> ((ib->control_reg) = (((ib->control_reg) & ~IPMI_BT_HBUSY_MASK) |
>    (((!IPMI_BT_GET_HBUSY(ib->control_reg)) & 1) << IPMI_BT_HBUSY_BIT)))
>
> Again, everything to the left of | is okay, to the right further expands to:
>
> (((!(((ib->control_reg) >> IPMI_BT_HBUSY_BIT) & 0x1)) & 1) <<
> IPMI_BT_HBUSY_BIT)
>
> which now boils down to either:
>
> (!(0) & 1) << shift
> (!(1) & 1) << shift
>
> where we are now being explicit that we want the ! bound only to the
> left argument, and not to the overall (a&b) expression.  But we are not
> changing semantics, and therefore not fixing an observable bug.
>
> Note, on the other hand, that a call such as
> IPMI_BT_SET_HBUSY(ib->control_reg, 2) would result in writing 0 to the
> HBUSY bit. In other words, the IPMI_BT_SET_HBUSY() macro is rather weird
> in that it sets or clears the HBUSY bit based solely on whether its v
> parameter is even or odd, rather than the more usual semantics of
> whether the v parameter is 0 or non-zero.  We could change that if we
> wanted - by having the macro expand to "(left | (!!(v) << shift))"
> instead of our current expansion of "(left | (((v) & 1) << shift))" -
> but I still don't think it would change the semantics of any existing
> caller.

Yeah, that would be better.  Should I do another patch?

-corey

>> That said, it's also not going to hurt anything and it's nice to silence
>> the
>> warnings.
> I don't know if there were other warnings or just the one on the use of
> IPMI_BT_SET_BUSY(); it may well be that auditing one of the other
> warnings may turn up an actual behavioral change, but at this point, I'm
> doubting that we are doing any more than shutting up the compiler, and
> working around compiler noise is not the same level of bug fix as an
> actual behavior change.  I'm not opposed to this patch going into 2.9,
> but I don't see any problem if it slips to 2.10.
>


