Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XuAjS-0001Dq-RU
	for mharc-qemu-trivial@gnu.org; Thu, 27 Nov 2014 20:52:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XuAjK-0001D3-MD
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 20:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XuAjF-0002oj-Qo
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 20:52:18 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:1332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XuAjF-0002oF-8Z; Thu, 27 Nov 2014 20:52:13 -0500
Received: from 172.24.2.119 (EHLO szxeml406-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDB84974; Fri, 28 Nov 2014 09:52:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml406-hub.china.huawei.com
	(10.82.67.93) with Microsoft SMTP Server id 14.3.158.1; Fri, 28 Nov 2014
	09:51:52 +0800
Message-ID: <5477D530.7030101@huawei.com>
Date: Fri, 28 Nov 2014 09:51:44 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<1415881027-8112-3-git-send-email-arei.gonglei@huawei.com>
	<87h9xkkdxx.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9xkkdxx.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] virtfs-proxy-helper:
 Fix handle leak to make Coverity happy
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
X-List-Received-Date: Fri, 28 Nov 2014 01:52:24 -0000

On 2014/11/27 20:47, Markus Armbruster wrote:

> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Coverity report:
>> (94) Event open_fn:  Returning handle opened by function "proxy_socket(char const *, uid_t, gid_t)". [details]
>> (95) Event var_assign:  Assigning: "sock" = handle returned from "proxy_socket(sock_name, own_u, own_g)".
>> (103) Event leaked_handle:  Handle variable "sock" going out of scope leaks the handle.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  fsdev/virtfs-proxy-helper.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>> index c1da2d7..2d72def 100644
>> --- a/fsdev/virtfs-proxy-helper.c
>> +++ b/fsdev/virtfs-proxy-helper.c
>> @@ -1150,6 +1150,9 @@ int main(int argc, char **argv)
>>  
>>      process_requests(sock);
>>  error:
>> +    if (sock_name && sock >= 0) {
>> +        close(sock);
>> +    }
>>      do_log(LOG_INFO, "Done\n");
>>      closelog();
>>      return 0;
> 
> Why if sock_name?  What about sock gotten from -f?
>

Thanks for your review, Makus :)

 

Because only sock_name is non-NULL, the sock returned from
"proxy_socket(sock_name, own_u, own_g)", then will leak fd.
If sock gotten from -f, maybe the caller will free it IMO.

> If sock >= 0 is pointless, too, but needed to hush up Coverity.

You mean do not check sock_name is NULL or not?

Regards,
-Gonglei


