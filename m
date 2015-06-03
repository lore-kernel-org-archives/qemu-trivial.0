Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z06Sa-0006Dj-Hu
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 07:03:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z06SX-00068G-Hg
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 07:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z06SW-00062T-Qn
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 07:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z06SR-0005x5-M6; Wed, 03 Jun 2015 07:03:39 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 2E9AEB7CE6;
	Wed,  3 Jun 2015 11:03:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t53B3bu9006969
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 3 Jun 2015 07:03:38 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CE67A303F809; Wed,  3 Jun 2015 13:03:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1433223995-26725-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Wed, 03 Jun 2015 13:03:36 +0200
In-Reply-To: <1433223995-26725-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Tue, 2 Jun 2015 08:46:35 +0300")
Message-ID: <87vbf5njef.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] slirp: use less
	predictable directory name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Wed, 03 Jun 2015 11:03:46 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> In this version I used mkdtemp(3) which is:
>
>         _BSD_SOURCE
>         || /* Since glibc 2.10: */
>             (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)
>
> (POSIX.1-2008), so should be available on systems we care about.
>
> While at it, reset the resulting directory name within smb structure
> on error so cleanup function wont try to remove directory which we
> failed to create.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2:
> Add resetting of the dirname on failure so that cleanup function
> does not try to remove directory which we failed to create.
>
> Use snprintf() as was in the original code, not strcpy(): while
> in this very case it does not matter at all since both strings
> are of known size, some people dislike strcpy() in principle.

I guess I would've used pstrcpy(), but your use of snprintf() is just
fine.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

