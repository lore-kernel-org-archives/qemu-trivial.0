Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWNmX-0006aN-Qa
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 02:43:41 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RWNmU-0006PS-0r
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RWNmT-0005A2-2j
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:43:37 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RWNmQ-00059U-Su; Fri, 02 Dec 2011 02:43:35 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8F174728188C; Fri,  2 Dec 2011 08:43:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 8jDIW8VVKi+7; Fri,  2 Dec 2011 08:42:54 +0100 (CET)
Received: from [192.168.178.20] (p5086F501.dip.t-dialin.net [80.134.245.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	02B4D7281889; Fri,  2 Dec 2011 08:42:53 +0100 (CET)
Message-ID: <4ED88173.2040505@weilnetz.de>
Date: Fri, 02 Dec 2011 08:42:43 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Mark Wu <wudxw@linux.vnet.ibm.com>
References: <1322796863-3475-1-git-send-email-zhihuili@linux.vnet.ibm.com>
	<4ED87E29.1010207@linux.vnet.ibm.com>
In-Reply-To: <4ED87E29.1010207@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Li Zhi Hui <zhihuili@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-nbd.c : fix memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 07:43:39 -0000

Am 02.12.2011 08:28, schrieb Mark Wu:
> On 12/02/2011 11:34 AM, Li Zhi Hui wrote:
>> Signed-off-by: Li Zhi Hui<zhihuili@linux.vnet.ibm.com>
>> ---
>>   qemu-nbd.c |    4 +++-
>>   1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/qemu-nbd.c b/qemu-nbd.c
>> index 291cba2..ab7fa6c 100644
>> --- a/qemu-nbd.c
>> +++ b/qemu-nbd.c
>> @@ -500,8 +500,10 @@ int main(int argc, char **argv)
>>           sharing_fds[0] = tcp_socket_incoming(bindto, port);
>>       }
>>
>> -    if (sharing_fds[0] == -1)
>> +    if (sharing_fds[0] == -1) {
>> +        g_free(sharing_fds);
>>           return 1;
>> +    }
>>
>>       if (device) {
>>           int ret;
> Zhihui,
>
> Kernel should free all memory used by the process after it exits.  So  
> there's no memory leak even without explicit free.

That's correct. Nevertheless fixing this helps to find other more important
memory leaks with static or dynamic code analyzers like cppcheck or 
valgrind.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



