Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kiFdP-0005xu-0w
	for mharc-qemu-trivial@gnu.org; Thu, 26 Nov 2020 06:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFdM-0005wF-Ow; Thu, 26 Nov 2020 06:40:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFdJ-0001BX-Oh; Thu, 26 Nov 2020 06:40:20 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ChbQR0BflzkWsD;
 Thu, 26 Nov 2020 19:39:43 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 19:40:04 +0800
Message-ID: <5FBF9413.4050907@huawei.com>
Date: Thu, 26 Nov 2020 19:40:03 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Li Qiang <liq3ea@gmail.com>
CC: Greg Kurz <groug@kaod.org>, <qemu_oss@crudebyte.com>,
 <qemu-trivial@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
References: <20201126101624.55714-1-alex.chen@huawei.com>
 <CAKXe6SLTqMgANNox-Y9=DhZHzRRaqT6taWBu1qenC4hsRe0+Qg@mail.gmail.com>
In-Reply-To: <CAKXe6SLTqMgANNox-Y9=DhZHzRRaqT6taWBu1qenC4hsRe0+Qg@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Nov 2020 11:40:21 -0000

On 2020/11/26 18:50, Li Qiang wrote:
> Alex Chen <alex.chen@huawei.com>
>>
>> Only one of the options -s and -f can be used. When -f is used,
>> the fd is created externally and does not need to be closed.
>> When -s is used, a new socket fd is created, and this socket fd
>> needs to be closed at the end of main().
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> ---
>>  fsdev/virtfs-proxy-helper.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>> index 15c0e79b06..339d477169 100644
>> --- a/fsdev/virtfs-proxy-helper.c
>> +++ b/fsdev/virtfs-proxy-helper.c
>> @@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
>>      process_requests(sock);
>>  error:
>>      g_free(rpath);
>> +    if (sock_name) {
>> +        close(sock);
>> +    }
> 
> If 'proxy_socket' failed, you call close(-1).
> 
> Maybe following is better?
> 
> if (sock >= 0) {
>     close(sock);
> }
> 

Hi Qiang,

Thanks for your review.
The 'sock' need to be closed only when option -s is used, that is when 'sock_name' is not NULL.
So maybe the following is better?

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 15c0e79b06..3ba68d9878 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
     process_requests(sock);
 error:
     g_free(rpath);
+    if (sock_name && (sock >= 0)) {
+        close(sock);
+    }
     g_free(sock_name);
     do_log(LOG_INFO, "Done\n");
     closelog();

Thanks,
Alex


