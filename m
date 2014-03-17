Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPYmI-0003FK-2t
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 10:44:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WPYmA-00033q-3g
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 10:44:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WPYm4-0004f1-5D
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 10:44:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WPYlr-0004cZ-Vl; Mon, 17 Mar 2014 10:44:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6E0F442725;
	Mon, 17 Mar 2014 18:43:59 +0400 (MSK)
Message-ID: <53270A2F.4070309@msgid.tls.msk.ru>
Date: Mon, 17 Mar 2014 18:43:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394977751-18881-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394977751-18881-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-s390x: Add missing 'static' and
 'const' attributes
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
X-List-Received-Date: Mon, 17 Mar 2014 14:44:32 -0000

16.03.2014 17:49, Stefan Weil wrote:
> This fixes warnings from the static code analysis (smatch).

Thanks, applied to -trivial.

/mjt

