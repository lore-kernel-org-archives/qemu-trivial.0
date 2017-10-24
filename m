Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e78Un-0002jO-VL
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 19:20:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e78Ul-0002hV-Ki
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 19:20:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e78Uk-0003JS-Si
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 19:20:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1e78Ug-0003EH-Ft; Tue, 24 Oct 2017 19:20:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E715AC2DE;
	Tue, 24 Oct 2017 23:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4E715AC2DE
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=quintela@redhat.com
Received: from localhost (ovpn-116-43.ams2.redhat.com [10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 905DA5D6A2;
	Tue, 24 Oct 2017 23:20:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,  "Richard W . M . Jones"
	<rjones@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>,  Stefan Berger
	<stefanb@linux.vnet.ibm.com>,  Amarnath Valluri
	<amarnath.valluri@intel.com>,  Eric Blake <eblake@redhat.com>,  Peter
	Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@gmail.com>,  "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>
In-Reply-To: <20171024122045.30072-3-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	24 Oct 2017 09:20:43 -0300")
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024122045.30072-3-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 25 Oct 2017 01:20:13 +0200
Message-ID: <87a80gnnf6.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 24 Oct 2017 23:20:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 2/4] tpm: add stubs
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
X-List-Received-Date: Tue, 24 Oct 2017 23:20:28 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Commit c37cacabf22 moved tpm_cleanup() in the main loop exit, however this
> function is not available when compiling with --disable-tpm.
>
> Provides necessary stubs to keep code clean of #ifdef'fery.
>
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Message-Id: <20171023102903.256AF7456A0@zero.eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Richard W.M. Jones <rjones@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


