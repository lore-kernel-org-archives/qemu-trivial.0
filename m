Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fazhv-0005wE-VA
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 04:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fazhr-0005uF-Iv
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 04:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fazhq-0006Ls-Tk
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 04:33:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fazhd-0005dP-9d; Thu, 05 Jul 2018 04:33:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0537381A4EAA;
	Thu,  5 Jul 2018 08:33:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-19.ams2.redhat.com
	[10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F56F2156880;
	Thu,  5 Jul 2018 08:33:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6478A11385D6; Thu,  5 Jul 2018 10:33:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, Alexander
	Graf <agraf@suse.de>,  Gerd Hoffmann <kraxel@redhat.com>,  Stefano
	Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, "Michael S .
	Tsirkin" <mst@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,  Anthony Perard
	<anthony.perard@citrix.com>,  xen-devel@lists.xenproject.org,
	qemu-s390x@nongnu.org,  qemu-arm@nongnu.org,  Richard Henderson
	<rth@twiddle.net>,  Kevin Wolf <kwolf@redhat.com>,  Cornelia Huck
	<cohuck@redhat.com>,  Max Reitz <mreitz@redhat.com>,  Igor Mammedov
	<imammedo@redhat.com>, qemu-trivial@nongnu.org
References: <20180704153919.12432-1-f4bug@amsat.org>
Date: Thu, 05 Jul 2018 10:33:21 +0200
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Jul 2018 12:39:11
	-0300")
Message-ID: <87a7r6axpq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 05 Jul 2018 08:33:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 05 Jul 2018 08:33:24 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/8] Coccinelle cleanups
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
X-List-Received-Date: Thu, 05 Jul 2018 08:33:42 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Nothing exciting here, patches created mechanically
> (common after soft freeze).

Cc: qemu-trivial

