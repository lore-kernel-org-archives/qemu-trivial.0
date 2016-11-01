Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1T4j-0002Ly-Q3
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 03:01:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1SW2-0005lL-PH
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 02:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1SVz-000687-I5
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 02:25:46 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:27461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1SVy-00066F-Dv
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 02:25:43 -0400
Received: from 172.24.1.137 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CKQ97495; Tue, 01 Nov 2016 14:25:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Tue, 1 Nov 2016
	14:25:27 +0800
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, qemu devel
	<qemu-devel@nongnu.org>, Amit Shah <amit.shah@redhat.com>
References: <1477971492-10766-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
CC: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	"eddie . dong" <eddie.dong@intel.com>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <58183554.8070101@huawei.com>
Date: Tue, 1 Nov 2016 14:25:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1477971492-10766-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
X-Mailman-Approved-At: Tue, 01 Nov 2016 03:01:35 -0400
Subject: Re: [Qemu-trivial] [PATCH] docs: fix COLO architecture diagram
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
X-List-Received-Date: Tue, 01 Nov 2016 06:25:48 -0000

Hmm, there are other contents in this file need to be updated,
for example, we support blockdev-add command for nbd now,
so we can convert the related hmp command to qmp command way.
But since we didn't integrate COLO frame with block replication
and proxy, It is OK to fix them later.

For COLO, the basic capability is still incomplete,
but now we got into 'Soft feature freeze' stage,
I'm wondering if it is possible at this point to combine
COLO frame with proxy and block replication which only needs
three or four patches that only touch colo related files ...
Or uses still can't test COLO feature in qemu 2.8.

Any ideas ? Thanks.

On 2016/11/1 11:38, Zhang Chen wrote:
> Fix COLO-Proxy part of COLO architecture diagram
>
> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>

Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

All such patches can go through trivial branch.

Cc: qemu-trivial@nongnu.org

> ---
>   docs/COLO-FT.txt | 72 +++++++++++++++++++++++++++++---------------------------
>   1 file changed, 37 insertions(+), 35 deletions(-)
>
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
> index 6282938..e289be2 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -41,41 +41,43 @@ identical responses to all client requests. Once the differences in the outputs
>   are detected between the PVM and SVM, COLO withholds transmission of the
>   outbound packets until it has successfully synchronized the PVM state to the SVM.
>
> -   Primary Node                                                            Secondary Node
> - +------------+  +-----------------------+       +------------------------+  +------------+
> - |            |  |       HeartBeat       |<----->|       HeartBeat        |  |            |
> - | Primary VM |  +-----------|-----------+       +-----------|------------+  |Secondary VM|
> - |            |              |                               |               |            |
> - |            |  +-----------|-----------+       +-----------|------------+  |            |
> - |            |  |QEMU   +---v----+      |       |QEMU  +----v---+        |  |            |
> - |            |  |       |Failover|      |       |      |Failover|        |  |            |
> - |            |  |       +--------+      |       |      +--------+        |  |            |
> - |            |  |   +---------------+   |       |   +---------------+    |  |            |
> - |            |  |   | VM Checkpoint |-------------->| VM Checkpoint |    |  |            |
> - |            |  |   +---------------+   |       |   +---------------+    |  |            |
> - |            |  |                       |       |                        |  |            |
> - |Requests<---------------------------^------------------------------------------>Requests|
> - |Responses----------------------\ /--|--------------\  /------------------------Responses|
> - |            |  |               | |  |  |       |   |  |                 |  |            |
> - |            |  | +-----------+ | |  |  |       |   |  |  +------------+ |  |            |
> - |            |  | | COLO disk | | |  |  |       |   |  |  | COLO disk  | |  |            |
> - |            |  | |   Manager |-|-|--|--------------|--|->| Manager    | |  |            |
> - |            |  | +|----------+ | |  |  |       |   |  |  +-----------|+ |  |            |
> - |            |  |  |            | |  |  |       |   |  |              |  |  |            |
> - +------------+  +--|------------|-|--|--+       +---|--|--------------|--+  +------------+
> -                    |            | |  |              |  |              |
> - +-------------+    | +----------v-v--|--+       +---|--v-----------+  |    +-------------+
> - |  VM Monitor |    | |  COLO Proxy      |       |    COLO Proxy    |  |    | VM Monitor  |
> - |             |    | |(compare packet)  |       | (adjust sequence)|  |    |             |
> - +-------------+    | +----------|----^--+       +------------------+  |    +-------------+
> -                    |            |    |                                |
> - +------------------|------------|----|--+       +---------------------|------------------+
> - |   Kernel         |            |    |  |       |   Kernel            |                  |
> - +------------------|------------|----|--+       +---------------------|------------------+
> -                    |            |    |                                |
> -     +--------------v+  +--------v----|--+       +------------------+ +v-------------+
> -     |   Storage     |  |External Network|       | External Network | |   Storage    |
> -     +---------------+  +----------------+       +------------------+ +--------------+
> +  Primary Node                                                            Secondary Node
> ++------------+  +-----------------------+       +------------------------+  +------------+
> +|            |  |       HeartBeat       +<----->+       HeartBeat        |  |            |
> +| Primary VM |  +-----------+-----------+       +-----------+------------+  |Secondary VM|
> +|            |              |                               |               |            |
> +|            |  +-----------|-----------+       +-----------|------------+  |            |
> +|            |  |QEMU   +---v----+      |       |QEMU  +----v---+        |  |            |
> +|            |  |       |Failover|      |       |      |Failover|        |  |            |
> +|            |  |       +--------+      |       |      +--------+        |  |            |
> +|            |  |   +---------------+   |       |   +---------------+    |  |            |
> +|            |  |   | VM Checkpoint +-------------->+ VM Checkpoint |    |  |            |
> +|            |  |   +---------------+   |       |   +---------------+    |  |            |
> +|Requests<--------------------------\ /-----------------\ /--------------------->Requests|
> +|            |  |                   ^ ^ |       |       | |              |  |            |
> +|Responses+---------------------\ /-|-|------------\ /-------------------------+Responses|
> +|            |  |               | | | | |       |  | |  | |              |  |            |
> +|            |  | +-----------+ | | | | |       |  | |  | | +----------+ |  |            |
> +|            |  | | COLO disk | | | | | |       |  | |  | | | COLO disk| |  |            |
> +|            |  | |   Manager +---------------------------->| Manager  | |  |            |
> +|            |  | ++----------+ v v | | |       |  | v  v | +---------++ |  |            |
> +|            |  |  |+-----------+-+-+-++|       | ++-+--+-+---------+ |  |  |            |
> +|            |  |  ||   COLO Proxy     ||       | |   COLO Proxy    | |  |  |            |
> +|            |  |  || (compare packet  ||       | |(adjust sequence | |  |  |            |
> +|            |  |  ||and mirror packet)||       | |    and ACK)     | |  |  |            |
> +|            |  |  |+------------+---+-+|       | +-----------------+ |  |  |            |
> ++------------+  +-----------------------+       +------------------------+  +------------+
> ++------------+     |             |   |                                |     +------------+
> +| VM Monitor |     |             |   |                                |     | VM Monitor |
> ++------------+     |             |   |                                |     +------------+
> ++---------------------------------------+       +----------------------------------------+
> +|   Kernel         |             |   |  |       |   Kernel            |                  |
> ++---------------------------------------+       +----------------------------------------+
> +                   |             |   |                                |
> +    +--------------v+  +---------v---+--+       +------------------+ +v-------------+
> +    |   Storage     |  |External Network|       | External Network | |   Storage    |
> +    +---------------+  +----------------+       +------------------+ +--------------+
> +
>
>   == Components introduction ==
>
>


