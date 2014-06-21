Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyMpZ-0007Ia-2U
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 11:03:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyMpR-0007CR-K1
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyMpL-0006MR-G8
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:03:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyMp8-00064G-Vo; Sat, 21 Jun 2014 11:03:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DF58F41E41;
	Sat, 21 Jun 2014 19:03:21 +0400 (MSK)
Message-ID: <53A59EB9.4020208@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 19:03:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, kwolf@redhat.com, 
	stefanha@redhat.com
References: <53A581FC.6050305@gmail.com>
In-Reply-To: <53A581FC.6050305@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] block.c: Remove useless 'buf'
	variable
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
X-List-Received-Date: Sat, 21 Jun 2014 15:03:48 -0000

21.06.2014 17:00, Chen Gang wrote:
> 'buf' is not used actually, so remove it and related snprintf() statement.

Applied to -trivial, after removing wrong reference to dtc submodule removal.
Please don't include these in diffs.

Thanks,

/mjt

