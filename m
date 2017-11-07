Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eC23X-00023x-BZ
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 06:28:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eC23R-00020o-FN
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 06:28:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eC23L-0003ts-OP
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 06:28:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eC23H-0003rp-FA; Tue, 07 Nov 2017 06:28:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31A58C04AC49;
	Tue,  7 Nov 2017 11:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 31A58C04AC49
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.118.41] (unknown [10.36.118.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACF4360C90;
	Tue,  7 Nov 2017 11:28:14 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20171106185506.20334-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a537eb5-27c6-912b-899b-e2ca86faf00f@redhat.com>
Date: Tue, 7 Nov 2017 12:28:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171106185506.20334-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 07 Nov 2017 11:28:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] memory: remove unused
 memory_region_set_global_locking()
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
X-List-Received-Date: Tue, 07 Nov 2017 11:28:33 -0000

On 06/11/2017 19:55, Marc-Andr=C3=A9 Lureau wrote:
> This was never used since its introduction in commit
> 196ea13104f8 ("memory: Add global-locking property to memory
> regions").
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Indeed, it was introduced for symmetry with
memory_region_clear_global_locking but it isn't very useful.

Adding qemu-trivial.

Paolo

