Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVhBN-0003Ch-8g
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:41:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dVhBK-0003AV-Vp
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dVhBK-0004Wk-BM
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:41:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dVhBG-0004VD-2l; Thu, 13 Jul 2017 12:41:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E0194DD4B;
	Thu, 13 Jul 2017 16:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0E0194DD4B
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0E0194DD4B
Received: from localhost (ovpn-116-67.gru2.redhat.com [10.97.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F78770A0B;
	Thu, 13 Jul 2017 16:41:29 +0000 (UTC)
Date: Thu, 13 Jul 2017 13:41:28 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Message-ID: <20170713164128.GY6020@localhost.localdomain>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-27-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170713163219.9024-27-marcandre.lureau@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 13 Jul 2017 16:41:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 26/29] i386: introduce ELF_NOTE_SIZE
 macro
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
X-List-Received-Date: Thu, 13 Jul 2017 16:41:39 -0000

On Thu, Jul 13, 2017 at 06:32:16PM +0200, Marc-Andr=E9 Lureau wrote:
> Factour out a common pattern to compute the ELF note size.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo

