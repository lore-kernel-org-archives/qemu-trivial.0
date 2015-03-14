Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWjEW-0001u9-Ug
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 06:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWjEV-0001tz-Ae
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 06:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWjEQ-0001SM-CL
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 06:23:51 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWjEP-0001R7-JM; Sat, 14 Mar 2015 06:23:46 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIL95931; Sat, 14 Mar 2015 18:23:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 14 Mar 2015 18:23:38 +0800
Message-ID: <55040C25.7010706@huawei.com>
Date: Sat, 14 Mar 2015 18:23:33 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1426323477-949-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1426323477-949-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci-assign: Fix warning
 from coverity (argument cannot be negative)
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
X-List-Received-Date: Sat, 14 Mar 2015 10:23:52 -0000

On 2015/3/14 16:57, Stefan Weil wrote:
> Coverity warns because function monitor_fd_param can return a negative
> value which might be passed to function read.
> 
> This won't happen because dev->config_fd will only be negative (-1)
> when local_err is set.

Yes.

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/i386/kvm/pci-assign.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
> index 9db7c77..f3d145b 100644
> --- a/hw/i386/kvm/pci-assign.c
> +++ b/hw/i386/kvm/pci-assign.c
> @@ -554,7 +554,7 @@ static void get_real_device(AssignedDevice *pci_dev, Error **errp)
>      if (pci_dev->configfd_name && *pci_dev->configfd_name) {
>          dev->config_fd = monitor_fd_param(cur_mon, pci_dev->configfd_name,
>                                            &local_err);
> -        if (local_err) {
> +        if (dev->config_fd < 0) {
>              error_propagate(errp, local_err);
>              return;
>          }
> 

This fix the coverity warning of dev->config_id. I'm not sure that this may introduce
another warning of not checking local_err.

-- 
Thanks,
Shannon


