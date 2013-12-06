Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0iT-0000OG-EL
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:05:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0iK-0008V2-Ic
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:05:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0iE-0002fR-CX
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:05:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46365)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0hq-0002KZ-0l; Fri, 06 Dec 2013 14:04:54 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 52B9640D77;
	Fri,  6 Dec 2013 23:04:53 +0400 (MSK)
Message-ID: <52A21FD5.6080101@msgid.tls.msk.ru>
Date: Fri, 06 Dec 2013 23:04:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1386342485-8656-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1386342485-8656-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] help: add id suboption to -iscsi
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
X-List-Received-Date: Fri, 06 Dec 2013 19:05:31 -0000

06.12.2013 19:08, Paolo Bonzini wrote:
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2089,7 +2089,7 @@ ETEXI
>  DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
>      "-iscsi [user=user][,password=password]\n"
>      "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
> -    "       [,initiator-name=iqn]\n"
> +    "       [,initiator-name=initiator-iqn][,id=target-iqn]\n"
>      "                iSCSI session parameters\n", QEMU_ARCH_ALL)
>  STEXI

I'm not sure this is clearer, to me it looks more confusing
than before.

The thing is that "id" suboption is automatic and is handled
in the option parsing code explicitly.

As far as I can see, "id" suboption is actually never used by
iscsi code, only initiator-name is.

What this change is for?

Thanks,

/mjt

