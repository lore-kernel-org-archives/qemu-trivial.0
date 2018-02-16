Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1emiic-00009j-6M
	for mharc-qemu-trivial@gnu.org; Fri, 16 Feb 2018 11:18:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1emiiX-00006V-SS
	for qemu-trivial@nongnu.org; Fri, 16 Feb 2018 11:18:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1emiiX-0005ZA-0c
	for qemu-trivial@nongnu.org; Fri, 16 Feb 2018 11:18:33 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46130 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1emiiP-0005XE-V1; Fri, 16 Feb 2018 11:18:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C0EE8182D2F;
	Fri, 16 Feb 2018 16:18:15 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29F32213AEE2;
	Fri, 16 Feb 2018 16:18:09 +0000 (UTC)
Date: Fri, 16 Feb 2018 16:18:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Message-ID: <20180216161806.GA22220@work-vm>
References: <1513700253-10045-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513700253-10045-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 16 Feb 2018 16:18:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 16 Feb 2018 16:18:15 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Remove legacy
 "-mon default=on" parameter
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
X-List-Received-Date: Fri, 16 Feb 2018 16:18:36 -0000

* Thomas Huth (thuth@redhat.com) wrote:
> The "default" parameter of the "-mon" option is useless since
> QEMU v2.4.0, and marked as deprecated since QEMU v2.8.0. That
> should have been long enough to let people update their scripts,
> so time to remove it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued for HMP (at last...)

Dave

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
>  
>  The ``-vnc tls'' argument is now a synonym for setting
> diff --git a/vl.c b/vl.c
> index 2644400..4e7a7e4 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2438,10 +2438,6 @@ static int mon_init_func(void *opaque, QemuOpts *opts, Error **errp)
>      if (qemu_opt_get_bool(opts, "pretty", 0))
>          flags |= MONITOR_USE_PRETTY;
>  
> -    if (qemu_opt_get_bool(opts, "default", 0)) {
> -        error_report("option 'default' does nothing and is deprecated");
> -    }
> -
>      chardev = qemu_opt_get(opts, "chardev");
>      chr = qemu_chr_find(chardev);
>      if (chr == NULL) {
> -- 
> 1.8.3.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

