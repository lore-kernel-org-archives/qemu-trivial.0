Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3SVH-00008m-Ur
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 09:58:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T3SVF-0008R0-2z
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 09:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T3SVA-0001aS-Sb
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 09:58:49 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:61945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T3SV7-0001ZX-7a; Mon, 20 Aug 2012 09:58:41 -0400
Received: by lagz14 with SMTP id z14so3089886lag.4
	for <multiple recipients>; Mon, 20 Aug 2012 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gdOU0YT2Bk7rVKOvYTMRJ+xoB+YBozdb7uZErch/E1g=;
	b=n2OXbqrFjmyiExTHCKE09acniW685d4vTZteBvuEnHbPOUxlmsqsft+0pRgOSxUp+C
	89kzPqsPgzqAhoadDyYj25iXssxNDiKGlDLdKnUnFZzEuwoBRS9n1lrDv78QuIxNNgjS
	L6b2ttC2Jv0cXeAOuppEaOlJcVCIjQjbXSFF6mRCyb0n2NpKNXgUJHpqG0bFRHCYxe9W
	T8FyM4cKKNKNfjAJJ3P9z+vh1OR9X0bS5nkh1FGHMzcl43zxlhiw6lgJHOVr/ESxXjGd
	F+owi8nxbIS6VuFXrtWecv73TjzOWtagVudJ97+cytHkEdg0u3im8HS62lNs+fTrSgWL
	038A==
MIME-Version: 1.0
Received: by 10.152.124.76 with SMTP id mg12mr14022210lab.10.1345471119619;
	Mon, 20 Aug 2012 06:58:39 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Mon, 20 Aug 2012 06:58:39 -0700 (PDT)
In-Reply-To: <20120816021411.GE4171@truffula.fritz.box>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
	<1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
	<20120810134245.GC14122@stefanha-thinkpad.localdomain>
	<CAEgOgz7OwHJgKhgm=5VH9UomOr09XOQbDy5OgZx4DqnNj559gQ@mail.gmail.com>
	<CAJSP0QXonD5WYkgAaqO-BeLaJEVoFOPDOajLWerxkrbKdECUkQ@mail.gmail.com>
	<20120815134156.GD10742@stefanha-thinkpad.localdomain>
	<20120816021411.GE4171@truffula.fritz.box>
Date: Mon, 20 Aug 2012 14:58:39 +0100
Message-ID: <CAJSP0QUoH0nwyCE+U9b1Ua3oDDKE+nx5h7qS8Lr_TEp=rzHmWA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Jon Loeliger <jdl@jdl.com>,
	qemu-trivial@nongnu.org, agraf@suse.de, qemu-devel@nongnu.org, 
	Peter Crosthwaite <peter.crosthwaite@petalogix.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
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
X-List-Received-Date: Mon, 20 Aug 2012 13:58:50 -0000

On Thu, Aug 16, 2012 at 3:14 AM, David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Wed, Aug 15, 2012 at 02:41:56PM +0100, Stefan Hajnoczi wrote:
>> On Sat, Aug 11, 2012 at 01:33:42PM +0100, Stefan Hajnoczi wrote:
>> > On Sat, Aug 11, 2012 at 12:11 AM, Peter Crosthwaite
>> > <peter.crosthwaite@petalogix.com> wrote:
>> > > On Fri, Aug 10, 2012 at 11:42 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> > >> On Fri, Aug 10, 2012 at 01:54:26PM +1000, Peter A. G. Crosthwaite wrote:
>> > >>> The sizep arg is populated with the size of the loaded device tree. Since this
>> > >>> is one of those informational "please populate" type arguments it should be
>> > >>> optional. Guarded writes to *sizep against NULL accordingly.
>> > >>>
>> > >>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
>> > >>> Acked-by: Alexander Graf <agraf@suse.de>
>> > >>> ---
>> > >>>  device_tree.c |    8 ++++++--
>> > >>>  1 files changed, 6 insertions(+), 2 deletions(-)
>> > >>>
>> > >>> diff --git a/device_tree.c b/device_tree.c
>> > >>> index d7a9b6b..641a48a 100644
>> > >>> --- a/device_tree.c
>> > >>> +++ b/device_tree.c
>> > >>> @@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>> > >>>      int ret;
>> > >>>      void *fdt = NULL;
>> > >>>
>> > >>> -    *sizep = 0;
>> > >>> +    if (sizep) {
>> > >>> +        *sizep = 0;
>> > >>> +    }
>> > >>>      dt_size = get_image_size(filename_path);
>> > >>>      if (dt_size < 0) {
>> > >>>          printf("Unable to get size of device tree file '%s'\n",
>> > >>> @@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>> > >>>              filename_path);
>> > >>>          goto fail;
>> > >>>      }
>> > >>> -    *sizep = dt_size;
>> > >>> +    if (sizep) {
>> > >>> +        *sizep = dt_size;
>> > >>> +    }
>> > >>
>> > >> What can the caller do with this void* buffer without knowing its size?
>> > >>
>> > >
>> > > Sanity check the machine:
>> > >
>> > > dtb = load_device_tree( ... ); //dont care how big it is
>> > > foo = fdt_gep_prop( dtb, ... );
>> > > if (foo != object_get_prop(foo_device, foo_prop, ... )) {
>> > >     hw_error("your dtb is bad because ... !\n", ... );
>> > > }
>> >
>> > What happens if the fdt is corrupt or malicious?  I guess we'll access
>> > memory beyond the end of blob.
>> >
>> > This seems to be libfdt's fault.  I didn't see an API to validate the
>> > blob's size.
>> >
>> > I'm "happy" with this patch but if fdt's can ever come from untrusted
>> > sources then we're in trouble.
>>
>> Jon/David, can you confirm that libfdt has no way of check the size of
>> the fdt blob?
>
> That's not rentirely true.
>
>> For example, if I pass a corrupt or malicious blob to libfdt, is there a
>> way to detect that or will it access memory beyond the end of the blob
>> as we query the device tree?
>
> So, libfdt does trust the blob size that's given in the blob header,
> since libfdt itself doesn't really have any other source for the
> blob/buffer size.  If you have another source for your buffer size
> though, you can check that quite easily against fdt_totalsize(blob)
> (which returns the header value).  If you can think of a helper
> function that would make this easier, I'd be happy to add it to
> libfdt.
>
> Once the header size is validated, though, libfdt *is* supposed to be
> safe against a corrupt or malicious blob.  I can't guarantee that we
> don't have bugs here, but any crash on malicious data I do consider a
> bug and will fix once I'm aware of it.

David:

fdt_check_header() does not check off_dt_struct, off_dt_strings,
off_mem_rsvmap, size_dt_strings, size_dt_struct against the blob size.
 For example, fdt_get_mem_rsv() will access out-of-bounds memory if
off_mem_rsvmap is invalid.  Or another example, fdt_offset_ptr() does
bounds checking on offset + len but only against the size_dt_struct
header field, which was never checked against the blob size.

Having the user check fdt_totalsize(blob) is not enough.  libfdt
itself needs to use the blob's external size to validate the fdt
header.  Something like:

/**
 * fdt_check_header_size - sanity check a device tree's size
 * @fdt: pointer to a flattened device tree
 * @size: fdt size in bytes
 *
 * fdt_check_header_size() checks that the given flattened
 * device tree header describes a data layout that fits within
 * the given size limit.  Use this to check untrusted fdt input
 * immediately after calling fdt_check_header() and before calling
 * other functions.
 *
 * returns:
 *     0, if the fdt fits within the given size limit
 *     -FDT_ERR_NOSPACE, fdt would exceed given size
 *     -FDT_ERR_BADMAGIC,
 *     -FDT_ERR_BADVERSION, standard meanings
 */
int fdt_check_blob_size(const void *fdt, size_t size);

Also, fdt_string() documentation says the function returns NULL if
stroffset is out of bounds.  The implementation does not check and
will return an out-of-bounds pointer.

Peter:

When libfdt adds the fdt_check_block_size() function then the QEMU
patch is no longer useful since the header size should be validate
(this requires a non-NULL size argument).  I suggest we drop the
patch.

Stefan

