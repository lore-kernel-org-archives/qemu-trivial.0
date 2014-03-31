Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUfSB-0005T7-5d
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 12:52:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WUc18-0005Si-B7
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WUc0z-0005DP-7s
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:12:46 -0400
Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e]:35578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WUc0g-0004q6-GC; Mon, 31 Mar 2014 09:12:18 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so8147279pbb.19
	for <multiple recipients>; Mon, 31 Mar 2014 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=VKRdRL6Vtd2VuSgH2r9RD9AA6RMm13WwKICkRU5oD5k=;
	b=huA6bemDM7smo0TsdsuMw/sYKMOl9yYP4Ys2Ft9ftPAxhN1GIBja4E4qDCFMEvg/WQ
	f5+Uk3sZrRjZ5V5N16kw1wBH5II3BtrN4pRzQT1xlG4gLIJMeXb4JycAUBlWi7b4CkYE
	JjRtavmQqwFtaBZca4PUiOZ6C0Z68wboDOkocvITAwGUVJ587DbV37zpJi+WxaaTj2zJ
	S+aPFEBrJQwJ9rcGVhPnjC2nDCzDsn92jJIda/tJtvAEeesmO0uSuc5qHHpiBzd2Rrwy
	qrUW3Aho4e+S4g0tN72YmViYCDNiwU3gOYylOXaSCvcb8B4K60uBXqHnmfjJJJE2KIex
	JPJg==
X-Received: by 10.68.244.229 with SMTP id xj5mr25369279pbc.108.1396271537429; 
	Mon, 31 Mar 2014 06:12:17 -0700 (PDT)
Received: from [192.168.1.104] ([106.37.103.35])
	by mx.google.com with ESMTPSA id
	nx12sm40605607pab.6.2014.03.31.06.12.13 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 06:12:16 -0700 (PDT)
Message-ID: <533969AB.4010505@gmail.com>
Date: Mon, 31 Mar 2014 21:12:11 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
In-Reply-To: <CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22e
X-Mailman-Approved-At: Mon, 31 Mar 2014 12:52:53 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: use 'break' instead
 of 'continue' in configure_accelerator()
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
X-List-Received-Date: Mon, 31 Mar 2014 13:12:56 -0000



On 03/31/2014 09:01 PM, Peter Maydell wrote:
> On 31 March 2014 13:53, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> On 03/31/2014 08:38 PM, Markus Armbruster wrote:
>>> Chen Gang <gang.chen.5i5j@gmail.com> writes:
>>>
>>>> Hello Maintainers:
>>>>
>>>> If it is necessary to send patch v2 by me, please let me know, I
>>>> will/should send.
>>>
>>> Not a maintainer, but if you send a v2 with an improved commit message,
>>> I'll R-by it, which can only help getting it merged.
>>>
>>
>> I guess your meaning is "not quite necessary" (for me, minor useful
>> patches almost like spam). So if sending patch v2 is really required,
>> please let me know, thanks.
> 
> Basically, asking a maintainer to make changes to a patch
> as they apply it is asking them to do extra work beyond
> what they would normally do. Sometimes people will agree
> to do this, but in general it's better just to send a fixed
> version of the patch yourself.
> 
> (I've cc'd qemu-trivial since that's probably the best tree
> to take this patch.)
> 

OK, thanks. And excuse me, my English is not quite well, I guess, I
misunderstood the original replier's meaning. I will/should send patch
v2 for it within this week (2014-04-06).

Next, when I send trivial patches, I will/should cc to qemu-trivial. I
guess, most of my future patches will be trivial patches (and for me,
trivial != minor).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

