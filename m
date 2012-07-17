Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrDNY-0007EB-EU
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 15:24:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrDNW-00079R-Bf
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrDNV-0003M8-8M
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:24:14 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SrDNS-0003LI-55; Tue, 17 Jul 2012 15:24:10 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E795072800C6; Tue, 17 Jul 2012 21:24:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HfgTBQLAaHaE; Tue, 17 Jul 2012 21:24:08 +0200 (CEST)
Received: from [192.168.178.20] (p5086F649.dip.t-dialin.net [80.134.246.73])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	18032728001A; Tue, 17 Jul 2012 21:24:08 +0200 (CEST)
Message-ID: <5005BBD7.1000905@weilnetz.de>
Date: Tue, 17 Jul 2012 21:24:07 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
In-Reply-To: <CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix ALSA
	configure test
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
X-List-Received-Date: Tue, 17 Jul 2012 19:24:15 -0000

Am 17.07.2012 20:46, schrieb Peter Maydell:
> On 17 July 2012 19:32, Stefan Weil <sw@weilnetz.de> wrote:
>> Hello Anthony, hello Blue,
>>
>> these patches fix broken builds, therefore I expected that they
>> would be applied fast:
>>
>> http://patchwork.ozlabs.org/patch/171066/
>> http://patchwork.ozlabs.org/patch/171067/
>> http://patchwork.ozlabs.org/patch/171081/
>> http://patchwork.ozlabs.org/patch/171082/
>>
>> The first of them fixes the ALSA problem.
>
> I think this is making it clearer that we should back out
> the Werror change in favour of something more narrowly
> targeted (although we may as well fix these warnings in
> test code anyway). Patch to follow...
>
> -- PMM

The arguments why -Werror is a bad idea for some configure tests
are reasonable.

Nevertheless the QEMU community was able to produce thousands of
lines of code which compile without a warning, so we should be able
to create warning and error free code for a handful of configure
tests.

The 4 patches above are valid and can be applied with or without
-Werror, therefore qemu-trivial or whoever does not have to wait for
Peter's patch. There is an ongoing discussion for the 3rd patch,
so maybe patches 3 and 4 need to be delayed (they are less important
because they are only needed for some older hosts which
don't use -march=i868 by default).

Regards,
Stefan W.


