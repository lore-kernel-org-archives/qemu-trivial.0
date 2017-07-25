Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZwT5-0000T6-PH
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 05:49:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dZwT2-0000QL-QG
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 05:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dZwT2-0007iP-1h
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 05:49:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dZwSx-0007fC-37; Tue, 25 Jul 2017 05:49:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E613113A45;
	Tue, 25 Jul 2017 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E613113A45
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.116.132] (ovpn-116-132.ams2.redhat.com [10.36.116.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E8D84D9E5;
	Tue, 25 Jul 2017 09:49:11 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>
References: <20170725061158.10745-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <865f533b-8fe7-dd3d-be79-c2852ef0508d@redhat.com>
Date: Tue, 25 Jul 2017 11:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170725061158.10745-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 25 Jul 2017 09:49:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Makefile: add
 all-user/all-linux-user/all-softmmu meta-targets
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
X-List-Received-Date: Tue, 25 Jul 2017 09:49:29 -0000

On 25/07/2017 08:11, Philippe Mathieu-Daud=C3=A9 wrote:
> Useful to build a whole set at once.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 5f18243d05..da899522e4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -814,6 +814,11 @@ endif
>  # Dependencies in Makefile.objs files come from our recursive subdir r=
ules
>  -include $(wildcard *.d tests/*.d)
> =20
> +.PHONY: subdir-all-user subdir-all-linux-user subdir-all-softmmu
> +subdir-all-user: $(patsubst %,subdir-%,$(filter %-user,$(TARGET_DIRS))=
)
> +subdir-all-linux-user: $(patsubst %,subdir-%,$(filter %-linux-user,$(T=
ARGET_DIRS)))
> +subdir-all-softmmu: $(patsubst %,subdir-%,$(filter %-softmmu,$(TARGET_=
DIRS)))

I'm not sure why you need subdir-all-linux-user.  I think it's okay to
add these, but please add "romsubdir-all" too.  This way "all" can use
"subdir-all-user subdir-all-softmmu romsubdir-all" and you can remove
"recurse-all".

Paolo

>  include $(SRC_PATH)/tests/docker/Makefile.include
> =20
>  .PHONY: help
> @@ -827,7 +832,7 @@ help:
>  	@echo  ''
>  	@$(if $(TARGET_DIRS), \
>  		echo 'Architecture specific targets:'; \
> -		$(foreach t, $(TARGET_DIRS), \
> +		$(foreach t, $(TARGET_DIRS) all-user all-linux-user all-softmmu, \
>  		printf "  %-30s - Build for %s\\n" $(patsubst %,subdir-%,$(t)) $(t);=
) \
>  		echo '')
>  	@echo  'Cleaning targets:'
>=20


