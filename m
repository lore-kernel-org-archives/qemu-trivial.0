Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chMpe-0000iS-9q
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 15:51:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chMpc-0000hk-JD
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 15:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chMpb-00061P-RQ
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 15:51:12 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:53968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chMpX-0005xk-ID; Fri, 24 Feb 2017 15:51:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 68D8074577A;
	Fri, 24 Feb 2017 21:51:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id DA5117456B0; Fri, 24 Feb 2017 21:51:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id D99D27456AD;
	Fri, 24 Feb 2017 21:51:05 +0100 (CET)
Date: Fri, 24 Feb 2017 21:51:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA8gde7GfWhyRLyOB5yL_5zrm4b7tj4pH=GTj=RwZO_4wg@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1702242148080.76443@zero.eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<5077e2a9732e1b9afcb0754e93624b787589ac61.1487522123.git.balaton@eik.bme.hu>
	<CAFEAcA8gde7GfWhyRLyOB5yL_5zrm4b7tj4pH=GTj=RwZO_4wg@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/10] ppc: Add SM501 device
 in config for ppc and ppcemb targets
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
X-List-Received-Date: Fri, 24 Feb 2017 20:51:13 -0000

On Fri, 24 Feb 2017, Peter Maydell wrote:
> On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> This is not used by default on any emulated machine yet but it is
>> still useful to have it compiled so it can be added from the command
>> line for clients that can use it (e.g. MorphOS has no driver for any
>> other emulated video cards but can output via SM501)
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> If this is a generic PCI device then shouldn't it go into
> default-configs/pci.mak ?

This is a multimedia chip usually found on sh4 systems and some ppc boards 
that's why I've only added it to these but I can move it to pci.mak if you 
think it's a better place for it.

Thanks again for taking the time to review, if you could answer these 
questions I can try to prepare a v2.


