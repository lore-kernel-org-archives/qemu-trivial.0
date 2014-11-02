Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xko5n-0006sR-HB
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:52:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xko5h-0006iq-BP
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xko5c-00030m-Hq
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:52:41 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:64170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xko5R-0002xg-WD; Sun, 02 Nov 2014 01:52:26 -0400
Received: from 172.24.2.119 (EHLO szxeml405-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDU97609; Sun, 02 Nov 2014 13:52:20 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml405-hub.china.huawei.com
	(10.82.67.60) with Microsoft SMTP Server id 14.3.158.1; Sun, 2 Nov 2014
	13:52:11 +0800
Message-ID: <5455C67A.3080007@huawei.com>
Date: Sun, 2 Nov 2014 13:51:54 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414906637-11048-1-git-send-email-arei.gonglei@huawei.com>
	<5455C380.7080506@msgid.tls.msk.ru>
In-Reply-To: <5455C380.7080506@msgid.tls.msk.ru>
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
Subject: Re: [Qemu-trivial] [PATCH v2] tap: fix possible fd leak in
	net_init_tap
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
X-List-Received-Date: Sun, 02 Nov 2014 05:52:46 -0000

On 2014/11/2 13:39, Michael Tokarev wrote:

> 02.11.2014 08:37, arei.gonglei@huawei.com wrote:
>>
>> In hotplugging scenario, taking those true branch, the file
>> handler do not be closed. Let's close them before return.
> 
> This looks much better now, and is shorter too :)
> Applied to -trivial, thank you!
> 

Thanks :)

Best regards,
-Gonglei


