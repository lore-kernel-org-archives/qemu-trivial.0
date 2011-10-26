Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJAUu-0007pz-Kq
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 16:54:52 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJAUq-0007bF-Jz
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 16:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJAUp-0008BB-BW
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 16:54:48 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:40107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>)
	id 1RJAUm-0008A2-CY; Wed, 26 Oct 2011 16:54:44 -0400
Received: by qyk10 with SMTP id 10so7741003qyk.4
	for <multiple recipients>; Wed, 26 Oct 2011 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:in-reply-to:subject:references:message-id
	:content-type:content-transfer-encoding:mime-version:date:cc
	:x-mailer; bh=pkMp86lnjq4MWn3DBdVTEbctlcdNkel9DHiS00FiY+g=;
	b=f3L/0mEgOAYZg+tJmUObEvsTTR4h1MhK81OqNgi4PU6Twf5oXkQmcrVfDpricqyvH8
	3qxKVo0GHT/WMVbXa0xtuTkfBF50Qao0qu6uVnm6kU8/o8SBP8yZDyYPvLUCqU9o5fi2
	4UqtcAPGBcSvStHBkR9WJLdQYMwsdFV10tDTY=
Received: by 10.229.251.73 with SMTP id mr9mr6948919qcb.264.1319662483419;
	Wed, 26 Oct 2011 13:54:43 -0700 (PDT)
Received: from [192.168.1.2] (user-0c936tj.cable.mindspring.com.
	[24.145.155.179])
	by mx.google.com with ESMTPS id bh18sm4022993qab.8.2011.10.26.13.54.41
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 13:54:42 -0700 (PDT)
Sender: Eric Sunshine <ericsunshine@gmail.com>
From: Eric Sunshine <sunshine@sunshineco.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <4EA86C98.8040303@weilnetz.de>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
	<4EA86C98.8040303@weilnetz.de>
Message-Id: <BA21F324-38EF-4DB7-8137-783E4DC33441@sunshineco.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 26 Oct 2011 16:54:40 -0400
X-Mailer: Apple Mail (2.936)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
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
X-List-Received-Date: Wed, 26 Oct 2011 20:54:50 -0000

On Oct 26, 2011, at 4:24 PM, Stefan Weil wrote:
> Thank you for this extension. I have several remarks - see below.
>
> Am 26.10.2011 21:51, schrieb Eric Sunshine:
>> An entry in the VDI block map will hold an offset to the actual  
>> block if
>> the block is allocated, or one of two specially-interpreted values if
>> not allocated. Using VirtualBox terminology, value  
>> VDI_IMAGE_BLOCK_FREE
>> (0xffffffff) represents a never-allocated block (semantically  
>> arbitrary
>> content). VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
>> block (semantically zero-filled). block/vdi knows only about
>> VDI_IMAGE_BLOCK_FREE. Teach it about VDI_IMAGE_BLOCK_ZERO.
>>
>> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
>> ---
>>
>> Without this patch, "qemu-image check" on a VDI image containing
>> discarded blocks reports errors such as:
>>
>> ERROR: block index 3434 too large, is 4294967294
>>
>> Decimal 4294967294 is 0xfffffffe. Worse, "qemu-image convert" or  
>> direct
>> access of the VDI image from qemu involves reads and writes of  
>> blocks at
>> the bogus block offset 4294967294 within the image file.
>>
>> Cc: Stefan Weil <weil@mail.berlios.de>
>> Cc: Kevin Wolf <kwolf@redhat.com>
>>
>> block/vdi.c | 23 ++++++++++++++---------
>> 1 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/block/vdi.c b/block/vdi.c
>> index 883046d..25790c4 100644
>> --- a/block/vdi.c
>> +++ b/block/vdi.c
>> @@ -114,8 +114,13 @@ void uuid_unparse(const uuid_t uu, char *out);
>> */
>> #define VDI_TEXT "<<< QEMU VM Virtual Disk Image >>>\n"
>>
>> -/* Unallocated blocks use this index (no need to convert  
>> endianness). */
>> -#define VDI_UNALLOCATED UINT32_MAX
>> +/* A never-allocated block; semantically arbitrary content. */
>> +#define VDI_UNALLOCATED ((uint32_t)~0)
>
> Why did you change the definition of VDI_UNALLOCATED?
> Or do you get a difference with the old definition?

My hope was that future readers of the code might find it easier to  
assimilate if it used the same notation "(uint32_t)~0" as the  
VirtualBox source code (which also is the most accurate documentation  
of the VDI format). I don't have particularly strong feelings about it  
and can re-roll using UINT32_MAX if you prefer.

> It's ok to change the comment, but you missed an important point  
> (endianness).

The removal of the comment was intentional because it was ambiguous  
and confusing rather than illuminating. Specifically, it does not  
explain if this is a case of programmer laziness (0xffffffff being the  
same on big- and little-endian) or if code employing VDI_UNALLOCATED  
applies proper endian conversions. Had the comment indicated that  
VDI_UNALLOCATED is only ever employed with host-endian values (which  
is the case), then that would have been worth retaining. I can re-roll  
with a clearer comment but would be sorry to see the confusing comment  
retained.

>> +
>> +/* A discarded (no longer allocated) block; semantically zero- 
>> filled. */
>> +#define VDI_DISCARDED ((uint32_t)~1)
>
> The type cast is not needed. Please use
>
> #define VDI_DISCARD (VDI_UNALLOCATED - 1)
>
>> +
>> +#define VDI_IS_ALLOCATED(X) ((X) < VDI_DISCARDED)
>>
>> #if !defined(CONFIG_UUID)
>> void uuid_generate(uuid_t out)
>> @@ -307,10 +312,10 @@ static int vdi_check(BlockDriverState *bs,  
>> BdrvCheckResult *res)
>> /* Check block map and value of blocks_allocated. */
>> for (block = 0; block < s->header.blocks_in_image; block++) {
>> uint32_t bmap_entry = le32_to_cpu(s->bmap[block]);
>> - if (bmap_entry != VDI_UNALLOCATED) {
>> + if (VDI_IS_ALLOCATED(bmap_entry)) {
>> if (bmap_entry < s->header.blocks_in_image) {
>> blocks_allocated++;
>> - if (bmap[bmap_entry] == VDI_UNALLOCATED) {
>> + if (!VDI_IS_ALLOCATED(bmap[bmap_entry])) {
>> bmap[bmap_entry] = bmap_entry;
>> } else {
>> fprintf(stderr, "ERROR: block index %" PRIu32
>> @@ -472,7 +477,7 @@ static int vdi_is_allocated(BlockDriverState  
>> *bs, int64_t sector_num,
>> n_sectors = nb_sectors;
>> }
>> *pnum = n_sectors;
>> - return bmap_entry != VDI_UNALLOCATED;
>> + return VDI_IS_ALLOCATED(bmap_entry);
>> }
>>
>> static void vdi_aio_cancel(BlockDriverAIOCB *blockacb)
>> @@ -603,7 +608,7 @@ static void vdi_aio_read_cb(void *opaque, int  
>> ret)
>> /* prepare next AIO request */
>> acb->n_sectors = n_sectors;
>> bmap_entry = le32_to_cpu(s->bmap[block_index]);
>> - if (bmap_entry == VDI_UNALLOCATED) {
>> + if (!VDI_IS_ALLOCATED(bmap_entry)) {
>> /* Block not allocated, return zeros, no need to wait. */
>> memset(acb->buf, 0, n_sectors * SECTOR_SIZE);
>> ret = vdi_schedule_bh(vdi_aio_rw_bh, acb);
>> @@ -685,7 +690,7 @@ static void vdi_aio_write_cb(void *opaque, int  
>> ret)
>> if (acb->header_modified) {
>> VdiHeader *header = acb->block_buffer;
>> logout("now writing modified header\n");
>> - assert(acb->bmap_first != VDI_UNALLOCATED);
>> + assert(VDI_IS_ALLOCATED(acb->bmap_first));
>> *header = s->header;
>> vdi_header_to_le(header);
>> acb->header_modified = 0;
>> @@ -699,7 +704,7 @@ static void vdi_aio_write_cb(void *opaque, int  
>> ret)
>> goto done;
>> }
>> return;
>> - } else if (acb->bmap_first != VDI_UNALLOCATED) {
>> + } else if (VDI_IS_ALLOCATED(acb->bmap_first)) {
>> /* One or more new blocks were allocated. */
>> uint64_t offset;
>> uint32_t bmap_first;
>> @@ -749,7 +754,7 @@ static void vdi_aio_write_cb(void *opaque, int  
>> ret)
>> /* prepare next AIO request */
>> acb->n_sectors = n_sectors;
>> bmap_entry = le32_to_cpu(s->bmap[block_index]);
>> - if (bmap_entry == VDI_UNALLOCATED) {
>> + if (!VDI_IS_ALLOCATED(bmap_entry)) {
>> /* Allocate new block and write to it. */
>> uint64_t offset;
>> uint8_t *block;
>
>
> Did you test your code for big endian hosts?
> While 0xffffffff does not change with the endianness, 0xfffffffe does.

Yes, my work has been done on a big-endian PowerPC iMac G5. I also  
audited the code to ensure that all functionality dealing with  
VDI_UNALLOCATED and VDI_DISCARDED involves only host-endian values,  
hence host-endian ((uint32_t)~0) and ((uint32_t)~1) or UINT32_MAX and  
UINT32_MAX -1 work correctly.

-- ES


