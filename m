Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur5oY-0003Bz-MU
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 08:24:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur5oW-0003Bg-IH
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:24:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur5oV-0008Lt-1D
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:24:08 -0400
Received: from mail-gh0-x22c.google.com ([2607:f8b0:4002:c05::22c]:54227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur5oU-0008Lb-Te
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:24:06 -0400
Received: by mail-gh0-f172.google.com with SMTP id r18so3422287ghr.31
	for <qemu-trivial@nongnu.org>; Mon, 24 Jun 2013 05:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=1rDDG17XBvxm42FHtcCQ9/D/FV0U1DvY41h+az/w4gE=;
	b=kpiqvBPgRXrtsZJ2It+WxxJX29VSD/r/VDwDvqKY13bGtbmZmdg2GdOYNgkair5vX7
	n0D1ulWoRZvF0B1w+Eqcy8KBjjThPbuw51ilZhTmJg5/8qlf71kBBVrpuKQKilzVzdS4
	m1jSzcaBaXR19ZYYKXjDo/AMJvMMwAuNA3D6QncOCHpQ6FjBE9q27gf2cxQwekYhA3Ck
	jNQPkOMoRVfLEEbSc0aEZJ9mMK2dCMB70dJ23ngo7XoLfDLIG02Z2RfchVHGa2oo0IGu
	WvuFjn0rpSW3RLzWSUtPnTU/N4fS5UmMbwhgMsM5acpdMUektOlwp4JnSwCjJ4AcIb3U
	EMng==
X-Received: by 10.236.128.5 with SMTP id e5mr12631303yhi.118.1372076646228;
	Mon, 24 Jun 2013 05:24:06 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87]) by mx.google.com with ESMTPSA id
	r41sm30123703yhc.12.2013.06.24.05.24.04 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 05:24:05 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Alex Williamson <alex.williamson@redhat.com>
In-Reply-To: <1372049162.30572.172.camel@ul30vt.home>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
	<CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
	<1372023554.3944.111.camel@pasglop>
	<CA+aC4kt9GqL9JGE7z5e0d0pDROqPBBMqzo00Yv58oxR_=Lf48Q@mail.gmail.com>
	<1372049162.30572.172.camel@ul30vt.home>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 24 Jun 2013 07:24:03 -0500
Message-ID: <87y59zbst8.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQkVys354iKk+XISlJ41Hcdv8gBrDT/tdw4fMV5EfpX0JmX8K9UFr97lquruTXe5NbcyjwVp
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c05::22c
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
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
X-List-Received-Date: Mon, 24 Jun 2013 12:24:10 -0000

Alex Williamson <alex.williamson@redhat.com> writes:

> On Sun, 2013-06-23 at 16:58 -0500, Anthony Liguori wrote:
>> Yeah, but none of this is Power specific...  so we can do the same for x86, no?
>> 
>> I'm still trying to wrap my head around why we need MSI knowledge at
>> all in the kernel for x86.  I presume it's to fast-path irqfd when
>> doing vhost?
>
> Or device assignment.  Any paths where we want to inject an MSI
> interrupt without going through userspace.  Thanks,

With VFIO, we use irqfd, if we program the irqfd as the underlying IRQ
that MSI would route to, isn't that sufficient?

That's more or less what Ben is proposing for Power...

Regards,

Anthony Liguori

>
> Alex

