Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8mVT-0003QT-On
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 08:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f8mVR-0003OS-Ou
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:48:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f8mVM-0005jx-6Q
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:48:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56052 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f8mVB-0005cH-Sh; Wed, 18 Apr 2018 08:47:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E350402333B;
	Wed, 18 Apr 2018 12:47:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FF752023594;
	Wed, 18 Apr 2018 12:47:55 +0000 (UTC)
Date: Wed, 18 Apr 2018 13:47:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418124753.GM27579@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180418123838.3511-1-olaf@aepfle.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 18 Apr 2018 12:47:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 18 Apr 2018 12:47:57 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 12:48:15 -0000

On Wed, Apr 18, 2018 at 02:38:37PM +0200, Olaf Hering wrote:
> Since usage of g_realloc_n was introduced, glib-2.22 can not be used anymore.
> Fixes commit 418026ca43 ("util: Introduce vfio helpers")

Normally we expect ./include/glib-compat.h to be changed in this scenario
to add compat for the missing symbol.

IIRC, one of Peters desired build targets required 2.22, but I guess we
missed this bug because that platform would not enable vfio functionality ?



> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 6e9b994f21..81760ef45a 100755
> --- a/configure
> +++ b/configure
> @@ -3369,7 +3369,7 @@ fi
>  if test "$mingw32" = yes; then
>      glib_req_ver=2.30
>  else
> -    glib_req_ver=2.22
> +    glib_req_ver=2.24
>  fi



>  glib_modules=gthread-2.0
>  if test "$modules" = yes; then
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

