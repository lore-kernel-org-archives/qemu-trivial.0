Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlFdo-00007c-TM
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 06:17:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlFdh-0008Qm-Ab
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:17:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlFdb-0006ct-5T
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:17:37 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:8748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlFdO-0006YL-1e; Mon, 03 Nov 2014 06:17:18 -0500
Received: from 172.24.2.119 (EHLO szxeml423-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDW43998; Mon, 03 Nov 2014 19:17:13 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by szxeml423-hub.china.huawei.com
	(10.82.67.162) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 3 Nov 2014 19:17:04 +0800
Message-ID: <5457642D.30309@huawei.com>
Date: Mon, 3 Nov 2014 19:17:01 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-trivial@nongnu.org>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415007872-8228-6-git-send-email-zhang.zhanghailiang@huawei.com>
	<54575344.1080609@msgid.tls.msk.ru>
In-Reply-To: <54575344.1080609@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 5/5] spice-qemu-char: convert
 qemu_chr_open_spice_vmc to use Error API
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
X-List-Received-Date: Mon, 03 Nov 2014 11:17:43 -0000

On 2014/11/3 18:04, Michael Tokarev wrote:
> 03.11.2014 12:44, zhanghailiang wrote:
> []
>> --- a/qemu-char.c
>> +++ b/qemu-char.c
>> @@ -4252,7 +4252,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
>>   #endif
>>   #ifdef CONFIG_SPICE
>>       case CHARDEV_BACKEND_KIND_SPICEVMC:
>> -        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type);
>> +        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type, errp);
>>           break;
>>       case CHARDEV_BACKEND_KIND_SPICEPORT:
>>           chr = qemu_chr_open_spice_port(backend->spiceport->fqdn);
>
> Now this is funny.  Why we have two functions nearby using different
> error reporting APIs?  Maybe qemu_chr_open_spice_port() should be
> converted to Error API too, at the same time (maybe in the same
> patch or in a subsequent patch in the same series)?
>

Actually, after patch 3, there will be no error case for this function, it can not
fail, so i just leave it. What's your opinion? Thanks.


