Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsmlz-0005XP-0j
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmlw-0005TR-F3
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmlu-0000Zm-Kc
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:14:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsmlp-0000U9-BY; Sat, 08 Oct 2016 04:14:13 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CF3BA40EB7;
	Sat,  8 Oct 2016 11:14:09 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4E4D5B26;
	Sat,  8 Oct 2016 11:14:09 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-devel@nongnu.org
References: <1475220411-22873-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Leon Alrae <leon.alrae@imgtec.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <076cfc47-2079-d084-3898-5c754f274374@msgid.tls.msk.ru>
Date: Sat, 8 Oct 2016 11:14:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475220411-22873-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more MIPS related
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
X-List-Received-Date: Sat, 08 Oct 2016 08:14:21 -0000

30.09.2016 10:26, Thomas Huth wrote:
> The MIPS section is missing some related header files, and files
> in the hw/misc/, hw/intc/ and hw/timer/ folders.

Applied to -trivial, thanks!

/mjt

