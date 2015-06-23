Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7KZk-0003sr-Kn
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 05:33:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7KZh-0003pR-KT
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 05:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7KZe-0005At-FE
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 05:33:01 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:41303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7KZd-0005AF-T8; Tue, 23 Jun 2015 05:32:58 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BIB63288; Tue, 23 Jun 2015 17:32:52 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 17:32:28 +0800
Message-ID: <558927A9.6000709@huawei.com>
Date: Tue, 23 Jun 2015 17:32:25 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>	<87oak6zxio.fsf@blackfin.pond.sub.org>
	<87h9py232f.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9py232f.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.558927C6.0017, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 178b0dee9d8219f67caaf875f510a06c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, quintela@redhat.com,
	qemu-devel@nongnu.org, mrhines@us.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 09:33:02 -0000

On 2015/6/23 17:20, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> <arei.gonglei@huawei.com> writes:
>>
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> Variable "r" going out of scope leaks the storage
>>> it points to in line 3268.
>>>
>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>> ---
>>>  migration/rdma.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/migration/rdma.c b/migration/rdma.c
>>> index cf5de7e..de80860 100644
>>> --- a/migration/rdma.c
>>> +++ b/migration/rdma.c
>>> @@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
>>>  
>>>  static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>>>  {
>>> -    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
>>> +    QEMUFileRDMA *r = NULL;
>>
>> Dead initialization, please drop.
>>
>>>  
>>>      if (qemu_file_mode_is_not_valid(mode)) {
>>>          return NULL;
>>>      }
>>>  
>>> +    r = g_malloc0(sizeof(QEMUFileRDMA));
>>>      r->rdma = rdma;
>>>  
>>>      if (mode[0] == 'w') {
>>
>> Looks good otherwise.
> 
> Since you're touching this, you could
> 
>     r = g_new0(QEMUFileRDMA, 1)
> 
> See commit 5839e53.
> 
I noticed this, but this whole file is using g_malloc, maybe using
another patch fix them is better. This path is just fix memory leak. :)

Regards,
-Gonglei


