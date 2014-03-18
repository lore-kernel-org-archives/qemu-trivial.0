Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPr3E-0002Bd-7Q
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 06:15:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WPr37-00029k-RY
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 06:15:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WPr33-0002sX-Ep
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 06:15:09 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:53145 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WPr33-0002lz-9k; Tue, 18 Mar 2014 06:15:05 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WPr3J-00021o-9b; Tue, 18 Mar 2014 11:15:21 +0100
References: <1394633633-18211-1-git-send-email-alex.bennee@linaro.org>
	<53232591.50005@msgid.tls.msk.ru>
User-agent: mu4e 0.9.9.6pre2; emacs 24.3.50.13
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <87siqfn78r.fsf@linaro.org>
In-reply-to: <53232591.50005@msgid.tls.msk.ru>
Date: Tue, 18 Mar 2014 10:15:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PULL 0/4] Travis Updates
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
X-List-Received-Date: Tue, 18 Mar 2014 10:15:14 -0000


Michael Tokarev <mjt@tls.msk.ru> writes:

> 12.03.2014 18:13, alex.bennee@linaro.org wrote:
>> From: Alex Bennée <alex.bennee@linaro.org>
>> 
>> are available in the git repository at:
>> 
>> 
>>   git@github.com:stsquad/qemu.git travis-updates
>> 
>> for you to fetch changes up to 3e6fa9a5bb773d0d7d22d9aea0495d91404dfd3d:
>
> Thanks, applied all 4 to the trivial patches queue.
> Not verified if the thing actually works, so.. all blames are up to you :)

Well we should only see spam on the IRC channel the first time someone
breaks the master tree. So far all the auto-builds have worked fine so
it's obviously doing its job well ;-)

>
> /mjt

-- 
Alex Bennée


