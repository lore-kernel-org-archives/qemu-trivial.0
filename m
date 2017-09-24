Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwDqT-00026K-CN
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 16:49:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDqR-00025I-Cr
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDqQ-0003Yn-MZ
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:49:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwDqM-0003NG-EG; Sun, 24 Sep 2017 16:49:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7C08141C78;
	Sun, 24 Sep 2017 23:49:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 660C53C3;
	Sun, 24 Sep 2017 23:49:27 +0300 (MSK)
To: Liang Yan <lyan@suse.com>, samuel.thibault@ens-lyon.org,
	pbonzini@redhat.com, marcandre.lureau@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170922225533.1928-1-lyan@suse.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <0dfef71c-cb6a-d959-0d4e-ea5a534048fa@msgid.tls.msk.ru>
Date: Sun, 24 Sep 2017 23:49:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170922225533.1928-1-lyan@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] chardev/baum: fix baum that releases
 brlapi twice
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
X-List-Received-Date: Sun, 24 Sep 2017 20:49:44 -0000

23.09.2017 01:55, Liang Yan wrote:
> Error process of baum_chr_open needs to set brlapi null, so it won't
> get released twice in char_braille_finalize, which will cause
> "/usr/bin/qemu-system-x86_64: double free or corruption (!prev)"

Applied to -trivial, thanks!

/mjt

