Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRSfi-00087U-NO
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 12:56:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1RRSff-0007wT-QA
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 12:56:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1RRSfe-0001RG-V2
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 12:56:15 -0500
Received: from fe01x03-cgp.akado.ru ([77.232.31.164]:57396 helo=akado.ru)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>)
	id 1RRSfb-0001QX-QW; Fri, 18 Nov 2011 12:56:11 -0500
Received: from [10.0.66.9] ([10.0.66.9] verified)
	by fe01-cgp.akado.ru (CommuniGate Pro SMTP 5.2.13)
	with ESMTPS id 307977558; Fri, 18 Nov 2011 20:56:05 +0300
Date: Fri, 18 Nov 2011 21:56:01 +0400 (MSK)
From: malc <av1474@comtv.ru>
X-X-Sender: malc@linmac
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1321636580-5478-1-git-send-email-sw@weilnetz.de>
Message-ID: <alpine.LNX.2.00.1111182155490.3465@linmac>
References: <1321636580-5478-1-git-send-email-sw@weilnetz.de>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 77.232.31.164
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] fmodaudio: Remove unused variable
 'bits16' (reported by cppcheck)
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
X-List-Received-Date: Fri, 18 Nov 2011 17:56:16 -0000

On Fri, 18 Nov 2011, Stefan Weil wrote:

> The variable is assigned a value which is never used,
> so remove variable and assignment.
> 

Applied, thanks.

-- 
mailto:av1474@comtv.ru

