Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUwO3-0001uL-7I
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 10:43:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dUwO2-0001qv-0V
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 10:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dUwO1-0000Qu-FO
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 10:43:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dUwNw-0000N0-Hy; Tue, 11 Jul 2017 10:43:32 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0AF5740D6C;
	Tue, 11 Jul 2017 17:43:24 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id DBAD06A3;
	Tue, 11 Jul 2017 17:43:23 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170707154646.22230-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <a304046a-e2f4-8d01-7011-971ca6db96c5@msgid.tls.msk.ru>
Date: Tue, 11 Jul 2017 17:43:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170707154646.22230-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hxtool: remove dead -q option
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
X-List-Received-Date: Tue, 11 Jul 2017 14:43:38 -0000

07.07.2017 18:46, Paolo Bonzini wrote:
> This was used to extract .txt documentation for QMP.  This was
> changed to use the QAPI schema instead, so zap it.

Applied to -trivial, thanks!

/mjt


