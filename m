Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVPXK-0007up-MG
	for mharc-qemu-trivial@gnu.org; Thu, 25 Apr 2013 13:00:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UVPXH-0007rL-V0
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 13:00:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UVPXC-0007xV-MH
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 13:00:43 -0400
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230]:54021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UVPXC-0007xB-F7
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 13:00:38 -0400
Received: by mail-la0-f48.google.com with SMTP id eo20so2824765lab.35
	for <qemu-trivial@nongnu.org>; Thu, 25 Apr 2013 10:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=haJTkm5kkKKifjt/Rud+b2K7buaU2L/00ewjGv3tyO4=;
	b=LoLtPSlfZTXrpbdLtT97pXSjZ+6rwc883duHdBYEGCTMps9jw+oXyKu/ATbV3pMuUe
	xxFXkQSWYuZ344ibe5w9dsE3kjs1xb3/sqaCGa0SmnA93yX+D3B62vz5veQ41qJ6KDso
	1QS9/nHlB4d0LCFrf3eeV598IGW02phr9uJfSW12sLhn9KNg1RQJy/W8VYNSO+edYl4G
	thmmnBNL7A4aRHZcaQx+Xw813HIxbkDxhMWvJObEH/beaLN34ydDeWQQv6bGA4vGT5N4
	/9g4d6PCbus8+zGBsxhZhsXKREM4mY3iV+0qhwQy0aORQ9GTkujl8CqKPD2b0/TigXbb
	w7Bg==
X-Received: by 10.112.125.33 with SMTP id mn1mr20310193lbb.89.1366909237023;
	Thu, 25 Apr 2013 10:00:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Thu, 25 Apr 2013 10:00:16 -0700 (PDT)
In-Reply-To: <1366908076-22099-1-git-send-email-thomas@codesourcery.com>
References: <CAFEAcA_m4a_xeeH8+9Sx2sKC-R-gG8Qte-Zg4wC7XWGOTp6uGw@mail.gmail.com>
	<1366908076-22099-1-git-send-email-thomas@codesourcery.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Apr 2013 18:00:16 +0100
Message-ID: <CAFEAcA_6ygPNhP=D06Z-5S5S4sFfTF3MpYVcEbYg+ny1ns+n0Q@mail.gmail.com>
To: Thomas Schwinge <thomas@codesourcery.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkEB4/0WQ3RZB++k0xxO5PG5Kzil8P6/4zlCRRru4XzHXfwZFFojVzrdpFp3qm14UtgC3C+
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::230
Cc: aliguori@us.ibm.com, QEMU Trivial <qemu-trivial@nongnu.org>, sw@weilnetz.de,
	riku.voipio@iki.fi, qemu-devel@nongnu.org, agraf@suse.de,
	paul@codesourcery.com, j.schauer@email.de
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Option -ignore-environment
	removed.
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
X-List-Received-Date: Thu, 25 Apr 2013 17:00:45 -0000

On 25 April 2013 17:41, Thomas Schwinge <thomas@codesourcery.com> wrote:
> Has been removed in commit fc9c54124d134dbd76338a92a91804dab2df8166.
>
> Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>

Thanks.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(and cc'd qemu-trivial).

> ---
>  qemu-doc.texi |    3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git qemu-doc.texi qemu-doc.texi
> index dfea4d3..64493eb 100644
> --- qemu-doc.texi
> +++ qemu-doc.texi
> @@ -2683,9 +2683,6 @@ Set the x86 elf interpreter prefix (default=/usr/local/qemu-i386)
>  Set the x86 stack size in bytes (default=524288)
>  @item -cpu model
>  Select CPU model (-cpu help for list and additional feature selection)
> -@item -ignore-environment
> -Start with an empty environment. Without this option,
> -the initial environment is a copy of the caller's environment.
>  @item -E @var{var}=@var{value}
>  Set environment @var{var} to @var{value}.
>  @item -U @var{var}
> --
> 1.7.10.4
>

