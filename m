Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS15v-00031a-Kv
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 05:22:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WS15o-0002sH-4A
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 05:22:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WS15i-0002T7-2U
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 05:22:52 -0400
Received: from cantor2.suse.de ([195.135.220.15]:45733 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WS15T-0002Mq-Al; Mon, 24 Mar 2014 05:22:31 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 91599ACD5;
	Mon, 24 Mar 2014 09:22:28 +0000 (UTC)
Message-ID: <532FF953.3010702@suse.de>
Date: Mon, 24 Mar 2014 10:22:27 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Deepak Kathayat <deepak.mk17@gmail.com>, qemu-devel@nongnu.org
References: <1395649817-20742-1-git-send-email-deepak.mk17@gmail.com>
In-Reply-To: <1395649817-20742-1-git-send-email-deepak.mk17@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fixed various typos
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
X-List-Received-Date: Mon, 24 Mar 2014 09:22:58 -0000

Hi,

Am 24.03.2014 09:30, schrieb Deepak Kathayat:
> Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
> ---
>  block/gluster.c  |    2 +-
>  block/qcow.c     |    2 +-
>  block/sheepdog.c |    8 ++++----
>  block/vdi.c      |    2 +-
>  block/vhdx-log.c |    2 +-
>  slirp/tftp.c     |    2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Note that in general the present tense is preferred, i.e. what is the
patch doing rather than what did you do to create the patch.

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

