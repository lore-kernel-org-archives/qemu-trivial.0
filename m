Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxw7e-0000Gz-6D
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:37:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Yxw7W-0000C8-W0
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:37:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Yxw7W-0003yZ-2Q
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:37:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Yxw7M-0003oB-So; Thu, 28 May 2015 07:36:56 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id C7DDA2B7845;
	Thu, 28 May 2015 11:36:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4SBasAd018731
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 28 May 2015 07:36:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8330E3008AAF; Thu, 28 May 2015 13:36:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 13:36:53 +0200
In-Reply-To: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Thu, 28 May 2015 14:15:43 +0300")
Message-ID: <87wpztc4ru.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: use less predictable
	directory name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Thu, 28 May 2015 11:37:13 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> In this version I used mkdtemp(3) which is:
>
>         _BSD_SOURCE
>         || /* Since glibc 2.10: */
>             (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)

In short, it's POSIX.1-2008.

> so should be available on systems we care about.

Yes.

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

