Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsmlO-00055m-8n
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:13:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmlL-000528-U4
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmlK-0000CU-0R
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:13:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsmlG-000060-6X; Sat, 08 Oct 2016 04:13:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A205E40EB7;
	Sat,  8 Oct 2016 11:13:34 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 2E30DB26;
	Sat,  8 Oct 2016 11:13:34 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
References: <1475219235-21273-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <66721ad4-8bb5-0b2d-6fa1-fdfdc4fedb01@msgid.tls.msk.ru>
Date: Sat, 8 Oct 2016 11:13:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475219235-21273-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add usermode related config
 files
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2016 08:13:44 -0000

30.09.2016 10:07, Thomas Huth wrote:
> The default-configs/*-linux-user.mak belong to Linux usermode
> emulation, and default-configs/*-bsd-user.mak belong to BSD
> usermode emulation.

Applied to -trivial, thanks!

/mjt

