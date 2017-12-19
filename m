Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRKeq-0005a7-6b
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 11:22:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eRKen-0005Xo-6H
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 11:22:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eRKem-0007TP-4R
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 11:22:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:14150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eRKec-0007Qm-Ug; Tue, 19 Dec 2017 11:22:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 234EE43A25;
	Tue, 19 Dec 2017 16:22:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.109])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA071839A;
	Tue, 19 Dec 2017 16:22:00 +0000 (UTC)
Date: Tue, 19 Dec 2017 16:21:57 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
Message-ID: <20171219162157.GD3567@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1513700253-10045-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1513700253-10045-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 19 Dec 2017 16:22:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] monitor: Remove legacy "-mon default=on"
 parameter
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
X-List-Received-Date: Tue, 19 Dec 2017 16:22:18 -0000

On Tue, Dec 19, 2017 at 05:17:33PM +0100, Thomas Huth wrote:
> The "default" parameter of the "-mon" option is useless since
> QEMU v2.4.0, and marked as deprecated since QEMU v2.8.0. That
> should have been long enough to let people update their scripts,
> so time to remove it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  monitor.c     | 3 ---
>  qemu-doc.texi | 9 ---------
>  vl.c          | 4 ----
>  3 files changed, 16 deletions(-)
> 
> diff --git a/monitor.c b/monitor.c
> index e36fb53..e53c6e1 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4141,9 +4141,6 @@ QemuOptsList qemu_mon_opts = {
>              .name = "chardev",
>              .type = QEMU_OPT_STRING,
>          },{
> -            .name = "default",  /* deprecated */
> -            .type = QEMU_OPT_BOOL,
> -        },{
>              .name = "pretty",
>              .type = QEMU_OPT_BOOL,
>          },
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index d9861b3..6913b32 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -2401,15 +2401,6 @@ setting ``-machine kernel_irqchip=off''.
>  The ``-no-kvm'' argument is now a synonym for setting
>  ``-machine accel=tcg''.
>  
> -@subsection -mon default=on (since 2.4.0)
> -
> -The ``default'' option to the ``-mon'' argument is
> -now ignored. When multiple monitors were enabled, it
> -indicated which monitor would receive log messages
> -from the various subsystems. This feature is no longer
> -required as messages are now only sent to the monitor
> -in response to explicitly monitor commands.
> -
>  @subsection -vnc tls (since 2.5.0)

It occurs to me that qemu.org only ever displays the very latest version
of the qemu-tech doc.

So if someone has deployed QEMU 2.11, and reads the doc online, once your
patches are commited, all the info about deprecated features that affect
their 2.11 version will have gone, despite 2.12 not yet existing. They'll
only find deprecation info in their locally installed doc. I think this
is pretty undesirable.

So rather than deleting entries from the deprecation appendix, should
we move them to a separate appendix, or "Formerly deprecated, now
deleted" features. Or just change the annotation

  (since 2.4.0)

to

  (deprecated since 2.4.0, deleted in 2.12.0)


same comment for all your patches deleting deprecated features.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

