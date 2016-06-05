Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9S4k-00067P-Ax
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:02:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9S4f-000641-PA
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:02:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9S4e-0002wd-Vs
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:02:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9S4c-0002v1-Ph; Sun, 05 Jun 2016 03:02:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E3A72408D7;
	Sun,  5 Jun 2016 10:02:10 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1464881296-9618-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5753CE72.5090102@msgid.tls.msk.ru>
Date: Sun, 5 Jun 2016 10:02:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464881296-9618-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] thunk: Drop unused NO_THUNK_TYPE_SIZE
 guards
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
X-List-Received-Date: Sun, 05 Jun 2016 07:02:21 -0000

02.06.2016 18:28, Peter Maydell wrote:
> The thunk_type_size_array() and thunk_type_align_array() functions
> are only provided if NO_THUNK_TYPE_SIZE is not defined. However
> nothing in the codebase defines that, and so in fact these functions
> are always present. Drop the unnecessary #ifdefs.

Applied to -trivial, thanks!

/mjt

