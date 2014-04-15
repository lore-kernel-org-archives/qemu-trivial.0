Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZvC2-0005sH-Ry
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 00:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WZvBv-0005s1-MO
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 00:41:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WZvBp-0006vw-OW
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 00:41:51 -0400
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a]:57343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WZvBp-0006ts-G0; Tue, 15 Apr 2014 00:41:45 -0400
Received: by mail-pd0-f170.google.com with SMTP id v10so9017027pde.1
	for <multiple recipients>; Mon, 14 Apr 2014 21:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=9Th8IVQKLdJ/EsUaV9/yWzqp89oYY7Kb91lPiDO18II=;
	b=aeFkGakm8/AgvWuYv22/FP8jY57SY75PoKyEGbb6mweeZn4FhYisAiqENJwVBDx+3A
	3VD8E8h3yrIDtF56iMZYIvpKTEK1wxGWX5FkKiG41HcJy+qfB+NQr27CbuBn365ljO60
	Vp6S4BNo79Az9zXpQAbM6Fa31plM1sLTo7xeDL0rawf5V6IkHZ9u/zW1XXrz/HVBzQ6K
	wXVMdSKqkxvZPdyUl9hLPMZFpt8bfnXPE6ulGsLNqYK1bzU2teJb9OndGb8NEOnMEItd
	tFmy9dG9T2hNWQmkTLrdeeDG85GnGdrKJf1IuoV6TP/jSVRdEPr2mNjsFp9DvAkgEknl
	UdQw==
X-Received: by 10.66.163.164 with SMTP id yj4mr48762175pab.91.1397536904330;
	Mon, 14 Apr 2014 21:41:44 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.234.202])
	by mx.google.com with ESMTPSA id
	xg4sm37324181pbb.47.2014.04.14.21.41.12 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Apr 2014 21:41:43 -0700 (PDT)
Message-ID: <534CB860.7040408@gmail.com>
Date: Tue, 15 Apr 2014 12:41:04 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <53337BEB.90305@gmail.com>	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>	<5343E4D4.6070305@gmail.com>	<5343E516.3020103@gmail.com>
	<CAEgOgz7ey1BCwEoewVGhUtcx34=P8POmKOkNJY=VdfJZHFiJmQ@mail.gmail.com>
In-Reply-To: <CAEgOgz7ey1BCwEoewVGhUtcx34=P8POmKOkNJY=VdfJZHFiJmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 1/3] vl: remove
	useless 'continue'
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
X-List-Received-Date: Tue, 15 Apr 2014 04:41:57 -0000

On 04/15/2014 10:11 AM, Peter Crosthwaite wrote:
> On Tue, Apr 8, 2014 at 10:01 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> > Normal "if (...) {...} else {...}" is enough in "while(...) {...}", not
>> > need additional useless 'continue'.
>> >
> Only in the case where the if-else is not followed by any code. Which
> is the case here. I found this sentance slightly confusing and TBH id
> just drop it or say something less codey like:
> 
> "This if else has no code between it and the end of the enclosing
> while loop. This makes this continue redundant."
> 
>> > Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> But patch is good:
> 
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 

OK, thanks.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

