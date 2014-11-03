Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlDWa-0001ip-HX
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 04:02:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlDWS-0001Y0-Ow
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlDWM-0004hG-JS
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:02:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlDWA-0004Na-3O; Mon, 03 Nov 2014 04:01:42 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6772F404DE;
	Mon,  3 Nov 2014 12:01:40 +0300 (MSK)
Message-ID: <54574474.30209@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 12:01:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Zhu Guihua <zhugh.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1414993894-17539-1-git-send-email-zhugh.fnst@cn.fujitsu.com>
In-Reply-To: <1414993894-17539-1-git-send-email-zhugh.fnst@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, imammedo@redhat.com,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] icc_bus: rename ICC_BRIGDE to ICC_BRIDGE
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
X-List-Received-Date: Mon, 03 Nov 2014 09:02:07 -0000

03.11.2014 08:51, Zhu Guihua wrote:
> Rename ICC_BRIGDE for better readability.

That's a good one... :)  Applied to -trivial, thank you!

/mjt

