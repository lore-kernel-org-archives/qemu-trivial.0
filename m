Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDB8n-0001dF-7b
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 10:50:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDB8l-0001bi-Ca
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDB8k-0000bS-Ir
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:50:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDB8d-0000XV-8q; Tue, 23 May 2017 10:50:19 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7B9E74197F;
	Tue, 23 May 2017 17:50:18 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 60147437;
	Tue, 23 May 2017 17:50:18 +0300 (MSK)
To: Luc MICHEL <luc.michel@git.antfield.fr>, qemu-devel@nongnu.org
References: <20170428125632.5704-1-luc.michel@git.antfield.fr>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <57594c43-eed4-c7c2-2efd-05872dd67d5c@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 17:50:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170428125632.5704-1-luc.michel@git.antfield.fr>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/1] target/arm: add data cache
 invalidation cp15 instruction to cortex-r5
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
X-List-Received-Date: Tue, 23 May 2017 14:50:28 -0000

28.04.2017 15:56, Luc MICHEL wrote:
> This patch adds the cp15, CRn=15, opc1=0, CRm=5, opc2=0 coprocessor instruction
> to the cortex-r5. As stated in the TRM, this instruction invalidates all the
> data cache. This trivial patch implements it as NOP as cache operations are not
> implemented in QEMU.
> 
> The documentation is here:
> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0460d/Bgbdbdjc.html

Applied to -trivial, since no one else picked it up so far :)

Thanks,

/mjt

