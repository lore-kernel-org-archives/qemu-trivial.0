Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkJcZ-0004Al-0n
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 15:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkJcX-00048n-0C
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 15:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkJcW-0000aS-5S
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 15:43:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UkJcT-0000T6-2I; Wed, 05 Jun 2013 15:43:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4B53140AA8;
	Wed,  5 Jun 2013 23:43:38 +0400 (MSK)
Message-ID: <51AF94E8.1020600@msgid.tls.msk.ru>
Date: Wed, 05 Jun 2013 23:43:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/5] oslib-posix: add qemu_pipe_non_block
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
X-List-Received-Date: Wed, 05 Jun 2013 19:43:45 -0000

05.06.2013 00:23, Alon Levy wrote:
> Used by the followin patch.
> 
> +int qemu_pipe_non_block(int pipefd[2]);

A nitpick.  I'd name it qemu_pipe_nonblock(), like O_NONBLOCK
is named, but that may be just me.

Thanks,

/mjt

