Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLPwi-0008Pp-HG
	for mharc-qemu-trivial@gnu.org; Fri, 18 Oct 2019 06:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iLPwe-0008L0-DX
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 06:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iLPwd-0002dP-7d
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 06:57:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42546)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iLPwa-0002cl-46; Fri, 18 Oct 2019 06:57:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C581308A9E2;
 Fri, 18 Oct 2019 10:57:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A6D1001B05;
 Fri, 18 Oct 2019 10:57:13 +0000 (UTC)
Date: Fri, 18 Oct 2019 11:57:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, eblake@redhat.com
Subject: Re: [PATCH] Do not use %m in common code to print error messages
Message-ID: <20191018105710.GD28271@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20191018104438.6158-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191018104438.6158-1-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 18 Oct 2019 10:57:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 18 Oct 2019 10:57:22 -0000

On Fri, Oct 18, 2019 at 12:44:38PM +0200, Thomas Huth wrote:
> The %m format specifier is an extension from glibc - and when compiling
> QEMU for NetBSD, the compiler correctly complains, e.g.:
> 
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_handler':
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is only
>  allowed in syslog(3) like functions [-Wformat=]
>              printf("read from sigfd returned %zd: %m\n", len);
>              ^
> Let's use g_strerror() here instead, which is an easy-to-use wrapper
> around the thread-safe strerror_r() function.
> 
> While we're at it, also convert the "printf()" in main-loop.c into
> the preferred "error_report()".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/misc/tmp421.c | 8 ++++++--
>  util/main-loop.c | 4 +++-
>  util/systemd.c   | 5 +++--
>  3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
> index 9f044705fa..f23c46a40a 100644
> --- a/hw/misc/tmp421.c
> +++ b/hw/misc/tmp421.c
> @@ -120,7 +120,9 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
>      int tempid;
>  
>      if (sscanf(name, "temperature%d", &tempid) != 1) {
> -        error_setg(errp, "error reading %s: %m", name);
> +        const char *errmsg = g_strerror(errno);
> +        error_setg(errp, "error reading %s: %s", name, errmsg);
> +        g_free((gpointer)errmsg);

Kaboom crash. This is trying to free a const string that is the caller
doesn't own. It remains under ownership of g_strerror forever.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

