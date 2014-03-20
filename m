Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQfis-0007nA-VX
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 12:21:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfim-0007ca-Or
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:21:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfih-0005TZ-SH
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:21:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQfiW-0005RT-VD; Thu, 20 Mar 2014 12:21:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A6FC242CA3;
	Thu, 20 Mar 2014 20:21:14 +0400 (MSK)
Message-ID: <532B157A.7000601@msgid.tls.msk.ru>
Date: Thu, 20 Mar 2014 20:21:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, aliguori@amazon.com, qemu-trivial@nongnu.org,
	lersek@redhat.com, coreyb@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
	pbonzini@redhat.com, lcapitulino@redhat.com, eblake@redhat.com,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v4 0/2] convert -m to QemuOpts
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
X-List-Received-Date: Thu, 20 Mar 2014 16:21:38 -0000

06.03.2014 13:39, Igor Mammedov wrote:
> Igor Mammedov (1):
>   vl: convert -m to QemuOpts

This patch (2/2) was mime-damaged, I had to edit it manually
in order for it to apply.  Please take a look at
http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
to verify it's okay.

Applied to -trivial.

Thanks,

/mjt

