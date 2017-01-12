Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRdTu-0008Sa-68
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:23:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdTq-0008Qc-Kj
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:23:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdTo-0005M8-V1
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:23:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRdTi-0005J9-2J; Thu, 12 Jan 2017 06:23:34 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D6F140A39;
	Thu, 12 Jan 2017 14:23:34 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 48C74560;
	Thu, 12 Jan 2017 14:23:33 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1483980309-30821-1-git-send-email-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <5f112063-7143-48be-461d-7ecd069fa103@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:23:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483980309-30821-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/display/framebuffer.c: Avoid overflow
 for framebuffers > 4GB
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
X-List-Received-Date: Thu, 12 Jan 2017 11:23:44 -0000

09.01.2017 19:45, Peter Maydell wrote:
> Coverity points out that calculating src_len by multiplying
> src_width by rows could overflow. This can only happen in
> the implausible case of a framebuffer larger than 4GB, but
> we may as well fix it, placating Coverity. (CID1005515)

Applied to -trivial, thanks!

/mjt

