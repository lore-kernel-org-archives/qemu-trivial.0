Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6Wa1-00048E-EO
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 02:19:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6WZx-000451-87
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:19:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6WZw-0000Bk-HM
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:19:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d6WZq-0008Rk-AD; Fri, 05 May 2017 02:18:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A92AC40385;
	Fri,  5 May 2017 09:16:45 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 859B33BB;
	Fri,  5 May 2017 09:16:44 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-devel@nongnu.org
References: <20170426115826.1826-1-n54@gmx.com>
	<20170426131604.3459-1-n54@gmx.com>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <7fa8f78f-7e89-d81f-1976-96c229c3bf4c@msgid.tls.msk.ru>
Date: Fri, 5 May 2017 09:16:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170426131604.3459-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] scripts: Switch to more portable Perl
 shebang
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
X-List-Received-Date: Fri, 05 May 2017 06:19:02 -0000

26.04.2017 16:16, Kamil Rytarowski wrote:
> The default NetBSD package manager is pkgsrc and it installs Perl
> along other third party programs under custom and configurable prefix.
> The default prefix for binary prebuilt packages is /usr/pkg, and the
> Perl executable lands in /usr/pkg/bin/perl.
> 
> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
> the most portable solution that should work for almost everybody.
> Perl's executable is detected automatically.
> 
> This change switches -w option passed to the executable with more
> modern "use warnings;" approach. There is no functional change to the
> default behavior.

Applied to -trivial, thanks!

/mjt

