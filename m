Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQgJC-0002R9-3U
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 12:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WQgJ6-0002K1-Jx
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WQgJ1-0003q4-Gs
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:59:04 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:48118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WQgIr-0003m3-Bi; Thu, 20 Mar 2014 12:58:49 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id E03D560092; Thu, 20 Mar 2014 17:58:46 +0100 (CET)
Date: Thu, 20 Mar 2014 17:58:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <532B180F.5080301@redhat.com>
Message-ID: <alpine.LMD.2.02.1403201755320.2043@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<532B0C5D.5060905@msgid.tls.msk.ru> <532B0E71.1000009@redhat.com>
	<alpine.LMD.2.02.1403201659440.1844@jedlik.phy.bme.hu>
	<532B180F.5080301@redhat.com>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] serial-pci: Set prog interface field of
 pci config to 16550 compatible
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
X-List-Received-Date: Thu, 20 Mar 2014 16:59:09 -0000

On Thu, 20 Mar 2014, Paolo Bonzini wrote:
> Il 20/03/2014 17:01, BALATON Zoltan ha scritto:
>> On Thu, 20 Mar 2014, Paolo Bonzini wrote:
>>> Il 20/03/2014 16:42, Michael Tokarev ha scritto:
>>>> 10.03.2014 22:40, BALATON Zoltan wrote:
>>>>> Ping!
>>>>> http://patchwork.ozlabs.org/patch/324674/
>>>> 
>>>> Thanks, applied to -trivial.
>>> 
>>> No, please don't; this needs to be done for new machine types only.
>> 
>> Why? I tried running a Windows XP image that was set up before this
>> patch and it did not complain about changed hardware. Or is there
>> another reason I'm missing?
>
> Classes (or anything guest-visible in fact) must never ever be changed for 
> the same machine type.  It's a rule.

The class did not change only the prog interface field after it (which is 
guest visible but I think most guests just ignore it). So then what's the 
correct way to do it? Do I need to change the patch or can it be merged as 
it is the next time a new machine type is added?

Regards,
BALATON Zoltan

