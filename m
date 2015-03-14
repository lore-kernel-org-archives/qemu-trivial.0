Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWanF-0006RF-VI
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 21:23:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWanE-0006PI-6B
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 21:23:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWanD-0002bZ-81
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 21:23:08 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:26775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWan6-0002ZD-Ik; Fri, 13 Mar 2015 21:23:01 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIL66717; Sat, 14 Mar 2015 09:19:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 14 Mar 2015 09:19:25 +0800
Message-ID: <55038C9B.7050607@huawei.com>
Date: Sat, 14 Mar 2015 09:19:23 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1426244956-5316-1-git-send-email-zhaoshenglong@huawei.com>
	<5502DD26.6070401@redhat.com>
In-Reply-To: <5502DD26.6070401@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-proxy: Fix possible
	overflow
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
X-List-Received-Date: Sat, 14 Mar 2015 01:23:09 -0000

On 2015/3/13 20:50, Paolo Bonzini wrote:
> 
> 
> On 13/03/2015 12:09, Shannon Zhao wrote:
>> +    g_assert(strlen(path) < sizeof(helper.sun_path));
> 
> Ok.
> 
>>      sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
>>      if (sockfd < 0) {
>>          fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
>>          return -1;
>>      }
>> -    strcpy(helper.sun_path, path);
>> +    strncpy(helper.sun_path, path, sizeof(helper.sun_path));
> 
> strcpy is okay here.  strncpy makes people think of what happens if
> strlen(path) == sizeof(helper.sun_path).  While this cannot happen here
> because of the assertion, the function should still be used with care.
> 

Thanks, will fix along with the other patch.

-- 
Thanks,
Shannon


