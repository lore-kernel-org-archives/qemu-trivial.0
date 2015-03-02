Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSEza-0002fh-LN
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2015 20:17:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YSEzX-0002c6-RJ
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 20:17:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YSEzX-0004Ng-2E
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 20:17:51 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:41556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YSEzS-0004Ku-9e; Sun, 01 Mar 2015 20:17:46 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKD66575; Mon, 02 Mar 2015 09:17:25 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1; Mon, 2 Mar 2015
	09:17:20 +0800
Message-ID: <54F3BA15.1040408@huawei.com>
Date: Mon, 2 Mar 2015 09:17:09 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	"Michael Tokarev" <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>	<54F194B7.9080603@msgid.tls.msk.ru>	<54F1EF7A.4040007@redhat.com>	<54F1F13C.9070204@weilnetz.de>
	<54F2E496.7000700@redhat.com>
In-Reply-To: <54F2E496.7000700@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Mon, 02 Mar 2015 01:17:52 -0000

On 2015/3/1 18:06, Paolo Bonzini wrote:
> 
> 
> On 28/02/2015 17:47, Stefan Weil wrote:
>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Which one of the two patch variants did you review?
>>
>> I suggest using Michael's version (only one g_free as early as
>> possible). For that variant, my review may be added:
>>
>> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> I also referred to Michael's.
> 
OK, thanks.

Michael, need I send another version? Or you own handle it directly?

Regards,
-Gonglei



