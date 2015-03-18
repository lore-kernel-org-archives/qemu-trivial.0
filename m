Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YY2nH-0005HZ-4M
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 21:29:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YY2nF-0005HP-1w
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 21:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YY2nB-0007iu-6I
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 21:29:08 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:40594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YY2nA-0007iN-F8; Tue, 17 Mar 2015 21:29:05 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIQ24159; Wed, 18 Mar 2015 09:28:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 18 Mar 2015 09:28:36 +0800
Message-ID: <5508D4C4.5030509@huawei.com>
Date: Wed, 18 Mar 2015 09:28:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1426224119-8352-1-git-send-email-zhaoshenglong@huawei.com>
	<20150317170545.GA13669@stefanha-thinkpad.redhat.com>
In-Reply-To: <20150317170545.GA13669@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/e1000: fix integer
	endianness
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
X-List-Received-Date: Wed, 18 Mar 2015 01:29:10 -0000

On 2015/3/18 1:05, Stefan Hajnoczi wrote:
> On Fri, Mar 13, 2015 at 01:21:59PM +0800, Shannon Zhao wrote:
>> It's detected by coverity.In is_vlan_packet s->mac_reg[VET] is
>> unsigned int but is dereferenced as a narrower unsigned short.
>> This may lead to unexpected results depending on machine
>> endianness.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/net/e1000.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Thanks, applied to my net tree:
> https://github.com/stefanha/qemu/commits/net
> 

Thanks :-)

Shannon


