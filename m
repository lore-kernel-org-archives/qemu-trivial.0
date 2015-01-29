Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGcqj-0002hX-Bu
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 19:20:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGcqg-0002ed-6L
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 19:20:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGcqe-0004B4-Om
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 19:20:41 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:17794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YGcqZ-00046k-Kj; Wed, 28 Jan 2015 19:20:36 -0500
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBB84201; Thu, 29 Jan 2015 08:20:30 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 29 Jan 2015 08:20:27 +0800
Message-ID: <54C97CC9.5010009@huawei.com>
Date: Thu, 29 Jan 2015 08:20:25 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
	<1422456844-13043-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1422456844-13043-3-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.54C97CCF.0084, ss=2, re=0.001, recu=0.000,
	reip=0.000, cl=2, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f403af259a20d209085a9b20a63f43f9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] qemu-option: Pair
 g_malloc() with g_free(), not free()
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
X-List-Received-Date: Thu, 29 Jan 2015 00:20:43 -0000

On 2015/1/28 22:54, Markus Armbruster wrote:

> Spotted by Coverity with preview checker ALLOC_FREE_MISMATCH enabled
> and my "coverity: Model g_free() isn't necessarily free()" model patch
> applied.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  util/qemu-option.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>


