Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPYob-0006xB-Ao
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 10:46:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WPYoU-0006nE-4P
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 10:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WPYoN-0005OF-Rw
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 10:46:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WPYoB-0005JN-Or; Mon, 17 Mar 2014 10:46:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B106E42766;
	Mon, 17 Mar 2014 18:46:30 +0400 (MSK)
Message-ID: <53270AC6.4030808@msgid.tls.msk.ru>
Date: Mon, 17 Mar 2014 18:46:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394992972-23004-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394992972-23004-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] util: Add 'static' attribute to function
 implementation
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
X-List-Received-Date: Mon, 17 Mar 2014 14:46:56 -0000

16.03.2014 22:02, Stefan Weil wrote:
> The static code analyzer smatch complains because of a missing 'static'
> attribute:

Thanks, applied to -trivial.

/mjt

