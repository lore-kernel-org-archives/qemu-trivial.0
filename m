Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhC3K-0005gJ-MP
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:39:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC3D-0005Sj-4L
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC37-0001Pu-0X
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:39:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhC2s-0001OD-Ru; Thu, 23 Oct 2014 02:38:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 26C3E45ABE;
	Thu, 23 Oct 2014 10:38:50 +0400 (MSK)
Message-ID: <5448A278.2090107@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:38:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-trivial@nongnu.org
References: <1413357391-26869-1-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1413357391-26869-1-git-send-email-alex.bennee@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-arm: A64: remove redundant store
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
X-List-Received-Date: Thu, 23 Oct 2014 06:39:17 -0000

On 10/15/2014 11:16 AM, Alex Benn=C3=A9e wrote:
> There is not much point storing the same value twice in a row.

Applied to -trivial, thank you!

/mjt

