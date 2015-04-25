Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YltR5-0004Yr-LZ
	for mharc-qemu-trivial@gnu.org; Sat, 25 Apr 2015 02:19:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltR1-0004G5-FA
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltKy-0000Jo-Ln
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:13:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YltKv-0000In-7j; Sat, 25 Apr 2015 02:13:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 65E2E42320;
	Sat, 25 Apr 2015 09:12:58 +0300 (MSK)
Message-ID: <553B306A.1010808@msgid.tls.msk.ru>
Date: Sat, 25 Apr 2015 09:12:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>, qemu-devel@nongnu.org
References: <20150331133251.5be10dd6@redhat.com>
In-Reply-To: <20150331133251.5be10dd6@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] balloon: improve error msg when adding
	second device
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
X-List-Received-Date: Sat, 25 Apr 2015 06:19:30 -0000

31.03.2015 20:32, Luiz Capitulino wrote:
> A VM supports only one balloon device, but due to several changes
> in infrastructure the error message got messed up when trying
> to add a second device. Fix it.
...
Heh.  Such a huge commit message ;)

Applied to -trivial now.  In the large commit text I missed your
comment about the patch is okay to go during the freeze, so doing
it after :)

Thanks,

/mjt


