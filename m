Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhyh-0000iN-Ix
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:50:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhyf-0000h7-9J
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhye-0007Ng-MR
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:50:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZrhyZ-0007NO-Nc; Thu, 29 Oct 2015 03:50:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1A8114211B;
	Thu, 29 Oct 2015 10:50:23 +0300 (MSK)
Message-ID: <5631CFBF.2050808@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:50:23 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1445263720-6765-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1445263720-6765-2-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] xen: fix invalid assertion
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
X-List-Received-Date: Thu, 29 Oct 2015 07:50:30 -0000

19.10.2015 17:08, Paolo Bonzini wrote:
> Asserting "true" is not that useful.

> -        default: assert(1);
> +        default: abort();

Blah :)

Applied to -trivial, thank you!

/mjt


