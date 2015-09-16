Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZcANu-0008AF-Uz
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 06:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZcANs-00087M-Op
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZcANs-0000O2-2t
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:56:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZcANm-0000Km-5s; Wed, 16 Sep 2015 06:56:10 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AC5641B11;
	Wed, 16 Sep 2015 13:56:07 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4F1FDA6E;
	Wed, 16 Sep 2015 13:56:07 +0300 (MSK)
Message-ID: <55F94AC7.4050209@msgid.tls.msk.ru>
Date: Wed, 16 Sep 2015 13:56:07 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1442306856-11153-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1442306856-11153-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Houcheng Lin <houcheng@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] pci-assign: do not include sys/io.h
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
X-List-Received-Date: Wed, 16 Sep 2015 10:56:17 -0000

15.09.2015 11:47, Paolo Bonzini wrote:
> This file does not exist on bionic libc and the functions it defines
> are in fact not used by pci-assign.c.  Remove it.

Applied to -trivial, thanks!

/mjt

