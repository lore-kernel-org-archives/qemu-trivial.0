Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKjVI-0001eb-W8
	for mharc-qemu-trivial@gnu.org; Mon, 30 Aug 2021 11:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKjVH-0001cG-VR
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 11:47:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKjVE-00079M-NA
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 11:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630338435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cuetmihm1yANF0z2LYB1AEnlbKR2U+z84xNMqbhOC7I=;
 b=VJjOLnoNT8EnbwRmqmS8MNVjWbKysNlRj/3E15IT8Qs4V0qYA7iJYzJzgVbX/iJf8HEK1B
 S2kxTZ0u9gdoY/v0T9HStCnoJCA8PZy90ZgueZ6T0t5ksSwC7YIlg1tveG+7vEtlv9gHjb
 p5d7DPVBjVMrQfum91LOczrrmoRX4PA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-7Uwe9vDjOnmsq9mbcBExBw-1; Mon, 30 Aug 2021 11:47:12 -0400
X-MC-Unique: 7Uwe9vDjOnmsq9mbcBExBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67E22E77;
 Mon, 30 Aug 2021 15:47:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 639936A900;
 Mon, 30 Aug 2021 15:47:10 +0000 (UTC)
Date: Mon, 30 Aug 2021 10:47:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: johannst <johannes.stoelp@googlemail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 johannst <johannes.stoelp@gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
Message-ID: <20210830154708.ah27fh34q5dgg3le@redhat.com>
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Aug 2021 15:47:20 -0000

On Sun, Aug 29, 2021 at 10:09:19PM +0100, Peter Maydell wrote:
> On Thu, 5 Aug 2021 at 21:34, johannst <johannes.stoelp@googlemail.com> wrote:
> >
> > Dear all,
> >
> > in my opinion the `type` argument in the kvm ioctl wrappers should be of
> > type unsigned. Please correct me if I am wrong.
> 
> (Ccing Eric as our resident POSIX expert.)
> 
> > Due to the same reason as explained in the comment on the
> > `irq_set_ioctl` field in `struct KVMState` (accel/kvm/kvm-all.c),
> > the kvm ioctl wrapper should take `type` as an unsigned.
> 
> The reason in that comment:
>     /* The man page (and posix) say ioctl numbers are signed int, but
>      * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
>      * unsigned, and treating them as signed here can break things */
> 
> It would be more helpful to readers to state the reason directly
> in the commit message, rather than requiring them to go and look
> up a comment in some other file.
> 
> (That comment, incidentally, seems to be no longer completely
> true: on my system the ioctl manpage says 'unsigned long', though
> the glibc info docs say 'int', in contradiction to the ioctl.h
> glibc actually ships...)

POSIX says of ioctl:
https://pubs.opengroup.org/onlinepubs/9699919799/functions/ioctl.html
 int ioctl(int fildes, int request, ... /* arg */);

But the standardization of ioctl() is extremely limited: POSIX only
uses it for the now-deprecated STREAMS option (basically it was
supposed to be the next-generation pty interface, but it never really
caught on; Solaris supported it, but I don't think Linux ever has).
And qemu doesn't really care about the STREAMS option; so our real
source of authority for how ioctl behaves is not POSIX, but the
kernel.

The fact that glibc uses unsigned long rather than int for the second
argument is a strong argument in favor of using an unsigned type (on
64-bit platforms, the kernel really is looking at 64 bits, even though
POSIX says we are only passing in 32, and sign-extension is wrong),
but on the other hand, I don't know if any ioctl requests CAN be sign
extended (ideally, no ioctl request has bit 0x80000000 set, so that it
doesn't matter if the userspace code was calling via a signed or
unsigned type, or via the 32-bit POSIX signature instead of the actual
kernel 'unsigned long' signature).

> 
> Of the various KVM_* ioctls we use via these functions, do
> any actually have values that would result in invalid sign
> extension here ? That is, is this fixing an existing bug, or is
> it merely avoiding a potential future bug?

My question as well.  If there is such a bug, calling it out in the
commit message is essential; if the bug is just theoretical,
mentioning that is still useful.

> 
> > Signed-off-by: johannst <johannes.stoelp@gmail.com>
> > ---
> >  accel/kvm/kvm-all.c    | 8 ++++----
> >  accel/kvm/trace-events | 8 ++++----
> >  include/sysemu/kvm.h   | 8 ++++----
> >  3 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 0125c17edb..45cd6edce3 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -2967,7 +2967,7 @@ int kvm_cpu_exec(CPUState *cpu)
> >      return ret;
> >  }
> >
> > -int kvm_ioctl(KVMState *s, int type, ...)
> > +int kvm_ioctl(KVMState *s, unsigned type, ...)
> 
> The underlying ioctl() prototype (at least in my Linux /usr/include/sys/ioctl.h
> and as documented in the ioctl(2) manpage) uses "unsigned long" for the
> request argument; should we do the same ?

Either we should match POSIX ('int') or Linux ('unsigned long'),
'unsigned' matches neither.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


