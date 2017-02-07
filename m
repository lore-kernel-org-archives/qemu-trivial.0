Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb7hZ-0004Ek-NK
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 10:29:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cb7hX-0004CY-Fr
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 10:29:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cb7hR-0007vH-Tk
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 10:29:03 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:32919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cb7hR-0007uM-Nl; Tue, 07 Feb 2017 10:28:57 -0500
Received: by mail-wm0-x242.google.com with SMTP id v77so28873541wmv.0;
	Tue, 07 Feb 2017 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=F7/YAujaaNBabBd3+kitOlZvdPUN9oz34QKCfPlHCl8=;
	b=iRhXoCveXUh4aOcqXPF6ibtl/UaMvM2Byp04+0qWJ7b/PrE26QcXwlSwj5tNF3XGrn
	jwoEJOYWWRo9I8A0eOr0UxyK2I3/R36WpOGrVWwGeJZGjBtaEmgfCr5foloHjPd/idSa
	TTDmjvOwWNAXO1srOAHdfHUFh6JeDoT88lixDJ4ouhtlZXInhmUQeC9ib7hIcTwEQ9AJ
	By6ualQqfaavnic+zJ+7Z6QPRixdvURZhlK/fyT7Vb3wQZdIXTKHrA3ytD3jdyTxfe9V
	/0LkqJuazMOCQtc8GcZfObVyhkrVeiCPW/fFfNaG+olYkCyM/Vva/qfL87rJpw00U4Dd
	ZtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=F7/YAujaaNBabBd3+kitOlZvdPUN9oz34QKCfPlHCl8=;
	b=E1wrHiL4RHMYEyQUMDFGKB0e+UDM+v/25PV5+93xfbpZx5KbxywZfVfBs/EhXGDTAS
	qxl/GOK/UOx0MdC9tJQdqtrtbrSCiJHlNHJLcGeBew03wY3qy8bRvqRZeSLL2nyt5O1J
	wHjkWlgl2byLDYDUUBZwin6TYNe0vVFrIzEclDQN/FAYjuxeQwDlEovalJU/oTFdHgSY
	bHrcsU3PT8CDQhHxmXV5NHoscMTY6z/6QEbDjkV1sdaqDWE1axeTCY0MLTh+FP/rNt7V
	u1WzW00hPPfHNQGnCLY1ph1c9XFWQGLdPaD3YSJfZZfFgvK4H7TZfiXC5lM+wRwsHWmF
	1NfA==
X-Gm-Message-State: AMke39kBjxPnLHcnPZTvR/qO39nk/tss2AovQcauAOg8e4jvFBnwKmsDyV5fnYaAU+TJiQ==
X-Received: by 10.28.15.2 with SMTP id 2mr14779736wmp.66.1486481336430;
	Tue, 07 Feb 2017 07:28:56 -0800 (PST)
Received: from [192.168.10.165] (94-39-187-56.adsl-ull.clienti.tiscali.it.
	[94.39.187.56]) by smtp.googlemail.com with ESMTPSA id
	w17sm7915846wra.28.2017.02.07.07.28.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 07:28:55 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20170127094154.19778-1-berto@igalia.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5370d078-6f29-3d56-635b-5871a6b95983@redhat.com>
Date: Tue, 7 Feb 2017 16:28:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170127094154.19778-1-berto@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Clarify that -vga std is now
 the default
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
X-List-Received-Date: Tue, 07 Feb 2017 15:29:04 -0000



On 27/01/2017 10:41, Alberto Garcia wrote:
> The QEMU manual page states that Cirrus Logic is the default video
> card if the user doesn't specify any. However this is not true since
> QEMU 2.2.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 80df52651a..66ee562821 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1195,12 +1195,12 @@ Select type of VGA card to emulate. Valid values for @var{type} are
>  Cirrus Logic GD5446 Video card. All Windows versions starting from
>  Windows 95 should recognize and use this graphic card. For optimal
>  performances, use 16 bit color depth in the guest and the host OS.
> -(This one is the default)
> +(This card was the default before QEMU 2.2)
>  @item std
>  Standard VGA card with Bochs VBE extensions.  If your guest OS
>  supports the VESA 2.0 VBE extensions (e.g. Windows XP) and if you want
>  to use high resolution modes (>= 1280x1024x16) then you should use
> -this option.
> +this option. (This card is the default since QEMU 2.2)
>  @item vmware
>  VMWare SVGA-II compatible adapter. Use it if you have sufficiently
>  recent XFree86/XOrg server or Windows guest with a driver for this
> 

Queued, thanks.

Paolo

