Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZufBw-0006IK-Oz
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 06:28:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZufBt-0006E4-J5
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 06:28:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZufBo-0004r1-JJ
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 06:28:21 -0500
Received: from [59.151.112.132] (port=57134 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZufBo-0004m4-26
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 06:28:16 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="175940"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2015 19:27:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA6BRNC2024971;
	Fri, 6 Nov 2015 19:27:23 +0800
Received: from [10.167.226.57] (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 6 Nov 2015 19:28:00 +0800
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1446700614-16138-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<563C6095.5000503@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <563C8ED4.3060503@cn.fujitsu.com>
Date: Fri, 6 Nov 2015 19:28:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <563C6095.5000503@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] object_new_with_type: remove redundant
	code
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
X-List-Received-Date: Fri, 06 Nov 2015 11:28:22 -0000

Hi Michael,

     Thanks very much for your reply, there is a tiny mistake here, I 
sent the patch with email format typo "=qemu-devel@nongnu.org" and got 
"undeliverable" feeback. so I sent it again...I thought you can`t 
receive the 1st one, but obviously I make a wrong guess...I Already 
replied the 2nd one stating that I realized I am wrong about this patch: 
type_initialize(type) is used to assign a value to type->instance_size 
when it is called 1st time, so it could malloc in the following.

Your opinion make sense to me, thanks for sharing it with me. As a 
personal habit, I prefer to figure out the arch of the project when I 
learn it, and you know, sometimes it is hard to figure out why author 
wrote that way, especially lacking of doc and comment, and having no one 
around to discuss with. So, Thanks very much for discussing with me and 
your time, I appreciate it.

On 11/06/2015 04:11 PM, Michael Tokarev wrote:
> 05.11.2015 08:16, Cao jin wrote:
>> g_assert & type_initialize are called in object_initialize_with_type
>
> object_new_with_type() is a separate QOM API function.  If we're
> to rely on other functions calling it to check for parameters,
> we should probably remove it from public API and make it static.
>
> And yes, I'm aware of the fact that currently object_new_with_type()
> is only called from object_initialize_with_type().  This is not a
> good reason to drop the check/init, since object_new_with_type()
> remains a published API and might be used in other places in the
> future.
>
> Thanks,
>
> /mjt
> .
>

-- 
Yours Sincerely,

Cao Jin

