Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhMQM-0007tM-Fv
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 13:43:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XhMQF-0007mU-VM
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 13:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XhMQA-0007JO-NT
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 13:43:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1XhMQA-0007IU-F9; Thu, 23 Oct 2014 13:43:34 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9NHhWrh018974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 13:43:32 -0400
Received: from [10.36.116.19] (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9NHhTsB007055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 23 Oct 2014 13:43:30 -0400
Message-ID: <54493E40.8060801@redhat.com>
Date: Thu, 23 Oct 2014 19:43:28 +0200
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Zhang Haoyu <zhanghy@sangfor.com>, qemu-devel <qemu-devel@nongnu.org>
References: <201410222039495960337@sangfor.com>
In-Reply-To: <201410222039495960337@sangfor.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v5] snapshot: use local variable to
 bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Thu, 23 Oct 2014 17:43:44 -0000

On 22.10.2014 14:39, Zhang Haoyu wrote:
> Use local variable to bdrv_pwrite_sync L1 table,
> needless to make conversion of cached L1 table between
> big-endian and host style.
>
> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
> v4 -> v5:
> - delete superfluous check of "l1_size2 != 0"
>    after qemu_try_blockalign(l1_size2)
>
> v3 -> v4:
>   - convert local L1 table to host-style before copy it
>     back to s->l1_table
>
> v2 -> v3:
>   - replace g_try_malloc0 with qemu_try_blockalign
>   - copy the latest local L1 table back to s->l1_table
>     after successfully bdrv_pwrite_sync L1 table
>
> v1 -> v2:
>   - remove the superflous assignment, l1_table = NULL;
>   - replace 512 with BDRV_SECTOR_SIZE, and align_offset with ROUND_UP
>   - remove needless check of if (l1_table) before g_free(l1_table)
>
>   block/qcow2-refcount.c | 28 ++++++++++++----------------
>   1 file changed, 12 insertions(+), 16 deletions(-)

Sorry, but this patch breaks the qemu-iotests 060 and 061. I'll have a 
look into it myself, but for now I had to drop it from my block tree.

Max

