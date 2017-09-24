Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwDzP-0006H1-H2
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 16:58:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDzN-0006FW-HH
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:58:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDzM-000805-R4
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:58:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwDzK-0007yE-SB; Sun, 24 Sep 2017 16:58:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 07D7E41C8E;
	Sun, 24 Sep 2017 23:58:54 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id E42C53C3;
	Sun, 24 Sep 2017 23:58:53 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1505465181-4147-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <582c16a3-36c9-e06c-de01-26e87a1ba184@msgid.tls.msk.ru>
Date: Sun, 24 Sep 2017 23:58:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505465181-4147-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/display/virtio-gpu: Put the
 virtio-gpu-device into the display category
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
X-List-Received-Date: Sun, 24 Sep 2017 20:58:58 -0000

15.09.2017 11:46, Thomas Huth wrote:
> The virtio-gpu-pci device is already in the display category, so the
> virtio-gpu-device should be there, too.

Applied to -trivial, thanks!

/mjt

