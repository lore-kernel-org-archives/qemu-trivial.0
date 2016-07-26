Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bS1ZF-0007JN-Ko
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2016 08:34:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bS1ZB-0007Fk-Pk
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 08:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bS1Z6-0006nK-T8
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 08:34:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bS1Yy-0006iM-TP; Tue, 26 Jul 2016 08:34:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AE601426C9;
	Tue, 26 Jul 2016 15:34:17 +0300 (MSK)
To: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>
References: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <f6ea2646-d8ea-c0bd-60bc-fd6884abaf50@msgid.tls.msk.ru>
Date: Tue, 26 Jul 2016 15:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] linux-user,
 trivial: display "0x%x" instead of "0x%d"
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
X-List-Received-Date: Tue, 26 Jul 2016 12:34:35 -0000

20.06.2016 12:51, Laurent Vivier wrote:
> Display an exception number, generally defined as an hexadecimal
> number (for instance, EXCP_HLT is 0x10001).

Applied to -trivial, thanks!

/mjt


