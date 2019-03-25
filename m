Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8P7a-0003Vj-VE
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2019 08:54:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fam@euphon.net>) id 1h8FwI-0005rG-Vy
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2019 23:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fam@euphon.net>) id 1h8FmE-0004ME-HZ
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2019 22:55:55 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17762
	helo=sender1.zoho.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <fam@euphon.net>)
	id 1h8FmA-0004Is-RB; Sun, 24 Mar 2019 22:55:53 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1553482522; cv=none; d=zoho.com.cn; s=zohoarc; 
	b=DKTP6a+qN7eTNwRsv6geLrqUXfMFvNP04LbLwGxXZQLKkwfn7owlniOfTCDILOdVkDwCHemuoOySYicrLgkVhOQggk/apgdlYV76RhHm0RKDV/Ai+5eKDtrgk5wT+xbGnQfBmozl9sBd1tqWaFljpT7dZltxdKcRW6XffxivkXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
	s=zohoarc; t=1553482522;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=S8/Bk5axHptMBc8OXoYE34VNRz8Mmb1I5pJPGkzJrEM=; 
	b=FgDCn++mLM3teeqEfSdmlKrOyi5ENQgpal4m/jQeDP9SwxYBbUcjkI3bryxRn3IYyz1KPn31FhUHYikejeVwF0Mdu/JMp+vUa4/ticqVdA1eEDQHnf75H4kPscocAe803pdIU0emauFsvKILgdee4Y8Wv3dSI+vUaWbQSvm4Prg=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
	dkim=pass  header.i=euphon.net;
	spf=pass  smtp.mailfrom=fam@euphon.net;
	dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1553482522; 
	s=zoho; d=euphon.net; i=fam@euphon.net;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	l=1606; bh=S8/Bk5axHptMBc8OXoYE34VNRz8Mmb1I5pJPGkzJrEM=;
	b=JA4qJQbAnXJ/OAQ9F82PAHnq6cg4q2BvosTmaJf3jtbqnVU770Lco5XA+KPuhVQE
	OUl1GntF4CuFVUwM+st1es8HNrbKsl/aSz84eipOWG/8EjgXtf5fw8Y12HUGHN2s/3I
	bUWlTASjEP8o9RaPtU1r+lZDEpGXiLuw/OQfkMPw=
Received: from [10.2.201.103] (120.52.147.55 [120.52.147.55]) by mx.zoho.com.cn
	with SMTPS id 1553482520422604.1768614330713;
	Mon, 25 Mar 2019 10:55:20 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Fam Zheng <fam@euphon.net>
In-Reply-To: <20190321212528.6100-1-wainersm@redhat.com>
Date: Mon, 25 Mar 2019 10:55:18 +0800
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	mjt@tls.msk.ru, laurent@vivier.eu,
	=?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C9AE314A-D5E7-4781-AC14-B4D604580A44@euphon.net>
References: <20190321212528.6100-1-wainersm@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-ZohoCNMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 163.53.93.243
X-Mailman-Approved-At: Mon, 25 Mar 2019 08:54:34 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docker: trivial changes to
 `make docker` help
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
X-List-Received-Date: Mon, 25 Mar 2019 03:06:20 -0000



> On Mar 22, 2019, at 05:25, Wainer dos Santos Moschetta =
<wainersm@redhat.com> wrote:
>=20
> Apply double quotes and period punctuation uniformly.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
> tests/docker/Makefile.include | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/docker/Makefile.include =
b/tests/docker/Makefile.include
> index 60314d293a..c0e1bf57a3 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -151,15 +151,15 @@ docker:
> 	@echo
> 	@echo '    docker:              Print this help.'
> 	@echo '    docker-all-tests:    Run all image/test =
combinations.'
> -	@echo '    docker-TEST:         Run TEST on all image =
combinations.'
> +	@echo '    docker-TEST:         Run "TEST" on all image =
combinations.'
> 	@echo '    docker-clean:        Kill and remove residual docker =
testing containers.'
> 	@echo '    docker-TEST@IMAGE:   Run "TEST" in container =
"IMAGE".'
> 	@echo '                         Note: "TEST" is one of the =
listed test name,'
> 	@echo '                         or a script name under =
$$QEMU_SRC/tests/docker/;'
> -	@echo '                         "IMAGE" is one of the listed =
container name."'
> +	@echo '                         "IMAGE" is one of the listed =
container name.'
> 	@echo '    docker-image:        Build all images.'
> 	@echo '    docker-image-IMAGE:  Build image "IMAGE".'
> -	@echo '    docker-run:          For manually running a "TEST" =
with "IMAGE"'
> +	@echo '    docker-run:          For manually running a "TEST" =
with "IMAGE".'
> 	@echo
> 	@echo 'Available container images:'
> 	@echo '    $(DOCKER_IMAGES)'
> --=20
> 2.20.1
>=20
>=20

Reviewed-by: Fam Zheng <fam@euphon.net>



