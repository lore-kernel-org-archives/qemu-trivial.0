Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XknQT-0001lJ-Ik
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:10:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XknQN-0001i0-3F
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XknQI-0000Bk-9g
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:09:59 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:58621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XknQH-0000BZ-MU; Sun, 02 Nov 2014 01:09:54 -0400
Received: from 172.24.2.119 (EHLO SZXEML453-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDU95331; Sun, 02 Nov 2014 13:09:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML453-HUB.china.huawei.com
	(10.82.67.196) with Microsoft SMTP Server id 14.3.158.1; Sun, 2 Nov 2014
	13:09:34 +0800
Message-ID: <5455BC84.8070104@huawei.com>
Date: Sun, 2 Nov 2014 13:09:24 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
	<1414735861-1232-2-git-send-email-arei.gonglei@huawei.com>
	<5455BBB8.5040205@msgid.tls.msk.ru>
In-Reply-To: <5455BBB8.5040205@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] tap: remove close(fd)
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
X-List-Received-Date: Sun, 02 Nov 2014 05:10:04 -0000

On 2014/11/2 13:06, Michael Tokarev wrote:

> 31.10.2014 09:11, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> commit 5193e5fb (tap: factor out common tap initialization)
>> introduce net_init_tap_one(). But it's inapposite that close
>> fd in net_init_tap_one(), we should lay it in the caller,
>> becuase some caller needn't to close it if we get the fd
>> by monitor_handle_fd_param().
>>
>> On the other hand, in other exceptional branch fd doesn't
>> be closed, so that's incomplete.
> 
> Applied to -trivial, with grammar tweaking in commit message
> and with slightly better (in my opinion) subject, like this:
> 

Ack. Thanks for your work. :)

Best regards,
-Gonglei

>     tap: do not close(fd) in net_init_tap_one()
> 
>     commit 5193e5fb (tap: factor out common tap initialization)
>     introduce net_init_tap_one(). But it's inappropriate that
>     we close fd in net_init_tap_one(), we should lay it in the
>     caller, becuase some callers needn't to close it if we get
>     the fd by monitor_handle_fd_param().
> 
>     On the other hand, in other exceptional branches fd isn't
>     closed, so that's incomplete anyway.
> 
> Thanks,
> 
> /mjt




