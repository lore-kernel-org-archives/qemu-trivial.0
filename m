Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRd2S-0000XM-Qm
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:55:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd2Q-0000Vg-MD
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:55:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd2P-0003I9-HA
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:55:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRd2J-0003H3-OO; Thu, 12 Jan 2017 05:55:15 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 96FCD40A29;
	Thu, 12 Jan 2017 13:55:15 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id C804454C;
	Thu, 12 Jan 2017 13:55:14 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170104145914.3361-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ef00f454-4049-6b88-cbca-d59b21fdb259@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 13:55:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170104145914.3361-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] block: remove dead check
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
X-List-Received-Date: Thu, 12 Jan 2017 10:55:24 -0000

04.01.2017 17:59, Paolo Bonzini wrote:
> options must be non-NULL here, because a NULL value is replaced with
> qdict_new earlier in the function.  Reported by Coverity.

Applied to -trivial, thank you!

/mjt

