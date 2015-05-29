Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yy9yw-0004ER-IP
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 22:25:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yy9yu-0004Cl-DL
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 22:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yy9yr-0001wd-8z
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 22:25:08 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yy9yq-0001sA-Jn; Thu, 28 May 2015 22:25:05 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMB51603; Fri, 29 May 2015 10:22:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 29 May 2015 10:21:09 +0800
Message-ID: <5567CD12.9040106@huawei.com>
Date: Fri, 29 May 2015 10:21:06 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<55670B48.20106@msgid.tls.msk.ru>
In-Reply-To: <55670B48.20106@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 00/29] Fix memory leak relevant to
	calling qemu_allocate_irqs
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
X-List-Received-Date: Fri, 29 May 2015 02:25:09 -0000



On 2015/5/28 20:34, Michael Tokarev wrote:
> 28.05.2015 15:08, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Before I sent some patches to fix memory leak spotted by valgrind and
>> those are relevant to qemu_allocate_irqs. Then I find all the places
>> calling this function through code searching and test by valgrind to
>> check whether they have memory leak. These patches fix these memory leaks.
>>
>> Sorry that maybe the names of the patches are vertiginous while I could
>> not find out better names and I try to sort them out.
> 
> Maybe a better subject will be "fix memory leak after qemu_allocate_irqs"
> or something like that?  And for some, "use qemu_allocate_irq not _irqs
> for single irq" -- this kind is sorta fun, I wonder why the codebase has
> so many cases of this API misuse.
> 
> And one more question: do you really care that whole valgrind report is
> included into every commit message? :)  
not really, while these reports show people the problems. You could deal
them in your way.

Thanks,

-- 
Shannon


