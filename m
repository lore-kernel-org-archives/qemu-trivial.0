Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKGTa-0002yf-6y
	for mharc-qemu-trivial@gnu.org; Wed, 20 Aug 2014 20:43:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XKGTR-0002pH-Iw
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 20:43:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XKGTL-00019J-9c
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 20:43:29 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:52907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XKGT6-0000xa-AW; Wed, 20 Aug 2014 20:43:09 -0400
Received: from 172.24.2.119 (EHLO szxeml423-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAP16478; Thu, 21 Aug 2014 08:43:02 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml423-hub.china.huawei.com
	(10.82.67.162) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 21 Aug 2014 08:42:55 +0800
Message-ID: <53F5408B.3080908@huawei.com>
Date: Thu, 21 Aug 2014 08:42:51 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1408437017-15648-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F4B776.9040508@msgid.tls.msk.ru>
	<53F4B8DE.4050508@msgid.tls.msk.ru>
In-Reply-To: <53F4B8DE.4050508@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v8] slirp/misc: Use the GLib memory
	allocation APIs
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
X-List-Received-Date: Thu, 21 Aug 2014 00:43:36 -0000

On 2014/8/20 23:03, Michael Tokarev wrote:
> 20.08.2014 18:57, Michael Tokarev пишет:
>> 19.08.2014 12:30, zhanghailiang wrote:
>>> Here we don't check the return value of malloc() which may fail.
>>> Use the g_new() instead, which will abort the program when
>>> there is not enough memory.
>>>
>>> Also, use g_strdup instead of strdup and remove the unnecessary
>>> strdup function.
>>
>> I also will remove the HAVE_STRDUP define from slirp_config.h --
>> it is no longer needed there.
>>
>> Applied to -trivial (with the above addition), thank you!
>
> ..And with removal of the corresponding #ifdef HAVE_STRDUP from slirp/misc.h.
>
> /mjt
>
>
OK! Thanks.

zhanghailiang




