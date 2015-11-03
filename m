Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtbfM-00079W-EV
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 08:30:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1ZtbfF-00072N-9o
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:30:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1ZtbfB-0002AV-99
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:30:17 -0500
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:35113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1ZtbfB-000279-2S; Tue, 03 Nov 2015 08:30:13 -0500
Received: from host31-50-136-216.range31-50.btcentralplus.com ([31.50.136.216]
	helo=[192.168.1.65]) by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1Ztbev-0003l4-3T; Tue, 03 Nov 2015 13:30:00 +0000
Message-ID: <5638B6BC.50000@ilande.co.uk>
Date: Tue, 03 Nov 2015 13:29:32 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Julio Guerra <julio@farjump.io>, 
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <1444844599-33161-1-git-send-email-julio@farjump.io>	<CAFAwnGNwFft-tH+3mhspok2gz2UKiHeiuqi_ARdB4=6k4wq4uQ@mail.gmail.com>
	<5638A5AF.9000709@msgid.tls.msk.ru>
In-Reply-To: <5638A5AF.9000709@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 31.50.136.216
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: No (on s16892447.onlinehome-server.info); Unknown failure
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Cc: christophe@farjump.io, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] taget-ppc: Fix read
 access to IBAT registers higher than IBAT3
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
X-List-Received-Date: Tue, 03 Nov 2015 13:30:22 -0000

On 03/11/15 12:16, Michael Tokarev wrote:

> 03.11.2015 11:00, Julio Guerra wrote:
>> Ping :)
> 
> Well, I'm not sure what can I do with this.  I've no idea what is IBAT to start
> with, so while technically the patch is a one-liner, I've no idea what it does
> and how trivial it is :)
> 
> Maybe you can include some context which teaches me what it is all about, and in
> that case it becomes really trivial, or.. I dunno :)

FWIW PPC has a set of IBAT and DBAT registers on chip, each of which
indicates a large continuous physical/virtual memory mapping for
Instruction and Data memory respectively. The idea is that the OS can
use these to provide "fast" virtual to physical lookups instead of
invoking a time-consuming hash lookup to provide the translation.

From casual observation comparing with spr_write_ibatu_h() in the same
file (which already includes the +4 offset that the patch is adding to
spr_read_ibat_h()), it does look like a genuine bug. However it really
needs someone who understands PPC architecture a bit more to give a RB
to ensure this is doing the right thing.


ATB,

Mark.


