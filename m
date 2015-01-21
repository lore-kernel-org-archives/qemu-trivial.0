Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDqFB-00010K-I9
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 03:02:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDqF8-0000vd-VQ
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDqF7-0004Yj-UC
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:02:26 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YDqF1-0004XT-GB; Wed, 21 Jan 2015 03:02:19 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D262B42199;
	Wed, 21 Jan 2015 11:02:18 +0300 (MSK)
Message-ID: <54BF5D0A.3080606@msgid.tls.msk.ru>
Date: Wed, 21 Jan 2015 11:02:18 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1421155153-14061-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1421155153-14061-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vl: Fix bogus error message for implied
 mon ID clashing
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
X-List-Received-Date: Wed, 21 Jan 2015 08:02:27 -0000

13.01.2015 16:19, Markus Armbruster wrote:
> monitor_parse() desugars --monitor, --qmp and -qmp-pretty to --mon.
> The ID it picks can clash with a user-specified ID.  When it happens,
> the error message is misleading.

Thanks, applied to -trivial.

/mjt

