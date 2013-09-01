Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGA7v-0001Tw-Ec
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 12:03:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGA7o-0001MK-EI
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 12:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGA7i-00030x-Bq
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 12:03:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGA7V-0002sU-Oy; Sun, 01 Sep 2013 12:03:21 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D4A8A4012D;
	Sun,  1 Sep 2013 20:03:20 +0400 (MSK)
Message-ID: <52236548.1080408@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 20:03:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377815534-13608-1-git-send-email-alex@alex.org.uk>
	<5220192E.5040301@weilnetz.de>
In-Reply-To: <5220192E.5040301@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Alex Bligh <alex@alex.org.uk>
Subject: Re: [Qemu-trivial] [PATCHv2] aio / timers: use g_usleep() not
	sleep()
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
X-List-Received-Date: Sun, 01 Sep 2013 16:03:46 -0000

30.08.2013 08:01, Stefan Weil wrote:
> Am 30.08.2013 00:32, schrieb Alex Bligh:
>> sleep() apparently doesn't exist under mingw. Use g_usleep for
>> portability.

Thanks, applied to the trivial-patches queue.

/mjt

