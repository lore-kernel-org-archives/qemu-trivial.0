Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xnmoh-0003Ao-2t
	for mharc-qemu-trivial@gnu.org; Mon, 10 Nov 2014 06:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xnmob-00033p-RH
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 06:07:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xnmob-0005gy-1O
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 06:07:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XnmoT-0005aU-LQ; Mon, 10 Nov 2014 06:07:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAAB7C2J021997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 10 Nov 2014 06:07:13 -0500
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
	[10.36.116.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAAB7Adk025927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 10 Nov 2014 06:07:11 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8094730403AF; Mon, 10 Nov 2014 12:07:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Max Reitz <mreitz@redhat.com>
References: <1415610638-3918-1-git-send-email-famz@redhat.com>
	<5460924C.7040308@redhat.com>
Date: Mon, 10 Nov 2014 12:07:09 +0100
In-Reply-To: <5460924C.7040308@redhat.com> (Max Reitz's message of "Mon, 10
	Nov 2014 11:24:12 +0100")
Message-ID: <87wq73s49u.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, Fam Zheng <famz@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Fix comment for
	bdrv_co_get_block_status
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
X-List-Received-Date: Mon, 10 Nov 2014 11:07:22 -0000

Max Reitz <mreitz@redhat.com> writes:

> On 2014-11-10 at 10:10, Fam Zheng wrote:
>> It returns more information than binary, fix the comment.
>>
>> Signed-off-by: Fam Zheng <famz@redhat.com>
>> ---
>>   block.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index dacd881..42c914e 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3903,9 +3903,9 @@ typedef struct BdrvCoGetBlockStatusData {
>>   } BdrvCoGetBlockStatusData;
>>     /*
>> - * Returns true iff the specified sector is present in the disk image. Drivers
>> - * not implementing the functionality are assumed to not support backing files,
>> - * hence all their sectors are reported as allocated.
>> + * Returns the status of the specified sectors. Drivers not implementing the
>> + * functionality are assumed to not support backing files, hence all their
>> + * sectors are reported as allocated.
>>    *
>>    * If 'sector_num' is beyond the end of the disk image the return value is 0
>>    * and 'pnum' is set to 0.
>
> "status" is a bit broad, but pointing to "line 86 in
> include/block/block.h" for a further explanation will probably not be
> very stable.
>
> Reviewed-by: Max Reitz <mreitz@redhat.com>

Could perhaps call it "allocation status", and squash in something like

diff --git a/include/block/block.h b/include/block/block.h
index 13e4537..5450610 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -83,7 +83,9 @@ typedef enum {
 #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
 #define BDRV_SECTOR_MASK   ~(BDRV_SECTOR_SIZE - 1)
 
-/* BDRV_BLOCK_DATA: data is read from bs->file or another file
+/*
+ * Allocation status flags
+ * BDRV_BLOCK_DATA: data is read from bs->file or another file
  * BDRV_BLOCK_ZERO: sectors read as zero
  * BDRV_BLOCK_OFFSET_VALID: sector stored in bs->file as raw data
  * BDRV_BLOCK_ALLOCATED: the content of the block is determined by this

Anyway, it's an improvement already, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>

