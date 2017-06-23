Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dOS7G-0006lL-L5
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 13:11:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dOS7D-0006if-W9
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 13:11:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dOS7D-0006nX-3a
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 13:11:27 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:34790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dOS7C-0006lk-UH
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 13:11:27 -0400
Received: by mail-wr0-x22b.google.com with SMTP id 77so74110178wrb.1
	for <qemu-trivial@nongnu.org>; Fri, 23 Jun 2017 10:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=o7l5AeEkqTX2GZjDPpR1Gf3h8ar2rx4dSOp/+dwG/KE=;
	b=kUrQ3mB39ggkCt+/4CrYct5uOMGWHQi87LFlcJeETzoaH6E7ccEsZFgrib1mIeHoiy
	JqvEzvEtIhHuyqWIQ8lFUWzRevjAv268L7JUpGAqRpwjx/hRBQCJvYbfmXvsZ47mCcEq
	HykAaHFVhAq9dVG6VKIEuQhZ/Yk7mguIL0ZZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o7l5AeEkqTX2GZjDPpR1Gf3h8ar2rx4dSOp/+dwG/KE=;
	b=TnRaETbMbQdEE4+T5btG/XU7EEnFRWDw/bgC8vhqzQhzWuU3uMKhv+seweNcf0GlgP
	f3zmf7Pv+a4WJ7sFRwkYfIvr0TJQOsfo4692/UaZSUVGmu4XNIVgkCey9AWRlMAG/Qu6
	2sv6BCU/PAtElMTBgQCIKiUWlNV6YjtLoWE7LeocDmwaXD9Qcg3xSy3IIFTvuxj72ta1
	PQ6pEKGmbZqtqEnWgd+nkXlY911C+qjWLy/aALMNu0Arj1EISrTH9yK1VT0hlBsMv20U
	sVaC8zADoONbH0NX3bVWd4/glrIjSnPIZuKCf0QVJv504OR1SiLhFzTMofbIju3mGoKH
	RqFw==
X-Gm-Message-State: AKS2vOz+bNYiiB2k/dJfk49tF/JvTOBIuiLGuh3jXM1wIIDBlxvFsAbj
	tiKzA1Zdm+I8FGqritW5PRg5axZi4xbN
X-Received: by 10.223.150.163 with SMTP id u32mr6807656wrb.195.1498237884096; 
	Fri, 23 Jun 2017 10:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 23 Jun 2017 10:11:03 -0700 (PDT)
In-Reply-To: <20170623164557.11636-2-f4bug@amsat.org>
References: <20170623164557.11636-1-f4bug@amsat.org>
	<20170623164557.11636-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2017 18:11:03 +0100
Message-ID: <CAFEAcA_MwaYkN8tS0U9nkkic9VrEtppCm_bCS=2pWyKfgUSr-w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Eric Blake <eblake@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Alexander Graf <agraf@suse.de>, 
	David Gibson <david@gibson.dropbear.id.au>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-trivial] [PATCH 1/3] elf-loader: warn about invalid
 endianess
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
X-List-Received-Date: Fri, 23 Jun 2017 17:11:29 -0000

On 23 June 2017 at 17:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> fprintf(stderr) is how errors are reported in this file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/loader.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index f72930ca4a..094f24627f 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -478,6 +478,7 @@ int load_elf_ram(const char *filename,
>      }
>
>      if (target_data_order !=3D e_ident[EI_DATA]) {
> +        fprintf(stderr, "%s: wrong endianess\n", filename);

"endianness" (two 'n's).

>          ret =3D ELF_LOAD_WRONG_ENDIAN;
>          goto fail;
>      }
> --
> 2.13.1

thanks
-- PMM

