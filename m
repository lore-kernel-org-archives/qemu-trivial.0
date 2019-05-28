Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVW63-0006PP-VL
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 03:00:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hVW60-0006Ox-F8
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 03:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hVW5y-00074G-9R
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 03:00:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:53943)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hVW5w-0006zQ-Ek
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 03:00:26 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1M26j1-1hTaHa2usb-002ZLY; Tue, 28 May 2019 09:00:03 +0200
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190505105112.22691-1-yuval.shaia@oracle.com>
	<871s0pjisd.fsf@dusky.pond.sub.org>
	<89805e43-4bbe-1a4b-1fd4-2c042aa979bf@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4508df6d-cb54-26e9-1603-09ef9ff87a0b@vivier.eu>
Date: Tue, 28 May 2019 09:00:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <89805e43-4bbe-1a4b-1fd4-2c042aa979bf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vuuUMc/2cWgLfw03eeHBxTXVx/Y41ECip2Z5iVVZYXnQrN94UHt
	1X3n+lstJovlyJf2jbHd9XGf/RcXgck0kw87c+ASarzHc8MAFomXXsQoUiFspE0VvfXUQYO
	W69igIzKiCkhdVtGFqkkFVfmETR8UxNSkGW9XMha+R/+nAFM6tlhHx85AJn35Oqj13qZ/J3
	CCC1X69/AqYQIKTjo0xAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m5iFgOqP4wg=:r4JQfP79VMDy3rv37IK1+n
	7/fj7bpyrvBjThhuZiLacy5nhdyaiswxGQiv7uDyW8QLyLYL3w/cxZyrrdY762cNw5johT/TC
	VCFUAYpnRk9nNyIRRmZ/Gpvm1LrDSzodhXPiatjM2Nu7bEDDMJBjHVMi027Hd+BBCQPRxyipj
	zcsfwC2yGs0usaCI50xmE4CTR3vcpraMU5dRm2QB81iB/QARx5d6GzFXN2/gwBj4Xhd89FKCd
	bMeeoV13dfdg9KsFUaerEp20XSOSGzg0ZMP1FxlMJu2xx0bCzifhFmk8KLz8UgjZACTZs37Cu
	8oZ5JBwSnYNLz/wulZzz3MOnkOg90ItjJp/bKD0Fb37j4adeOGZutZeLjWpybqYDUKD7yTAS2
	BIZQAbhtZLY8wMJKOQbWDQ0Ke6dnYJH3eOhPB3M6Ui3mbZp8xvPDvC5l0KJDCrjwaPmhduBKZ
	xOy7aZyuW6ZAFBcNjTRJ4xGheZCiQnw0nqIDiyXK/wmsHl7/djEke55g95DCRCvBhBSHNhp1g
	zJTVrgLrOv2bHTo508Eaj1i/dWQb+Uxow3kRNc0tOddENrkwr7EDFwxz/BmX5ZSkHSrFU+SUF
	uriOwINpEw74luWY7+IAr7fsgm14gYOdaohW2cEPci/yrIcSOsk9uTZLCnKJ8asXHPQMmQZRW
	uV96ku0YcTrcXZR7OJ5SSwI9s7A7kJ1zAnQYjCUbT0tPxcxh+ZzGO+O3Oh/nF6haLrZ09FDe+
	IRlW3IvPDjwzLD9vr2mtIpj1l/iNDBeIsUlFILIY/xHbaskgTUtZ93fKPaY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/rdma: Delete unused
 headers inclusion
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
X-List-Received-Date: Tue, 28 May 2019 07:00:30 -0000

On 24/05/2019 07:29, Marcel Apfelbaum wrote:
> Hi Markus,
> 
> On 5/23/19 6:24 PM, Markus Armbruster wrote:
>> Looks stuck.  Let's try qemu-trivial.
> 
> Thanks, that is a great idea.
> 
> I didn't want to send a single-patch pull request,
> especially while another is waiting for reviews.
> Anyway, trivial queue can be used indeed.

Applied to my trivial-patches branch.

Thanks,
Laurent

> Thanks,
> Marcel
> 
>>
>> Yuval Shaia <yuval.shaia@oracle.com> writes:
>>
>>> This is a trivial cleanup patch.
>>>
>>> Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
>>> ---
>>>   hw/rdma/rdma_backend.c | 7 -------
>>>   1 file changed, 7 deletions(-)
>>>
>>> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
>>> index d1660b6474..05f6b03221 100644
>>> --- a/hw/rdma/rdma_backend.c
>>> +++ b/hw/rdma/rdma_backend.c
>>> @@ -14,16 +14,9 @@
>>>    */
>>>   #include "qemu/osdep.h"
>>> -#include "sysemu/sysemu.h"
>>> -#include "qapi/error.h"
>>> -#include "qapi/qmp/qlist.h"
>>> -#include "qapi/qmp/qnum.h"
>>>   #include "qapi/qapi-events-rdma.h"
>>>   #include <infiniband/verbs.h>
>>> -#include <infiniband/umad_types.h>
>>> -#include <infiniband/umad.h>
>>> -#include <rdma/rdma_user_cm.h>
>>>   #include "contrib/rdmacm-mux/rdmacm-mux.h"
>>>   #include "trace.h"
> 
> 


