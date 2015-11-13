Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxCAB-0000Oh-DS
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 06:05:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ZxCA4-0000Cd-DH
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 06:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ZxCA3-0006tB-ET
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 06:04:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1ZxC9o-0006qk-CA; Fri, 13 Nov 2015 06:04:40 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 56833694;
	Fri, 13 Nov 2015 11:04:39 +0000 (UTC)
Received: from noname.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tADB4Yjq022627; Fri, 13 Nov 2015 06:04:35 -0500
Date: Fri, 13 Nov 2015 12:04:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20151113110434.GC4755@noname.redhat.com>
References: <1447161947-22542-1-git-send-email-rabin.vincent@axis.com>
	<564208B1.7050200@redhat.com>
	<CAPokK=p_70OJag_kpx25kSC8iMuiC6fHGrjU6Zc4Dgzxi8T-AQ@mail.gmail.com>
	<727460710.12150402.1447407121726.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727460710.12150402.1447407121726.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Rabin Vincent <rabinv@axis.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-stable@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Rabin Vincent <rabin.vincent@axis.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] nand: fix address overflow
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
X-List-Received-Date: Fri, 13 Nov 2015 11:05:02 -0000

Am 13.11.2015 um 10:32 hat Paolo Bonzini geschrieben:
> > > On 10/11/2015 14:25, Rabin Vincent wrote:
> > >> The shifts of the address mask and value shift beyond 32 bits when there
> > >> are 5 address cycles.
> > >>
> > >> Signed-off-by: Rabin Vincent <rabin.vincent@axis.com>
> > >> ---
> > >>  hw/block/nand.c |    4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/hw/block/nand.c b/hw/block/nand.c
> > >> index 61d2cec..a68266f 100644
> > >> --- a/hw/block/nand.c
> > >> +++ b/hw/block/nand.c
> > >> @@ -522,8 +522,8 @@ void nand_setio(DeviceState *dev, uint32_t value)
> > >>
> > >>      if (s->ale) {
> > >>          unsigned int shift = s->addrlen * 8;
> > >> -        unsigned int mask = ~(0xff << shift);
> > >> -        unsigned int v = value << shift;
> > >> +        uint64_t mask = ~(0xffull << shift);
> > >> +        uint64_t v = (uint64_t)value << shift;
> > >>
> > >>          s->addr = (s->addr & mask) | v;
> > >>          s->addrlen ++;
> > >>
> > >
> > > Cc: qemu-trivial@nongnu.org
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > 
> > This is a bugfix right? IIUC This would not have worked for accesses
> > to devices above column address 255 at all. Should this go to
> > stable/2.5?
> 
> Yes, it should.  Michael, are you planning to send another pull
> request during hard freeze?

The block layer catch-all entry in MAINTAINERS says that it's mine, so
I'll just take it through my block tree.

Kevin

