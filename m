Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ag9nN-0001CL-PJ
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 07:39:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ag9nL-00018L-3a
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ag9nJ-0002E9-Rf
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:39:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ag9nC-00029K-73; Wed, 16 Mar 2016 07:39:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1F4F440EBF;
	Wed, 16 Mar 2016 14:39:10 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1456305167-19457-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56E945DD.7030702@msgid.tls.msk.ru>
Date: Wed, 16 Mar 2016 14:39:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456305167-19457-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] loader: fix potential memory leak
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
X-List-Received-Date: Wed, 16 Mar 2016 11:39:20 -0000

24.02.2016 12:12, Cao jin wrote:

> +    if (fw_dir) {
> +        g_free(rom->fw_dir);
> +        g_free(rom->fw_file);
> +    }

Applied to -trivial, thanks!

/mjt


