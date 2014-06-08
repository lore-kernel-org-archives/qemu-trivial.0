Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtdO3-0007DU-6a
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 09:43:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtdNv-00075Q-6Y
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 09:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtdNo-0002eG-Q6
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 09:43:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WtdNc-0002c4-0n; Sun, 08 Jun 2014 09:43:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1B4B940DD7;
	Sun,  8 Jun 2014 17:43:21 +0400 (MSK)
Message-ID: <53946878.3060606@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 17:43:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1402060885-18332-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1402060885-18332-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] cpu/x86: correctly set errors in
	x86_cpu_parse_featurestr
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
X-List-Received-Date: Sun, 08 Jun 2014 13:43:49 -0000

06.06.2014 17:21, Paolo Bonzini wrote:
> Because of the "goto out", the contents of local_err are leaked
> and lost.

Might just as well change 'goto out' to 'break' (instead of return),
and handle the `if (local_err)' like you did.

Applied to -trivial, thank you!

/mjt

