Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9D1k-0007X9-Rg
	for mharc-qemu-trivial@gnu.org; Wed, 16 Dec 2015 09:26:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lszhu@suse.com>) id 1a93uO-0004L2-E2
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 23:41:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lszhu@suse.com>) id 1a93uN-0004Ns-GN
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 23:41:48 -0500
Received: from smtp2.provo.novell.com ([137.65.250.81]:48917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lszhu@suse.com>)
	id 1a93uF-0004Ha-Ee; Tue, 15 Dec 2015 23:41:39 -0500
Received: from [147.2.212.240] (prv-ext-foundry1int.gns.novell.com
	[137.65.251.240])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Tue, 15 Dec 2015 21:41:28 -0700
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <1450150404-20668-1-git-send-email-lszhu@suse.com>
	<567075F8.5090201@redhat.com>
From: Zhu Lingshan <lszhu@suse.com>
Message-ID: <5670EB74.8040808@suse.com>
Date: Wed, 16 Dec 2015 12:41:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <567075F8.5090201@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 137.65.250.81
X-Mailman-Approved-At: Wed, 16 Dec 2015 09:25:58 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com, pl@kamp.de,
	qemu-devel@nongnu.org, ronniesahlberg@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] iscsi: fix readcapacity
	error message
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
X-List-Received-Date: Wed, 16 Dec 2015 04:41:49 -0000

OK, thanks, I have sent the patch again and CC them

On 12/16/2015 04:20 AM, John Snow wrote:
> CC qemu-trivial, I think this can go in through that tree.
>
> On 12/14/2015 10:33 PM, Zhu Lingshan wrote:
>> fix:The error message for readcapacity 16 incorrectly mentioned
>> a readcapacity 10 failure, fixed the error message.
>>
>> Signed-off-by: Zhu Lingshan <lszhu@suse.com>
>> ---
>>   block/iscsi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/iscsi.c b/block/iscsi.c
>> index bd1f1bf..eb28ddc 100644
>> --- a/block/iscsi.c
>> +++ b/block/iscsi.c
>> @@ -1270,7 +1270,7 @@ static void iscsi_readcapacity_sync(IscsiLun *iscsilun, Error **errp)
>>                && retries-- > 0);
>>   
>>       if (task == NULL || task->status != SCSI_STATUS_GOOD) {
>> -        error_setg(errp, "iSCSI: failed to send readcapacity10 command.");
>> +        error_setg(errp, "iSCSI: failed to send readcapacity10/16 command");
>>       } else if (!iscsilun->block_size ||
>>                  iscsilun->block_size % BDRV_SECTOR_SIZE) {
>>           error_setg(errp, "iSCSI: the target returned an invalid "
>>
> Reviewed-by: John Snow <jsnow@redhat.com>
>


