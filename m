Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRd6Z-0004Ks-EZ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:59:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd6V-0004Gq-8q
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:59:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd6S-0004bJ-W2
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:59:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRd6N-0004Zu-FN; Thu, 12 Jan 2017 05:59:27 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 52DD040A29;
	Thu, 12 Jan 2017 13:59:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 8B11F54C;
	Thu, 12 Jan 2017 13:59:26 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1483981521-6789-1-git-send-email-peter.maydell@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, patches@linaro.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <c88596ec-71c3-ce54-b956-785d5f7fc03f@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 13:59:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483981521-6789-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/i386/kvmvapic: Remove dead code in
 patch_hypercalls()
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
X-List-Received-Date: Thu, 12 Jan 2017 10:59:37 -0000

09.01.2017 20:05, Peter Maydell wrote:
> The patch_hypercalls() function sets up a 'patches'
> variable and checks it at the end of the function, but
> never modifies it in the middle. Remove this dead code,
> which seems to have been present since the function was
> added in commit e5ad936b0fd7 in 2012.

Applied to -trivial, thank you!

/mjt

