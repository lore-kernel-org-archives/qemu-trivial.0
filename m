Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqEiX-00040N-LB
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 00:19:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqEiR-0003os-4V
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:19:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqEiM-0000cP-5N
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:19:07 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:5064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XqEiB-0000bc-3u; Mon, 17 Nov 2014 00:18:52 -0500
Received: from 172.24.2.119 (EHLO szxeml424-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCL67465; Mon, 17 Nov 2014 13:18:25 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml424-hub.china.huawei.com
	(10.82.67.163) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 17 Nov 2014 13:18:13 +0800
Message-ID: <54698515.9040203@huawei.com>
Date: Mon, 17 Nov 2014 13:18:13 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1415931488-2484-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<87oasa2kqh.fsf@blackfin.pond.sub.org>
In-Reply-To: <87oasa2kqh.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] libcacard: fix resource
	leak
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
X-List-Received-Date: Mon, 17 Nov 2014 05:19:12 -0000

On 2014/11/14 17:29, Markus Armbruster wrote:
> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>
>> In function connect_to_qemu(), getaddrinfo() will allocate memory
>> that is stored into server, it should be freed by using freeaddrinfo()
>> before connect_to_qemu() return.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>> v2:
>> - fix typo in title ;)
>> ---
>>   libcacard/vscclient.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
>> index 80111df..fa6041d 100644
>> --- a/libcacard/vscclient.c
>> +++ b/libcacard/vscclient.c
>> @@ -597,7 +597,7 @@ connect_to_qemu(
>>       const char *port
>>   ) {
>>       struct addrinfo hints;
>> -    struct addrinfo *server;
>> +    struct addrinfo *server = NULL;
>>       int ret, sock;
>>
>>       sock = socket(AF_INET, SOCK_STREAM, 0);
>> @@ -629,9 +629,14 @@ connect_to_qemu(
>>       if (verbose) {
>>           printf("Connected (sizeof Header=%zd)!\n", sizeof(VSCMsgHeader));
>>       }
>> +
>> +    freeaddrinfo(server);
>>       return sock;
>>
>>   cleanup_socket:
>> +    if (server) {
>> +        freeaddrinfo(server);
>> +    }
>>       closesocket(sock);
>>       return -1;
>>   }
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Aside: this code uses the first result from getaddrinfo(), and fails if
> it can't connect.  This is a common misuse of getaddrinfo().
>
> Consider a remote host with both an IPv4 and an IPv6 address, but only
> one of them actually connects.  If getaddrinfo() puts the connectable
> one first, we succeed.  Else, we fail.
>
> We should try the addresses in order until connect() succeeds, like
> qemu-sockets.c does.

Good catch, i will fix it soon. And this patch mainly fix the coverity warning.
Maybe i should fix the problem after this patch been merged. ;) Thanks.



