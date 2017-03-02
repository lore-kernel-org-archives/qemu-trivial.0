Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWsB-00040U-NG
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:58:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjWs8-0003yK-Rs
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:58:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjWs7-00050b-Q6
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:58:44 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:23988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjWs3-0004we-MS; Thu, 02 Mar 2017 14:58:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 244C1745796;
	Thu,  2 Mar 2017 20:58:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 04D8E7456BC; Thu,  2 Mar 2017 20:58:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 040E17456D4;
	Thu,  2 Mar 2017 20:58:32 +0100 (CET)
Date: Thu, 2 Mar 2017 20:58:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA_b_iOCBk0dXGNGLve0hM5sLx5qAzq5mvDN-5yARopkdg@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703022058020.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<65f979bc1683c46f74ddb5e931810f4e2b8ea27c.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA8hgztzBZ=4EK7GR_1V4WnKL_hp-CopC1q5NwxeARkgSA@mail.gmail.com>
	<CAFEAcA_b_iOCBk0dXGNGLve0hM5sLx5qAzq5mvDN-5yARopkdg@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/14] sm501: Use defines
 instead of constants where available
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
X-List-Received-Date: Thu, 02 Mar 2017 19:58:46 -0000

On Thu, 2 Mar 2017, Peter Maydell wrote:
> On 2 March 2017 at 18:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 7 November 2016 at 09:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I just found a datasheet which says that the power-on-default
>> for the misc-control register is 0b0000.0000.0000.00x0.0001.0000.xxx0.0xxx
>> which means that the 0x1000 decimal value is correct and setting
>> the IRQ_INVERT bit is wrong.
>>
>> I think the "active=low" bit is referencing the fact that the
>> DAC_POWER bit is 1 for "disable" and 0 for "enable".
>
> Actually it's referring to bit 17 (which is an "X" in the reset value
> above), which is documented as being set by a GPIO pin on reset,
> and having different meanings for SH and SA1110. In this case we're
> saying 'reset bit 17 to 0, meaning "SH series CPU, Active Low"'.
>
> Note also that the low bits indicate the bus type which is 000 for
> SH and 001 for PCI, etc.
>
> So a better comment here would be:
>    /* Bits 17 (SH), 7 (CDR), 6:5 (Test), 2:0 (Bus) are all supposed
>     * to be determined at reset by GPIO lines which set config bits.
>     * We hardwire them:
>     *  SH = 0 : Hitachi Ready Polarity == Active Low
>     *  CDR = 0 : do not reset clock divider
>     *  TEST = 0 : Normal mode (not testing the silicon)
>     *  BUS = 0 : Hitachi SH3/SH4
>     */
>    s->misc_control = SM501_MISC_DAC_POWER;
>
> ...and you'll want to put something in to get the right Bus value
> for the PCI version.

Thanks for investigating this, I'll update it in v3.


