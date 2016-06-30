Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIie5-0004iR-5u
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 16:33:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIie2-0004i5-4f
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIidx-0002xN-VT
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:33:05 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:34894)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bIidx-0002wU-MF; Thu, 30 Jun 2016 16:33:01 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id u5UKWxvg023251;
	Thu, 30 Jun 2016 16:32:59 -0400
Date: Thu, 30 Jun 2016 16:32:59 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kraxel@redhat.com,
	peter maydell <peter.maydell@linaro.org>
Message-ID: <1978695732.3315031.1467318779611.JavaMail.zimbra@redhat.com>
In-Reply-To: <5b24e821-7b08-257b-0b3e-0e3336ee644c@redhat.com>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
	<209727639.3312728.1467317746061.JavaMail.zimbra@redhat.com>
	<5b24e821-7b08-257b-0b3e-0e3336ee644c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: Remove left shifts of negative signed integers
Thread-Index: WVcA3GEWsK6m9bN8hAnGTS8uNgXimQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.24
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Thu, 30 Jun 2016 20:33:07 -0000


> > GCC correctly puts this warning under -Wextra, and promises not to ever
> > make use of this facet of undefined behavior.  The only correct patch
> > is the one that disables the warning for clang, and possibly adds
> > -fwrapv.  In GCC, -fwrapv correctly silences ubsan's left-shift
> > and signed-overflow warnings.  In Clang, this is reported at
> > https://llvm.org/bugs/show_bug.cgi?id=25552.  It's a heavy hammer
> > but it's the safest options as compiler evolve.
> 
> Where /exactly/ do you propose we canonicalize the clang invocation you
> would like to support?

In configure where we look for other warning flags.  Add -fwrapv and
-Wno-shift-negative-value so that they're enabled if the compilers
supports them.

Paolo

