Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcaIK-0003mA-TJ
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2015 10:04:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YcaIF-0003kR-EN
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 10:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YcaIC-0007Hq-C3
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 10:03:55 -0400
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:47762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YcaIB-0007HS-Nj
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 10:03:52 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Mon, 30 Mar 2015 19:33:47 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp08.in.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 30 Mar 2015 19:33:46 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id B55561258063;
	Mon, 30 Mar 2015 19:35:26 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2UE3YGY45875224; Mon, 30 Mar 2015 19:33:35 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2UDqpJq023845; Mon, 30 Mar 2015 19:22:51 +0530
Received: from skywalker.linux.vnet.ibm.com ([9.79.204.46])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2UDqp9R023829
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 30 Mar 2015 19:22:51 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Stefan Hajnoczi <stefanha@gmail.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
In-Reply-To: <20150330132941.GK25181@stefanha-thinkpad.redhat.com>
References: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
	<20150330132941.GK25181@stefanha-thinkpad.redhat.com>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.4.1
	(x86_64-pc-linux-gnu)
Date: Mon, 30 Mar 2015 19:33:33 +0530
Message-ID: <87pp7qlgzu.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033014-0029-0000-0000-0000051A0EA3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.8
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2]
	fsdev/virtfs-proxy-helper: Fix possible overflow
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
X-List-Received-Date: Mon, 30 Mar 2015 14:03:58 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Sat, Mar 14, 2015 at 10:00:16AM +0800, Shannon Zhao wrote:
>> It's detected by coverity. As max of sockaddr_un.sun_path is
>> sizeof(helper.sun_path), should check the length of source
>> and use strncpy instead of strcpy.
>> 
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>     v1->v2: Still use strcpy [Paolo]
>> ---
>>  fsdev/virtfs-proxy-helper.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>> index bf2e5f3..13fe032 100644
>> --- a/fsdev/virtfs-proxy-helper.c
>> +++ b/fsdev/virtfs-proxy-helper.c
>> @@ -738,6 +738,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
>>          return -1;
>>      }
>>  
>> +    g_assert(strlen(path) < sizeof(proxy.sun_path));
>>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
>
> path is user input.  While the assertion check silences Coverity, it is
> not suitable for input validation.  Users expect a graceful exit with an
> error message, not an assertion failure if the given path is too long.
>
> I will send a patch.

That is the proxy helper. The assert will cause an exit() which is good,
isn't it ? I did update the qemu side of the patch to do a graceful exit

-aneesh


