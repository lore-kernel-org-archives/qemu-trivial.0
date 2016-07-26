Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bS1VO-0004kQ-V6
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2016 08:30:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bS1VK-0004gi-HP
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 08:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bS1VG-0005hT-Lq
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 08:30:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bS1VA-0005dw-36; Tue, 26 Jul 2016 08:30:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E39ED426B8;
	Tue, 26 Jul 2016 15:30:12 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1466079904-28902-1-git-send-email-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, stefanb@us.ibm.com
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5c0add91-2868-3c17-2a18-49ca28d8b8cb@msgid.tls.msk.ru>
Date: Tue, 26 Jul 2016 15:30:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466079904-28902-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] vl: remove unnecessary duplicate call to
 tpm_cleanup
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
X-List-Received-Date: Tue, 26 Jul 2016 12:30:38 -0000

16.06.2016 15:25, Paolo Bonzini wrote:
> tpm_cleanup is called from main() and also registered with atexit from
> tpm_init.  The function only visits the tpm_backends linked list, and the
> atexit registration happens right after tpm_init fills in the list from
> -tpmdev options.  Therefore, the direct call is unnecessary.  Remove it.

Applied to -trivial. thanks!

/mjt

