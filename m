Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIV2I-0007e5-EY
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 04:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fIV2B-0007WJ-KW
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 04:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fIV27-0000so-Af
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 04:10:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35334 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fIV1x-0000n5-OJ; Tue, 15 May 2018 04:09:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B4CF11734A;
	Tue, 15 May 2018 08:09:57 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9470C1FB5;
	Tue, 15 May 2018 08:09:51 +0000 (UTC)
Date: Tue, 15 May 2018 10:09:49 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, Fam Zheng <famz@redhat.com>, "open list:All patches
	CC here" <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-stable@nongnu.org
Message-ID: <20180515100949.248bc43b.cohuck@redhat.com>
In-Reply-To: <d17ae62a-03a5-61fa-934a-4cb917d14222@redhat.com>
References: <20180515063128.7040-1-olaf@aepfle.de>
	<d17ae62a-03a5-61fa-934a-4cb917d14222@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 15 May 2018 08:09:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 15 May 2018 08:09:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] replace functions which
 are only available in glib-2.24
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
X-List-Received-Date: Tue, 15 May 2018 08:10:17 -0000

On Tue, 15 May 2018 09:18:52 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 15.05.2018 08:31, Olaf Hering wrote:
> > Currently the minimal supported version of glib is 2.22.
> > Since testing is done with a glib that claims to be 2.22, but in fact
> > has APIs from newer version of glib, this bug was not caught during
> > submit of the patch referenced below.
> > 
> > Replace g_realloc_n, which is available only since 2.24, with g_renew.
> > 
> > Fixes commit 418026ca43 ("util: Introduce vfio helpers")
> > 
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > ---
> >  This must go into stable-2.12.  
> 
> In that case please CC: qemu-stable@nongnu.org (done now).
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> >  util/vfio-helpers.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> > index 006674c916..1d9272efa4 100644
> > --- a/util/vfio-helpers.c
> > +++ b/util/vfio-helpers.c
> > @@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
> >  
> >      assert(index >= 0);
> >      s->nr_mappings++;
> > -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> > -                              s->nr_mappings);
> > +    s->mappings = g_renew(IOVAMapping, s->mappings, s->nr_mappings);
> >      insert = &s->mappings[index];
> >      shift = s->nr_mappings - index - 1;
> >      if (shift) {
> > @@ -577,8 +576,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IOVAMapping *mapping,
> >      memmove(mapping, &s->mappings[index + 1],
> >              sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
> >      s->nr_mappings--;
> > -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> > -                              s->nr_mappings);
> > +    s->mappings = g_renew(IOVAMapping, s->mappings, s->nr_mappings);
> >  }
> >  
> >  /* Check if the mapping list is (ascending) ordered. */
> >   

This looks fine to me, so

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

But this leads to another question: What do we do if we want a fix only
in stable? Hypothetical scenario: Same parameters as for this patch
(glib version bump, newer function sneaked in), but the older function
that could be used in stable is clearly worse (IOW, we don't want it in
the new version). Do we have a process to get a change only into stable?

