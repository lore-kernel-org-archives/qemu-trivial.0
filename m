Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UqyfV-0005vU-OK
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 00:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1UqyfS-0005qt-Rs
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 00:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1UqyfR-0004g9-Jd
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 00:46:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1UqyfL-0004e2-MK; Mon, 24 Jun 2013 00:46:11 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O4k5CE020277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 00:46:05 -0400
Received: from [10.3.113.38] (ovpn-113-38.phx2.redhat.com [10.3.113.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O4k3K0003458; Mon, 24 Jun 2013 00:46:03 -0400
Message-ID: <1372049162.30572.172.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Date: Sun, 23 Jun 2013 22:46:02 -0600
In-Reply-To: <CA+aC4kt9GqL9JGE7z5e0d0pDROqPBBMqzo00Yv58oxR_=Lf48Q@mail.gmail.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
	<CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
	<1372023554.3944.111.camel@pasglop>
	<CA+aC4kt9GqL9JGE7z5e0d0pDROqPBBMqzo00Yv58oxR_=Lf48Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [Qemu-devel] [PATCH] RFC kvm irqfd:
 add directly mapped MSI IRQ support
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
X-List-Received-Date: Mon, 24 Jun 2013 04:46:20 -0000

On Sun, 2013-06-23 at 16:58 -0500, Anthony Liguori wrote:
> On Sun, Jun 23, 2013 at 4:39 PM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > On Sun, 2013-06-23 at 10:02 -0500, Anthony Liguori wrote:
> >> It doesn't make a lot of sense to have Power do MSI decoding in
> >> userspace while x86 does it in the kernel.  I assume the kernel
> >> doesn't have enough information to do the translation on Power?
> >
> > Well, it would need the host bridge which it doesn't have and it
> > would need a concept of mapping that to interrupt numbers which
> > we don't want in the kernel.
> >
> > We can keep the kernel side a LOT simpler (completely avoiding
> > the whole route bloatware) by sticking to our "simple" direct map kernel
> > stuff and doing the mapping from address/data to interrupts in qemu, so
> > we'll stick to that.
> 
> Yeah, but none of this is Power specific...  so we can do the same for x86, no?
> 
> I'm still trying to wrap my head around why we need MSI knowledge at
> all in the kernel for x86.  I presume it's to fast-path irqfd when
> doing vhost?

Or device assignment.  Any paths where we want to inject an MSI
interrupt without going through userspace.  Thanks,

Alex


