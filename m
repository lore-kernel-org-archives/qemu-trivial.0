Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXYyM-0006Wz-Cb
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXYyE-0006Iw-RI
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXYy8-0003ty-MY
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:06:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXYxv-0003pG-QY; Fri, 26 Sep 2014 13:05:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 83B9246F56;
	Fri, 26 Sep 2014 21:05:41 +0400 (MSK)
Message-ID: <54259CE5.8020901@msgid.tls.msk.ru>
Date: Fri, 26 Sep 2014 21:05:41 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-trivial@nongnu.org
References: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] A number of Travis CI tweaks
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
X-List-Received-Date: Fri, 26 Sep 2014 17:06:21 -0000

24.09.2014 14:13, Alex Benn=C3=A9e wrote:
> Hi,
>=20
> The patches I posted last week have been reviewed and I've given them
> a good test on my tree. My last test failed but only because master
> has introduced a regression. This was found by the tests in master but
> missed due to the noise of GTester hangs which are mitigated by
> reducing the times we run "make check" in this patch series.
>=20
> Please apply to the trivial tree so we can get the master branch
> testing a little less noisy soon ;-)

Applied to -trivial.  Without any testing at all, as promised... :)

Thanks,

/mjt

