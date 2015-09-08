Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZIGn-0005tk-Hg
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 08:45:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZZIGi-0005ps-0u
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZZIGf-0000Ob-Bd
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:44:59 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:60481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZZIGf-0000OB-3p; Tue, 08 Sep 2015 08:44:57 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id t88CisJt024832;
	Tue, 8 Sep 2015 08:44:54 -0400
Date: Tue, 8 Sep 2015 08:44:53 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <1829681137.27366603.1441716293187.JavaMail.zimbra@redhat.com>
In-Reply-To: <87h9n5p3ou.fsf@blackfin.pond.sub.org>
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
	<87h9n5p3ou.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF39 (Win)/8.0.6_GA_5922)
Thread-Topic: add macro file for coccinelle
Thread-Index: JC4wRYFI4j6htFNNaIHSAeCnhYTD5w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.24
Cc: qemu-trivial@nongnu.org, peter maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] add macro file for
	coccinelle
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
X-List-Received-Date: Tue, 08 Sep 2015 12:45:00 -0000

> > +/* From qemu/compiler.h */
> > +#define QEMU_GNUC_PREREQ(maj, min) 1
> > +#define QEMU_NORETURN __attribute__ ((__noreturn__))
> > +#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> > +#define QEMU_SENTINEL __attribute__((sentinel))
> > +#define QEMU_ARTIFICIAL __attribute__((always_inline, artificial))
> > +#define QEMU_PACKED __attribute__((gcc_struct, packed))
> > +
> > +#define cat(x,y) x ## y
> > +#define cat2(x,y) cat(x,y)
> 
> Why not reuse glue()?

Because the duplication is already in compiler.h, which should
use glue() instead of cat2().  Separate patch IMHO, but thanks
for noticing. :-)

Paolo

> > +#define QEMU_BUILD_BUG_ON(x) \
> > + typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1]
> > __attribute__((unused));
> > +
> > +#define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> > +
> > +#define xglue(x, y) x ## y
> > +#define glue(x, y) xglue(x, y)
> > +#define stringify(s)	tostring(s)
> > +#define tostring(s)	#s
> > +
> > +#define typeof_field(type, field) typeof(((type *)0)->field)
> > +#define type_check(t1,t2) ((t1*)0 - (t2*)0)
> > +
> [...]
> 
> Preferably with cat2() replaced by glue():
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

