Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gordV-0004Tu-PY
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 10:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gordT-0004Sa-QT
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 10:18:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gordQ-0002k9-T7
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 10:18:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33619)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gordM-0002i7-NR; Wed, 30 Jan 2019 10:18:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2CCBA402E;
	Wed, 30 Jan 2019 15:18:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3F926324;
	Wed, 30 Jan 2019 15:18:32 +0000 (UTC)
Date: Wed, 30 Jan 2019 15:18:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20190130151829.GT15904@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
	<20190129145156.6719b8a4.cohuck@redhat.com>
	<e3dfae55-8733-bd01-1f13-422f343fb258@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3dfae55-8733-bd01-1f13-422f343fb258@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 30 Jan 2019 15:18:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/s390x: Fix LGPL
 version in the file header comments
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
X-List-Received-Date: Wed, 30 Jan 2019 15:18:44 -0000

On Wed, Jan 30, 2019 at 09:01:01AM -0600, Eric Blake wrote:
> On 1/29/19 7:51 AM, Cornelia Huck wrote:
> > On Tue, 29 Jan 2019 14:37:47 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> > 
> >> It's either "GNU *Library* General Public License version 2" or
> >> "GNU Lesser General Public License version *2.1*", but there was
> >> no "version 2.0" of the "Lesser" license. So assume that version
> >> 2.1 is meant here.
> > 
> > I think we can assume that.
> > 
> > Given that there have been several of these cases (and that there's a
> > lot of boilerplate in general): Should we adopt SPDX license
> > identifiers for QEMU, as the Linux kernel did? They also discovered and
> > fixed some problems/oddities while at it.
> 
> I'm also in favor of SPDX license identifiers - their brevity and
> machine-parsability favors more accurate usage and fewer copy/paste
> mistake propagation.

I'm curious if the kernel developers actually ended up removing the
current boilerplate license text from files they added SPDX tags
to ?

The original work only added SPDX tags to files which lacked any
pre-existing license text

  https://lwn.net/Articles/739183/

Although its from 2017, the LWN article indicates there was
some uncertainty about whether they'd actually go through with
removing license text, especially for files where the person
removing the text is not the exclusive copyright holder:


  "An additional goal is to eventually get rid of the other license
   texts; the consensus seems to be that the SPDX identifier is a 
   sufficient declaration of the license on its own. But removing
   license text from source files must be done with a great deal 
   of care, so it may be a long time before anybody works up the 
   courage to attempt that on any files that they do not themselves 
   own the copyright for. "

I can understand the sentiment that SPDX identifier alone should be
sufficient, but I think I'd want to see an explicit legal opinion from
a lawyer who works with open source before removing any license text.

Any one know if anything changed in this respect since that 2017
lwn article ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

