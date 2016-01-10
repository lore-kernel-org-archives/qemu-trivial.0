Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIK4t-0008GW-3H
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 12:46:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK4r-0008En-7D
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK4q-0001rh-Ev
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:46:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIK4k-0001qB-5Z; Sun, 10 Jan 2016 12:46:46 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A82940359;
	Sun, 10 Jan 2016 20:46:43 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1449232726-18984-1-git-send-email-pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929902.5010104@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 20:46:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1449232726-18984-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] net: convert qemu_log to error_report,
	fix message
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
X-List-Received-Date: Sun, 10 Jan 2016 17:46:54 -0000

04.12.2015 15:38, Paolo Bonzini wrote:
> Ensure that the error is printed with the proper timestamp.

Applied to -trivial, thank you!

/mjt

