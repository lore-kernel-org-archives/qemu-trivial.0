Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XydSf-0001qR-L8
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:21:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XydSY-0001gq-CS
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:21:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XydSS-00012h-37
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:21:26 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:13317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XydSD-0000yK-LC; Wed, 10 Dec 2014 04:21:07 -0500
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDU42003; Wed, 10 Dec 2014 17:20:53 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 10 Dec 2014 17:20:44 +0800
Message-ID: <54881066.9000107@huawei.com>
Date: Wed, 10 Dec 2014 17:20:38 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-trivial@nongnu.org>
References: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<54880B00.3030108@msgid.tls.msk.ru>
In-Reply-To: <54880B00.3030108@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: sw@weilnetz.de, armbru@redhat.com, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, peter.huangpeng@huawei.com,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v2] vt82c686: fix coverity warning about
 out-of-bounds write
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
X-List-Received-Date: Wed, 10 Dec 2014 09:21:32 -0000

On 2014/12/10 16:57, Michael Tokarev wrote:
> 09.12.2014 10:15, zhanghailiang wrote:
>> Refactor superio_ioport_writeb to fix the out of bounds write warning.
>
> Is it just a warning, or real oob write?
>>From the code it looks like it's just a warning...
>

Er, i don't know when input 'data' will be oxff,
if this happens, it will access superio_conf->config[0xff] which is out of bounds
for superio_conf->config.

Actually, we should check the 'can_write' when access superio_conf->config[] in the follow codes,
but these codes seem a little odd, so refactor it is better choice. ;)


> []
>> +
>> +        }
>> +        if (can_write == true) {
>
> 09.12.2014 17:08, Paolo Bonzini wrote:
>> Michael, can you remove "== true" when applying this patch?
>
> Sure, just did.  Does it mean I can add your R-b too? ;)
>

cc: Paolo

Thanks.
zhanghailiang




