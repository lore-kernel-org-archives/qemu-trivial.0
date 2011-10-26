Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJA2x-0005oq-5y
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 16:25:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RJA2t-0005et-Pz
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 16:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RJA2s-0001LH-IL
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 16:25:55 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RJA2p-0001KB-0v; Wed, 26 Oct 2011 16:25:51 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D23907283498; Wed, 26 Oct 2011 22:25:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id I4UlJBkIalOU; Wed, 26 Oct 2011 22:25:19 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADA04C.dip.t-dialin.net [84.173.160.76])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	542F57283499; Wed, 26 Oct 2011 22:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RJA1w-0001bQ-Ml; Wed, 26 Oct 2011 22:24:56 +0200
Message-ID: <4EA86C98.8040303@weilnetz.de>
Date: Wed, 26 Oct 2011 22:24:56 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Eric Sunshine <sunshine@sunshineco.com>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
In-Reply-To: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Teach block/vdi about
 "discarded" (no longer allocated) blocks
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
X-List-Received-Date: Wed, 26 Oct 2011 20:25:57 -0000

Thank you for this extension. I have several remarks - see below.

Am 26.10.2011 21:51, schrieb Eric Sunshine:
> An entry in the VDI block map will hold an offset to the actual block if
> the block is allocated, or one of two specially-interpreted values if
> not allocated. Using VirtualBox terminology, value VDI_IMAGE_BLOCK_FREE
> (0xffffffff) represents a never-allocated block (semantically arbitrary
> content). VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
> block (semantically zero-filled). block/vdi knows only about
> VDI_IMAGE_BLOCK_FREE. Teach it about VDI_IMAGE_BLOCK_ZERO.
>
> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
> ---
>
> Without this patch, "qemu-image check" on a VDI image containing
> discarded blocks reports errors such as:
>
> ERROR: block index 3434 too large, is 4294967294
>
> Decimal 4294967294 is 0xfffffffe. Worse, "qemu-image convert" or direct
> access of the VDI image from qemu involves reads and writes of blocks at
> the bogus block offset 4294967294 within the image file.
>
> Cc: Stefan Weil <weil@mail.berlios.de>
> Cc: Kevin Wolf <kwolf@redhat.com>
>
> block/vdi.c | 23 ++++++++++++++---------
> 1 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/block/vdi.c b/block/vdi.c
> index 883046d..25790c4 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -114,8 +114,13 @@ void uuid_unparse(const uuid_t uu, char *out);
> */
> #define VDI_TEXT "<<< QEMU VM Virtual Disk Image >>>\n"
>
> -/* Unallocated blocks use this index (no need to convert endianness). */
> -#define VDI_UNALLOCATED UINT32_MAX
> +/* A never-allocated block; semantically arbitrary content. */
> +#define VDI_UNALLOCATED ((uint32_t)~0)

Why did you change the definition of VDI_UNALLOCATED?
Or do you get a difference with the old definition?

It's ok to change the comment, but you missed an important point 
(endianness).

> +
> +/* A discarded (no longer allocated) block; semantically zero-filled. */
> +#define VDI_DISCARDED ((uint32_t)~1)

The type cast is not needed. Please use

#define VDI_DISCARD (VDI_UNALLOCATED - 1)

> +
> +#define VDI_IS_ALLOCATED(X) ((X) < VDI_DISCARDED)
>
> #if !defined(CONFIG_UUID)
> void uuid_generate(uuid_t out)
> @@ -307,10 +312,10 @@ static int vdi_check(BlockDriverState *bs, 
> BdrvCheckResult *res)
> /* Check block map and value of blocks_allocated. */
> for (block = 0; block < s->header.blocks_in_image; block++) {
> uint32_t bmap_entry = le32_to_cpu(s->bmap[block]);
> - if (bmap_entry != VDI_UNALLOCATED) {
> + if (VDI_IS_ALLOCATED(bmap_entry)) {
> if (bmap_entry < s->header.blocks_in_image) {
> blocks_allocated++;
> - if (bmap[bmap_entry] == VDI_UNALLOCATED) {
> + if (!VDI_IS_ALLOCATED(bmap[bmap_entry])) {
> bmap[bmap_entry] = bmap_entry;
> } else {
> fprintf(stderr, "ERROR: block index %" PRIu32
> @@ -472,7 +477,7 @@ static int vdi_is_allocated(BlockDriverState *bs, 
> int64_t sector_num,
> n_sectors = nb_sectors;
> }
> *pnum = n_sectors;
> - return bmap_entry != VDI_UNALLOCATED;
> + return VDI_IS_ALLOCATED(bmap_entry);
> }
>
> static void vdi_aio_cancel(BlockDriverAIOCB *blockacb)
> @@ -603,7 +608,7 @@ static void vdi_aio_read_cb(void *opaque, int ret)
> /* prepare next AIO request */
> acb->n_sectors = n_sectors;
> bmap_entry = le32_to_cpu(s->bmap[block_index]);
> - if (bmap_entry == VDI_UNALLOCATED) {
> + if (!VDI_IS_ALLOCATED(bmap_entry)) {
> /* Block not allocated, return zeros, no need to wait. */
> memset(acb->buf, 0, n_sectors * SECTOR_SIZE);
> ret = vdi_schedule_bh(vdi_aio_rw_bh, acb);
> @@ -685,7 +690,7 @@ static void vdi_aio_write_cb(void *opaque, int ret)
> if (acb->header_modified) {
> VdiHeader *header = acb->block_buffer;
> logout("now writing modified header\n");
> - assert(acb->bmap_first != VDI_UNALLOCATED);
> + assert(VDI_IS_ALLOCATED(acb->bmap_first));
> *header = s->header;
> vdi_header_to_le(header);
> acb->header_modified = 0;
> @@ -699,7 +704,7 @@ static void vdi_aio_write_cb(void *opaque, int ret)
> goto done;
> }
> return;
> - } else if (acb->bmap_first != VDI_UNALLOCATED) {
> + } else if (VDI_IS_ALLOCATED(acb->bmap_first)) {
> /* One or more new blocks were allocated. */
> uint64_t offset;
> uint32_t bmap_first;
> @@ -749,7 +754,7 @@ static void vdi_aio_write_cb(void *opaque, int ret)
> /* prepare next AIO request */
> acb->n_sectors = n_sectors;
> bmap_entry = le32_to_cpu(s->bmap[block_index]);
> - if (bmap_entry == VDI_UNALLOCATED) {
> + if (!VDI_IS_ALLOCATED(bmap_entry)) {
> /* Allocate new block and write to it. */
> uint64_t offset;
> uint8_t *block;


Did you test your code for big endian hosts?
While 0xffffffff does not change with the endianness, 0xfffffffe does.

Kind regards,
Stefan Weil


