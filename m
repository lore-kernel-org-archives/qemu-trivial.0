Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c6ZZn-0004uN-N9
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2016 03:58:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c6ZZl-0004sx-Pu
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 03:58:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c6ZZl-0001zq-54
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 03:58:45 -0500
Received: from [59.151.112.132] (port=15812 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1c6ZZf-0001wT-7A; Tue, 15 Nov 2016 03:58:39 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12986507"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2016 16:58:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5D2934670068;
	Tue, 15 Nov 2016 16:58:18 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 15 Nov 2016 16:58:17 +0800
To: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>, 
	Hailiang Zhang <zhang.zhanghailiang@huawei.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
	<0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
CC: <qemu-trivial@nongnu.org>, <armbru@redhat.com>, <qemu-devel@nongnu.org>,
	<dgilbert@redhat.com>, Amit Shah <amit.shah@redhat.com>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <2a0125c8-bbc1-6b03-9204-dc7caf776e97@cn.fujitsu.com>
Date: Tue, 15 Nov 2016 16:58:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 5D2934670068.A5D69
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
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
X-List-Received-Date: Tue, 15 Nov 2016 08:58:46 -0000



On 11/15/2016 04:44 PM, Laurent Vivier wrote:
> Le 14/11/2016 à 14:54, Stefan Hajnoczi a écrit :
>> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>>> ping ?
>>>
>>> Anyone pick this up?
>> The original patch that added these lines went through Amit Shah and
>> David Gilbert.  I have CCed them.
> If it is needed, I can also send a pull request through my
> trivial-patches branch.
>
> Laurent

The pull request for this patch has been sent by Jason.
Thanks for your attention, and thank Stefan.

Zhang Chen


-- 
Thanks
zhangchen




