Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYcu6-00047T-BS
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 13:11:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cYcu3-00043z-P1
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:11:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cYctz-0005Q2-Ix
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:11:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1cYctv-0005OU-7d; Tue, 31 Jan 2017 13:11:31 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FAAB80F6D;
	Tue, 31 Jan 2017 18:11:31 +0000 (UTC)
Received: from redhat.com (ovpn-117-115.ams2.redhat.com [10.36.117.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F9C1D4242;
	Tue, 31 Jan 2017 18:11:28 +0000 (UTC)
Date: Tue, 31 Jan 2017 18:11:24 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Message-ID: <20170131181124.GF20303@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
	<CAFEAcA-Ggv2VGszZg0Ld3-1wm=hVe8w=4ZcQ7TDRHf5Puq88ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Ggv2VGszZg0Ld3-1wm=hVe8w=4ZcQ7TDRHf5Puq88ug@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 Jan 2017 18:11:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 18:11:41 -0000

On Tue, Jan 31, 2017 at 06:00:13PM +0000, Peter Maydell wrote:
> On 31 January 2017 at 17:40, Markus Armbruster <armbru@redhat.com> wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> We already require gcc 4.1 or newer (for the atomic
> >> support), so the fallback codepaths for older gcc
> >> versions than that are now dead code and we can
> >> just delete them.
> >>
> >> NB: clang reports itself as gcc 4.2 (regardless of
> >> clang version), so clang won't be using the fallbacks
> >> either.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >> For compatibility with clang we should probably try to avoid
> >> using QEMU_GNUC_PREREQ() and instead have something in
> >> compiler.h that abstracts away whether the test for "does
> >> the compiler support feature foo" is via a GCC version
> >> check or a clang __has_feature or whatever.
> >
> > Yes, testing for feature is better than testing a version.
> >
> > This patch reduces use of QEMU_GNUC_PREREQ roughly by half.  Good.
> >
> >>
> >>
> >>  include/qemu/compiler.h   |   8 ---
> >>  include/qemu/host-utils.h | 121 ----------------------------------------------
> >>  tcg/arm/tcg-target.h      |   7 ---
> >>  3 files changed, 136 deletions(-)
> >>
> >> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> >> index 157698b..fc12e49 100644
> >> --- a/include/qemu/compiler.h
> >> +++ b/include/qemu/compiler.h
> >> @@ -24,17 +24,9 @@
> >>
> >>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
> >>
> >> -#if QEMU_GNUC_PREREQ(3, 4)
> >>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> >> -#else
> >> -#define QEMU_WARN_UNUSED_RESULT
> >> -#endif
> >
> > Should we inline this macro?
> 
> We have attributes which we wrap in QEMU_ macros already
> even though they always expand to the same thing:
> QEMU_NORETURN and QEMU_ALIGNED. I'm happy to leave these
> to follow that pattern. (If you wanted to send a patch
> series that uninlined all of those then I wouldn't hugely
> object to it, but I think it touches enough files that it's
> a separate thing from removing the #if guards that this
> patch does.)

The other option is just to replace QEMU_WARN_UNUSED_RESULT with

  #define QEMU_WARN_UNUSED_RESULT  G_GNUC_WARN_UNUSED_RESULT

and convert code to use G_GNUC_WARN_UNUSED_RESULT directly until we
can kill the QEMU specific define. There's no benefit to QEMU having
its own defines that duplicate stuff already covered by our min
required glib - G_GNUC_WARN_UNUSED_RESULT was added in 2.10 for
example.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|

