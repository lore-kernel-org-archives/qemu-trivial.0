Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpxck-0003WG-R6
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 13:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jpxcj-0003Vs-1i
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 13:31:17 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38642
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jpxcf-0007ZE-Tn
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 13:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593451872;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U95fsWvuFH3nvjOtH6i5Acn/ftLxkk5GUpVBfXQ6Taw=;
 b=KhW7K3AkS3WQ3ApgfCffIAMyy0gz+HaxY/QISphjSnDOze/h9n8eFCt/CrhbS7Mq7qdXYn
 AZi3bF1cnbBex9Ve2Z4qAeEQqUng2SWB0KKPT3/1wxl65p3VlSI8bNYFmgUSqRxWiur/W3
 e0wiJjoviS5hQtcUroQ+QwPDFQtpde8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-tv6huNt8P9uK4JpQPd5gCg-1; Mon, 29 Jun 2020 13:30:57 -0400
X-MC-Unique: tv6huNt8P9uK4JpQPd5gCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EED51005512;
 Mon, 29 Jun 2020 17:30:56 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EF51002393;
 Mon, 29 Jun 2020 17:30:38 +0000 (UTC)
Date: Mon, 29 Jun 2020 18:30:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 09/10] spice: Put spice functions in a separate load module
Message-ID: <20200629173035.GA1298906@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-10-dinechin@redhat.com>
 <20200626173538.GP1028934@redhat.com> <lyo8p1dc2a.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <lyo8p1dc2a.fsf@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 29 Jun 2020 17:31:17 -0000

On Mon, Jun 29, 2020 at 07:19:41PM +0200, Christophe de Dinechin wrote:
> 
> On 2020-06-26 at 19:35 CEST, Daniel P. Berrangé wrote...
> > On Fri, Jun 26, 2020 at 06:43:06PM +0200, Christophe de Dinechin wrote:
> >> Use the MODIFACE and MODIMPL macros to to redirect the highest-level
> >> qemu_spice functions into the spice-app.so load module when SPICE is
> >> compiled as a module.
> >>
> >> With these changes, the following shared libraries are no longer
> >> necessary in the top-level qemu binary:
> >>
> >>  	libspice-server.so.1 => /lib64/libspice-server.so.1 (HEX)
> >>  	libopus.so.0 => /lib64/libopus.so.0 (HEX)
> >>  	liblz4.so.1 => /lib64/liblz4.so.1 (HEX)
> >>  	libgstapp-1.0.so.0 => /lib64/libgstapp-1.0.so.0 (HEX)
> >>  	libgstvideo-1.0.so.0 => /lib64/libgstvideo-1.0.so.0 (HEX)
> >>  	libgstbase-1.0.so.0 => /lib64/libgstbase-1.0.so.0 (HEX)
> >>  	libgstreamer-1.0.so.0 => /lib64/libgstreamer-1.0.so.0 (HEX)
> >>  	libssl.so.1.1 => /lib64/libssl.so.1.1 (HEX)
> >>  	liborc-0.4.so.0 => /lib64/liborc-0.4.so.0 (HEX)
> >>
> >> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> >> ---
> >>  include/ui/qemu-spice.h | 24 +++++++++++++++---------
> >>  monitor/hmp-cmds.c      |  6 ++++++
> >>  softmmu/vl.c            |  1 +
> >>  ui/spice-core.c         | 31 +++++++++++++++++++++----------
> >>  ui/spice-display.c      |  2 +-
> >>  5 files changed, 44 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
> >> index 8c23dfe717..0f7e139da5 100644
> >> --- a/include/ui/qemu-spice.h
> >> +++ b/include/ui/qemu-spice.h
> >> @@ -24,22 +24,28 @@
> >>
> >>  #include <spice.h>
> >>  #include "qemu/config-file.h"
> >> +#include "qemu/module.h"
> >>
> >> -extern int using_spice;
> >> +#define using_spice     (qemu_is_using_spice())
> >>
> >> -void qemu_spice_init(void);
> >> +MODIFACE(bool, qemu_is_using_spice,(void));
> >> +MODIFACE(void, qemu_start_using_spice, (void));
> >> +MODIFACE(void, qemu_spice_init, (void));
> >>  void qemu_spice_input_init(void);
> >>  void qemu_spice_audio_init(void);
> >> -void qemu_spice_display_init(void);
> >> -int qemu_spice_display_add_client(int csock, int skipauth, int tls);
> >> +MODIFACE(void, qemu_spice_display_init, (void));
> >> +MODIFACE(int, qemu_spice_display_add_client, (int csock, int skipauth, int tls));
> >>  int qemu_spice_add_interface(SpiceBaseInstance *sin);
> >>  bool qemu_spice_have_display_interface(QemuConsole *con);
> >>  int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
> >> -int qemu_spice_set_passwd(const char *passwd,
> >> -                          bool fail_if_connected, bool disconnect_if_connected);
> >> -int qemu_spice_set_pw_expire(time_t expires);
> >> -int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
> >> -                            const char *subject);
> >> +MODIFACE(int, qemu_spice_set_passwd, (const char *passwd,
> >> +                                      bool fail_if_connected,
> >> +                                      bool disconnect_if_connected));
> >> +MODIFACE(int, qemu_spice_set_pw_expire,(time_t expires));
> >> +MODIFACE(int, qemu_spice_migrate_info,(const char *hostname,
> >> +                                       int port, int tls_port,
> >> +                                       const char *subject));
> >> +MODIFACE(struct SpiceInfo *,qemu_spice_query, (Error **errp));
> >
> > This macro usage looks kind of unpleasant and its hard to understand
> > just what is going on, especially why some methods are changed but
> > others are not.
> 
> The functions that are changed are the module interface between qemu and the
> DSO. For example, qemu_spice_init is called from vl.c, i.e. the main binary,
> but qemu_spice_audio_init is called from ui/spice-core.c and
> ui/spice-input.c, which are both in the DSO after the commit.
> 
> The existing function-based interface in qemu-spice.h was not really
> carefully designed for modularization, so this list was determined by
> following the initialization path. It may not be the smallest possible cut.
> It may be neat to add a patch to reorder functions based on whether they are
> inside the DSO or exported from it.
> 
> As for the macro syntax, I see it as somewhat transient. I wanted to propose
> a working and scalable mechanism before adding some nice syntactic sugar
> tooling to it. I expect the syntax to turn into something like:
> 
> MODIFACE void  qemu_spice_display_init (void);
> MODIIMPL void  qemu_spice_display_init (void) { ... }
> 
> But it feels a bit too early to do that. I prefer to experiment with a
> simple macro for now.
> 
> >
> > IIUC, the goal is to turn all these into weak symbols so they don't
> > need to be resolved immediately at startup, and instead have an
> > impl of them provided dynamically at runtime.
> 
> My very first approach was indeed to use weak symbols, but then I learned
> that ld.so no longer deals with weak symbols, apparently for security
> reasons. See LD_DYNAMIC_WEAK in ld.so(8).
> 
> >
> > If so the more normal approach would be to have a struct defining
> > a set of callbacks, that can be registered. Or if there's a natural
> > fit with QOM, then a QOM interface that can then have a QOM object
> > impl registered as a singleton.
> 
> That was my second attempt (after the weak symbols). I cleaned it up a bit
> and put it here: https://github.com/c3d/qemu/commits/spice-vtable.
> 
> What made me switch to the approach in this series is the following
> considerations:
> 
> - A vtable is useful if there can be multiple values for a method, e.g. to
>   implement inheritance, or if you have multiple instances. This is not the
>   case here.

IMHO a vtable is fine for singleton objects. It is a generic way to
remove tight coupling between caller(s) and an implementation. Just
having 1 implementation doesn't invalidate the model.

> - A vtable adds one level of indirection, which does not seem to be
>   particularly useful or helpful for this particular use case.
> 
> - Overloading QOM for that purpose looked more confusing than anything else.
>   It looked like I was mixing unrelated concepts. Maybe that's just me.
> 
> - The required change with a vtable ends up being more extensive. Instead of
>   changing a single line to put an entry point in a DSO, you need to create
>   the vtable, add functions to it, add a register function, etc. I was
>   looking for an easier and more scalable way.
> 
> - In particular, with a vtable, you cannot take advantage of the syntactic
>   trick I used here, which is that foo(x) is a shortcut for (*foo)(x).
>   So for a vtable, you need to manually write wrappers.
> 
> This could be automated, of course, but so far I did not find any clear
> benefit, and many drawbacks to using the vtable approach. As a quantitative
> comparison point, the commit that does this same connection using the vtable
> approach is:
> 
>  include/ui/qemu-spice.h | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  monitor/hmp-cmds.c      |   6 +++++
>  softmmu/vl.c            |  10 +++++++
>  ui/spice-core.c         |  38 ++++++++++++++++++++++++---
>  4 files changed, 148 insertions(+), 10 deletions(-)
> 
> as opposed to what is presented in this series:
> 
>  include/ui/qemu-spice.h | 24 +++++++++++++++---------
>  monitor/hmp-cmds.c      |  6 ++++++
>  softmmu/vl.c            |  1 +
>  ui/spice-core.c         | 31 +++++++++++++++++++++----------
>  ui/spice-display.c      |  2 +-
>  5 files changed, 44 insertions(+), 20 deletions(-)

I much prefer the code in the vtable patch version. The larger number of
lines of code doesn't bother me, because the code is really simple and
clear to read. IOW I prefer the clarity of the longer code, over the
shorter code with magic hidden behind it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


