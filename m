Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckxeM-0001TD-RM
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 13:46:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckxeJ-0001RT-O3
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 13:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckxeI-0007xB-Qn
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 13:46:23 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:38585)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ckxeD-0007ts-8E; Mon, 06 Mar 2017 13:46:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 9CCEE7456C2;
	Mon,  6 Mar 2017 19:46:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 7982B7456AD; Mon,  6 Mar 2017 19:46:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 78DC07456BC;
	Mon,  6 Mar 2017 19:46:15 +0100 (CET)
Date: Mon, 6 Mar 2017 19:46:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA9euFa=fypaZaO5prpNQ6mdCmaSZgu3dofVgh2bYcSSxA@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703061935550.39075@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
	<alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
	<CAFEAcA-PUcPaOPOXXhab1N=YAHja0xCf5yaZYm5m0p1=j6A=WA@mail.gmail.com>
	<alpine.BSF.2.20.1703032100430.14293@zero.eik.bme.hu>
	<CAFEAcA_KxS6J3Mzrc+ijg0LGdxZsk_FDd9xAExGROgWYn-3qyQ@mail.gmail.com>
	<alpine.BSF.2.20.1703042344460.63482@zero.eik.bme.hu>
	<CAFEAcA9euFa=fypaZaO5prpNQ6mdCmaSZgu3dofVgh2bYcSSxA@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 07/14] sm501: Fix device
 endianness
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
X-List-Received-Date: Mon, 06 Mar 2017 18:46:24 -0000

On Mon, 6 Mar 2017, Peter Maydell wrote:
> On 4 March 2017 at 22:58, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Sat, 4 Mar 2017, Peter Maydell wrote:
>>> Right, but we should test the PCI-on-a-little-endian CPU
>>> case, because right now your code has #ifdef TARGET_WORDS_BIGENDIAN
>>> in it which means that the PCI device will behave differently
>>> on big and little endian CPUs, and you have a case that you
>>> haven't tested.
>>
>>
>> I could not find an image to test this. I've tried removing the sysbus
>> version from SH and add a PCI one instead but then Linux did not seem to
>> find the card.
>
> I was thinking about testing the PCI card on x86.
>
>> I could not find any other OS images that would have this
>> combination that is also known to work on any real hardware so I think if
>> someone ever finds a problem with such combination then we can fix it when
>> having a test case, since I could not figure out theoretically what should
>> be the right way.
>>
>>> (At the moment with the set of cases you've tested the
>>> sh embedded device ones will always be using the "not
>>> TARGET_WORDS_BIGENDIAN" code and the PCI-on-PPC will
>>> always use the "is TARGET_WORDS_BIGENDIAN" code. But
>>> TARGET_WORDS_BIGENDIAN set/not set is orthogonal to
>>> PCI-vs-embedded.)
>>
>>
>> Why do you think that framebuffer endianness is dependent on PCI-vs-embedded
>> as opposed to target endianness? The latter seems more plausible to me.
>
> The PCI card should behave the same way whether you plug it
> into a PPC system or an x86 system (since it's the same
> hardware). So code in the handling of the PCI card that
> looks at TARGET_WORDS_BIGENDIAN is suspicious.

I've searched the web for this and read about possible cards having this 
chip working under Linux on x86 (or not working as these were mostly bug 
reports) but could not find an image that is known to be working with such 
card. I've tried a few recent Linux live CDs (Ubuntu and Fedora) with 
x86_64 and sm501 PCI emulation on QEMU but these did not seem to boot and 
find the card, only with the default VGA. Probably a card would have some 
BIOS and some VESA modes that the drivers would use so I'm not sure a PCI 
card would really behave the same on PPC and x64 (other video cards 
usually don't work between PC and PPC Macs because of the BIOS on them). 
Also on PPC this chip is mostly found on embedded boards not on pluggable 
cards.

Regards,
BALATON Zoltan

