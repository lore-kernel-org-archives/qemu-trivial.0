Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrCZI-0006og-My
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 14:32:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrCZF-0006hF-O0
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 14:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrCZE-0006C5-Ip
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 14:32:17 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SrCZA-0006AS-Cz; Tue, 17 Jul 2012 14:32:12 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C031D72800C6; Tue, 17 Jul 2012 20:32:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id t7hDz+NuXArJ; Tue, 17 Jul 2012 20:32:06 +0200 (CEST)
Received: from [192.168.178.20] (p5086F649.dip.t-dialin.net [80.134.246.73])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	01ED8728001A; Tue, 17 Jul 2012 20:32:05 +0200 (CEST)
Message-ID: <5005AFA5.6080101@weilnetz.de>
Date: Tue, 17 Jul 2012 20:32:05 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>, 
	Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com>
In-Reply-To: <5005A904.5000006@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Igor Mitsyanko <i.mitsyanko@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 17 Jul 2012 18:32:19 -0000

Am 17.07.2012 20:03, schrieb Igor Mitsyanko:
> I see now that this bug was already noticed, please ignore this mail
>
> On 07/17/2012 09:34 PM, Igor Mitsyanko wrote:
>> After commit 417c9d72d48275d19c60861896efd4962d21aca2 all configure=20
>> tests are
>> executed with -Werror flag. Current ALSA configure test program=20
>> invokes a warning:
>>
>> warning: =E2=80=98handle=E2=80=99 is used uninitialized in this functi=
on=20
>> [-Wuninitialized]
>>
>> which results in error with -Werror flag and, consequently, in alsa=20
>> test failing.
>> This means that QEMU won't configure with "--audio-drv-list=3Dalsa".
>>
>> Initialize "handle" variable to fix compilation warning.
>>
>> Signed-off-by: Igor Mitsyanko <i.mitsyanko@samsung.com>
>> ---
>>   configure |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>


Hello Anthony, hello Blue,

these patches fix broken builds, therefore I expected that they
would be applied fast:

http://patchwork.ozlabs.org/patch/171066/
http://patchwork.ozlabs.org/patch/171067/
http://patchwork.ozlabs.org/patch/171081/
http://patchwork.ozlabs.org/patch/171082/

The first of them fixes the ALSA problem.

I think that all 4 patches are trivial, so maybe they could
also be committed via qemu-trivial if the next pull request
comes before they were applied to git master.

Regards,

Stefan W.


