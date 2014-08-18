Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLNC-0000kA-Mr
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:45:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLN4-0000Y6-Tq
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLMy-0008Mw-QW
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:45:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLMm-0008Ku-CM; Mon, 18 Aug 2014 07:44:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8BC314380F;
	Mon, 18 Aug 2014 15:44:47 +0400 (MSK)
Message-ID: <53F1E72F.3040402@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:44:47 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
 qemu-devel@nongnu.org
References: <737df733ddb4779e1dcb24b14d1b5d223509dce7.1408322869.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <737df733ddb4779e1dcb24b14d1b5d223509dce7.1408322869.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [Qemu-trivial] [PATCH trivial v1 1/2] microblaze: ml605: Get
 rid of ddr_base variable
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
X-List-Received-Date: Mon, 18 Aug 2014 11:45:13 -0000

18.08.2014 04:52, Peter Crosthwaite wrote:
> It's a constant based on a macro. Just use the macro in place.

Applied both to -trivial, thanks!

/mjt

