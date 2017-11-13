Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEJCP-00042t-4z
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 13:11:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eEJCN-000428-Sq
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 13:11:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eEJCN-0004Hi-0I
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 13:11:07 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eEJCG-0004Eh-3m; Mon, 13 Nov 2017 13:11:00 -0500
Received: by mail-wm0-x241.google.com with SMTP id n74so15070420wmi.1;
	Mon, 13 Nov 2017 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zQVt7Y3PEcY/h0JsyaXJIF2LTn/r2dvRP3HGlO8SaO8=;
	b=LEsA7KDOmXo+nvA25fhyCGyq9XKBDzAMLzUGtpfkXTzhbT4FIp1UyVRTLYKp/tGUI2
	sU/CUEHnBm7dV+spCUEMQ/Q0Us6GlKQiuAMLyOYrZS4fnY1swFTvyKQ+LZlAnHdxzrpv
	cs27fyYecCH5JsXiHFrLnykXkCKigRo+C+GhoBpSyYtRyXVbLbhAz1m+0iLBSjzFA81d
	YlHishwjgo09xCIGZGdvog6PW4YNvQLWrFp4cXGCMDcweJj1ciz0ECYLojIzECXAP1qb
	/PUXR/iVkX+qjJpG1jdKKevwtGoMX7TapC8sxsdpZRRF3i8QhdFNwzV44xBi5+oHCspU
	8cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zQVt7Y3PEcY/h0JsyaXJIF2LTn/r2dvRP3HGlO8SaO8=;
	b=jK+IfVP7NEEN6Zp5wLS7e6SFdJwbB0Atntp2kh0wOsdxIYIjrFlbPiLVkoGh3VEbIW
	itm9oth+gUN8zICWLztyGoKg1U75/gE8yErwCYw1V2GPGPDMJuDIslVy11bup4HmJLQY
	yW809ZwbqPCFrqSapAXnR72CzX4GOHMMsTIn0SHtngQW4Li8jUtZ45wqwVziHi6XX32b
	FzbIYfrZlxk3CAdFpA6sUlIjl6rkXTSOwjiu8F9OaRnZHCJg0SgbJGzcudlzN+h+TYWG
	11+oyqHiq7Wy4zQbvn0gZJflFxhfmn7w1zHrgHpGUCtnuBbXfKMjJHTjUzDfPoKctn89
	qmvg==
X-Gm-Message-State: AJaThX5tg07qEtFlEL/x/Ezhp/P699+0P8N6QhlyU/S/CarVGdwK6QjY
	mKDVobA5ZEUJ15M6tS3FcM9WUZWtMUUa9RlHWOo=
X-Google-Smtp-Source: AGs4zMZ6OWXH0f0MBktmeqmFvbgLu9M/sYZFWDXEnD6Y163aAKR6P7D83Za+iiDH/XB8zXdxywgXfnUC4ZYykS8nSvA=
X-Received: by 10.28.247.16 with SMTP id v16mr7619742wmh.128.1510596658511;
	Mon, 13 Nov 2017 10:10:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Mon, 13 Nov 2017 10:10:27 -0800 (PST)
In-Reply-To: <1510564905-6185-1-git-send-email-thuth@redhat.com>
References: <1510564905-6185-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Nov 2017 10:10:27 -0800
Message-ID: <CAKmqyKMvFAZ3p+2csO=viTyF7ruCpWL4iReZVzNRcO9DnaAkkQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, 
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/make-release: No
 need to delete pixman/.git anymore
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
X-List-Received-Date: Mon, 13 Nov 2017 18:11:08 -0000

On Mon, Nov 13, 2017 at 1:21 AM, Thomas Huth <thuth@redhat.com> wrote:
> The pixman submodule has been removed in commit c12b6d70e384c769ca372e1,
> so there is no need anymore to delete pixman/.git while building a
> release tarball.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  scripts/make-release | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/make-release b/scripts/make-release
> index fa6323f..70367ab 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -19,7 +19,7 @@ pushd ${destination}
>  git checkout "v${version}"
>  git submodule update --init
>  (cd roms/seabios && git describe --tags --long --dirty > .version)
> -rm -rf .git roms/*/.git dtc/.git pixman/.git
> +rm -rf .git roms/*/.git dtc/.git
>  popd
>  tar cfj ${destination}.tar.bz2 ${destination}
>  rm -rf ${destination}
> --
> 1.8.3.1
>
>

