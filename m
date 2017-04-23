Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2LJR-0003Bg-90
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 13:28:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LJP-0003B4-HU
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LJO-0006rf-Sg
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:28:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2LJK-0006qg-HF; Sun, 23 Apr 2017 13:28:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6474241F5A;
	Sun, 23 Apr 2017 20:28:33 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4FFEA3F8;
	Sun, 23 Apr 2017 20:28:33 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1488975205-26312-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <91599bbb-5c48-6ad5-e910-df5aad07e21e@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 20:28:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1488975205-26312-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Fix broken URLs of amnhltm.zip
 and dosidle210.zip
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
X-List-Received-Date: Sun, 23 Apr 2017 17:28:40 -0000

08.03.2017 15:13, Thomas Huth wrote:
> There are some broken URLs in the qemu-doc which reference tools that
> are not available at their original location anymore. Fortunately, they
> have been mirrored to archive.org, so point to that location instead.

Applied to -trivial, thanks!

/mjt

