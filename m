Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eH1ck-0002hq-AX
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 01:01:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eH1cd-0002eH-8O
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 01:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eH1cW-0005er-VP
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 01:01:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1eH1cN-0005Xc-Ak; Tue, 21 Nov 2017 01:01:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDF706E770;
	Tue, 21 Nov 2017 06:01:09 +0000 (UTC)
Received: from localhost (ovpn-12-151.pek2.redhat.com [10.72.12.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C2CF60BE5;
	Tue, 21 Nov 2017 06:01:04 +0000 (UTC)
Date: Tue, 21 Nov 2017 14:01:02 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Message-ID: <20171121060102.GB28270@lemon>
References: <20171121032119.14442-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20171121032119.14442-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 21 Nov 2017 06:01:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] Makefile: use
 $(MAKE) variable
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
X-List-Received-Date: Tue, 21 Nov 2017 06:01:31 -0000

On Tue, 11/21 00:21, Philippe Mathieu-Daud=E9 wrote:
> @@ -904,7 +904,7 @@ $(patsubst %, check-%, $(check-qapi-schema-y)): che=
ck-%.json: $(SRC_PATH)/%.json
>  		echo $$? >$*.test.exit, \
>  		"TEST","$*.out")
>  	@diff -q $(SRC_PATH)/$*.out $*.test.out
> -	@# Sanitize error messages (make them independent of build directory)
> +	@# Sanitize error messages ($(MAKE) them independent of build directo=
ry)

This doesn't look like a good candidate, does it?

Fam

>  	@perl -p -e 's|\Q$(SRC_PATH)\E/||g' $*.test.err | diff -q $(SRC_PATH)=
/$*.err -
>  	@diff -q $(SRC_PATH)/$*.exit $*.test.exit
> =20
> --=20
> 2.15.0
>=20
>=20

Fam

