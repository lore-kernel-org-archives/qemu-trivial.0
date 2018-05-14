Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIFq6-0004gS-Tv
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 11:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fIFq4-0004e1-7g
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 11:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fIFq3-0006YM-Gu
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 11:56:40 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:50200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fIFq1-0006XH-GP; Mon, 14 May 2018 11:56:37 -0400
Received: by mail-wm0-x244.google.com with SMTP id t11-v6so14441626wmt.0;
	Mon, 14 May 2018 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=13OxdREhBkxzoMyFIYv827b6FsvRAFa7k7ds8KeWJKM=;
	b=WjotfZFg4ES7Kh1bOXqQnjwy4fZ/CRp+uUz8HcEcs6LPrFBQKOIUPCc7RqHVcQOsS2
	cgIWgMgECg1HG0kb+V9F3WItQxoZrDdJbyjrV0efuDwjNIvetBZ9ITHKCfNnYSSNYv9A
	8VoVmmOe2y2uGdG9c1ZCXTUAEW1WpPMjEBlmSX2baJUEFIWRoGNSs4DfxLUFucwG6UYC
	fBltKumy6hzsCn/vIw/ptake1UDJfQ485AUYL7ti0uDSZ7KQjf4m1SUvkgVveyLoTj8h
	PPH2ZO0jp37/JGPDb6zC3Kp8sr2X4QIPDKNOdwvlR7CnwXk0fQTNP0QV9v+WQmuKKuPZ
	KH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=13OxdREhBkxzoMyFIYv827b6FsvRAFa7k7ds8KeWJKM=;
	b=Aw+x5ewYcJuNu68lBKoMdN0jPD1iKal/KHyg3HLyuiWdOYOr1ljAkJWSl23ze+fCLn
	fO3vHtpyApfIRVYNMCZgyin/5knPMJNvaTOfvV7r4N6lfowvnvFrthxT4OS5G50Qhfl4
	m1vw3YOqcjpkg3JUyAjLMiNqQ9htMIEPAtAvyvHyj5EyDTruwIT5gnUH14S+vUuo2YsK
	N3CEv2oGzrr872tIfCj5MD+km+1xtGP1ywWwtXOZlIYwXacPseDXRk9mYyxBBEF60G7I
	wTH6zCVQHqxZbOpJzkdQt2wXTkLQc2LIGpfWPi/Gq9LQPS+fyUbNyFL3mqbzF7A9RZWv
	FHdA==
X-Gm-Message-State: ALKqPwen0THBkAh5s28t5f8fRvKFHxPNIWa9S1R47ZT1fWblShaI2ur6
	uZ5Ga/LpEI46FSLWS4jRC+vpNTdQqp+GDAY+z+g=
X-Google-Smtp-Source: AB8JxZqtC0JxyWImd1bTHyalSz/ruF4t4hSpVBy3vq8hw+NB50dRwWg0qZ159NmQnAlacefvBByVE1g2VQEu0pS+ByQ=
X-Received: by 2002:a1c:f714:: with SMTP id
	v20-v6mr5972005wmh.73.1526313396300; 
	Mon, 14 May 2018 08:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.4 with HTTP; Mon, 14 May 2018 08:56:35 -0700 (PDT)
In-Reply-To: <CACKT+Ap2MHCrSCT-0_=KG9UrGAtO7F3EGue6-63-XJxry9=C=w@mail.gmail.com>
References: <CACKT+Ap2MHCrSCT-0_=KG9UrGAtO7F3EGue6-63-XJxry9=C=w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 May 2018 16:56:35 +0100
Message-ID: <CAJSP0QW1BN8ouvQU4LRSeYmn02A63-pB3Cq6xT9h8hm70Gti3Q@mail.gmail.com>
To: Jonathan Marler <johnnymarler@gmail.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] handle all
 fdt_get_phandle_errors
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
X-List-Received-Date: Mon, 14 May 2018 15:56:41 -0000

On Fri, May 4, 2018 at 7:37 PM, Jonathan Marler <johnnymarler@gmail.com> wrote:
> Signed-off-by: Jonathan Marler <johnnymarler@gmail.com>
> ---
>  device_tree.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/device_tree.c b/device_tree.c
> index 52c3358..2b75905 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -379,8 +379,12 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char
> *path)
>
>      r = fdt_get_phandle(fdt, findnode_nofail(fdt, path));
>      if (r == 0) {
> -        error_report("%s: Couldn't get phandle for %s: %s", __func__,
> -                     path, fdt_strerror(r));
> +        error_report("%s: Node %s does not have a 'phandle'", __func__,
> +                     path);
> +        exit(1);
> +    }
> +    if (r == -1) {
> +        error_report("%s: Couldn't get phandle for %s", __func__, path);

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

