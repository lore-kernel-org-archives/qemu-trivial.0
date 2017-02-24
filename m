Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chNjm-0002J6-CG
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 16:49:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chNjj-0002I5-RA
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 16:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chNji-0008BE-W6
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 16:49:11 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:16351)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chNje-00086u-DI; Fri, 24 Feb 2017 16:49:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id D0A11745797;
	Fri, 24 Feb 2017 22:49:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id B541174577A; Fri, 24 Feb 2017 22:49:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id B4BE17456AD;
	Fri, 24 Feb 2017 22:49:04 +0100 (CET)
Date: Fri, 24 Feb 2017 22:49:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <alpine.BSF.2.20.1702242138290.76443@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.20.1702242239330.76443@zero.eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<8936f97ffdf6fe9a71a300113019bfdba0ecef23.1487522123.git.balaton@eik.bme.hu>
	<CAFEAcA9m8Yjwjn_B5aBZmWVwXXVj7-BQ1_d76ED4bg3cAWw=bw@mail.gmail.com>
	<alpine.BSF.2.20.1702242138290.76443@zero.eik.bme.hu>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 09/10] sm501: Add some more
 missing registers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 21:49:13 -0000

On Fri, 24 Feb 2017, BALATON Zoltan wrote:
> On Fri, 24 Feb 2017, Peter Maydell wrote:
>> On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>> Write only to allow clients to initialise these without failing
>>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> 
>> What's the point in write-only register values?
>
> U-boot writes this register during setting up the device and without this it 
> would abort QEMU.
>
>> What does the real hardware do here?
>
> This register contains bits to set up FIFO parameters and memory priorities 
> which we are not emulating so these can be ignored here but the hardware 
> would change parameters according the value written.

Sorry, this is for the arbitration_control register. The other registers 
added in this patch are for the 2D engine which is only partially emulated 
but writing the registers is OK as long as no operation using them is 
called. (That case is handled in sm501_2d_operation.) We need to allow 
writes as these are initialised during boot but not used afterwards. Later 
when implementing more of the 2D engine we may use the written values.

>> If the registers are writes-ignored, there's no need to store
>> the data written into the state struct; if the registers are
>> reads-as-written then implement them that way.

Still not sure what do you mean by read-as-written because I think that's 
exactly what is done here, value stored and read back as is, except for 
video_control where there are reserved bits that are always 0.

