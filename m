Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1khjUL-0005vI-Sp
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2020 20:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khjUH-0005tv-4j; Tue, 24 Nov 2020 20:20:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khjUF-0002Nm-2A; Tue, 24 Nov 2020 20:20:48 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cgjk66n9zzkYJd;
 Wed, 25 Nov 2020 09:20:14 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 09:20:34 +0800
Message-ID: <5FBDB161.505@huawei.com>
Date: Wed, 25 Nov 2020 09:20:33 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Raphael Norwitz <raphael.s.norwitz@gmail.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, <qemu-trivial@nongnu.org>, QEMU
 <qemu-devel@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH] vhost-user-scsi: Fix memleaks in vus_proc_req()
References: <20201124143727.47037-1-alex.chen@huawei.com>
 <CAFubqFub7gPiuHAU4fFXPncCZhfM3iPAr-oVDgR3Ewyk_D8hjA@mail.gmail.com>
In-Reply-To: <CAFubqFub7gPiuHAU4fFXPncCZhfM3iPAr-oVDgR3Ewyk_D8hjA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Nov 2020 01:20:51 -0000

On 2020/11/24 23:37, Raphael Norwitz wrote:
> On Tue, Nov 24, 2020 at 9:50 AM Alex Chen <alex.chen@huawei.com> wrote:
>>
>> The 'elem' is allocated memory in vu_queue_pop(), and it's memory should be
>> freed in all error branchs after vu_queue_pop().
> 
> s/branchs/branches
> 
>> In addition, in order to free 'elem' memory outside of while(1) loop, move the
>> definition of 'elem' to the begin of vus_proc_req().
> 
> s/begin/beginning
> 
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> 
> Other than spelling in the commit message, looks good to me.
> 

Thanks for your review, I will fix it and send patch v2.

Thanks,
Alex

> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> 
>> ---
>>  contrib/vhost-user-scsi/vhost-user-scsi.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
>> index 0f9ba4b2a2..4639440a70 100644
>> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
>> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
>> @@ -232,6 +232,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
>>      VugDev *gdev;
>>      VusDev *vdev_scsi;
>>      VuVirtq *vq;
>> +    VuVirtqElement *elem = NULL;
>>
>>      assert(vu_dev);
>>
>> @@ -248,7 +249,6 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
>>      g_debug("Got kicked on vq[%d]@%p", idx, vq);
>>
>>      while (1) {
>> -        VuVirtqElement *elem;
>>          VirtIOSCSICmdReq *req;
>>          VirtIOSCSICmdResp *rsp;
>>
>> @@ -288,6 +288,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
>>
>>          free(elem);
>>      }
>> +    free(elem);
>>  }
>>
>>  static void vus_queue_set_started(VuDev *vu_dev, int idx, bool started)
>> --
>> 2.19.1
>>
>>
> .
> 


