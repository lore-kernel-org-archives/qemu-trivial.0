Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4do-00046w-Gl
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:49:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL4dm-00044A-89
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL4dh-00079F-B2
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:49:46 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:37793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YL4dg-00077Q-Kk; Tue, 10 Feb 2015 01:49:41 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBR44819; Tue, 10 Feb 2015 14:49:21 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Feb 2015 14:49:13 +0800
Message-ID: <54D9A9E6.3040306@huawei.com>
Date: Tue, 10 Feb 2015 14:49:10 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
	<1422689277-16032-3-git-send-email-arei.gonglei@huawei.com>
	<alpine.DEB.2.02.1502100638200.29696@kaball.uk.xensource.com>
In-Reply-To: <alpine.DEB.2.02.1502100638200.29696@kaball.uk.xensource.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54D9A9F7.0138, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c0d779ebf9671d152412d181b5c86520
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Tue, 10 Feb 2015 06:49:47 -0000

On 2015/2/10 14:39, Stefano Stabellini wrote:
> On Sat, 31 Jan 2015, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> The array length of s->real_device.io_regions[] is
>> "PCI_NUM_REGIONS - 1". Add a check, just make Coverity happy.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/xen/xen_pt_config_init.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
>> index 710fe50..3c8b0f1 100644
>> --- a/hw/xen/xen_pt_config_init.c
>> +++ b/hw/xen/xen_pt_config_init.c
>> @@ -443,6 +443,11 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
>>          return -1;
>>      }
>>  
>> +    if (index == PCI_ROM_SLOT) {
>> +        XEN_PT_ERR(&s->dev, "Internal error: Access violation at ROM BAR.\n");
>> +        return -1;
>> +    }
> 
> Could you please fix the boundaries of the check just above?
> Also please avoid using PCI_ROM_SLOT for the array index check, simply
> use PCI_NUM_REGIONS.
> 
You meaning is changing the below check:

if (index < 0 || index >= PCI_NUM_REGIONS - 1) {
        XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n", index);
        return -1;
    }

Isn't it?

Regards,
-Gonglei




