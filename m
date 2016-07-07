Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bLEN9-00027o-TC
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 14:50:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riku.voipio@linaro.org>) id 1bLEN7-00025c-7F
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 14:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riku.voipio@linaro.org>) id 1bLEN4-0005Hi-RV
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 14:50:00 -0400
Received: from jessie.kos.to ([212.47.231.226]:35354 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riku.voipio@linaro.org>)
	id 1bLEMw-0005H0-Q6; Thu, 07 Jul 2016 14:49:51 -0400
Received: from beaming.home (91-157-170-157.elisa-laajakaista.fi
	[91.157.170.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 0B7C82C2312;
	Thu,  7 Jul 2016 18:49:45 +0000 (UTC)
Received: (nullmailer pid 10513 invoked by uid 1000);
	Thu, 07 Jul 2016 18:49:44 -0000
Date: Thu, 7 Jul 2016 21:49:44 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, "Wirth, Allan" <awirth@akamai.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <20160707184944.GA30964@beaming.home>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
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
X-List-Received-Date: Thu, 07 Jul 2016 18:50:02 -0000

On Sat, Jul 02, 2016 at 09:12:09PM +0100, Peter Maydell wrote:
> On 2 July 2016 at 17:41, Laurent Vivier <laurent@vivier.eu> wrote:
> > Sadly, this can't work:
> >
> > sparc/sparc64/cris use sys_select for NR_select AND NR_newselect.
> 
> > Not sure all is correct, but it's what I've found:
> >
> >             | __NR_select    | __NR__newselect
> > ------------+----------------+-----------------+
> > arm         | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> > aarch64     | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > alpha       | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > cris        | sys_select     | sys_select      |
> > ------------+----------------+-----------------+
> > m68k        | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> > microblaze  | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> > mips        | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> > mips64      | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > openrisc    | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > ppc         | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> > s390x       | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > sh4         | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> > sparc       | sys_select     | sys_select      |
> > ------------+----------------+-----------------+
> > sparc64     | sys_select     | sys_select      |
> > ------------+----------------+-----------------+
> > tilegx      | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > unicore32   | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > x86_64      | sys_select     |        -        |
> > ------------+----------------+-----------------+
> > i386        | sys_old_select | sys_select      |
> > ------------+----------------+-----------------+
> 
> Hmm. Looking at current Linux git master, I get
> slightly different results. The only architectures which
> define __ARCH_WANT_SYS_OLD_SELECT are:
>  arm, m68k, mn10300, x86
> and no others use sys_old_select.
> 
> So I think we have the following behaviours:
> 
> (1) Define neither NR_select nor NR__newselect
>  (and use pselect6 syscall for select):
>  aarch64, openrisc, tilegx, unicore32, presumably any future arch
> 
> (2) only define NR__newselect, it is new select:
>  mips, mips64, sh, s390
> 
> (3) Only define NR_select, want that to be new select:
>  alpha, x86_64, s390x
> 
> (4) NR__newselect is new select, NR_select is old_select:
>  i386, m68k, arm if kernel is not CONFIG_AEABI
> 
> (5) NR__newselect is new select, NR_select is defined but
>  if called returns ENOSYS:
>  microblaze, arm if CONFIG_AEABI, ppc64
> 
> (6) NR__newselect is new select, NR_select is a bonkers custom
>  thing that tries to autodetect the calling convention:
> http://lxr.free-electrons.com/source/arch/powerpc/kernel/syscalls.c#L86
>  ppc32 (but only native 32-bit; 32-bit compat support
>  on a ppc64 kernel is category 5, so I vote for ignoring
>  this weirdness and calling ppc category 5)
> 
> (7) NR_select and NR__newselect are different numbers
>  but both are new select:
>  cris, sparc, sparc64
> 
> which is a pretty confusing mess, but I think it equates to:
> (0) if defined, NR__newselect is always new select
> (1) if NR_select is defined, the choices are:
>  (a) NR_select is old_select:
>    i386, m68k, arm
>  (b) NR_select is defined but should ENOSYS:
>    microblaze, ppc
>  (c) NR_select defined and is new select:
>    everything else (alpha, x86-64, s390x, cris, sparc, sparc64)
> 
> and I think we should handle that by having the code in syscall.c
> be something like:
> 
> #ifdef TARGET_NR_select
>     case TARGET_NR_select:
> #if defined(TARGET_WANT_NI_OLD_SELECT)
>         /* some architectures used to have old_select here
>          * but now ENOSYS it.
>          */
>         ret = -TARGET_ENOSYS;
>         break;
> #elif defined(TARGET_WANT_OLD_SYS_SELECT)
>         /* code for old select here; maybe factored out to
>          * its own function: ret = do_old_select() ?
>          */
> #else
>         /* select is new style select */
>         ret = do_select(...);
> #endif
> #endif

I agree, this seems to be the best way to fix select properly.

> where TARGET_WANT_NI_OLD_SELECT and
> TARGET_WANT_OLD_SYS_SELECT are #defined in
> linux-user/$(ARCH)/target_syscall.h by those
> architectures that need that behaviour
> (microblaze, ppc for the first; i386, m68k, arm
> for the second).
> 
> We could just not define TARGET_NR_select for
> microblaze and ppc, of course, but that might
> be confusing and easily accidentally reverted.
> 
> For openrisc, sh and tilegx we incorrectly define
> a TARGET_NR_select which the kernel doesn't, so
> we should delete that from our headers.
> 
> I think overall that produces a reasonable separation
> of "what behaviour does my architecture want" from
> the implementation of the various behaviours, and
> means the default will be correct for any architectures
> we add later (only the oddball legacy cases need
> to request special behaviour).
> 
> thanks
> -- PMM

