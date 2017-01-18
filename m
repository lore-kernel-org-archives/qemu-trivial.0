Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTerF-0004Er-JU
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 20:16:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTerC-0004Di-U3
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:16:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTerB-00022h-VC
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:16:10 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTer9-00021s-L7; Tue, 17 Jan 2017 20:16:07 -0500
Received: by mail-qk0-x244.google.com with SMTP id e1so17567239qkh.1;
	Tue, 17 Jan 2017 17:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=64PRMaCyRefAM5xlt9usCj2OzF3NDXPYrChDD6i9py0=;
	b=d6GORJ2LWbzxyfnjVn9LdnpdZdJJGF/cVOlEnl7zkiXtCU8KvuZ3aEAlvQInx8PWTl
	bCNFf8UekWrAOR/IIfxLqvdlgYaqeK45VP2goShBNdDsHhY1Oi6diLDy8suRhIdB+yW8
	RNslII8IEFJWhNnDF8f/yPPzyW6IUIz/kfmU1NYpT481ukiyqzMIM/Gr7fPgC5/TodpZ
	OVXCpKxct3epu8rIzMGV7Zuu2n7ZUimPPJUc/j7CBe+s000Wdvsuso7qT0lT+6OpEdbA
	XMVyHktwYV1Q85PaikavdkiaM4kaVn21xlbwmPvVsRTortmGzaZwcxbGNufBEAfB/uS7
	TaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=64PRMaCyRefAM5xlt9usCj2OzF3NDXPYrChDD6i9py0=;
	b=aZSenA+1xFQTHUsagNs1VuOvswVy8xhb4yuv8e8mB8TovxGdAXJSMhBHJyuDig/jTr
	CnVPBiPjEtWFsuesApKffjVv0W128RK3Z2biYB/iNGbzRhBOPQeZ2tgAReBhQz944MyM
	EzEbtQJv/5/x7dNoa5azlkgxv7N6y9bfptNEpeKcaE7MTUhN5RojU9rZfn/Y3LX4BvJd
	smxBqfv1EWZhIdWuQGSRS+XpdMjkoyDcYgFNzWRL7bAHzMECxr5mbtoG11ngoOoNwEO7
	RpUvmQYAeKHBCsDcc+iWNBO6F8EvB8JPZpNwl7SbqqglmH9zKf/fBFYU3A+p9UCORcBK
	UW8w==
X-Gm-Message-State: AIkVDXJ3Ssewxlr78HL5jSUpLqbxZDFBYzx5FWlEe/OPR/hTabv8ngxxypcjdf7TEdRkmjaQ0KGBgklNM5NfGg==
X-Received: by 10.55.70.82 with SMTP id t79mr586305qka.82.1484702167131; Tue,
	17 Jan 2017 17:16:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.231 with HTTP; Tue, 17 Jan 2017 17:16:06 -0800 (PST)
In-Reply-To: <c1e01bb3-6dd1-dfe1-1659-8b7b9b683d63@redhat.com>
References: <1484666391-15089-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<c1e01bb3-6dd1-dfe1-1659-8b7b9b683d63@redhat.com>
From: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 09:16:06 +0800
Message-ID: <CAHkcwaemKr-d2qZRHYYUR1ry_spP_8ch2B886q6wxqv4WorBYA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Ziyue Yang <yzylivezh@hotmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub.c: fix GDB
 connection segfault caused by empty machines
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2017 01:16:12 -0000

2017-01-18 1:27 GMT+08:00 Thomas Huth <thuth@redhat.com>:
>
> On 17.01.2017 16:19, Ziyue Yang wrote:
> > From: Ziyue Yang <yzylivezh@hotmail.com>
> >
> > This patch is to fix the segmentation fault caused by attaching
> > GDB to a QEMU instance initialized with "-M none" option.
> >
> > The bug can be reproduced by
> >
> >> ./qemu-system-x86_64 -M none -nographic -S -s
> >
> > and attach a GDB to it by
> >
> >> gdb -ex 'target remote :1234
> >
> > The segmentation fault was originally caused by trying to read
> > the information about CPU when communicating with GDB. However,
> > it's impossible for any control flow to exist on an empty machine,
> > nor can CPU's be hot plugged to an empty machine later by QOM
> > commands. So I think simply disabling GDB connections on empty
> > machines makes sense.
>
> Yes, this sounds like a proper and easy fix for the problem.
>
> > Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
> > ---
> >  gdbstub.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/gdbstub.c b/gdbstub.c
> > index de62d26..413e817 100644
> > --- a/gdbstub.c
> > +++ b/gdbstub.c
> > @@ -1731,6 +1731,12 @@ int gdbserver_start(const char *device)
> >      CharDriverState *mon_chr;
> >      ChardevCommon common = { 0 };
> >
> > +    if (!first_cpu) {
> > +        fprintf(stderr, "gdbstub: meaningless to attach gdb to a "
> > +                "machine without any CPU.\n");
> > +        return -1;
> > +    }
>
> Could you maybe rather use error_report() instead of fprintf()? I think
> that's the preferred way to print out an error in QEMU nowadays.

Sure. I've sent a v2 version patch fixing that.

>
>
>  Thomas
>

