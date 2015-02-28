Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YReF8-0006OE-2L
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:03:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReF2-0006KD-Mp
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReEy-0006du-HN
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:03:24 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:28292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YReEx-0006dd-TZ; Sat, 28 Feb 2015 05:03:20 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHU83821; Sat, 28 Feb 2015 18:03:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 18:03:09 +0800
Message-ID: <54F1925B.2080902@huawei.com>
Date: Sat, 28 Feb 2015 18:03:07 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<54F19040.7000408@msgid.tls.msk.ru>
In-Reply-To: <54F19040.7000408@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/9] Coverity defects fixes
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
X-List-Received-Date: Sat, 28 Feb 2015 10:03:28 -0000

On 2015/2/28 17:54, Michael Tokarev wrote:
> 27.02.2015 10:50, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> All those defects are spotted by Coverity, which
>> classed in high impact outstanding defects.
>> Reports come from scan.coverity.com for Qemu.
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: qemu-trivial@nongnu.org
>>
>> Gonglei (9):
>>   nbd: fix resource leak
> Applied.
> 
>>   arm: fix memory leak
> Does not apply.
> 
>>   sparc/leon3.c: fix memory leak
> Applied.
> 
>>   macio: fix possible memory leak
> Applied.
> 
>>   e500: fix memory leak
> The patch is wrong.
> 
>>   9pfs: fix memory leak
> Applied.
> 
>>   milkymist.c: fix memory leak
> Applied.
> 
>>   sysbus: fix memory leak
> Applied.
> 
>>   microblaze: fix memory leak
> Applied.
> 
> Thanks,
> 
> /mjt
> 
Thanks for your work :)

Regards,
-Gonglei


