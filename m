Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez3RE-0000i0-F5
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 12:51:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3RD-0000gy-1H
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3RC-00065l-9y
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:51:39 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3R8-00061s-7O; Thu, 22 Mar 2018 12:51:34 -0400
Received: by mail-qt0-x243.google.com with SMTP id y6so9637410qtm.7;
	Thu, 22 Mar 2018 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yosD7plg4f9hIVR7FZHVCGilOJRomb0s4aLx89+su1o=;
	b=h24ItFDgVp5NYNl2p9XasONfAmiJuNJOPB2PPhMTYTnilE5bvtDb0CPOhOsyCBxYTh
	+Xsld29msQINxc7KypO1Rm/xZjQBtjBuW0rpgcqkoTOU2Wb18LRX+QWK7C/C3yxhMVfR
	wIrAfrTsBPd0AB3U3v9UFO8lvy3B7qr/+36HSzoMuxAVmxdd3LJR/94QnSLuoy/HrWe0
	fZsrTnhsij9XjEeiY733ySs6xOF3WP3CqGmsYnS1JIOI4Ov2dIW1A8cDnE3ojkUCBkxu
	CMsx8ui7DhsfqXfI+iqsL4bBT9UDL9dYyhFivWHwMkrzBeLiqtFmyLZwqFvoNnj3JwUd
	Zvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yosD7plg4f9hIVR7FZHVCGilOJRomb0s4aLx89+su1o=;
	b=pG52TScaNZRrjXC268LIE6ec2x3wG4jsouS/0ymIVWHPQLuRhCarRmIkVeVZ4z72wu
	RAXHIahXduaMti90CksAVmU2lNDk1eEUXqGEzv8yHhLwwd7gbWZlcKXfyLIX8FfSCxfk
	JVz4Q/iHqtTMPidaQQYeierNRsfZTMrbSEXHOkGfXQxbP5NeRC1cBkuetTB79QNVdFoN
	mtbGIDHBQrwTf+0QQQ5xZChIHmstKIguENCcQKZnJYWAB2PZ6i2Ew1SlvzO7ogFFbcs+
	RtxpwleK3eyXtA1XAN+01SiVCymKzL0gIorPYBee3V1D+KO/HhjAd9dxwQxNxcYPwqAU
	wgTw==
X-Gm-Message-State: AElRT7H0eBOYxHTeapaKUMz8lvA6QrI0W6+qnNzH2ABHt3VudCCKc451
	WbSzSkQAgwplTI9AlnhkzemJO6mkgCmmrFzOZrU=
X-Google-Smtp-Source: AG47ELuQNAwSWkCCHf6kifnDPjXLVPWjbLdMBeNkbLof3Yo3nIo8silM4MOMjgo6fNg+DJeQGmSFYOSIuhQsHAmthCI=
X-Received: by 10.237.60.204 with SMTP id e12mr34594328qtf.243.1521737493412; 
	Thu, 22 Mar 2018 09:51:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.60.212 with HTTP; Thu, 22 Mar 2018 09:51:32 -0700 (PDT)
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 09:51:32 -0700
Message-ID: <CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	qemu-ppc <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
X-List-Received-Date: Thu, 22 Mar 2018 16:51:40 -0000

On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com> wrote:
> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------

These files were autogenerated, fixing them doesn't make much sense.

-- 
Thanks.
-- Max

