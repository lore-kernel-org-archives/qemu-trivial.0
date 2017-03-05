Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckQya-0003Ro-Uj
	for mharc-qemu-trivial@gnu.org; Sun, 05 Mar 2017 02:53:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ckQyZ-0003RA-Ez
	for qemu-trivial@nongnu.org; Sun, 05 Mar 2017 02:53:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ckQyY-0006Vt-Q4
	for qemu-trivial@nongnu.org; Sun, 05 Mar 2017 02:53:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ckQyU-0006Uk-KP; Sun, 05 Mar 2017 02:53:02 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB55085540;
	Sun,  5 Mar 2017 07:53:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v257qxGt009919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 5 Mar 2017 02:53:00 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AFD451138647; Sun,  5 Mar 2017 08:52:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170304185533.10618-1-f4bug@amsat.org>
Date: Sun, 05 Mar 2017 08:52:57 +0100
In-Reply-To: <20170304185533.10618-1-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 4 Mar 2017 15:55:30
	-0300")
Message-ID: <87o9xgcg86.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sun, 05 Mar 2017 07:53:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] easy-to-fix clang
 warnings
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
X-List-Received-Date: Sun, 05 Mar 2017 07:53:08 -0000

Cc: qemu-trivial

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This patchset fixes three easy-to-fix clang warnings.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   usb-ccid: make ccid_write_data_block() cope with null buffers
>   device_tree: fix compiler warnings (clang 5)
>   qga: fix compiler warnings (clang 5)
>
>  device_tree.c                 | 1 +
>  hw/usb/dev-smartcard-reader.c | 8 +++++++-
>  qga/commands-posix.c          | 8 +++++---
>  3 files changed, 13 insertions(+), 4 deletions(-)

