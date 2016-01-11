Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXaH-0008DL-9l
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:12:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXaF-0008Bx-T8
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:12:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXaF-0002CH-4r
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:12:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXa9-0002BT-SN; Mon, 11 Jan 2016 03:12:06 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7C1D9403D2;
	Mon, 11 Jan 2016 11:12:03 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1450443571-14621-1-git-send-email-peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <569363D3.3040007@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:12:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450443571-14621-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Blue Swirl <blauwirbel@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] scripts/checkpatch.pl: Don't allow
 special cases of unspaced operators
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
X-List-Received-Date: Mon, 11 Jan 2016 08:12:12 -0000

18.12.2015 15:59, Peter Maydell wrote:
> The checkpatch.pl script has a special case to permit the following
> operators to have no spaces around them:
>  <<  >>  &  ^  |  +  -  *  /  %
> 
> QEMU style prefers all operators to consistently have spacing around
> them, so remove this special case handling. This avoids reviewers
> having to manually note it during code review.

Applied to -trivial, thank you!

/mjt

