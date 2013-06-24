Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur74Y-0004SK-7A
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 09:44:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur63r-0004bh-5Q
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:40:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur63o-0005fI-QW
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:39:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>)
	id 1Ur63h-0005db-VU; Mon, 24 Jun 2013 08:39:50 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5OCdk00018486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 08:39:46 -0400
Received: from dhcp-1-237.tlv.redhat.com (dhcp-4-26.tlv.redhat.com
	[10.35.4.26])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5OCdiB9013715; Mon, 24 Jun 2013 08:39:45 -0400
Received: by dhcp-1-237.tlv.redhat.com (Postfix, from userid 13519)
	id A370018D406; Mon, 24 Jun 2013 15:39:43 +0300 (IDT)
Date: Mon, 24 Jun 2013 15:39:43 +0300
From: Gleb Natapov <gleb@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20130624123943.GI18508@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
	<CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
	<1372023554.3944.111.camel@pasglop>
	<CA+aC4kt9GqL9JGE7z5e0d0pDROqPBBMqzo00Yv58oxR_=Lf48Q@mail.gmail.com>
	<1372049162.30572.172.camel@ul30vt.home>
	<87y59zbst8.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y59zbst8.fsf@codemonkey.ws>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 24 Jun 2013 09:44:44 -0400
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-ppc] [PATCH] RFC kvm irqfd:
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
X-List-Received-Date: Mon, 24 Jun 2013 12:40:00 -0000

On Mon, Jun 24, 2013 at 07:24:03AM -0500, Anthony Liguori wrote:
> Alex Williamson <alex.williamson@redhat.com> writes:
> 
> > On Sun, 2013-06-23 at 16:58 -0500, Anthony Liguori wrote:
> >> Yeah, but none of this is Power specific...  so we can do the same for x86, no?
> >> 
> >> I'm still trying to wrap my head around why we need MSI knowledge at
> >> all in the kernel for x86.  I presume it's to fast-path irqfd when
> >> doing vhost?
> >
> > Or device assignment.  Any paths where we want to inject an MSI
> > interrupt without going through userspace.  Thanks,
> 
> With VFIO, we use irqfd, if we program the irqfd as the underlying IRQ
> that MSI would route to, isn't that sufficient?
> 
Not sure I understand what you mean by IRQ here, there is no "IRQ pin"
on x86 CPU with APIC architecture (there is ExtINT but it is not
relevant here). If by IRQ you mean "information needed to inject
interrupt through APIC" then this is how things work now.

> That's more or less what Ben is proposing for Power...
> 
> Regards,
> 
> Anthony Liguori
> 
> >
> > Alex

--
			Gleb.

