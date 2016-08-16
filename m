Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZbwr-000587-Vi
	for mharc-qemu-trivial@gnu.org; Tue, 16 Aug 2016 06:50:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZbwp-00056W-4b
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 06:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZbwo-0004oV-57
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 06:50:19 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:35975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZbwn-0004o5-4Z
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 06:50:18 -0400
Received: by mail-ua0-x231.google.com with SMTP id 97so114844036uav.3
	for <qemu-trivial@nongnu.org>; Tue, 16 Aug 2016 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=w3u0U3rYAioSbHm6vklfqZdUoF9w5fF5qJF7M6VpWVI=;
	b=JBmSbGjXUR2n42GMWJJqbSwtIU6+yWxyGp2P61mQyRzTjr8cx7vvG9QG/K/UBaC+Sv
	YJkmO80fFo3n/OO2ZF2EZ1KjSJKzpvMrPKBR6GKynWXvZSCnip70MSXEU5g2Zh9Lu9hO
	dk2g7iAl+nVzkTGe4v0JCiAKpKrYZ9/r6n9mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=w3u0U3rYAioSbHm6vklfqZdUoF9w5fF5qJF7M6VpWVI=;
	b=JpyqMXu7aQIq6joVQaWxT7IZxd8dRVbJrG89R2NNHGDRaFmmwY48+phvkt7yXdC26B
	O0idOvG3jUEo+aCFpd4M11+76PvtNVI1PJzex+ZM5pDsovtuSXvPOF4cH9UIol910IST
	Z5aLgtt/ro4PvogBdInay0qEyURABq4Qa/LLNaNnKtis7KCXuLrh1XFx+X+CKihuIwNq
	V4qjKgtc8yCJ/whLDbjXX2lbJNR/Z/v3WEQy57A2XJTT1JPKG5U7nPDZRhGaFgej3KxX
	19hsosDZj/b+rPpJp23s2JgwIujDGqZ4pPuvViLvmplJ4DwdJqBMhdX4xiBa1SzOpu7z
	FUow==
X-Gm-Message-State: AEkoousD38ESGAaqa9VIZTriIPMa9Hl1+Q+vOX8BsTw9jVcla+ozVGooZzb8Y9EZHE5bRF/qkYggmLoo12En8mDY
X-Received: by 10.159.35.47 with SMTP id 44mr4168686uae.38.1471344616494; Tue,
	16 Aug 2016 03:50:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Tue, 16 Aug 2016 03:49:55 -0700 (PDT)
In-Reply-To: <1470648700-3474-1-git-send-email-berrange@redhat.com>
References: <1470648700-3474-1-git-send-email-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2016 11:49:55 +0100
Message-ID: <CAFEAcA-tp0G2V1-ugCOKP+J3XPE70_y-5KAWuMwWYKG+UGO_jQ@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.7] virtio-gpu: fix
 missing log.h include file
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
X-List-Received-Date: Tue, 16 Aug 2016 10:50:20 -0000

On 8 August 2016 at 10:31, Daniel P. Berrange <berrange@redhat.com> wrote:
> The virtio-gpu.h file defines a macro VIRTIO_GPU_FILL_CMD
> which includes a call to qemu_log_mask, but does not
> include qemu/log.h. In a default configure, it is lucky
> and gets qemu/log.h indirectly due to the 'log' trace
> backend being enabled. If that trace backend is disabled
> though, eg
>
>  ./configure --enable-trace-backends=3Dnop
>
> Then the build will fail:
>
> In file included from /home/berrange/src/virt/qemu/hw/display/virtio-gpu-=
3d.c:19:0:
> /home/berrange/src/virt/qemu/hw/display/virtio-gpu-3d.c: In function =E2=
=80=98virgl_cmd_create_resource_2d=E2=80=99:
> /home/berrange/src/virt/qemu/include/hw/virtio/virtio-gpu.h:138:13: error=
: implicit declaration of function =E2=80=98qemu_log_mask=E2=80=99 [-Werror=
=3Dimplicit-function-declaration]
>              qemu_log_mask(LOG_GUEST_ERROR,                              =
\
>              ^
> /home/berrange/src/virt/qemu/hw/display/virtio-gpu-3d.c:34:5: note: in ex=
pansion of macro =E2=80=98VIRTIO_GPU_FILL_CMD=E2=80=99
>      VIRTIO_GPU_FILL_CMD(c2d);
>      ^~~~~~~~~~~~~~~~~~~
> /home/berrange/src/virt/qemu/hw/display/virtio-gpu-3d.c:34:5: error: nest=
ed extern declaration of =E2=80=98qemu_log_mask=E2=80=99 [-Werror=3Dnested-=
externs]
> In file included from /home/berrange/src/virt/qemu/hw/display/virtio-gpu-=
3d.c:19:0:
> /home/berrange/src/virt/qemu/include/hw/virtio/virtio-gpu.h:138:27: error=
: =E2=80=98LOG_GUEST_ERROR=E2=80=99 undeclared (first use in this function)
>              qemu_log_mask(LOG_GUEST_ERROR,                              =
\
>
> [snip many more errors]
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

Applied, thanks.

-- PMM

