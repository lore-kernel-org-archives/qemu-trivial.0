Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e78V6-0002uK-GN
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 19:20:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e78V4-0002t2-LQ
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 19:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e78V3-0003Y6-UR
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 19:20:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57246)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1e78Uz-0003Ty-NW; Tue, 24 Oct 2017 19:20:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C512C6A7D5;
	Tue, 24 Oct 2017 23:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C512C6A7D5
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=quintela@redhat.com
Received: from localhost (ovpn-116-43.ams2.redhat.com [10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A3D660F84;
	Tue, 24 Oct 2017 23:20:35 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,  "Richard W . M . Jones"
	<rjones@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>,  Stefan Berger
	<stefanb@linux.vnet.ibm.com>,  Amarnath Valluri
	<amarnath.valluri@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, =?utf-8?Q?Marc-Andr?=
	=?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@gmail.com>, "Dr . David Alan
	Gilbert" <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>
In-Reply-To: <20171024122045.30072-4-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	24 Oct 2017 09:20:44 -0300")
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024122045.30072-4-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 25 Oct 2017 01:20:33 +0200
Message-ID: <8760b4nnem.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 24 Oct 2017 23:20:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 3/4] tpm: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Tue, 24 Oct 2017 23:20:47 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Makefile.objs now checks for $(CONFIG_TPM).
>
> Suggested-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

