Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxAiO-0004KW-QN
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 04:32:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZxAiM-0004HL-TG
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 04:32:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZxAiM-0007KL-2G
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 04:32:14 -0500
Received: from mx6-phx2.redhat.com ([209.132.183.39]:38601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZxAiF-0007Gz-Sd; Fri, 13 Nov 2015 04:32:08 -0500
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tAD9W1Qd010099;
	Fri, 13 Nov 2015 04:32:01 -0500
Date: Fri, 13 Nov 2015 04:32:01 -0500 (EST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <727460710.12150402.1447407121726.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAPokK=p_70OJag_kpx25kSC8iMuiC6fHGrjU6Zc4Dgzxi8T-AQ@mail.gmail.com>
References: <1447161947-22542-1-git-send-email-rabin.vincent@axis.com>
	<564208B1.7050200@redhat.com>
	<CAPokK=p_70OJag_kpx25kSC8iMuiC6fHGrjU6Zc4Dgzxi8T-AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF41 (Linux)/8.0.6_GA_5922)
Thread-Topic: nand: fix address overflow
Thread-Index: t+CJvJ8NQUP9+9GByp+47hJXsl0WoQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
Cc: Kevin Wolf <kwolf@redhat.com>, Rabin Vincent <rabinv@axis.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
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
X-List-Received-Date: Fri, 13 Nov 2015 09:32:15 -0000

> > On 10/11/2015 14:25, Rabin Vincent wrote:
> >> The shifts of the address mask and value shift beyond 32 bits when there
> >> are 5 address cycles.
> >>
> >> Signed-off-by: Rabin Vincent <rabin.vincent@axis.com>
> >> ---
> >>  hw/block/nand.c |    4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/block/nand.c b/hw/block/nand.c
> >> index 61d2cec..a68266f 100644
> >> --- a/hw/block/nand.c
> >> +++ b/hw/block/nand.c
> >> @@ -522,8 +522,8 @@ void nand_setio(DeviceState *dev, uint32_t value)
> >>
> >>      if (s->ale) {
> >>          unsigned int shift = s->addrlen * 8;
> >> -        unsigned int mask = ~(0xff << shift);
> >> -        unsigned int v = value << shift;
> >> +        uint64_t mask = ~(0xffull << shift);
> >> +        uint64_t v = (uint64_t)value << shift;
> >>
> >>          s->addr = (s->addr & mask) | v;
> >>          s->addrlen ++;
> >>
> >
> > Cc: qemu-trivial@nongnu.org
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> 
> This is a bugfix right? IIUC This would not have worked for accesses
> to devices above column address 255 at all. Should this go to
> stable/2.5?

Yes, it should.  Michael, are you planning to send another pull
request during hard freeze?

Paolo

