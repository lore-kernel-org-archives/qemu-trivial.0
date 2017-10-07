Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0m9T-0004lt-77
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 06:16:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e0m9P-0004l9-P4
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 06:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e0m9O-0003jD-SS
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 06:16:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1e0m9K-0003fT-K5; Sat, 07 Oct 2017 06:16:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0911C04AC45;
	Sat,  7 Oct 2017 10:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C0911C04AC45
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=quintela@redhat.com
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 116585D75E;
	Sat,  7 Oct 2017 10:15:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Markus
	Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
	Lureau <marcandre.lureau@redhat.com>, qemu-devel@nongnu.org, Kevin Wolf
	<kwolf@redhat.com>,  qemu trival <qemu-trivial@nongnu.org>
In-Reply-To: <20171006235023.11952-21-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 6 Oct 2017 20:49:15
	-0300")
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-21-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Sat, 07 Oct 2017 12:15:49 +0200
Message-ID: <87efqfmffu.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 07 Oct 2017 10:16:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 20/88] Migration: use g_new() family of
 functions
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
X-List-Received-Date: Sat, 07 Oct 2017 10:16:08 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: indented, added migration/migration.c and migration/page_cache.c]

Reviewed-by: Juan Quintela <quintela@redhat.com>

Do you want me to include it, or you want to include it yourself?

Later, Juan.

