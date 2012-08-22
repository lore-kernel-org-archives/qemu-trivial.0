Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T482Z-0006L0-Es
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 06:19:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T482W-0006Dc-Ca
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 06:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T482V-0007UH-LQ
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 06:19:56 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:58401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T482T-0007Tm-E9; Wed, 22 Aug 2012 06:19:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id 96D74283;
	Wed, 22 Aug 2012 12:19:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7K9atN3cRIyb; Wed, 22 Aug 2012 12:19:52 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 67FAA91F; Wed, 22 Aug 2012 12:19:52 +0200 (CEST)
Date: Wed, 22 Aug 2012 12:19:52 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <5034926B.5020808@web.de>
Message-ID: <Pine.GSO.4.64.1208221214550.8637@mono>
References: <Pine.GSO.4.64.1208212333210.11653@mono> <5034926B.5020808@web.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmware_vga: Cleanup and allow simple
 drivers to work without the fifo
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
X-List-Received-Date: Wed, 22 Aug 2012 10:19:57 -0000

On Wed, 22 Aug 2012, Jan Kiszka wrote:
> This is a rather big patch. I strongly suspect you can break it up into
> smaller pieces that address separate aspects one-by-one. Also, it is
> definitely to heavy for "qemu-trivial".

Despite its size the changes included are fairly simple but I can try to 
break it up. I've sent it to qemu-trivial because it may meet the "Do not 
fall under an actively maintained subsystem." category as I've found no 
maintainer for this part. Should I send the revisions only to qemu-devel 
then?

Thanks,
BALATON Zoltan

