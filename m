Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGAQ-0000PR-5a
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:45:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YTGAN-0000Lq-8T
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:45:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YTGAH-00011w-Mb
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:45:15 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:43875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YTGAH-00011a-AA
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:45:09 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	42FD111810A6; Wed,  4 Mar 2015 21:45:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id djgYKOfjrSa8; Wed,  4 Mar 2015 21:45:03 +0100 (CET)
Received: from [192.168.178.24] (p54ACA451.dip0.t-ipconnect.de [84.172.164.81])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	AD80B11810A5; Wed,  4 Mar 2015 21:45:02 +0100 (CET)
Message-ID: <54F76ECE.5050205@weilnetz.de>
Date: Wed, 04 Mar 2015 21:45:02 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-4-git-send-email-sw@weilnetz.de>
	<20150304133120.GG2530@work-vm>
In-Reply-To: <20150304133120.GG2530@work-vm>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] migration: Fix
 remaining 32 bit compiler errors
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
X-List-Received-Date: Wed, 04 Mar 2015 20:45:16 -0000

Please see my comments below.

Am 04.03.2015 um 14:31 schrieb Dr. David Alan Gilbert:
> * Stefan Weil (sw@weilnetz.de) wrote:
>> Fix type casts between pointers and 64 bit integers.
>> Now 32 bit builds are possible again.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   migration/rdma.c |   57 +++++++++++++++++++++++++++++-------------------------
>>   1 file changed, 31 insertions(+), 26 deletions(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 1512460..a68f1f1 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -493,8 +493,8 @@ static inline uint64_t ram_chunk_index(const uint8_t *start,
>>   static inline uint8_t *ram_chunk_start(const RDMALocalBlock *rdma_ram_block,
>>                                          uint64_t i)
>>   {
>> -    return (uint8_t *) (((uintptr_t) rdma_ram_block->local_host_addr)
>> -                                    + (i << RDMA_REG_CHUNK_SHIFT));
>> +    return (uint8_t *)(uintptr_t)(rdma_ram_block->local_host_addr +
>> +                                  (i << RDMA_REG_CHUNK_SHIFT));
>>   }
>>   
>>   static inline uint8_t *ram_chunk_end(const RDMALocalBlock *rdma_ram_block,
>> @@ -515,7 +515,7 @@ static int __qemu_rdma_add_block(RDMAContext *rdma, void *host_addr,
>>   {
> This will clash with my 'unbreak dtrace tracing due to double _ in rdma names' that's
> going through Stefan's tree.

Then this part will have to wait until Stefan's tree was applied.

>
>>       RDMALocalBlocks *local = &rdma->local_ram_blocks;
>>       RDMALocalBlock *block = g_hash_table_lookup(rdma->blockmap,
>> -        (void *) block_offset);
>> +        (void *)(uintptr_t)block_offset);
>>       RDMALocalBlock *old = local->block;
>
>>   
>>       assert(block == NULL);
>> @@ -526,9 +526,11 @@ static int __qemu_rdma_add_block(RDMAContext *rdma, void *host_addr,
>>           int x;
>>   
>>           for (x = 0; x < local->nb_blocks; x++) {
>> -            g_hash_table_remove(rdma->blockmap, (void *)old[x].offset);
>> -            g_hash_table_insert(rdma->blockmap, (void *)old[x].offset,
>> -                                                &local->block[x]);
>> +            g_hash_table_remove(rdma->blockmap,
>> +                                (void *)(uintptr_t)old[x].offset);
>> +            g_hash_table_insert(rdma->blockmap,
>> +                                (void *)(uintptr_t)old[x].offset,
>> +                                &local->block[x]);
>>           }
>>           memcpy(local->block, old, sizeof(RDMALocalBlock) * local->nb_blocks);
>>           g_free(old);
>> @@ -549,12 +551,12 @@ static int __qemu_rdma_add_block(RDMAContext *rdma, void *host_addr,
>>   
>>       block->is_ram_block = local->init ? false : true;
>>   
>> -    g_hash_table_insert(rdma->blockmap, (void *) block_offset, block);
>> +    g_hash_table_insert(rdma->blockmap, (void *)(uintptr_t)block_offset, block);
>>   
>>       trace___qemu_rdma_add_block(local->nb_blocks,
>> -                           (uint64_t) block->local_host_addr, block->offset,
>> +                           (uintptr_t)block->local_host_addr, block->offset,
>>                              block->length,
>> -                           (uint64_t) (block->local_host_addr + block->length),
>> +                           (uintptr_t)(block->local_host_addr + block->length),
>>                              BITS_TO_LONGS(block->nb_chunks) *
>>                                  sizeof(unsigned long) * 8,
>>                              block->nb_chunks);
>> @@ -595,7 +597,7 @@ static int qemu_rdma_init_ram_blocks(RDMAContext *rdma)
>>       return 0;
>>   }
>>   
>> -static int __qemu_rdma_delete_block(RDMAContext *rdma, ram_addr_t block_offset)
>> +static int __qemu_rdma_delete_block(RDMAContext *rdma, uintptr_t block_offset)
>>   {
>>       RDMALocalBlocks *local = &rdma->local_ram_blocks;
>>       RDMALocalBlock *block = g_hash_table_lookup(rdma->blockmap,
>> @@ -635,7 +637,7 @@ static int __qemu_rdma_delete_block(RDMAContext *rdma, ram_addr_t block_offset)
>>       block->remote_keys = NULL;
>>   
>>       for (x = 0; x < local->nb_blocks; x++) {
>> -        g_hash_table_remove(rdma->blockmap, (void *)old[x].offset);
>> +        g_hash_table_remove(rdma->blockmap, (void *)(uintptr_t)old[x].offset);
>>       }
>>   
>>       if (local->nb_blocks > 1) {
>> @@ -658,9 +660,9 @@ static int __qemu_rdma_delete_block(RDMAContext *rdma, ram_addr_t block_offset)
>>       }
>>   
>>       trace___qemu_rdma_delete_block(local->nb_blocks,
>> -                           (uint64_t)block->local_host_addr,
>> +                           (uintptr_t)block->local_host_addr,
>>                              block->offset, block->length,
>> -                           (uint64_t)(block->local_host_addr + block->length),
>> +                           (uintptr_t)(block->local_host_addr + block->length),
>>                              BITS_TO_LONGS(block->nb_chunks) *
>>                                  sizeof(unsigned long) * 8, block->nb_chunks);
>>   
>> @@ -670,8 +672,9 @@ static int __qemu_rdma_delete_block(RDMAContext *rdma, ram_addr_t block_offset)
>>   
>>       if (local->nb_blocks) {
>>           for (x = 0; x < local->nb_blocks; x++) {
>> -            g_hash_table_insert(rdma->blockmap, (void *)local->block[x].offset,
>> -                                                &local->block[x]);
>> +            g_hash_table_insert(rdma->blockmap,
>> +                                (void *)(uintptr_t)local->block[x].offset,
>> +                                &local->block[x]);
>>           }
>>       }
>>   
>> @@ -1076,7 +1079,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>>    * This search cannot fail or the migration will fail.
>>    */
>>   static int qemu_rdma_search_ram_block(RDMAContext *rdma,
>> -                                      uint64_t block_offset,
>> +                                      uintptr_t block_offset,
>>                                         uint64_t offset,
>>                                         uint64_t length,
>>                                         uint64_t *block_index,
>> @@ -1380,8 +1383,8 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
>>           RDMALocalBlock *block = &(rdma->local_ram_blocks.block[index]);
>>   
>>           trace_qemu_rdma_poll_write(print_wrid(wr_id), wr_id, rdma->nb_sent,
>> -                 index, chunk,
>> -                 block->local_host_addr, (void *)block->remote_host_addr);
>> +                                   index, chunk, block->local_host_addr,
>> +                                   (void *)(uintptr_t)block->remote_host_addr);
> I think that's the wrong fix there; remote_host_addr is actually 64bit because
> even if this host is 32bit the other end might be 64bit; I think the right
> fix is to change the trace to use a uint64_t for the remote_host_addr.

That depends on the kind of output which is wanted.

We can either use %p for pointers, then the output will depend on the 
host's pointer size.
Or we can use %16 PRIu64, then the output will always show 16 digits 
(with at least 8
leading zeros on 32 bit hosts).

>
>>           clear_bit(chunk, block->transit_bitmap);
>>   
>> @@ -1524,7 +1527,7 @@ static int qemu_rdma_post_send_control(RDMAContext *rdma, uint8_t *buf,
>>       RDMAWorkRequestData *wr = &rdma->wr_data[RDMA_WRID_CONTROL];
>>       struct ibv_send_wr *bad_wr;
>>       struct ibv_sge sge = {
>> -                           .addr = (uint64_t)(wr->control),
>> +                           .addr = (uintptr_t)(wr->control),
> No, as before, my belief is that the .addr is a uint64_t.

Yes, because wr->control is a pointer which you want to convert to an 
integer value.
C allows assignments from 32 bit integers to 64 bit integers - the 
compiler will add the
necessary 0 bits.

>
> (Although curiously I did a test and found that gcc lets me pass a uint64_t
> to a function that has a uintptr_t parameter on a 32bit machine, but I don't
> understand why.)
>
> Dave
>
>>                              .length = head->len + sizeof(RDMAControlHeader),
>>                              .lkey = wr->control_mr->lkey,
>>                            };
>> @@ -1578,7 +1581,7 @@ static int qemu_rdma_post_recv_control(RDMAContext *rdma, int idx)
>>   {
>>       struct ibv_recv_wr *bad_wr;
>>       struct ibv_sge sge = {
>> -                            .addr = (uint64_t)(rdma->wr_data[idx].control),
>> +                            .addr = (uintptr_t)(rdma->wr_data[idx].control),
>>                               .length = RDMA_CONTROL_MAX_BUFFER,
>>                               .lkey = rdma->wr_data[idx].control_mr->lkey,
>>                            };
>> @@ -1825,11 +1828,12 @@ static int qemu_rdma_write_one(QEMUFile *f, RDMAContext *rdma,
>>                                };
>>   
>>   retry:
>> -    sge.addr = (uint64_t)(block->local_host_addr +
>> +    sge.addr = (uintptr_t)(block->local_host_addr +
>>                               (current_addr - block->offset));
>>       sge.length = length;
>>   
>> -    chunk = ram_chunk_index(block->local_host_addr, (uint8_t *) sge.addr);
>> +    chunk = ram_chunk_index(block->local_host_addr,
>> +                            (uint8_t *)(uintptr_t)sge.addr);
>>       chunk_start = ram_chunk_start(block, chunk);
>>   
>>       if (block->is_ram_block) {
>> @@ -1882,8 +1886,9 @@ retry:
>>                * memset() + madvise() the entire chunk without RDMA.
>>                */
>>   
>> -            if (can_use_buffer_find_nonzero_offset((void *)sge.addr, length)
>> -                   && buffer_find_nonzero_offset((void *)sge.addr,
>> +            if (can_use_buffer_find_nonzero_offset((void *)(uintptr_t)sge.addr,
>> +                                                   length)
>> +                   && buffer_find_nonzero_offset((void *)(uintptr_t)sge.addr,
>>                                                       length) == length) {
>>                   RDMACompress comp = {
>>                                           .offset = current_addr,
>> @@ -2978,7 +2983,7 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque,
>>                */
>>               for (i = 0; i < local->nb_blocks; i++) {
>>                   rdma->block[i].remote_host_addr =
>> -                    (uint64_t)(local->block[i].local_host_addr);
>> +                    (uintptr_t)(local->block[i].local_host_addr);
>>   
>>                   if (rdma->pin_all) {
>>                       rdma->block[i].remote_rkey = local->block[i].mr->rkey;
>> @@ -3042,7 +3047,7 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque,
>>                       goto out;
>>                   }
>>   
>> -                reg_result->host_addr = (uint64_t) block->local_host_addr;
>> +                reg_result->host_addr = (uintptr_t)block->local_host_addr;
>>   
>>                   trace_qemu_rdma_registration_handle_register_rkey(
>>                                                              reg_result->rkey);
>> -- 
>> 1.7.10.4
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


