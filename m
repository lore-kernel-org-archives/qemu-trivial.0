Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJo67-0003bF-VF
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:30:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo66-0003Zw-HD
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo65-0006wp-Ol
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:30:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJo5y-0006th-6u; Mon, 27 Jul 2015 15:29:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AF5A6425AF;
	Mon, 27 Jul 2015 22:29:52 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 99782A57;
	Mon, 27 Jul 2015 22:29:52 +0300 (MSK)
Message-ID: <55B686B0.5020007@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:29:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <5a1b06f5d050beab1b9b6d8ff6d5185f4576e3fa.1435062620.git.mprivozn@redhat.com>
In-Reply-To: <5a1b06f5d050beab1b9b6d8ff6d5185f4576e3fa.1435062620.git.mprivozn@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] gitignore: Ignore shader generated files
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
X-List-Received-Date: Mon, 27 Jul 2015 19:30:03 -0000

23.06.2015 15:30, Michal Privoznik wrote:
> As of d98bc0b65 there are two files that are automatically generated:
> ui/shader/texture-blit-frag.h and /ui/shader/texture-blit-vert.h. None
> of them is wanted to be tracked by git. Put them into the ignore file
> then.

Applied to -trivial, thanks!

/mjt

