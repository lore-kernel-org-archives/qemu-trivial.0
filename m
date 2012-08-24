Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4vkc-0004JN-S8
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 11:24:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4vka-00048y-33
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 11:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4vkZ-0007fM-0i
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 11:24:44 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:48751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T4vkX-0007eR-0M; Fri, 24 Aug 2012 11:24:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id CAF70283;
	Fri, 24 Aug 2012 17:24:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xsJqorfGosz4; Fri, 24 Aug 2012 17:24:32 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 9CABCA94; Fri, 24 Aug 2012 17:24:32 +0200 (CEST)
Date: Fri, 24 Aug 2012 17:24:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: Stefan Hajnoczi <stefanha@gmail.com>
In-Reply-To: <20120824112647.GK10867@stefanha-thinkpad.localdomain>
Message-ID: <Pine.GSO.4.64.1208241714240.16113@mono>
References: <Pine.GSO.4.64.1208230207120.26411@mono>
	<20120824112647.GK10867@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] console: Cleanup
 computation of bytes per pixel and add missing cases
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
X-List-Received-Date: Fri, 24 Aug 2012 15:24:45 -0000

On Fri, 24 Aug 2012, Stefan Hajnoczi wrote:
>> +    case 15:
>> +        pf.bits_per_pixel = 16; /* Is this correct? */
>
> A trivial patch can't have "Is this correct?" parts :).
>
> I already applied the simple and correct v2 patch.  Feel free to follow
> up with additional cleanups but with resolved "Is this correct?" parts.

The v2 contained all my originally intended changes so it's fine with me. 
During review it was discovered that this part of code probably has more 
problems so I was trying to provide a fix for those in v3, and then 
checkpatch.pl complained about formatting too so I included a fix for that 
too. I can resend these broken up into too patches but as I wrote in the 
comment I have no way to test if these are correct. The above 
bits_per_pixel=16 for 15 bpp case was there already I just added a comment 
marking it as suspicious but I'm not sure how to resolve that.

Thanks,
BALATON Zoltan

