Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQNP7-0001Iq-Lf
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 16:15:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VQNOy-0001Eu-U3
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VQNOr-0002d5-6y
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:15:36 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:60200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VQNOc-0002Zl-DQ; Sun, 29 Sep 2013 16:15:14 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8144872809F1; Sun, 29 Sep 2013 22:15:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pQGZH3ZV6TBa; Sun, 29 Sep 2013 22:15:11 +0200 (CEST)
Received: from [192.168.178.35] (p54AD8DCF.dip0.t-ipconnect.de
	[84.173.141.207])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	81E2C72809F0; Sun, 29 Sep 2013 22:15:11 +0200 (CEST)
Message-ID: <52488A4E.5010902@weilnetz.de>
Date: Sun, 29 Sep 2013 22:15:10 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1380362114-29476-1-git-send-email-sw@weilnetz.de>
	<52488325.5090702@msgid.tls.msk.ru>
In-Reply-To: <52488325.5090702@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Remove unused assignment (fixes
 warning from clang)
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
X-List-Received-Date: Sun, 29 Sep 2013 20:15:44 -0000

Am 29.09.2013 21:44, schrieb Michael Tokarev:
> 28.09.2013 13:55, Stefan Weil wrote:
[...]
>> diff --git a/blockdev.c b/blockdev.c
>> index 8aa66a9..8c83f6f 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -1926,7 +1926,6 @@ void qmp_drive_mirror(const char *device, const
>> char *target,
>>       } else {
>>           switch (mode) {
>>           case NEW_IMAGE_MODE_EXISTING:
>> -            ret = 0;
>>               break;
>
> While this one is obviously unused assignment,
> there's on more usage of `ret' variable in this
> function, -- it is to store the return value
> from bdrv_open():
>
>     ret = bdrv_open(target_bs, target, NULL, flags |
> BDRV_O_NO_BACKING, drv,
>                     &local_err);
>     if (ret < 0) {...
>
> What's the rule about converting that into if() ?
>
> Thanks,
>
> /mjt

Is there a rule for cases like that? This pattern is very common in QEMU
code
(several occurrences in blockdev.c). Should we eliminate the 'ret' variable?
I don't think it's worth the effort.

Stefan


