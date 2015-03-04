Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGP2-0007Sf-TZ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:00:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YTGP1-0007Rd-83
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:00:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YTGOw-00066r-IP
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:00:23 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:44003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YTGOw-00066k-9O
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:00:18 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0069311810A5; Wed,  4 Mar 2015 22:00:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 5OZKypi6Olze; Wed,  4 Mar 2015 22:00:04 +0100 (CET)
Received: from [192.168.178.24] (p54ACA451.dip0.t-ipconnect.de [84.172.164.81])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	DFE781180040; Wed,  4 Mar 2015 22:00:03 +0100 (CET)
Message-ID: <54F77253.5070607@weilnetz.de>
Date: Wed, 04 Mar 2015 22:00:03 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-3-git-send-email-sw@weilnetz.de>
	<20150304124414.GE2530@work-vm>
In-Reply-To: <20150304124414.GE2530@work-vm>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] migration: Fix some 32
 bit compiler errors
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
X-List-Received-Date: Wed, 04 Mar 2015 21:00:24 -0000

Am 04.03.2015 um 13:44 schrieb Dr. David Alan Gilbert:
> * Stefan Weil (sw@weilnetz.de) wrote:
>> The current code won't compile on 32 bit hosts because there are lots
>> of type casts between pointers and 64 bit integers.
>>
>> Fix some of them.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Please route rdma stuff through migration, not -trivial; it's never
> trivial to read this code.

IMHO the modifications here are trivial transformations, but I agree 
that other people might have a different view. Patch 3 is less trivial 
(as I wrote in my initial mail).

>
>> ---
>>   migration/rdma.c |   23 +++++++++++------------
>>   1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 67c5701..1512460 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -1104,7 +1104,7 @@ static int qemu_rdma_search_ram_block(RDMAContext *rdma,
>>    * to perform the actual RDMA operation.
>>    */
>>   static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
>> -        RDMALocalBlock *block, uint8_t *host_addr,
>> +        RDMALocalBlock *block, uintptr_t host_addr,
>>           uint32_t *lkey, uint32_t *rkey, int chunk,
>>           uint8_t *chunk_start, uint8_t *chunk_end)
> OK, so 'host_addr' seems to only be used in this function to print debug,
> so that should be harmless.
>
>>   {
>> @@ -1141,11 +1141,12 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
>>           if (!block->pmr[chunk]) {
>>               perror("Failed to register chunk!");
>>               fprintf(stderr, "Chunk details: block: %d chunk index %d"
>> -                            " start %" PRIu64 " end %" PRIu64 " host %" PRIu64
>> -                            " local %" PRIu64 " registrations: %d\n",
>> -                            block->index, chunk, (uint64_t) chunk_start,
>> -                            (uint64_t) chunk_end, (uint64_t) host_addr,
>> -                            (uint64_t) block->local_host_addr,
>> +                            " start %" PRIuPTR " end %" PRIuPTR
>> +                            " host %" PRIuPTR
>> +                            " local %" PRIuPTR " registrations: %d\n",
>> +                            block->index, chunk, (uintptr_t)chunk_start,
>> +                            (uintptr_t)chunk_end, host_addr,
>> +                            (uintptr_t)block->local_host_addr,
> OK, although is there any reason not to use %p for most of those?

The output of %p depends on the host's pointer size and is in hex. I 
don't know why the original author had chosen to show these values as 
integers.

>
>>                               rdma->total_registrations);
>>               return -1;
>>           }
>> @@ -1932,8 +1933,7 @@ retry:
>>               }
>>   
>>               /* try to overlap this single registration with the one we sent. */
>> -            if (qemu_rdma_register_and_get_keys(rdma, block,
>> -                                                (uint8_t *) sge.addr,
>> +            if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
>>                                                   &sge.lkey, NULL, chunk,
>>                                                   chunk_start, chunk_end)) {
> sge.addr comes from /usr/include/infiniband/verbs.h for me:
>
> struct ibv_sge {
>          uint64_t                addr;
>          uint32_t                length;
>          uint32_t                lkey;
> };
>
> and that's the same on both 32 bit and 64 bit hosts (Fedora 21).
> I'm confused about why this helps you build 32 bit, since that uint64_t gets
> passed to your host_addr that's now a unitptr_t that will be 32bit.

That works because conversions between 32 and 64 bit values are no 
problem for the compiler (but maybe for the user when precision gets 
lost). IMHO it's surprising that the API in verbs.h uses uint64_t 
instead of uintptr_t for pointer values, but that's a different question.

Regards
Stefan


