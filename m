Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrXKt-0000Au-BC
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2012 12:42:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrXKp-0008RX-Jn
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrXKo-0004AG-DW
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:42:47 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SrXKl-00049L-GV; Wed, 18 Jul 2012 12:42:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E9AF572800C9; Wed, 18 Jul 2012 18:42:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id y80fyMQm+HCR; Wed, 18 Jul 2012 18:42:41 +0200 (CEST)
Received: from [192.168.178.20] (p5086F660.dip.t-dialin.net [80.134.246.96])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	CB999728001A; Wed, 18 Jul 2012 18:42:40 +0200 (CEST)
Message-ID: <5006E77F.8030602@weilnetz.de>
Date: Wed, 18 Jul 2012 18:42:39 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA-Cg7HOU3okDFUOdD9iG3z4gYKQovoNoFRibVV-1_E3Mw@mail.gmail.com>
In-Reply-To: <CAFEAcA-Cg7HOU3okDFUOdD9iG3z4gYKQovoNoFRibVV-1_E3Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use macro QEMU_PACKED for
	new packed structures
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
X-List-Received-Date: Wed, 18 Jul 2012 16:42:50 -0000

Am 18.07.2012 18:33, schrieb Peter Maydell:
> On 18 July 2012 17:12, Stefan Weil <sw@weilnetz.de> wrote:
>> Since commit 541dc0d47f10973c241e9955afc2aefc96adec51,
>> some new packed structures were added without using QEMU_PACKED.
>>
>> QEMU_PACKED is needed for compilations with MinGW.
>> For other platforms nothing changes.
>>
>> The code was fixed using this command:
>>
>>      git grep -la '__attribute__ ((packed))'|xargs perl -pi -e 's/__attribute__ \(\(packed\)\)/QEMU_PACKED/'
> There's one in tcg/tcg.c as well, which you missed because
> it doesn't have a space between the "__attribute__" and
> "((packed))".
>
> (There are also some in some of the tcg-target.c files,
> but those are cases of the packed attribute being applied
> to individual struct members rather than a whole struct, so
> I'm not entirely sure what we should do with those.)
>
> -- PMM
>

I noticed those, too, but did not change them because
I think that they need more examination (see my comment
in http://lists.nongnu.org/archive/html/qemu-devel/2012-07/msg02373.html).

Thanks,

Stefan W.




