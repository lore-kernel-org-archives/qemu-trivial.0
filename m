Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eygz7-0006vH-D5
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 12:53:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eygz5-0006tj-7O
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 12:53:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eygz4-0002zK-5n
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 12:53:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57154 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1eygyz-0002wQ-Ol; Wed, 21 Mar 2018 12:53:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 236E96166F;
	Wed, 21 Mar 2018 16:52:58 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D0E11701C6;
	Wed, 21 Mar 2018 16:52:50 +0000 (UTC)
To: Yuval Shaia <yuval.shaia@oracle.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180319215335.1119213-1-eblake@redhat.com>
	<20180320104348.GA3268@yuvallap>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <777824c3-4fd9-9690-d3a0-8e17c45e46fc@redhat.com>
Date: Wed, 21 Mar 2018 18:52:48 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320104348.GA3268@yuvallap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 16:52:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 16:52:58 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH for-2.12] rdma: Fix 32-bit compilation
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
X-List-Received-Date: Wed, 21 Mar 2018 16:53:08 -0000

On 20/03/2018 12:43, Yuval Shaia wrote:
> On Mon, Mar 19, 2018 at 04:53:35PM -0500, Eric Blake wrote:
>> Use the correct printf formats, so that a 32-bit compile doesn't
>> spit out lots of warnings about %lx being incompatible with uint64_t.
>> Broken since initial commit ef6d4ccd.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> I don't know if 'make vm-build-ubuntu.i368' would catch this (it failed
>> for me for other reasons); I found it via a 32-bit rawhide VM.
>>
>>  hw/rdma/rdma_backend.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
>> index e306fba5344..89020fdcf62 100644
>> --- a/hw/rdma/rdma_backend.c
>> +++ b/hw/rdma/rdma_backend.c
>> @@ -656,7 +656,8 @@ void rdma_backend_destroy_qp(RdmaBackendQP *qp)
>>  #define CHK_ATTR(req, dev, member, fmt) ({ \
>>      pr_dbg("%s="fmt","fmt"\n", #member, dev.member, req->member); \
>>      if (req->member > dev.member) { \
>> -        warn_report("%s = 0x%lx is higher than host device capability 0x%lx", \
>> +        warn_report("%s = 0x%" PRIx64 " is higher than host device " \
>> +                    "capability 0x%" PRIx64, \
>>                      #member, (uint64_t)req->member, (uint64_t)dev.member); \
> 
> Hmmm, interesting.
> I wonder why in first place to cast all members to uint64_t.
> Can you try the method that is used above in the call to pr_dbg, i.e. to
> use the given argument fmt?
> > Something like this:
> 	warn_report("%s = "fmt" is higher than host device capability "fmt, \
> 	            #member, req->member, dev.member); \
> 
>>          req->member = dev.member; \
>>      } \


Right, it seems to be a better solution.

Eric/Yuval, will you send a patch for it?

Thanks!
Marcel


>> -- 
>> 2.14.3
>>


