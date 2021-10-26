Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfFgY-0006ZH-PQ
	for mharc-qemu-trivial@gnu.org; Tue, 26 Oct 2021 02:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFgV-0006WM-0S; Tue, 26 Oct 2021 02:11:43 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:11213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFgP-0002tV-2Z; Tue, 26 Oct 2021 02:11:42 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 3EBAA7BB1F;
 Tue, 26 Oct 2021 06:11:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhKh0rhlz3MxS;
 Tue, 26 Oct 2021 06:11:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id F281BCB9F;
 Tue, 26 Oct 2021 06:11:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f177.google.com with SMTP id bl14so14199327qkb.4;
 Mon, 25 Oct 2021 23:11:35 -0700 (PDT)
X-Gm-Message-State: AOAM532d72leEPpO4sPUk0QsGAs3GxUXQMNqNk9fHncHpv4E7VWatx8S
 JajwPbm/LsDVTfv6GPoC3A79D4YN80ZUi2IsUNo=
X-Google-Smtp-Source: ABdhPJwCc9j0kajjnqNkvlMyr+tDeE4wJsxeM8wvUsXcG+K8BHp9m5y6mDv86zMnsdEKtAAsDqRlf4iCKGJVVYB7V2c=
X-Received: by 2002:a05:620a:c4a:: with SMTP id
 u10mr12387710qki.69.1635228695678; 
 Mon, 25 Oct 2021 23:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
 <CACNAnaHUq==anp0uQhxk3o=MuLeyaii+MsMPZc3_pBnuS-wCag@mail.gmail.com>
In-Reply-To: <CACNAnaHUq==anp0uQhxk3o=MuLeyaii+MsMPZc3_pBnuS-wCag@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:11:24 -0500
X-Gmail-Original-Message-ID: <CACNAnaH-=mFx-tPd4nVVv+Y=oRe6Vj4Um51rr0u1GBFGk0P=tQ@mail.gmail.com>
Message-ID: <CACNAnaH-=mFx-tPd4nVVv+Y=oRe6Vj4Um51rr0u1GBFGk0P=tQ@mail.gmail.com>
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Kyle Evans <kevans@freebsd.org>
Cc: Warner Losh <imp@bsdimp.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Oct 2021 06:11:43 -0000

On Tue, Oct 26, 2021 at 1:01 AM Kyle Evans <kevans@freebsd.org> wrote:
>
> On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement target_thread_init (to create a thread) and target_set_upcall
> > (to switch to a thread) for arm.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/arm/target_arch_thread.h | 71 +++++++++++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 bsd-user/arm/target_arch_thread.h
> >
> > diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
> > new file mode 100644
> > index 0000000000..317364bb84
> > --- /dev/null
> > +++ b/bsd-user/arm/target_arch_thread.h
> > @@ -0,0 +1,71 @@
> > +/*
> > + *  arm thread support
> > + *
> > + *  Copyright (c) 2013 Stacey D. Son
> > + *
> > + *  This program is free software; you can redistribute it and/or modify
> > + *  it under the terms of the GNU General Public License as published by
> > + *  the Free Software Foundation; either version 2 of the License, or
> > + *  (at your option) any later version.
> > + *
> > + *  This program is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public License
> > + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +#ifndef _TARGET_ARCH_THREAD_H_
> > +#define _TARGET_ARCH_THREAD_H_
> > +
> > +/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
> > +static inline void target_thread_set_upcall(CPUARMState *regs, abi_ulong entry,
> > +    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
> > +{
> > +    abi_ulong sp;
> > +
> > +    /*
> > +     * Make sure the stack is properly aligned.
> > +     * arm/include/param.h (STACKLIGN() macro)
> > +     */
> > +    sp = (u_int)((stack_base + stack_size) -
> > +        sizeof(struct target_trapframe)) & ~0x7;
> > +
> > +    /* sp = stack base */
> > +    regs->regs[13] = sp;
> > +    /* pc = start function entry */
> > +    regs->regs[15] = entry & 0xfffffffe;
> > +    /* r0 = arg */
> > +    regs->regs[0] = arg;
> > +    regs->spsr = ARM_CPU_MODE_USR;
> > +    if (entry & 0x1) {
> > +        regs->spsr |= CPSR_T;
> > +    }
> > +}
> > +
> > +static inline void target_thread_init(struct target_pt_regs *regs,
> > +        struct image_info *infop)
> > +{
> > +    abi_long stack = infop->start_stack;
> > +    memset(regs, 0, sizeof(*regs));
> > +    regs->ARM_cpsr = 0x10;
> > +    if (infop->entry & 1) {
> > +        regs->ARM_cpsr |= CPSR_T;
> > +    }
> > +    regs->ARM_pc = infop->entry & 0xfffffffe;
> > +    regs->ARM_sp = infop->start_stack;
> > +    if (bsd_type == target_freebsd) {
> > +        regs->ARM_lr = infop->entry & 0xfffffffe;
> > +    }
> > +    /* FIXME - what to for failure of get_user()? */
> > +    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
> > +    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
> > +    /* XXX: it seems that r0 is zeroed after ! */
> > +    regs->ARM_r0 = 0;
> > +    /* For uClinux PIC binaries.  */
> > +    /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
> > +    regs->ARM_r10 = infop->start_data;
> > +}
> > +
> > +#endif /* !_TARGET_ARCH_THREAD_H_ */
> > --
> > 2.32.0
> >
>
> I think it's obvious enough to folks already familiar with ARM, but I
> wonder if we shouldn't add in some basic commentary about the thumb
> bits above. Something like:
>
> /*
>  * The low bit in an entry point indicates a thumb instruction; the entry point
>  * can't actually exist at this address because it must be 16- or 32-
> bit aligned.
>  * The low bit gets masked off and the T bit in CSPR is twiddled to
> indicate thumb.
>  */

s/CSPR/CPSR/

