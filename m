Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrDf9-0005fg-5T
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 15:42:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrDf6-0005Yx-WF
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrDf5-0008AZ-OR
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:42:24 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:54956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SrDf3-0008A3-Id; Tue, 17 Jul 2012 15:42:21 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	CA0E872800C6; Tue, 17 Jul 2012 21:42:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TU7TCKCHLCXT; Tue, 17 Jul 2012 21:42:20 +0200 (CEST)
Received: from [192.168.178.20] (p5086F649.dip.t-dialin.net [80.134.246.73])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	BAAA7728001A; Tue, 17 Jul 2012 21:42:19 +0200 (CEST)
Message-ID: <5005C01B.2010803@weilnetz.de>
Date: Tue, 17 Jul 2012 21:42:19 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
	<5005BBD7.1000905@weilnetz.de>
	<CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Tue, 17 Jul 2012 19:42:26 -0000

Am 17.07.2012 21:28, schrieb Peter Maydell:
> On 17 July 2012 20:24, Stefan Weil <sw@weilnetz.de> wrote:
>> The arguments why -Werror is a bad idea for some configure tests
>> are reasonable.
>>
>> Nevertheless the QEMU community was able to produce thousands of
>> lines of code which compile without a warning, so we should be able
>> to create warning and error free code for a handful of configure
>> tests.
> The trouble is that the warnings and errors here don't cause the
> build to fail noisily; that's a big distinction IMHO.
> I suppose we could make compile_prog do something like:
>   * run the compile test
>   * if it fails => test failure as now
>   * if it succeeds (and we're doing a Werror build at all),
>     rerun the same test with -Werror
>   * if that fails, abort configure with an error message
> Then we would have the same "make the problem obvious" effect
> that plain -Werror provides for our main compilation.

Good idea. Of course it will increase the time needed for
running the default configure, but I think that's acceptable
if we don't use it for the tests of the compiler warning options.


