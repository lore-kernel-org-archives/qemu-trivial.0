Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEbEC-0002Jr-9P
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:12:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEbEA-0002HV-1L
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:12:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEbE9-00058n-8G
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:12:33 -0500
Received: from out114-135.biz.mail.alibaba.com ([205.204.114.135]:52233
	helo=out11.biz.mail.alibaba.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEbE3-00057x-Ey; Fri, 23 Jan 2015 05:12:27 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08026004|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03016; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.194.100.112);
	Fri, 23 Jan 2015 18:12:15 +0800
Message-ID: <54C22049.4000403@sunrus.com.cn>
Date: Fri, 23 Jan 2015 18:19:53 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C20C26.6010204@sunrus.com.cn>
	<CAFEAcA8ouuFXLJcTdM5B1hbj5_cZ1TKQgrJtFiCpaUJaYjGEAw@mail.gmail.com>
In-Reply-To: <CAFEAcA8ouuFXLJcTdM5B1hbj5_cZ1TKQgrJtFiCpaUJaYjGEAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.135
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Need
 call unlock_user() before go to failure return in default case
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
X-List-Received-Date: Fri, 23 Jan 2015 10:12:35 -0000

On 1/23/15 18:01, Peter Maydell wrote:
> On 23 January 2015 at 08:53, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>> In abi_long do_ioctl_dm(), after calls lock_user(), it does not call
>> unlock_user() before go to failure return in default case.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  linux-user/syscall.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index aaac6a2..290fdea 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -3681,6 +3681,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
>>          }
>>          default:
>>              ret = -TARGET_EINVAL;
>> +            unlock_user(argptr, guest_data, 0);
>>              goto out;
>>          }
>>          unlock_user(argptr, guest_data, guest_data_size);
>> --
>> 1.9.3 (Apple Git-50)
> 
> Correct as far as it goes, but notice that we have the identical
> bug in the other switch (ie->host_cmd) as well...
> 

Oh, really, thanks. I shall send patch v2 for it, if no additional reply
within 2 days.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

