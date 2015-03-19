Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYVjC-0007YJ-3i
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 04:22:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVjA-0007W6-1x
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVj9-0007ay-6t
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:22:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYVj4-0007ZW-Qb; Thu, 19 Mar 2015 04:22:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A5A2B41D21;
	Thu, 19 Mar 2015 11:22:45 +0300 (MSK)
Message-ID: <550A8755.60308@msgid.tls.msk.ru>
Date: Thu, 19 Mar 2015 11:22:45 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Thu, 19 Mar 2015 08:22:53 -0000

12.03.2015 17:57, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.

Applied to -trivial, with a tiny change:

> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
> +                                  fd_opaque, NULL);

    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id,
                                  fd_opaque ? true : false, fd_opaque, NULL);

(this fits in 80 chars a line).  Another variant is to use `fd_opaque != NULL' here
instead of this ?true:false construct.

Thanks,

/mjt

