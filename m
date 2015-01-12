Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAaoq-00033r-E1
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jan 2015 03:57:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAaoo-00031R-QP
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 03:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAaoo-0000Y2-0B
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 03:57:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YAaoj-0000WV-K7; Mon, 12 Jan 2015 03:57:45 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D5DE0406C6;
	Mon, 12 Jan 2015 11:57:44 +0300 (MSK)
Message-ID: <54B38C88.7040203@msgid.tls.msk.ru>
Date: Mon, 12 Jan 2015 11:57:44 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: David Morrison <dmorrison@invlim.com>, famz@redhat.com, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, proljc@gmail.com, 
	peter.maydell@linaro.org
References: <1420563978-19101-1-git-send-email-dmorrison@invlim.com>
In-Reply-To: <1420563978-19101-1-git-send-email-dmorrison@invlim.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] target-openrisc: bugfix for dec_sys
 to decode instructions correctly
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
X-List-Received-Date: Mon, 12 Jan 2015 08:57:51 -0000

06.01.2015 20:06, David Morrison wrote:
> Fixed the decoding of "system" instructions (starting with 0x2)
> in dec_sys() in translate.c.  In particular, the l.trap instruction
> is now correctly decoded, which enables for singlestepping and
> breakpoints to be set in GDB.

Applied to -trivial, thank you!

/mjt

