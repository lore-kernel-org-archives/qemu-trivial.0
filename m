Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ugumm-0005h6-GH
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 06:36:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1Ugumj-0005cN-GH
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1Ugume-0002HA-GQ
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:36:13 -0400
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:39232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1Ugumd-0002Gw-U6
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:36:08 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <lilei@linux.vnet.ibm.com>;
	Mon, 27 May 2013 20:27:18 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 27 May 2013 20:27:16 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 5387C2BB0023;
	Mon, 27 May 2013 20:36:01 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r4RAZraK26017950; Mon, 27 May 2013 20:35:53 +1000
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r4RAa0NE003845; Mon, 27 May 2013 20:36:00 +1000
Received: from localhost.localdomain ([9.125.24.193])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r4RAZxcR003800; Mon, 27 May 2013 20:35:59 +1000
Message-ID: <51A336F0.2020301@linux.vnet.ibm.com>
Date: Mon, 27 May 2013 18:35:28 +0800
From: Lei Li <lilei@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "mjt@tls.msk.ru >> Michael Tokarev" <mjt@tls.msk.ru>
References: <1369041650-22056-1-git-send-email-lilei@linux.vnet.ibm.com>
	<519A0488.60608@weilnetz.de>
In-Reply-To: <519A0488.60608@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13052710-5490-0000-0000-0000038903B0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.144
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Fix typo in
	comment
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
X-List-Received-Date: Mon, 27 May 2013 10:36:15 -0000

On 05/20/2013 07:10 PM, Stefan Weil wrote:
> Am 20.05.2013 11:20, schrieb Lei Li:
>> Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>
>> ---
>>   linux-user/syscall.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 30e93bc..72c6866 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8236,7 +8236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>>   #ifdef TARGET_NR_madvise
>>       case TARGET_NR_madvise:
>>           /* A straight passthrough may not be safe because qemu sometimes
>> -           turns private flie-backed mappings into anonymous mappings.
>> +           turns private file-backed mappings into anonymous mappings.
>>              This will break MADV_DONTNEED.
>>              This is a hint, so ignoring and returning success is ok.  */
>>           ret = get_errno(0);
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
PING?


-- 
Lei


