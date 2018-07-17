Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffMT3-0004De-9b
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2018 05:40:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ffMT1-0004CO-9k
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2018 05:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ffMT0-0007ZS-9G
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2018 05:40:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33990 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ffMSv-0007Xl-Od; Tue, 17 Jul 2018 05:40:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36C5387A73;
	Tue, 17 Jul 2018 09:40:17 +0000 (UTC)
Received: from redhat.com (wlan-5-166.fab.redhat.com [10.33.5.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 259197C3E;
	Tue, 17 Jul 2018 09:40:15 +0000 (UTC)
Date: Tue, 17 Jul 2018 10:40:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <20180717094013.GJ18603@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180716195851.0FE177456B7@zero.eik.bme.hu>
	<CAFEAcA-Lu=gZWQOROa+oEwaWP8FWSY__=jneDQZVK=mFXAcFMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Lu=gZWQOROa+oEwaWP8FWSY__=jneDQZVK=mFXAcFMw@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 17 Jul 2018 09:40:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 17 Jul 2018 09:40:17 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Do not enable QOM debugging
 by default
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
X-List-Received-Date: Tue, 17 Jul 2018 09:40:24 -0000

On Mon, Jul 16, 2018 at 09:41:12PM +0100, Peter Maydell wrote:
> On 16 July 2018 at 20:47, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> > Commit 3556c233d 5 years ago added an option to disable QOM debugging,
> > noting that it can have high performance cost but left the default to on.
> > Change the default to off and only enable it when debugging is requested
> > to avoid the performance penalty for those compiling without debug options.
> >
> > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Looking at the code, doesn't this disable all the type checking
> on the QOM casts? That is not something I think we should drop,
> in the same way that we do not disable assert()s even in the
> non-debug build.
> 
> Is this coming up as significant in profiling? In the past we've
> done some special casing if there are particular QOM casts in
> hot paths that use significant runtime.

There might also be scope for doing optimization of the
object_dynamic_cast_assert() implementation too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

