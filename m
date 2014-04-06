Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWmFU-00077Z-14
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 08:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WWmFJ-00074E-CG
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 08:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WWmFA-0005N1-C4
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 08:32:21 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:49412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WWmFA-0005LU-6K; Sun, 06 Apr 2014 08:32:12 -0400
Received: by mail-pa0-f45.google.com with SMTP id kl14so5510621pab.18
	for <multiple recipients>; Sun, 06 Apr 2014 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=8JIrYf5FQXBdFv33KCfj4rL2Nih2k7NCoCym4UIO9ag=;
	b=wfuKAtYhke0VivNyw9FFxk7F06jxnUjMpOmKMB2pqO4Jh1/PnQpwLOZHfBYsihNJMB
	8XHxmlDI1/Dnj735TeZHtmGN8xwDu0RKx/4/ZtX0SVaJS3pBOvMPZRJf5VxrGdfcNwfy
	5260JQ/stwY0WlW+yYkU82JuWYlwD+SgDi94pVtaaU0QAXrxWAIIKQj78t6PhmaTeqbW
	WzLnmclw/1MgG9Ao57SODgG2wS4nGQtM0T8NlUNnuy/apZASMg6oByTfqUGY9Tif2/2a
	dulM8/NtpgaFQdTm4rmqibXaZzwriOkE2g/WnYnpQ5VgSLMxEV9Jh0LEzz5Brw4AFWy3
	K/Mg==
X-Received: by 10.68.203.135 with SMTP id kq7mr9130151pbc.85.1396787531225;
	Sun, 06 Apr 2014 05:32:11 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.87.241])
	by mx.google.com with ESMTPSA id
	pl10sm30012908pbb.56.2014.04.06.05.32.05 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Apr 2014 05:32:10 -0700 (PDT)
Message-ID: <53414941.5040908@gmail.com>
Date: Sun, 06 Apr 2014 20:32:01 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
In-Reply-To: <5340F4FD.7040305@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH-trivial v2] vl: Report accelerator not
 supported for target more nicely
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
X-List-Received-Date: Sun, 06 Apr 2014 12:32:30 -0000


On 04/06/2014 02:32 PM, Michael Tokarev wrote:
> 04.04.2014 13:39, Chen Gang wrote:
>> When you ask for an accelerator not supported for your target, you get
>> a bogus "accelerator does not exist" message:
>>
>>   $ qemu-system-arm -machine none,accel=kvm
>>   KVM not supported for this target
>>   "kvm" accelerator does not exist.
>>   No accelerator found!
>>
>> Suppress it.
> 
> Applied to -trivial, thanks!
> 
> /mjt
> 

Thanks !

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

