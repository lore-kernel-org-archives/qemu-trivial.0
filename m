Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa3pi-0005PE-S2
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 09:55:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa3pX-0004zm-U4
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 09:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa3pN-0007Vo-L8
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 09:55:19 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:47435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wa3pN-0007Vg-Dc; Tue, 15 Apr 2014 09:55:09 -0400
Received: by mail-pa0-f45.google.com with SMTP id kl14so9685285pab.32
	for <multiple recipients>; Tue, 15 Apr 2014 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=3DN2/+pC8JvBMAlcxX+Yqv3Eg5XicFdtpHJRfSzyjFg=;
	b=yncT1ZjU5HjAw5eB2m5e2/bbfaOnhaynCRT+t2d+/SHmQt2qhyhqikuG0XWQFUw95E
	5qfSPaB4S4ehWOs4EAGCaiGvaJr4I15VaDsJdrJ504OQjKtlrFvjINpnulbWcY0jAC59
	p4+m9CnyfTPL3jDJFzDBhaSXmGSAB9gLZ+DSEvkRrSdjWuAm0AlmiZTVCHHTPXtJq9cd
	ZNCHwa1+yp26lOUim4XAyaQymq+W03KOByBJIIOXDy0/JKTQ8PmzAcu7QLNKRtTFd61L
	Vh8fL1ljdExFYDMPQQ68cdjiP83qWAeIYxOxKc8RhjpQwKffI7DeYuBQW2B95qcFIfwI
	3r1g==
X-Received: by 10.67.1.39 with SMTP id bd7mr2096273pad.15.1397570108090;
	Tue, 15 Apr 2014 06:55:08 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.91.142])
	by mx.google.com with ESMTPSA id
	pv4sm40530443pbb.55.2014.04.15.06.55.02 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 06:55:07 -0700 (PDT)
Message-ID: <534D3A2E.8020300@gmail.com>
Date: Tue, 15 Apr 2014 21:54:54 +0800
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
	<5343E4D4.6070305@gmail.com> <87ppkjgepp.fsf@blackfin.pond.sub.org>
In-Reply-To: <87ppkjgepp.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
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
X-List-Received-Date: Tue, 15 Apr 2014 13:55:29 -0000

On 04/15/2014 04:49 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> In "vl.c", at least, we can simplify the code below, so can let readers
>> read professional C code (especially for new readers, which often start
>> reading code at main function).
>>
>>  - remove useless 'continue' in main().
>>
>>  - remove redundant local variable 'res' in get_boot_device().
>>
>>  - remove local variable 'args' in the middle of code block in main().
>>
>> The following 3 patches are for the 3 'remove' above.
>>
>> And "vl.c" has a very long function main() which is about 17K lines.
>> Next, it can be split into sub-functions (so can bypass another code
>> style issue: multiple "{...}" styles within "swith(...)").
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  vl.c |   23 ++++++++++-------------
>>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> In future submissions, please send the patches in-reply-to the cover
> letter, not chained together in-reply-to the previous part.  Check out
> git-send-email --no-chain-reply-to.
> 

OK, thanks. But excuse me, I use thunderbird client to send/recv mail
(not use git send-mail), so not quit understand what you said. And I
guess what your meaning is:

  - start a new thread "[PATH 0/3]..."

    - "[PATH 1/3]..." need "reply all" the "[PATH 0/3]..."

    - "[PATH 2/3]..." need "reply all" the "[PATH 0/3]..."

    - "[PATH 3/3]..." need "reply all" the "[PATH 0/3]..."


If what I guess is incorrect, please let me know, and it will be better
to provide more detials.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

