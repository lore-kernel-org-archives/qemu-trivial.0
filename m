Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZKK7-0004nX-Kj
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 10:28:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aZKK4-0004he-Lr
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:28:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aZKK0-000844-Os
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:28:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aZKJx-00082y-4I; Fri, 26 Feb 2016 10:28:45 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 4B70A7F0A2;
	Fri, 26 Feb 2016 15:28:43 +0000 (UTC)
Received: from [10.10.58.27] (vpn-58-27.rdu2.redhat.com [10.10.58.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1QFSfG9014724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Feb 2016 10:28:42 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com> <56D04596.7010205@huawei.com>
	<CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
	<56D06712.2030607@linaro.org>
	<CAFEAcA8DE2Sx4+Rm8cg-tLktW0hz9VcV_7O2jWN5OeA9CwyF4w@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56D06F29.7040106@redhat.com>
Date: Fri, 26 Feb 2016 09:28:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8DE2Sx4+Rm8cg-tLktW0hz9VcV_7O2jWN5OeA9CwyF4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] arm: virt: change GPIO
 trigger interrupt to pulse
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
X-List-Received-Date: Fri, 26 Feb 2016 15:28:53 -0000



On 02/26/2016 09:06 AM, Peter Maydell wrote:
> On 26 February 2016 at 14:54, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> On 2016/2/26 20:53, Peter Maydell wrote:
>>> I don't understand why a 500ms pulse is better than a short one.
>>>
>> Oh, I just pick a value which seems like a real latency for pressing a
>> button. What's your suggestion?
> 
> I would prefer to avoid the pain of having a timer whose state
> needs to be migrated. It's unclear to me why a 500ms pulse
> will solve anything that an instantaneous pulse does not,
> so I'd like to better understand the problem first.

The problem we found with pulse was: only the last state change in GPIO
is received by guest VM. In other words, with 0(L)->1(H)->0(L) or
1(H)->0(L)->1(0), PL061 only sees the last state (0 and 1). I guess this
is because QEMU is non-preemptive. The solution is to have the following
steps:
  * qemu_set_irq(gpio_in, 1)
  * yeild to guest VM
  * qemu_set_irq(gpio_in, 0)

Is there any way to do so in QEMU without using timer?

> 
> thanks
> -- PMM
> 

