Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGcqx-00030J-4F
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 19:20:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGcqt-0002vb-Sr
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 19:20:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGcqt-0004Ew-0N
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 19:20:55 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:8838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YGcqn-0004CW-UI; Wed, 28 Jan 2015 19:20:50 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CGL83421; Thu, 29 Jan 2015 08:20:48 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 29 Jan 2015 08:20:46 +0800
Message-ID: <54C97CDD.5090102@huawei.com>
Date: Thu, 29 Jan 2015 08:20:45 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
	<1422456844-13043-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1422456844-13043-4-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] spapr_vio: Pair
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
X-List-Received-Date: Thu, 29 Jan 2015 00:20:56 -0000

On 2015/1/28 22:54, Markus Armbruster wrote:

> Spotted by Coverity with preview checker ALLOC_FREE_MISMATCH enabled
> and my "coverity: Model g_free() isn't necessarily free()" model patch
> applied.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/ppc/spapr_vio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>


