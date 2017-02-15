Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwZt-0005bM-6l
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:12:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwZq-0005Ye-1C
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:12:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwZp-0004DK-3b
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:12:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwZi-00049d-Oo; Wed, 15 Feb 2017 05:12:38 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A5E71421BB;
	Wed, 15 Feb 2017 13:12:38 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id F043B264;
	Wed, 15 Feb 2017 13:12:37 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <3f200670-cce5-014a-eaed-e82302ed3e7f@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:12:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] softfloat: Use correct type in
 float64_to_uint64_round_to_zero()
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
X-List-Received-Date: Wed, 15 Feb 2017 10:12:47 -0000

03.02.2017 21:59, Peter Maydell wrote:
> In float64_to_uint64_round_to_zero() a typo meant that we were
> taking the uint64_t return value from float64_to_uint64() and
> putting it into an int64_t variable before returning it as
> uint64_t again. Use uint64_t instead of pointlessly casting it
> back and forth to int64_t.

Applied to -trivial, thanks!

/mjt

