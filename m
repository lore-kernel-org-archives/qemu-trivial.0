Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2LOs-0005bs-S0
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 13:34:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LOn-0005a4-0A
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:34:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LOm-0008Gl-8f
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:34:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2LOh-0008G4-Q9; Sun, 23 Apr 2017 13:34:07 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CCCB141F5A;
	Sun, 23 Apr 2017 20:34:05 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B3D243F8;
	Sun, 23 Apr 2017 20:34:05 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>
References: <1485377117-18105-1-git-send-email-thuth@redhat.com>
	<f524e29d-6e8c-19b0-e170-2a6876cbfe69@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <c00a72ff-a3a0-76d1-1b0e-4477bddeff2f@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 20:34:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f524e29d-6e8c-19b0-e170-2a6876cbfe69@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/core/generic-loader: Fix crash when
 running without CPU
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
X-List-Received-Date: Sun, 23 Apr 2017 17:34:13 -0000

27.02.2017 22:36, Thomas Huth wrote:
> On 25.01.2017 21:45, Thomas Huth wrote:
>> When running QEMU with "-M none -device loader,file=kernel.elf", it
>> currently crashes with a segmentation fault, because the "none"-machine
>> does not have any CPU by default and the generic loader code tries
>> to dereference s->cpu. Fix it by adding an appropriate check for a
>> NULL pointer.

Applied to -trivial, thanks!

/mjt

