Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YblVg-0001T7-1j
	for mharc-qemu-trivial@gnu.org; Sat, 28 Mar 2015 03:50:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YblVe-0001RQ-Cn
	for qemu-trivial@nongnu.org; Sat, 28 Mar 2015 03:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YblVd-000520-M7
	for qemu-trivial@nongnu.org; Sat, 28 Mar 2015 03:50:22 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:63748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YblVY-000500-5Y; Sat, 28 Mar 2015 03:50:17 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDS74081; Sat, 28 Mar 2015 15:46:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Mar 2015 15:46:30 +0800
Message-ID: <55165C4A.5080800@huawei.com>
Date: Sat, 28 Mar 2015 15:46:18 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>	<5507D480.1000505@huawei.com>	<55161404.4000404@huawei.com>
	<CAJy5ezrFVPCC1VCbvVVYYTEgx2v__AicWFUme_yh2ikuB0wOEg@mail.gmail.com>
In-Reply-To: <CAJy5ezrFVPCC1VCbvVVYYTEgx2v__AicWFUme_yh2ikuB0wOEg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.55165C5A.0037, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 251867b19fb4bd1f08ba16d35e511046
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] microblaze: fix memory leak
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
X-List-Received-Date: Sat, 28 Mar 2015 07:50:23 -0000

On 2015/3/28 15:31, Edgar E. Iglesias wrote:
> On 28/03/2015 12:38 pm, "Gonglei" <arei.gonglei@huawei.com> wrote:
>>
>> Hi,
>>
>>    Ping again...  Can this patch be a raw stuff for rc2 ?
> 
> Looks good to me, thanks.
> 
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
Thanks :)

> Can this go through -trivial?
>
It's ok, but I don't know if -trivial branch maintainer has a plan to send a pull request
for rc2.

Michael?

Regards,
-Gonglei




