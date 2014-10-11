Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcnfX-0000nC-1T
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 23:48:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XcnfQ-0000mE-AL
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XcnfK-0004Up-5T
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:48:28 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:49641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XcnfI-0004Ue-Rh; Fri, 10 Oct 2014 23:48:22 -0400
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCS34932; Sat, 11 Oct 2014 11:48:08 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 11 Oct 2014 11:47:56 +0800
Message-ID: <5438A868.1070902@huawei.com>
Date: Sat, 11 Oct 2014 11:47:52 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
	<54389FB1.8040207@huawei.com> <5438A223.2040402@huawei.com>
	<5438A349.9090403@redhat.com> <5438A4E2.4090007@huawei.com>
	<5438A7BB.3060109@redhat.com>
In-Reply-To: <5438A7BB.3060109@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: change free to
	g_free
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
X-List-Received-Date: Sat, 11 Oct 2014 03:48:34 -0000

On 2014/10/11 11:44, Eric Blake wrote:

> On 10/10/2014 09:32 PM, Gonglei wrote:
> 
>>>> Actually, I had noted that C standard says it is a no-operation.
>>>> But that doesn't mean that every C-library handles it like that.
>>>
>>> EVERY libc that is C89 compliant handles it like that.  The last
>>> platform that failed on free(NULL) was SunOS 4, which is such
>>> museum-ware it's not funny.  There is no need to cater to platforms from
>>> 25 years ago.
> 
>>
>> But why some callers make a check,
>> but some other callers don't do this check?
> 
> Because some people haven't learned that free(NULL) is safe yet.  You're
> welcome to simplify code as you touch it.
> 

OK, I will. Thanks again :)

>> Can I consider those check is superfluous?
> 
> Yes.  Checking for NULL before calling free() or g_free() is wasted effort.
> 


Best regards,
-Gonglei


