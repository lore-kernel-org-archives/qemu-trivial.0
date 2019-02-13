Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtr96-0007QD-SF
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 04:48:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gtr94-0007OC-Fr
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 04:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gtr93-0007Kh-CN
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 04:47:58 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:41642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1gtr93-0007KP-5D
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 04:47:57 -0500
Received: by mail-wr1-f53.google.com with SMTP id x10so1691540wrs.8
	for <qemu-trivial@nongnu.org>; Wed, 13 Feb 2019 01:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=2zeSK3+Jowj+3QAjeR3iox0+ytxXbW6S7kCzM+Czolw=;
	b=j/tPp7nTDZFKxrYG+QydI1I4I7HbBuYp67XzDSfH+ZjOiukshrfW8sVODovyEeZxoR
	aEluBNjCFTrL8AnGEBRgKRd/CmXzIx/4V0nEpw+fkXcgQndBnBWNABQg37u0QFEc1szQ
	8CaRUtmRpi+lJV5rClDU0GPCpe5q1ztd1RuLgaPzpoMNH/B3QUYIJhxi7VaLIgH77Vkf
	AReu8h8RdabMYmPe5KZoOA6w/Diug/h0j+W5U57yq1ApTJO4wRlnlNN6CM4AXx7gLHrh
	59t1/VGJxclj4bQ/0Onh0K7DMTQFstia2iOgKVRlLrVTO71NYhRBfUOK+KbRvUNcYxux
	lUEQ==
X-Gm-Message-State: AHQUAubMbWQRrhu1nQ5qy/l90ZSs0OK84ZPaZsfWqba6Ue+M6pKHxBEg
	TMH5/QRlrAdbudBpSzvLC7jBrw==
X-Google-Smtp-Source: AHgI3IaaS4GFUP6HIVnFI5BPBryt/VXfr8qnTnv61xHAXuGMaB80N9ZFw61MOuPqPkhux1Mi4oD+Bg==
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr6143543wrn.197.1550051276046; 
	Wed, 13 Feb 2019 01:47:56 -0800 (PST)
Received: from steredhat ([95.235.129.48])
	by smtp.gmail.com with ESMTPSA id k4sm11552677wrp.8.2019.02.13.01.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 01:47:55 -0800 (PST)
Date: Wed, 13 Feb 2019 10:47:52 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190213094752.5jz2m3xrv5zonfvw@steredhat>
References: <20190212145322.30974-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190212145322.30974-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.53
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/dma/i8257: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Wed, 13 Feb 2019 09:47:59 -0000

On Tue, Feb 12, 2019 at 03:53:22PM +0100, Philippe Mathieu-Daudé wrote:
> Avoid to clutter stdout until explicitly requested (with -d unimp):
> 
>   $ qemu-system-mips64el -M fulong2e -bios pmon_2e.bin
>   dma: command df not supported
>   dma: command df not supported
>   dma: command df not supported
>   dma: command df not supported
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/dma/i8257.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

