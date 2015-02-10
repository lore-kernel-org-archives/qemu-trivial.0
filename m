Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL65O-00044e-FK
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 03:22:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL65M-000436-8z
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 03:22:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL65H-0005mO-WD
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 03:22:20 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:10715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YL65H-0005lR-Cd; Tue, 10 Feb 2015 03:22:15 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJI58513; Tue, 10 Feb 2015 16:22:02 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Feb 2015 16:21:51 +0800
Message-ID: <54D9BF9C.6070604@huawei.com>
Date: Tue, 10 Feb 2015 16:21:48 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
	<1423554683-2968-3-git-send-email-arei.gonglei@huawei.com>
	<alpine.DEB.2.02.1502100811100.29696@kaball.uk.xensource.com>
In-Reply-To: <alpine.DEB.2.02.1502100811100.29696@kaball.uk.xensource.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Tue, 10 Feb 2015 08:22:21 -0000

On 2015/2/10 16:11, Stefano Stabellini wrote:
> On Tue, 10 Feb 2015, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> The array length of s->real_device.io_regions[] is
>> "PCI_NUM_REGIONS - 1".
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> 
> Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
> 
> I am happy for these patches to go in via the qemu-trivial tree.
> 
Thanks. Let me cc /mjt.

Regards,
-Gonglei
>>  hw/xen/xen_pt_config_init.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
>> index 710fe50..d99c22e 100644
>> --- a/hw/xen/xen_pt_config_init.c
>> +++ b/hw/xen/xen_pt_config_init.c
>> @@ -438,7 +438,7 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
>>  
>>      /* get BAR index */
>>      index = xen_pt_bar_offset_to_index(reg->offset);
>> -    if (index < 0 || index >= PCI_NUM_REGIONS) {
>> +    if (index < 0 || index >= PCI_NUM_REGIONS - 1) {
>>          XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n", index);
>>          return -1;
>>      }
>> -- 
>> 1.7.12.4
>>
>>



