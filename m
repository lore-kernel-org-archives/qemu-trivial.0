Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XuGFX-00026W-BJ
	for mharc-qemu-trivial@gnu.org; Fri, 28 Nov 2014 02:45:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XuGFQ-00026Q-HO
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 02:45:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XuGFI-0007HQ-6O
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 02:45:48 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:25893)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XuGFH-00071H-Gk; Fri, 28 Nov 2014 02:45:40 -0500
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDC28910; Fri, 28 Nov 2014 15:45:21 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 28 Nov 2014 15:41:58 +0800
Message-ID: <54782743.2020201@huawei.com>
Date: Fri, 28 Nov 2014 15:41:55 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<1415881027-8112-3-git-send-email-arei.gonglei@huawei.com>
	<87h9xkkdxx.fsf@blackfin.pond.sub.org>
	<5477D530.7030101@huawei.com>
	<87lhmv9419.fsf@blackfin.pond.sub.org>
In-Reply-To: <87lhmv9419.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] virtfs-proxy-helper:
 Fix handle leak to make Coverity happy
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
X-List-Received-Date: Fri, 28 Nov 2014 07:45:54 -0000

On 2014/11/28 15:29, Markus Armbruster wrote:

> Since this is main(), the "caller" is the OS.  And yes, the OS closes
> the -f file descriptor when main() returns, because it closes *all* file
> descriptors.  Calling close() before return from main() is pointless,
> unless you check for errors.
> 
> Unfortunately, Coverity doesn't understand this.  Calling close() in
> main() suppresses its bogus defect report.
> 

Yes.

>>> >> If sock >= 0 is pointless, too, but needed to hush up Coverity.
>> >
>> > You mean do not check sock_name is NULL or not?
> Yes, unless it causes another bogus Coverity defect.
> 
> Or simply mark the defect as invalid and move on without patching the
> code.

Let's drop this patch, thanks.

Regards,
-Gonglei


