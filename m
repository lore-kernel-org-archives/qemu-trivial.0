Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSnHm-0000A5-8C
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 11:31:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bSnHk-00006p-91
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bSnHi-00042G-HB
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:31:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bSnHd-000416-56; Thu, 28 Jul 2016 11:31:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 34439429C0;
	Thu, 28 Jul 2016 18:31:34 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1468596562-28609-1-git-send-email-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <92f7fc1e-5b94-4376-c07d-3d41e33820e2@msgid.tls.msk.ru>
Date: Thu, 28 Jul 2016 18:31:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1468596562-28609-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] target-m68k: fix get_mac_extf helper
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
X-List-Received-Date: Thu, 28 Jul 2016 15:31:45 -0000

15.07.2016 18:29, Paolo Bonzini wrote:
> val is assigned twice; the second one should be combined with "|".
> Reported by Coverity.

Applied to -trivial, thanks!

/mjt

