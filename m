Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIKB9-0004FG-7l
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 12:53:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKB7-0004Cn-Jh
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKB6-0003fP-Nd
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:53:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIKB0-0003dq-Rk; Sun, 10 Jan 2016 12:53:15 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 185714035B;
	Sun, 10 Jan 2016 20:53:15 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1450713257-17108-1-git-send-email-eblake@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929A89.6090804@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 20:53:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450713257-17108-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] crypto: Fix typo in example
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
X-List-Received-Date: Sun, 10 Jan 2016 17:53:22 -0000

21.12.2015 18:54, Eric Blake wrote:
> The example code wouldn't even compile, since it did not use
> a consistent spelling for the Error ** parameter.


Applied to -trivial, thanks!

/mjt

