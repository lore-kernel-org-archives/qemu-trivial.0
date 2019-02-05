Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gr6DT-0002af-Jt
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 14:17:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gr6DR-0002YI-Dq
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 14:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gr6DQ-0002Us-Jl
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 14:17:05 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gr6DO-0002Sn-LH; Tue, 05 Feb 2019 14:17:02 -0500
Received: by mail-lj1-x244.google.com with SMTP id t18-v6so3895957ljd.4;
	Tue, 05 Feb 2019 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nrws9AXUBL35xch6ekr1OlNl7FySMn16fqUNYApuLy4=;
	b=MluQUDLT71zYhKcFiZBJbOj9DsG6It0X3YTeHeXBtu9OOci8ZZadEgFSrR0PYCRVng
	HQhAwPW7AEoA4VEsENgDAxJQZnlQvEcx9V82Tr0rLW4wyoACFbiRIDM6+Gqn4Exx4jyJ
	kSPLnuLRoCyhP4YS0g74p4+Rnl3JsX12MiFqlreQYH2YEhOB+K7zRVsDeTd1XhR8CpP2
	7hpwmCkahUnvWxIDcFL4O0XYFwzjKLYN88rjhII5Fmq7BAQOIdUFUYlCE332XbqGwTyl
	cey0/b653YZAzLIUyTSmVrd52cjT+YLlncm4yxrtAPl4QRhnZWPY+RjEE3FmVE6jfoT6
	3yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nrws9AXUBL35xch6ekr1OlNl7FySMn16fqUNYApuLy4=;
	b=XdSO9kSkncW3S+DCK+wo2axENkG20qgWzKYhGrqgoApLyCwP+Ye6L1LjFU7v6pfZ8b
	bFpz9fVz/QjhBNrOQxH3eIZ1O2/V0XjXGIFmoz59GA9d4RzYfk5OWOKbUjglj8pW87ns
	b8VsGE8ADtLbA+3E8W978tZIXZgc0Qh+JTYbdkBLPPWvWhcBs4SV8lf26c3eK78+ZoF4
	26bCI2BoEwdjc7sh5CI/cvNJ1kdecaYSukttVI38q+AraIpCMQrBaeRwOghftbpUQ+4u
	OgbRNMeExXJkGFMMwHFh2LzJc+dHdJHcYhqPtNy3FMvbK9R2xd6t2CktGwrSBToc8pOh
	S5Ug==
X-Gm-Message-State: AHQUAuY9l+34IPdHIN5Rb1S8B8b6FD4/DFR+zcOFmxY6bU9/TYlsYpBU
	x7lthGpDtolL1Jb1Kxs7CM0h9DrcLEiBAN8k0Q0=
X-Google-Smtp-Source: AHgI3IZ0CLMr6MFW4cVaiMQO+C2WyxtblncKMZKeLEdOXsAxEm5RP+zHoXg9j9jRT2N03ziozasgcQiME/YYysrIh3o=
X-Received: by 2002:a2e:3308:: with SMTP id d8-v6mr3867958ljc.38.1549394220312;
	Tue, 05 Feb 2019 11:17:00 -0800 (PST)
MIME-Version: 1.0
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
	<50ea8b3e-cd8e-c6e9-86dc-2e50b78646c5@greensocs.com>
In-Reply-To: <50ea8b3e-cd8e-c6e9-86dc-2e50b78646c5@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Feb 2019 11:16:22 -0800
Message-ID: <CAKmqyKNgj=u5vKgR1F_fMKs8NLq2ze1OamgUxZOqzN1jytF3qQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/cpu/cluster: Mark the
 cpu-cluster device with user_creatable = false
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
X-List-Received-Date: Tue, 05 Feb 2019 19:17:06 -0000

On Tue, Feb 5, 2019 at 7:22 AM Luc Michel <luc.michel@greensocs.com> wrote:
>
>
>
> On 2/5/19 1:58 PM, Thomas Huth wrote:
> > The device can not be instantiated by the user and QEMU currently
> > aborts when you try to use it:
> >
> > $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> > qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
> >  Assertion `cbdata.cpu_count > 0' failed.
> > Aborted (core dumped)
> >
> > Since this is an internal device only, mark it with user_creatable = false.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> > ---
> >  hw/cpu/cluster.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> > index 25f9070..6f5f037 100644
> > --- a/hw/cpu/cluster.c
> > +++ b/hw/cpu/cluster.c
> > @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
> >
> >      dc->props = cpu_cluster_properties;
> >      dc->realize = cpu_cluster_realize;
> > +
> > +    /* This is not directly for users, CPU children must be attached by code */
> > +    dc->user_creatable = false;
> >  }
> >
> >  static const TypeInfo cpu_cluster_type_info = {
> >
>

