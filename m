Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk813-0007Cw-84
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 06:01:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiPwn-0001fa-SI
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiPwn-0001fE-4h
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:46:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZiPwh-0001d8-BW; Sat, 03 Oct 2015 12:46:03 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8F84640359;
	Sat,  3 Oct 2015 19:45:52 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 6B71FA66;
	Sat,  3 Oct 2015 19:45:52 +0300 (MSK)
Message-ID: <56100640.6040507@msgid.tls.msk.ru>
Date: Sat, 03 Oct 2015 19:45:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Christopher Covington <cov@codeaurora.org>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
In-Reply-To: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] s/cpu_get_real_ticks/cpu_get_host_ticks/
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
X-List-Received-Date: Sat, 03 Oct 2015 16:46:10 -0000

25.09.2015 17:42, Christopher Covington wrote:
> This should help clarify the purpose of the function that returns
> the host system's CPU cycle count.

Applied to -trivial, thank you!

/mjt

