Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEV7N-0007jL-4J
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 01:54:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1eEV7L-0007iC-9K
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 01:54:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1eEV7K-0007tY-8j
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 01:54:43 -0500
Received: from ssl.serverraum.org ([213.133.101.245]:50947)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1eEV7G-0007go-1l; Tue, 14 Nov 2017 01:54:38 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher DHE-RSA-CAMELLIA256-SHA256 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 1BD8B22851;
	Tue, 14 Nov 2017 07:54:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1510642470;
	bh=jp5L+ac+t2gVvu6cdS04Nb8Aq5BrNvmw6kuFkwHVjgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AqqodfcUtUf6ZCxIkck1UwPwBx32CQk8M0lBVpjpHdj95Ps9VTlTAZN7v3eA/Qi3L
	q1N3ZpMsHVX54BqnKN6YynoOFUgjPF1fL84ScuSOs0dVMaV9G//vlUAAhChs4nl2dj
	xjedC1sF5zCjBE8u4j5d8u5iwIDr6vUaxMKJ6bhs=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Tue, 14 Nov 2017 07:54:29 +0100
From: Michael Walle <michael@walle.cc>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair23@gmail.com,
	armbru@redhat.com
In-Reply-To: <b2db7d8be31c3c4b5fc3d77ffae5eedcd4c70dde.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<b2db7d8be31c3c4b5fc3d77ffae5eedcd4c70dde.1510612380.git.alistair.francis@xilinx.com>
Message-ID: <dbf679ec24da96a4d2d9dc7a43adcde8@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-trivial] [PATCH v5 13/29] hw/lm32: Replace fprintf(stderr,
 "*\n" with error_report()
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
X-List-Received-Date: Tue, 14 Nov 2017 06:54:44 -0000

Am 2017-11-13 23:35, schrieb Alistair Francis:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
>=20
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N; {s|fprintf(stderr,
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N; {s|fprintf(stderr,=20
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N; {s|fprintf(stderr,=20
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N; {s|fprintf(stderr,=20
> "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
>=20
> Some lines where then manually tweaked to pass checkpatch.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Michael Walle <michael@walle.cc>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Michael Walle <michael@walle.cc>

-michael

