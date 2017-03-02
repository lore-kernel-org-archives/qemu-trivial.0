Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXF5-0002K6-Pu
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:22:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjXF3-0002IF-BL
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:22:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjXF2-0007kZ-B9
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:22:25 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:29481)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjXEu-0007bO-Tq; Thu, 02 Mar 2017 15:22:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 916E9745798;
	Thu,  2 Mar 2017 21:22:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 6FA55745796; Thu,  2 Mar 2017 21:22:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 6F1227456D4;
	Thu,  2 Mar 2017 21:22:15 +0100 (CET)
Date: Thu, 2 Mar 2017 21:22:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA_kzNEfkg56CFE=x-GqQTV-fpXjGXxvwoPoZS1HNVTnww@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703022121300.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<db1b69270ca4d2335e6fb2455ee56552373757fc.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA_kzNEfkg56CFE=x-GqQTV-fpXjGXxvwoPoZS1HNVTnww@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 12/14] sm501: Implement
 reading 2D engine registers
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
X-List-Received-Date: Thu, 02 Mar 2017 20:22:26 -0000

On Thu, 2 Mar 2017, Peter Maydell wrote:
> On 25 February 2017 at 21:47, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> Clients normally only write to these registers, nothing is known to
>> ever read them but they are documented as read/write so allow clients
>> to also read the values.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/display/sm501.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>
> Oh, the read code is in a separate patch? Please put all the handling
> for a particular register in the same patch. If you think the
> resulting patch is too long you can split it into several patches
> each of which handles a group of registers if you like (but it
> probably isn't necessary).

So is it OK to squash this in the previous patch adding write and make the 
two a single patch?

>
> thanks
> -- PMM
>
>

