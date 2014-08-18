Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJI2K-0004wb-85
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 04:11:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJI2E-0004wU-QO
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJI2A-0005Oz-GU
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:11:22 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:60318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJI2A-0005Ot-A0
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:11:18 -0400
Received: by mail-lb0-f173.google.com with SMTP id u10so3843026lbd.32
	for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2014 01:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=7pmJcwMRokyOHRfzBaJMnVckCjsd4ff55gx9jFxZUGk=;
	b=f0EpliJoz3CodKHCbtsjlpqb2WUAtHgU1gLjaNSrzKW+lbX+GpcsOowsC/BEtXoDUw
	kQigUtFt40vgyjTvjVVqPUa2duPZm01+lxlo9mgtuajbm22kMs+/C7C9VBmnR7RZ0En9
	nYBtUKBxaOvhXlpHN9VqtRszqm9DGwkmh1+pBNCtPz8c1YLYH+UvlmsYzFfmBj/fVCVb
	1GR+jrRKV9z13zLYKVCiNWQ93kXmZlC8tbMZ7el++rutUGvEUlSTPhSYba5QvaBnHXH1
	gFF3wtsW12cBN7IDNvrzy0FYx7jvdakGcEXpRy34OQe1aghJsYSUi3sIwM6DWae+LIgV
	5koA==
X-Gm-Message-State: ALoCoQnx8d/wJC2HGMCBIRanoPcKubKx0T/V1vgAO9QqHxrqXzbtLIJ5cLrtGYu2PrxjazmE7VcF
X-Received: by 10.112.22.37 with SMTP id a5mr26494502lbf.76.1408349476406;
	Mon, 18 Aug 2014 01:11:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 18 Aug 2014 01:10:56 -0700 (PDT)
In-Reply-To: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2014 09:10:56 +0100
Message-ID: <CAFEAcA_RLUyQcyvDQxtv6nGqqKjWC+8ZNOt4yPLuHfgteYexLQ@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Li Liu <john.liuli@huawei.com>,
	Marcel Apfelbaum <marcel.a@redhat.com>, Luonengjun <luonengjun@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v7] tests/bios-tables-test:
 check the value returned by fopen()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Aug 2014 08:11:27 -0000

On 18 August 2014 08:54, zhanghailiang <zhang.zhanghailiang@huawei.com> wro=
te:
> The function fopen() may fail, so check its return value.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Li Liu <john.liuli@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/bios-tables-test.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 045eb27..feb3b58 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
>      const char *arch =3D qtest_get_arch();
>      FILE *f =3D fopen(disk, "w");
>      int ret;
> +
> +    if (!f) {
> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(errno=
));
> +        return -1;
> +    }

-1 isn't a sensible value to return from main(); you want 1.
(Program exit statuses can only be 0 or positive.)

thanks
-- PMM

