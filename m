Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaCTk-0004gT-6L
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 19:09:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaCTZ-0004fw-8W
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaCTQ-00013b-7V
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:09:13 -0400
Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230]:41992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WaCTQ-00013R-0S; Tue, 15 Apr 2014 19:09:04 -0400
Received: by mail-pb0-f48.google.com with SMTP id md12so10134886pbc.35
	for <multiple recipients>; Tue, 15 Apr 2014 16:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=H5NMzDa6AGua77xCul+N37LteYB+GAQ27MUOZRs1ras=;
	b=LA0UAww0EmMXvX/3L1fqInVCoG8owzWZH5FlClw24Ju8DUl0DGdWqD0+Bbdt1ngfbr
	0xJFGweQOhiURPYw0N9+PC3Gz4Wi/jeVUuazElp0rFOtPFbglR+IgFQYYQYV1xXzBHuN
	sQMI5V9V8/GFgJmW2aNUlmakMcnYp4zrwp0nCpl32GJlZ63QhSKd+JaJJOHPwimViMxA
	U7w9oYv7FkFBOtzP0PLPjBN59AWbTTBj/E/vmfxTQKN9HaYhqgKwMjf03yGg7Ggh7kdE
	OYTOt6XpbAk8GTPHTJWMTqlbCbSoAc4YrXrZE5uLmtdeyzu56Th2zBa5LWkkNj5d0aaP
	KaEw==
X-Received: by 10.67.1.39 with SMTP id bd7mr4900411pad.15.1397603342843;
	Tue, 15 Apr 2014 16:09:02 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.238.172])
	by mx.google.com with ESMTPSA id
	pv4sm42691697pbb.55.2014.04.15.16.08.55 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 16:09:02 -0700 (PDT)
Message-ID: <534DBBFF.2020106@gmail.com>
Date: Wed, 16 Apr 2014 07:08:47 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <53337BEB.90305@gmail.com>
	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>
	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>
	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>
	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>
	<5343E4D4.6070305@gmail.com>	<87ppkjgepp.fsf@blackfin.pond.sub.org>
	<534D3A2E.8020300@gmail.com> <87mwfmd4te.fsf@blackfin.pond.sub.org>
In-Reply-To: <87mwfmd4te.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 0/3] vl: simplify
 code for main() and get_boot_device()
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
X-List-Received-Date: Tue, 15 Apr 2014 23:09:22 -0000

On 04/15/2014 10:51 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> On 04/15/2014 04:49 PM, Markus Armbruster wrote:
>>> In future submissions, please send the patches in-reply-to the cover
>>> letter, not chained together in-reply-to the previous part.  Check out
>>> git-send-email --no-chain-reply-to.
>>>
>>
>> OK, thanks. But excuse me, I use thunderbird client to send/recv mail
>> (not use git send-mail), so not quit understand what you said. And I
>> guess what your meaning is:
>>
>>   - start a new thread "[PATH 0/3]..."
>>
>>     - "[PATH 1/3]..." need "reply all" the "[PATH 0/3]..."
>>
>>     - "[PATH 2/3]..." need "reply all" the "[PATH 0/3]..."
>>
>>     - "[PATH 3/3]..." need "reply all" the "[PATH 0/3]..."
>>
>> If what I guess is incorrect, please let me know, and it will be better
>> to provide more detials.
> 
> Sounds okay.  But sending with git-send-email is so much easier...
> 

I guess so, too (sending with git-send-email is much easier, which I am
not quite familiar).

I have already familiar with Thunderbird, and at least now, I am not a
maintainer, neither a main patch maker. at present, I have no too many
patches to process. So Thunderbird is enough to me. :-)


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

