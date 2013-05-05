Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UYzOf-0004aE-K6
	for mharc-qemu-trivial@gnu.org; Sun, 05 May 2013 09:54:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UYzOd-0004Yq-Vj
	for qemu-trivial@nongnu.org; Sun, 05 May 2013 09:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UYzOc-0005sP-PO
	for qemu-trivial@nongnu.org; Sun, 05 May 2013 09:54:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UYzOa-0005rj-3V; Sun, 05 May 2013 09:54:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 526874000C;
	Sun,  5 May 2013 17:54:31 +0400 (MSK)
Message-ID: <51866496.5050400@msgid.tls.msk.ru>
Date: Sun, 05 May 2013 17:54:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1367677057-6809-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1367677057-6809-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.5] audio: update documentation
 after removing --audio-card-list option
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
X-List-Received-Date: Sun, 05 May 2013 13:54:36 -0000

04.05.2013 18:17, Herv=C3=A9 Poussineau wrote:
> Commit 98af93fde2e37b5b0c8cee9036e028fe6df6446c removed the
> --audio-card-list option in configure, and commit
> 8f3b664f6cc4153cc73941c941d54c4e499b7537 always compiled in
> the adlib, gus and cs4231a audio cards.

Added to the trivial patches queue (ba1c243ed54660282d2394a2b4ee9e82c4597=
f95).
Thank you!

/mjt

