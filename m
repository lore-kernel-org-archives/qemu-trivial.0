Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPq8I-0004fw-Uy
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jun 2017 09:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPq8H-0004c6-B1
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPq8G-000189-Lm
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:02:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dPq8A-00013t-2B; Tue, 27 Jun 2017 09:02:10 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C94C942013;
	Tue, 27 Jun 2017 16:02:08 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id BBD175EB;
	Tue, 27 Jun 2017 16:02:08 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1497376844-26561-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <59adcd8d-12c3-d148-ab56-5d1db4f42b5a@msgid.tls.msk.ru>
Date: Tue, 27 Jun 2017 16:02:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1497376844-26561-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix build with pkg-config and
 --static --enable-sdl
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
X-List-Received-Date: Tue, 27 Jun 2017 13:02:18 -0000

13.06.2017 21:00, Thomas Huth wrote:
> The configure script prefers pkg-config over sdl-config, but
> the "--static-libs" parameter only exists for the latter. With
> pkg-config, "--static --libs" have to be used instead.

Applied to -trivial, thanks!

/mjt

