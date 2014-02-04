Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAhAj-0004N2-G8
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2014 09:40:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WAhAb-0004Di-UW
	for qemu-trivial@nongnu.org; Tue, 04 Feb 2014 09:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WAhAW-0004vs-Cy
	for qemu-trivial@nongnu.org; Tue, 04 Feb 2014 09:40:13 -0500
Received: from cantor2.suse.de ([195.135.220.15]:39507 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WAhAL-0004aX-9x; Tue, 04 Feb 2014 09:39:57 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0893DAC56;
	Tue,  4 Feb 2014 14:39:56 +0000 (UTC)
Message-ID: <52F0FBBA.7010900@suse.de>
Date: Tue, 04 Feb 2014 15:39:54 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org, 
	Anthony Liguori <aliguori@amazon.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1391492590-8844-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1391492590-8844-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Fix case Qemu -> QEMU
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
X-List-Received-Date: Tue, 04 Feb 2014 14:40:19 -0000

Am 04.02.2014 06:43, schrieb Stefan Weil:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/switch-timer-api |    2 +-
>  tests/i440fx-test.c      |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

but that is the same spelling found in every single mailing list message
- any chance we can fix that too? (be it to all-lowercase or all-uppercas=
e)

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

