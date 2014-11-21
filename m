Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XrcBs-0004m7-0M
	for mharc-qemu-trivial@gnu.org; Thu, 20 Nov 2014 19:35:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XrcBl-0004cR-5W
	for qemu-trivial@nongnu.org; Thu, 20 Nov 2014 19:35:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XrcBg-0002pR-Am
	for qemu-trivial@nongnu.org; Thu, 20 Nov 2014 19:35:05 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:19930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XrcBV-0002me-ID; Thu, 20 Nov 2014 19:34:50 -0500
Received: from 172.24.2.119 (EHLO szxeml420-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCR34379; Fri, 21 Nov 2014 08:34:45 +0800 (CST)
Received: from [10.177.19.102] (10.177.19.102) by
	szxeml420-hub.china.huawei.com (10.82.67.159) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 21 Nov 2014 08:34:43 +0800
Message-ID: <546E88A2.1090506@huawei.com>
Date: Fri, 21 Nov 2014 08:34:42 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1416473754-8660-1-git-send-email-arei.gonglei@huawei.com>
	<546E80E2.5040300@redhat.com>
In-Reply-To: <546E80E2.5040300@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>
Subject: Re: [Qemu-trivial] for 2.2: Re: [Qemu-devel] [PATCH] pcie: fix
 improper use of negative value
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
X-List-Received-Date: Fri, 21 Nov 2014 00:35:10 -0000

On 2014/11/21 8:01, Eric Blake wrote:

> On 11/20/2014 01:55 AM, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/pci/pcie.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> adding qemu-trivial in cc.  This is a candidate for 2.2.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Thanks. :)

Best regards,
-Gonglei

>>
>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>> index 58455bd..2902f7d 100644
>> --- a/hw/pci/pcie.c
>> +++ b/hw/pci/pcie.c
>> @@ -229,7 +229,7 @@ static void pcie_cap_slot_hotplug_common(PCIDevice *hotplug_dev,
>>          /* the slot is electromechanically locked.
>>           * This error is propagated up to qdev and then to HMP/QMP.
>>           */
>> -        error_setg_errno(errp, -EBUSY, "slot is electromechanically locked");
>> +        error_setg_errno(errp, EBUSY, "slot is electromechanically locked");
>>      }
>>  }
>>  
>>
> 



