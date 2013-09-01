Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9rJ-000376-VF
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9rD-0002vP-NK
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9r9-0005yl-KQ
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:46:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9qx-0005xf-W1; Sun, 01 Sep 2013 11:46:16 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B7E204012D;
	Sun,  1 Sep 2013 19:46:14 +0400 (MSK)
Message-ID: <52236146.3050801@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:46:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
	<52207C25.9070302@siemens.com>
In-Reply-To: <52207C25.9070302@siemens.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Taimoor <taimoor.mrza@gmail.com>,
	Taimoor Mirza <tmirza@codesourcery.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] slirp: Port redirection option behave
 differently on Linux and Windows
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
X-List-Received-Date: Sun, 01 Sep 2013 15:46:36 -0000

30.08.2013 15:04, Jan Kiszka wrote:
> On 2013-08-15 21:25, Taimoor wrote:
>> From: Taimoor Mirza <tmirza@codesourcery.com>
>>
>> port redirection code uses SO_REUSEADDR socket option before binding to
>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
>> Relaunching QEMU with same host and guest port redirection values on Linux
>> throws error but on Windows it does not throw any error.
>> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
[]
> Stefan, can you ack this? Then I would pick it up for the slirp queue.

I remember having exactly the same issue myself a few years back with
the difference of SO_REUSEADDR behavour on windows and *nix, and the
suggested change appears to be correct.  So you can count on my

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

as well.

I applied the v2 of this patch (with a trivial fix) to trivial queue
(before seeing this v3), I can remove it if you like.

Thanks,

/mjt

