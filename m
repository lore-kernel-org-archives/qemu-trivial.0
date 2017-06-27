Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPqBC-0006bp-6D
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jun 2017 09:05:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPqBA-0006bV-QG
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPqBA-0003AH-0N
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:05:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dPqB3-00036E-Vd; Tue, 27 Jun 2017 09:05:10 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2302B42018;
	Tue, 27 Jun 2017 16:05:09 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 15E615EB;
	Tue, 27 Jun 2017 16:05:09 +0300 (MSK)
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20170626103756.22974-1-berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <08d2a926-13f8-fa8a-6d0b-87525f10d9ce@msgid.tls.msk.ru>
Date: Tue, 27 Jun 2017 16:05:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170626103756.22974-1-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] sockets: avoid formatting buffer that
 may not be NUL terminated
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
X-List-Received-Date: Tue, 27 Jun 2017 13:05:17 -0000

Applied to -trivial (with commit typo fix), thanks!

/mjt

