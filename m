Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULFhM-0003yb-Sh
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 12:29:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULFhF-0003mj-9M
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 12:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULFhC-0006D8-Da
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 12:29:01 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:38590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULFhC-0006D2-9S
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 12:28:58 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Thu, 28 Mar 2013 12:28:57 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 28 Mar 2013 12:28:55 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 64ECC6E8048;
	Thu, 28 Mar 2013 12:28:52 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r2SGSsUd339226; Thu, 28 Mar 2013 12:28:54 -0400
Received: from d01av05.pok.ibm.com (loopback [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r2SGSsrQ018312; Thu, 28 Mar 2013 12:28:54 -0400
Received: from [9.2.141.150] (k-d941e-10.watson.ibm.com [9.2.141.150])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r2SGSsT0018306; Thu, 28 Mar 2013 12:28:54 -0400
Message-ID: <51546FC5.5010909@linux.vnet.ibm.com>
Date: Thu, 28 Mar 2013 12:28:53 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1364483920.28637.3.camel@d941e-10>
	<20130328152916.GA31205@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130328152916.GA31205@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13032816-7182-0000-0000-000005FE6397
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.139
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] Fix some memory leaks in
	test-visitor-serialization
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
X-List-Received-Date: Thu, 28 Mar 2013 16:29:07 -0000

On 03/28/2013 11:29 AM, Stefan Hajnoczi wrote:
> On Thu, Mar 28, 2013 at 11:18:40AM -0400, Stefan Berger wrote:
>> This patch fixes some of the memory leaks in test-visitor-serialization but not all of them.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
>>
>> ---
>>   v2->v3: repost
>>
>>   v1->v2: call qobject_decref(obj) earlier
>>
>> ---
>>   tests/test-visitor-serialization.c |   12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
> Thanks, applied to the trivial patches -next tree:
> https://github.com/stefanha/qemu/commits/trivial-patches-next
>
> Stefan
>
Great. There are some left-over leaks that I couldn't figure out how to 
fix. Someone more familiar with the qmp code may want to look at them.


