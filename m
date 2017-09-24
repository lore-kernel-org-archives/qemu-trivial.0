Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwDsV-00031D-TN
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 16:51:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDsT-0002zr-A2
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDsS-0004vG-R7
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:51:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwDsO-0004sq-NI; Sun, 24 Sep 2017 16:51:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6875D41C8E;
	Sun, 24 Sep 2017 23:51:43 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 488153C3;
	Sun, 24 Sep 2017 23:51:43 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1505811746-29439-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b2ae0355-ceb0-0f88-3f7a-15d3743d8218@msgid.tls.msk.ru>
Date: Sun, 24 Sep 2017 23:51:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505811746-29439-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] trivial: Add missing "-m" parameter in
 docs/memory-hotplug.txt
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
X-List-Received-Date: Sun, 24 Sep 2017 20:51:50 -0000

19.09.2017 12:02, Thomas Huth wrote:
> The example obviously lacks the "-m" parameter.

Applied to -trivial, thanks!

/mjt

