Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8md2-0006kO-71
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 08:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f8md0-0006is-2i
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:56:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f8mcy-0001FN-V1
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:56:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58956 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f8mct-00016m-GH; Wed, 18 Apr 2018 08:55:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50BC0EBFEA;
	Wed, 18 Apr 2018 12:55:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E5DD2023227;
	Wed, 18 Apr 2018 12:55:48 +0000 (UTC)
Date: Wed, 18 Apr 2018 13:55:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418125545.GN27579@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180418144538.4aa2f492.cohuck@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 18 Apr 2018 12:55:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 18 Apr 2018 12:55:54 +0000 (UTC) for IP:'10.11.54.4'
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
X-List-Received-Date: Wed, 18 Apr 2018 12:56:03 -0000

On Wed, Apr 18, 2018 at 02:45:38PM +0200, Cornelia Huck wrote:
> On Wed, 18 Apr 2018 14:38:37 +0200
> Olaf Hering <olaf@aepfle.de> wrote:
> 
> > Since usage of g_realloc_n was introduced, glib-2.22 can not be used anymore.
> > Fixes commit 418026ca43 ("util: Introduce vfio helpers")
> > 
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 6e9b994f21..81760ef45a 100755
> > --- a/configure
> > +++ b/configure
> > @@ -3369,7 +3369,7 @@ fi
> >  if test "$mingw32" = yes; then
> >      glib_req_ver=2.30
> >  else
> > -    glib_req_ver=2.22
> > +    glib_req_ver=2.24
> >  fi
> >  glib_modules=gthread-2.0
> >  if test "$modules" = yes; then
> > 
> 
> Are we ready to give up support for whatever distro is still on 2.22?
> (If yes, can we bump to an even newer glib version?) Or should we
> rather solve this by adding a g_realloc_n implementation for that case?

Version 2.22 was released in Sep 2009, so coming up for 9 years old now.

At some point we should to declare that platforms shipping >= NNN year
old versions of software are not a desirable target for QEMU. What is
our desired NNN value - 9 years feels awfully long to me.

For libvirt we recently decided to become more aggressive[1] in culling old
distros as supportable targets, declaring we'll only support non-EOL
distros (for short life distros), or for long life distros (RHEL, LTS, etc)
the most recent version, and the recent minus-1 for 2 years overlap.

Should we formalize similar guidelines for QEMU to give developers a
guide for when it is reasonable to increase the min required version of
any 3rd party library ?  glib is a mandatory dep, but we've countless
other optional libraries we might wish to increase min versions for too,
and no guide on when it is reasonable todo so.

Regards,
Daniel

[1]   https://libvirt.org/platforms.html
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

