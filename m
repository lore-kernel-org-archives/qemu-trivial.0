Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zRO-0002n8-Uy
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:42:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zRN-0002lc-Aj
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:42:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zRM-0000Rp-GS
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:42:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zRG-0000RH-Du; Sun, 29 Nov 2015 05:42:38 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BBB1F43237;
	Sun, 29 Nov 2015 13:42:37 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A825BA68;
	Sun, 29 Nov 2015 13:42:37 +0300 (MSK)
Message-ID: <565AD69D.5090507@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:42:37 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1447436727-26484-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1447436727-26484-1-git-send-email-berrange@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] crypto: avoid two coverity false
	positive error reports
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
X-List-Received-Date: Sun, 29 Nov 2015 10:42:46 -0000

13.11.2015 20:45, Daniel P. Berrange wrote:
> In qcrypto_tls_creds_get_path() coverity complains that
> we are checking '*creds' for NULL, despite having
> dereferenced it previously. This is harmless bug due
> to fact that the trace call was too early. Moving it
> after the cleanup gets the desired semantics.
...

Applied to -trivial, thank you!

/mjt

