Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c6WzG-0007Az-Jr
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2016 01:12:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c6WzE-00079V-0p
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 01:12:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c6WzD-0007aH-9r
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 01:12:51 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:43706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c6Wz7-0007Pa-3f; Tue, 15 Nov 2016 01:12:45 -0500
Received: from 172.24.1.136 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CLJ16326; Tue, 15 Nov 2016 14:12:27 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Nov 2016 14:12:17 +0800
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
CC: Eric Blake <eblake@redhat.com>, <armbru@redhat.com>,
	<qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>, Amit Shah
	<amit.shah@redhat.com>, <dgilbert@redhat.com>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <582AA740.5080503@huawei.com>
Date: Tue, 15 Nov 2016 14:12:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20161114135451.GB26198@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi-schema: clarify
 'colo' state for MigrationStatus
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2016 06:12:52 -0000

On 2016/11/14 21:54, Stefan Hajnoczi wrote:
> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>> ping ?
>>
>> Anyone pick this up?
>
> The original patch that added these lines went through Amit Shah and
> David Gilbert.  I have CCed them.
>

Great, thanks :)

> Stefan
>


