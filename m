Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRe9z-0000Mg-Ib
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:58:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRe9x-0000MX-J7
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:58:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRe9s-0004Qo-Oh
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:58:09 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:34409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRe9r-0004IP-Vn; Sat, 28 Feb 2015 04:58:04 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKC47162; Sat, 28 Feb 2015 17:57:53 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 17:57:46 +0800
Message-ID: <54F19110.7080902@huawei.com>
Date: Sat, 28 Feb 2015 17:57:36 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<1425023419-12244-6-git-send-email-arei.gonglei@huawei.com>
	<54F18D2E.1060501@msgid.tls.msk.ru>
In-Reply-To: <54F18D2E.1060501@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 5/9] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 09:58:10 -0000

On 2015/2/28 17:41, Michael Tokarev wrote:
> 27.02.2015 10:50, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/ppc/e500.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index 7e17d18..38203a6 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -542,6 +542,7 @@ done:
>>  
>>  out:
>>      g_free(pci_map);
>> +    g_free(filename);
> 
> This patch breaks compilation, because `filename' variable is
> local to the "if (dtb_file)" code block at the beginning of this
> function and shold be freed there.
> 
Yes, it is. Thanks for your review, I'll respin it.

Regards,
-Gonglei



