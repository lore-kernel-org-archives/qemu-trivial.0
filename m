Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1drP-0005kf-Ue
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:42:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1drK-0005kV-1G
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1drF-0004X7-IH
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:42:05 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:41267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1drF-0004Wt-Be; Wed, 15 Aug 2012 09:42:01 -0400
Received: by wgbfm10 with SMTP id fm10so1118564wgb.10
	for <multiple recipients>; Wed, 15 Aug 2012 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tUVazPCEoEl7HJP9FosEG0z7DVSMq4L4c1lAjKW9xPA=;
	b=KmVTpUl1d5En9Jdx07K//SdABy7Wzh90w6f7qXsBuyLhz+3LXe5WCxM+E1mu8g1IMC
	yPOYRK/dkfGksFew0tUmfcJ4c0OnYhPgWsW+KnQpSpjC7/w3+RahtXJAXgDt4xjnPNRN
	kTCo1VtWcnOzaqO1CRG+8KWX3Qe/AMO+6oGuaTQLi1YMyOVPWSAgN7O5ZUmhR49bHS95
	UdOpFpUQZvWm//Y7eTSRmKJzL6YVNPFoXwTAuaMPcU/vbsskh2+CuHbefmYvjk/PeAg9
	Kuw8zSs4diC6RUfSSy1EBNVkyiLYLMZz6zB9HlXiP5eaIXaihKOu+IW99Jkqvai28GII
	p1mA==
Received: by 10.216.52.213 with SMTP id e63mr9577031wec.205.1345038120475;
	Wed, 15 Aug 2012 06:42:00 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t8sm28706382wiy.3.2012.08.15.06.41.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:41:59 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:41:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>
Message-ID: <20120815134156.GD10742@stefanha-thinkpad.localdomain>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
	<1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
	<20120810134245.GC14122@stefanha-thinkpad.localdomain>
	<CAEgOgz7OwHJgKhgm=5VH9UomOr09XOQbDy5OgZx4DqnNj559gQ@mail.gmail.com>
	<CAJSP0QXonD5WYkgAaqO-BeLaJEVoFOPDOajLWerxkrbKdECUkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXonD5WYkgAaqO-BeLaJEVoFOPDOajLWerxkrbKdECUkQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org,
	Peter Crosthwaite <peter.crosthwaite@petalogix.com>,
	agraf@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] device_tree:
 load_device_tree(): Allow NULL sizep
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
X-List-Received-Date: Wed, 15 Aug 2012 13:42:10 -0000

On Sat, Aug 11, 2012 at 01:33:42PM +0100, Stefan Hajnoczi wrote:
> On Sat, Aug 11, 2012 at 12:11 AM, Peter Crosthwaite
> <peter.crosthwaite@petalogix.com> wrote:
> > On Fri, Aug 10, 2012 at 11:42 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >> On Fri, Aug 10, 2012 at 01:54:26PM +1000, Peter A. G. Crosthwaite wrote:
> >>> The sizep arg is populated with the size of the loaded device tree. Since this
> >>> is one of those informational "please populate" type arguments it should be
> >>> optional. Guarded writes to *sizep against NULL accordingly.
> >>>
> >>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> >>> Acked-by: Alexander Graf <agraf@suse.de>
> >>> ---
> >>>  device_tree.c |    8 ++++++--
> >>>  1 files changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/device_tree.c b/device_tree.c
> >>> index d7a9b6b..641a48a 100644
> >>> --- a/device_tree.c
> >>> +++ b/device_tree.c
> >>> @@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
> >>>      int ret;
> >>>      void *fdt = NULL;
> >>>
> >>> -    *sizep = 0;
> >>> +    if (sizep) {
> >>> +        *sizep = 0;
> >>> +    }
> >>>      dt_size = get_image_size(filename_path);
> >>>      if (dt_size < 0) {
> >>>          printf("Unable to get size of device tree file '%s'\n",
> >>> @@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
> >>>              filename_path);
> >>>          goto fail;
> >>>      }
> >>> -    *sizep = dt_size;
> >>> +    if (sizep) {
> >>> +        *sizep = dt_size;
> >>> +    }
> >>
> >> What can the caller do with this void* buffer without knowing its size?
> >>
> >
> > Sanity check the machine:
> >
> > dtb = load_device_tree( ... ); //dont care how big it is
> > foo = fdt_gep_prop( dtb, ... );
> > if (foo != object_get_prop(foo_device, foo_prop, ... )) {
> >     hw_error("your dtb is bad because ... !\n", ... );
> > }
> 
> What happens if the fdt is corrupt or malicious?  I guess we'll access
> memory beyond the end of blob.
> 
> This seems to be libfdt's fault.  I didn't see an API to validate the
> blob's size.
> 
> I'm "happy" with this patch but if fdt's can ever come from untrusted
> sources then we're in trouble.

Jon/David, can you confirm that libfdt has no way of check the size of
the fdt blob?

For example, if I pass a corrupt or malicious blob to libfdt, is there a
way to detect that or will it access memory beyond the end of the blob
as we query the device tree?

Stefan

