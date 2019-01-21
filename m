Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glevF-0008IY-93
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2019 14:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevC-0008Da-80
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 14:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleha-0003la-Bc
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 13:53:43 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleha-0003lJ-6a
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 13:53:42 -0500
Received: by mail-ot1-x343.google.com with SMTP id s5so21415543oth.7
	for <qemu-trivial@nongnu.org>; Mon, 21 Jan 2019 10:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/PtvVBiEMNIsoBPD+DuxYbeQU1n9f6P2Zq3xC+fpqh4=;
	b=WfLSAVu0Lw781GycupSPZe653LM6Il/IRBQT9iNXa8bjdkCIJJhhlL6+Ju4yOrZDmz
	NIzMhnF+OSWi8f9sWSy6B2tl7RyKOIh0NqA52oNQkWzOhORJJ0rGqbuFA1PlnnYSGXxs
	YVk3EWFtyq1bmDjEl3A9rcAdBxcTGbePJ99W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/PtvVBiEMNIsoBPD+DuxYbeQU1n9f6P2Zq3xC+fpqh4=;
	b=NX6TDQ32HE/vBs/4CdKkwCt+J+c/c1khoRVrpcdMkrI29UKdcMw8nNXEu7pz3OWFG0
	rNNPbzoM1JorvhU9SThT5OvnGh1rqapArmjC+Uede/3KYBkAlb9DLH4IB5+54wTuZwpi
	sCyXoUuH6l+AbQla8IOdIKh9ZW/1p2nqg9339cH1nUt9AnaDpI+alcTzcZAMRFl3Kc6M
	VlIzkA/OCP2K1TAZRJK2OlXAR6+607mrNK9URAMjY6KMHdZWDVmL186MVbIp1HgqpDsV
	N+y4LvJpaNNjl9wknQ1pdK9lBdTn1Z2SjRWMfPL8TLJDsgKWBZi9S/LwX0LcWWduh9er
	E1ug==
X-Gm-Message-State: AJcUukeUmod3nBMRc/d/isFBuM8ugMTj55s6EFinaCBb/g6PaXOmyIRT
	wB3vmAA5K9e/bR4kh82k3UOvDXAg1M3giA/Wc/ZZCQ==
X-Google-Smtp-Source: ALg8bN70m85kYvhwf3Fjog8mc0F0/L6pqqD2e1VzRTeoyoTWrtU86+iDkCy/LwBXihbBA+tCiYBPhbFRoEHhHChRipw=
X-Received: by 2002:a9d:4b0f:: with SMTP id q15mr6120021otf.201.1548096821481; 
	Mon, 21 Jan 2019 10:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20190121181335.3326-1-philmd@redhat.com>
In-Reply-To: <20190121181335.3326-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jan 2019 18:53:30 +0000
Message-ID: <CAFEAcA9DqR70kNLNr=ywLF3w_dQ2qiKUdp+NHP=Nw_ab2vsNmw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Wei Xu <wexu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-net: Fix a typo
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
X-List-Received-Date: Mon, 21 Jan 2019 19:07:47 -0000

On Mon, 21 Jan 2019 at 18:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Fixes: 2974e916df8
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/virtio/virtio-net.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-ne=
t.h
> index c7ec1a755f..756eee8af0 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -94,7 +94,7 @@ typedef struct VirtioNetRscUnit {
>      uint16_t payload;       /* pure payload without virtio/eth/ip/tcp */
>  } VirtioNetRscUnit;
>
> -/* Coalesced segmant */
> +/* Coalesced segment */
>  typedef struct VirtioNetRscSeg {
>      QTAILQ_ENTRY(VirtioNetRscSeg) next;
>      void *buf;
> --
> 2.20.1
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

