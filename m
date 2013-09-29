Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQN34-0005Nq-8x
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 15:52:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQN2x-0005E2-NJ
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:52:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQN2t-0004q1-4C
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:52:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQN2k-0004oo-Eh; Sun, 29 Sep 2013 15:52:38 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 254B4429EB;
	Sun, 29 Sep 2013 23:52:37 +0400 (MSK)
Message-ID: <52488505.90903@msgid.tls.msk.ru>
Date: Sun, 29 Sep 2013 23:52:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1378625945-15525-1-git-send-email-linux@roeck-us.net>
	<5233E059.8090402@roeck-us.net> <52487BAB.4010703@redhat.com>
In-Reply-To: <52487BAB.4010703@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Landley <rob@landley.net>, qemu-devel@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-trivial] [PATCH] sh4: Fix serial line access for Linux
 kernels later than 3.2
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
X-List-Received-Date: Sun, 29 Sep 2013 19:52:56 -0000

29.09.2013 23:12, Paolo Bonzini wrote:
> sh4 is ~orphan so nobody should complain if qemu-trivial picks this up
> as well.
>
> Paolo
>
> Il 14/09/2013 06:04, Guenter Roeck ha scritto:
>> On 09/08/2013 12:39 AM, Guenter Roeck wrote:
>>> With Linux kernel version 3.3 or later, qemu fails with the following
>>> message:
>>>
>>> sh_serial: unsupported read from 0x18
>>>     Aborted
>>>
>>> Reported-and-analyzed-by: Rob Landley <rob@landley.net>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> ping ...
>>
>>> ---
>>> See http://lists.nongnu.org/archive/html/qemu-devel/2012-07/msg03870.html
>>> for Rob's analysis of the problem. Unfortunately, the patch never made it
>>> into qemu.

Thanks, applied to the trivial patches queue.

/mjt

