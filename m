Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckxTC-000738-KW
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 13:34:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckxTA-000718-17
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 13:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckxT9-0002QM-6C
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 13:34:52 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:29107)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ckxT1-0002OI-1c; Mon, 06 Mar 2017 13:34:43 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 980847456C2;
	Mon,  6 Mar 2017 19:34:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 79E9B7456BC; Mon,  6 Mar 2017 19:34:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 794CC7456B0;
	Mon,  6 Mar 2017 19:34:40 +0100 (CET)
Date: Mon, 6 Mar 2017 19:34:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
In-Reply-To: <CAFEAcA8oWmN8tE66XsviXnBxtP5w+WLijXxsGk+6RwRquRo9Gw@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703061913040.39075@zero.eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
	<d5475df8-290b-07d4-d177-979d78850615@redhat.com>
	<CAFEAcA90FRxghG0ZdH7H9y2bDk2U9XO1TUJgx0MN+N=7LzO5pQ@mail.gmail.com>
	<4a30ecb4-77d0-795f-bf61-378546a8b034@redhat.com>
	<CAFEAcA8oWmN8tE66XsviXnBxtP5w+WLijXxsGk+6RwRquRo9Gw@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 13/13] ppc: Add SM501
 device in config for ppc and ppcemb targets
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
X-List-Received-Date: Mon, 06 Mar 2017 18:34:53 -0000

On Mon, 6 Mar 2017, Peter Maydell wrote:
> On 6 March 2017 at 09:52, Thomas Huth <thuth@redhat.com> wrote:
>> I guess we could do something like that on ppc, too (and ppc-softmmu.mak
>> should likely include ppcemb-softmmu.mak), but
>> that's something for QEMU 2.10 / 3.0 / whichever version will be next.
>
> Yeah, definitely 2.10 material (so is this whole series, but
> let's not tangle it up with an unrelated cleanup).

Thanks for all the comments investigations and reviews, which were really 
helpful. I'll test your suggestions and send another version if found to 
be needed but I don't have access to real hardware to test on, so I can't 
confirm this other than using images that are known to work on real 
hardware and I only have those for PPC. So I cannot test LE guest more 
than using the Linux images available on the net but can't guarantee those 
are not buggy. The current version (however unlikely) does work for both 
the more or less known good PPC images and the SH images I could find so 
this is the most likely correct combination given the test cases. I'm 
fairly sure the big endian case is correct and the SH LE case works better 
with the images available so unless there's another image that is known to 
work on SH, this is the best I could do.

If there is no chance to get this in for 2.9 (considering it changes a 
relatively unmaintained and unused part, so the risk of breaking something 
important is very low) then let's get back to this about a month from now 
because no point to spend time on it if it just gets forgotten until the 
next chance to get it merged. Unless you can take it during the freeze 
I'll pick this up later when the window opens again. (By the way, the 
planning link on the wiki still points to 2.8.)

Regards,
BALATON Zoltan

