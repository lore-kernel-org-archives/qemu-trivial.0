Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7ZnK-0001u7-A5
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 18:34:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T7ZnI-0001tq-Ki
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 18:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T7ZnH-0007WN-IP
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 18:34:28 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:44697
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T7ZnH-0007WH-Bt
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 18:34:27 -0400
Received: from treguer.localnet ([90.32.144.8]) by mwinf5d09 with ME
	id taaS1j00A0B56Sa03aaSAH; Sat, 01 Sep 2012 00:34:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Organization: BZH lan
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 1 Sep 2012 00:34:25 +0200
User-Agent: KMail/1.13.5 (Linux/3.5.3-treguer; KDE/4.4.5; x86_64; ; )
References: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
	<20120831064931.GA6425@stefanha-thinkpad.localdomain>
In-Reply-To: <20120831064931.GA6425@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201209010034.25433.yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.127
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2 v2] Fix static linking for cURL and
	SDL
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
X-List-Received-Date: Fri, 31 Aug 2012 22:34:29 -0000

Stefan, All,

On Friday 31 August 2012 08:49:31 Stefan Hajnoczi wrote:
> Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>

BTW, I'm not that used to dealing with SoB-lines and the likes.

Is it valid for both patches (once the remaining cURL reference is
removed in patch 2)?

Should I add your reviewed-by to my commit message before I resubmit,
or will it be done by whoever commits this patchset in the tree?

Thanks for putting up with me!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

