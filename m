Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4yve-0008E1-6Q
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 14:48:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4yvb-000853-A1
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 14:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4yvU-0002wh-Jj
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 14:48:19 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:49711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T4yvS-0002vw-I8; Fri, 24 Aug 2012 14:48:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id 92858283;
	Fri, 24 Aug 2012 20:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Psm4N6Is1ZdZ; Fri, 24 Aug 2012 20:48:09 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 5ED79AD6; Fri, 24 Aug 2012 20:48:09 +0200 (CEST)
Date: Fri, 24 Aug 2012 20:48:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-qY2UyAAXBoHwGy0fMqmTFu6zwx4E8SRwLE7S+NZm=-w@mail.gmail.com>
Message-ID: <Pine.GSO.4.64.1208242034380.21955@mono>
References: <Pine.GSO.4.64.1208230207120.26411@mono>
	<20120824112647.GK10867@stefanha-thinkpad.localdomain>
	<Pine.GSO.4.64.1208241714240.16113@mono>
	<CAFEAcA-qY2UyAAXBoHwGy0fMqmTFu6zwx4E8SRwLE7S+NZm=-w@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Aug 2012 18:48:20 -0000

On Fri, 24 Aug 2012, Peter Maydell wrote:
> I think all this code needs careful auditing to (a) clearly define
> what "bpp" means and what "depth" means (assuming we need to distinguish;
> IME they are usually supposed to be synonyms!) and (b) make sure that
> everything that accesses one or the other is actually using the
> right one...

Right, and I don't feel like I can do that for parts I don't know at all 
so that's what I meant by not being sure about it and chose to add the 
comment as a hint for others who know better where these are used. I think 
I've mostly fixed it in vmware_vga which was the part I've looked at.

About depth vs. bpp, they are usually synonyms except for the 32 bits case 
where colour depth is actually 24 bits so distinguishing the two is 
proabably OK. (This was one of the things that the vmware_vga reported 
wrongly and the driver was patching it up with issuing a warning about 
it.)

Regards,
BALATON Zoltan

