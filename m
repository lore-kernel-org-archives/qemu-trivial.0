Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1pbR-0006TY-11
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 22:14:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1T1pbP-0006OE-4R
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 22:14:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1T1pbN-0005eT-Rl
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 22:14:27 -0400
Received: from ozlabs.org ([203.10.76.45]:36151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1T1pbF-0005ds-GH; Wed, 15 Aug 2012 22:14:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id F04362C0089; Thu, 16 Aug 2012 12:14:14 +1000 (EST)
Date: Thu, 16 Aug 2012 12:14:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120816021411.GE4171@truffula.fritz.box>
Mail-Followup-To: Stefan Hajnoczi <stefanha@gmail.com>,
	Jon Loeliger <jdl@jdl.com>, qemu-trivial@nongnu.org, agraf@suse.de,
	qemu-devel@nongnu.org,
	Peter Crosthwaite <peter.crosthwaite@petalogix.com>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
	<1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
	<20120810134245.GC14122@stefanha-thinkpad.localdomain>
	<CAEgOgz7OwHJgKhgm=5VH9UomOr09XOQbDy5OgZx4DqnNj559gQ@mail.gmail.com>
	<CAJSP0QXonD5WYkgAaqO-BeLaJEVoFOPDOajLWerxkrbKdECUkQ@mail.gmail.com>
	<20120815134156.GD10742@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120815134156.GD10742@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org,
	Peter Crosthwaite <peter.crosthwaite@petalogix.com>,
	Jon Loeliger <jdl@jdl.com>, agraf@suse.de, qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 16 Aug 2012 02:14:28 -0000

On Wed, Aug 15, 2012 at 02:41:56PM +0100, Stefan Hajnoczi wrote:
> On Sat, Aug 11, 2012 at 01:33:42PM +0100, Stefan Hajnoczi wrote:
> > On Sat, Aug 11, 2012 at 12:11 AM, Peter Crosthwaite
> > <peter.crosthwaite@petalogix.com> wrote:
> > > On Fri, Aug 10, 2012 at 11:42 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >> On Fri, Aug 10, 2012 at 01:54:26PM +1000, Peter A. G. Crosthwaite wrote:
> > >>> The sizep arg is populated with the size of the loaded device tree. Since this
> > >>> is one of those informational "please populate" type arguments it should be
> > >>> optional. Guarded writes to *sizep against NULL accordingly.
> > >>>
> > >>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> > >>> Acked-by: Alexander Graf <agraf@suse.de>
> > >>> ---
> > >>>  device_tree.c |    8 ++++++--
> > >>>  1 files changed, 6 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/device_tree.c b/device_tree.c
> > >>> index d7a9b6b..641a48a 100644
> > >>> --- a/device_tree.c
> > >>> +++ b/device_tree.c
> > >>> @@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
> > >>>      int ret;
> > >>>      void *fdt = NULL;
> > >>>
> > >>> -    *sizep = 0;
> > >>> +    if (sizep) {
> > >>> +        *sizep = 0;
> > >>> +    }
> > >>>      dt_size = get_image_size(filename_path);
> > >>>      if (dt_size < 0) {
> > >>>          printf("Unable to get size of device tree file '%s'\n",
> > >>> @@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
> > >>>              filename_path);
> > >>>          goto fail;
> > >>>      }
> > >>> -    *sizep = dt_size;
> > >>> +    if (sizep) {
> > >>> +        *sizep = dt_size;
> > >>> +    }
> > >>
> > >> What can the caller do with this void* buffer without knowing its size?
> > >>
> > >
> > > Sanity check the machine:
> > >
> > > dtb = load_device_tree( ... ); //dont care how big it is
> > > foo = fdt_gep_prop( dtb, ... );
> > > if (foo != object_get_prop(foo_device, foo_prop, ... )) {
> > >     hw_error("your dtb is bad because ... !\n", ... );
> > > }
> > 
> > What happens if the fdt is corrupt or malicious?  I guess we'll access
> > memory beyond the end of blob.
> > 
> > This seems to be libfdt's fault.  I didn't see an API to validate the
> > blob's size.
> > 
> > I'm "happy" with this patch but if fdt's can ever come from untrusted
> > sources then we're in trouble.
> 
> Jon/David, can you confirm that libfdt has no way of check the size of
> the fdt blob?

That's not rentirely true.

> For example, if I pass a corrupt or malicious blob to libfdt, is there a
> way to detect that or will it access memory beyond the end of the blob
> as we query the device tree?

So, libfdt does trust the blob size that's given in the blob header,
since libfdt itself doesn't really have any other source for the
blob/buffer size.  If you have another source for your buffer size
though, you can check that quite easily against fdt_totalsize(blob)
(which returns the header value).  If you can think of a helper
function that would make this easier, I'd be happy to add it to
libfdt.

Once the header size is validated, though, libfdt *is* supposed to be
safe against a corrupt or malicious blob.  I can't guarantee that we
don't have bugs here, but any crash on malicious data I do consider a
bug and will fix once I'm aware of it.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

