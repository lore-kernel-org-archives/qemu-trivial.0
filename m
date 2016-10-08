Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsmnU-0006mW-Ig
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmnS-0006lC-VN
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmnS-0001N1-3k
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:15:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsmnK-0001HL-C7; Sat, 08 Oct 2016 04:15:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B822E40EB7;
	Sat,  8 Oct 2016 11:15:41 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4095FB26;
	Sat,  8 Oct 2016 11:15:41 +0300 (MSK)
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1475247721-30670-1-git-send-email-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-stable@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <dec13070-90ba-c0aa-b514-32a8716d2e49@msgid.tls.msk.ru>
Date: Sat, 8 Oct 2016 11:15:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475247721-30670-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] char: fix missing return in error path
 for chardev TLS init
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
X-List-Received-Date: Sat, 08 Oct 2016 08:15:55 -0000

30.09.2016 18:02, Daniel P. Berrange wrote:
> If the qio_channel_tls_new_(server|client) methods fail,
> we disconnect the client. Unfortunately a missing return
> means we then go on to try and run the TLS handshake on
> a NULL I/O channel. This gives predictably segfaulty
> results.

Applied to -trivial, thanks!

/mjt

