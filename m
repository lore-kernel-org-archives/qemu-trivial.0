Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnLis-0004PY-JD
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 02:43:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1YnLip-0004LG-MF
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:43:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1YnLio-0000gq-QS
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:43:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1YnLii-0000d8-G4; Wed, 29 Apr 2015 02:43:44 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3T6hgeN019001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 29 Apr 2015 02:43:43 -0400
Received: from thh440s (vpn1-7-79.ams2.redhat.com [10.36.7.79])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3T6hcwL022479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 29 Apr 2015 02:43:40 -0400
Date: Wed, 29 Apr 2015 08:43:35 +0200
From: Thomas Huth <thuth@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150429084335.24fbeb31@thh440s>
In-Reply-To: <55407B8B.1010803@msgid.tls.msk.ru>
References: <1430153944-24368-1-git-send-email-thuth@redhat.com>
	<55407B8B.1010803@msgid.tls.msk.ru>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] kvm: Silence warning from valgrind
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
X-List-Received-Date: Wed, 29 Apr 2015 06:43:52 -0000

On Wed, 29 Apr 2015 09:34:51 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 27.04.2015 19:59, Thomas Huth wrote:
> > valgrind complains here about uninitialized bytes with the following message:
> > 
> > ==17814== Syscall param ioctl(generic) points to uninitialised byte(s)
> > ==17814==    at 0x466A780: ioctl (in /usr/lib64/power8/libc-2.17.so)
> > ==17814==    by 0x100735B7: kvm_vm_ioctl (kvm-all.c:1920)
> > ==17814==    by 0x10074583: kvm_set_ioeventfd_mmio (kvm-all.c:574)
> > 
> > Let's fix it by using a proper struct initializer in kvm_set_ioeventfd_mmio().
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  kvm-all.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kvm-all.c b/kvm-all.c
> > index dd44f8c..077b0ed 100644
> > --- a/kvm-all.c
> > +++ b/kvm-all.c
> > @@ -552,13 +552,13 @@ static int kvm_set_ioeventfd_mmio(int fd, hwaddr addr, uint32_t val,
> >                                    bool assign, uint32_t size, bool datamatch)
> >  {
> >      int ret;
> > -    struct kvm_ioeventfd iofd;
> > -
> > -    iofd.datamatch = datamatch ? adjust_ioeventfd_endianness(val, size) : 0;
> > -    iofd.addr = addr;
> > -    iofd.len = size;
> > -    iofd.flags = 0;
> > -    iofd.fd = fd;
> > +    struct kvm_ioeventfd iofd = {
> > +        .datamatch = datamatch ? adjust_ioeventfd_endianness(val, size) : 0,
> > +        .addr = addr,
> > +        .len = size,
> > +        .flags = 0,
> > +        .fd = fd,
> > +    };
> 
> Hm.  So, what's the difference?  The same fields are assigned the same
> values, why in first case we have some uninitialized data and in second
> case everything is initialized?  Does struct initializer zero-fills all
> other places (alignments, missing fields etc) ?

Right, the struct initializer fills the remaining fields with zeros.

> If yes, there's no need to assign zero to flags, btw ;)

True. Shall I sent a patch without that line?

 Thomas

