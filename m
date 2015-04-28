Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn5z9-0005aX-6b
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 09:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1Yn3yO-0005w9-0D
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 07:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1Yn3yN-0001yv-69
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 07:46:43 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:63056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1Yn3yI-0001xw-Vh; Tue, 28 Apr 2015 07:46:39 -0400
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
	by Websense Email Security Gateway with ESMTPS id E9C48EC727FA6;
	Tue, 28 Apr 2015 12:46:33 +0100 (IST)
Received: from [192.168.14.47] (192.168.14.47) by KLMAIL01.kl.imgtec.org
	(192.168.5.35) with Microsoft SMTP Server (TLS) id 14.3.195.1;
	Tue, 28 Apr 2015 12:46:36 +0100
Message-ID: <553F7317.6050607@imgtec.com>
Date: Tue, 28 Apr 2015 12:46:31 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <arei.gonglei@huawei.com>, <qemu-devel@nongnu.org>
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
	<1430212264-9672-2-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1430212264-9672-2-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.14.47]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
X-Mailman-Approved-At: Tue, 28 Apr 2015 09:55:38 -0400
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/3] target-mips: fix memory leak
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
X-List-Received-Date: Tue, 28 Apr 2015 11:46:45 -0000

On 28/04/2015 10:11, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Coveristy reports that variable prom_buf/params_buf going
> out of scope leaks the storage it points to.
> 
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Leon Alrae <leon.alrae@imgtec.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/mips/mips_fulong2e.c | 1 +
>  hw/mips/mips_malta.c    | 1 +
>  hw/mips/mips_r4k.c      | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>

Thanks,
Leon


