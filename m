Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um54h-000771-4Z
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 12:36:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um54a-0006vr-KB
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 12:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um54Z-000251-5x
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 12:36:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1Um54V-00023n-EY; Mon, 10 Jun 2013 12:35:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5AGZstR023912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 12:35:54 -0400
Received: from localhost (vpn1-6-48.ams2.redhat.com [10.36.6.48])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5AGZrd7024612; Mon, 10 Jun 2013 12:35:54 -0400
Date: Mon, 10 Jun 2013 17:35:50 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130610163550.GD4515@redhat.com>
References: <1370870347-22080-1-git-send-email-rjones@redhat.com>
	<51B5F21C.9020700@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51B5F21C.9020700@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] curl: Don't set curl options on the
 handle just before it's going to be deleted.
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
X-List-Received-Date: Mon, 10 Jun 2013 16:36:05 -0000

On Mon, Jun 10, 2013 at 07:34:52PM +0400, Michael Tokarev wrote:
> 10.06.2013 17:19, Richard W.M. Jones wrote:
> > From: "Richard W.M. Jones" <rjones@redhat.com>
> > 
> > (Found by Kamil Dudka)
> > 
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > ---
> >  block/curl.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/block/curl.c b/block/curl.c
> > index b634ccf..bf31efe 100644
> > --- a/block/curl.c
> > +++ b/block/curl.c
> > @@ -453,7 +453,6 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
> >          goto out;
> >      curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d);
> >      curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_read_cb);
> > -    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 0);
> >      if (d)
> >          s->len = (size_t)d;
> >      else if(!s->len)
> 
> Adding a bit more context:
> 
> 
>     curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1);
>     curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_size_cb);
>     if (curl_easy_perform(state->curl))
>         goto out;
>     curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d);
>     curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_read_cb);
> =>> curl_easy_setopt(state->curl, CURLOPT_NOBODY, 0);
>     if (d)
>         s->len = (size_t)d;
>     else if(!s->len)
>         goto out;
>     DPRINTF("CURL: Size = %zd\n", s->len);
> 
>     curl_clean_state(state);
>     curl_easy_cleanup(state->curl);
>     state->curl = NULL;
> 
> So indeed, the curl object is being removed here a few lines down the code.
> 
> But it looks like the previous call to curl_easy_setopt, to set WRITEFUNCTION,
> is also not very useful. Should we probably want to remove that too, or don't
> remove either of these?

Yes you're right.  For some reason I "saw" another call to
curl_easy_perform which obviously isn't there in reality.  Will send a
v2 patch shortly after I've done a bit of testing.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

