Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnCBr-0004wQ-Dl
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 19:14:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnCBn-0004v1-QK
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 19:14:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnCBn-00084Z-1U
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 19:14:27 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dnCBm-00084I-SA; Wed, 30 Aug 2017 19:14:26 -0400
Received: by mail-wm0-x244.google.com with SMTP id e204so3255881wma.2;
	Wed, 30 Aug 2017 16:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=8JYXPHiGqYeeHYdSKCq/Qs/v7jc9xmVLLnwYJyAgBag=;
	b=ffg5LUPNlYihuE1joIv/A1YTdwVQ8GZ1nGbSOu0a1iRhCovkIO5VEzMJKoPrDB2G8B
	0ijJtWYu9B+ebuOoB1IWNS8+OfvVIngiMwkDSnYuE4Ywm/3VPUC7/s649qp8zGSJ97p4
	X1iPYT1/yXxnCIvUKd/fFfFqYsNHIfeGoMrfdDYnQ0FSx/oQrGElRen03UiMWF97YUqY
	if5sZBpGw1/zPNJt4W3hCpns6aNbl1tu0jD+6fGvPw6HyKi7waSCdsAw21X6l+z0QFhG
	euJBOwvbtye8DJeTGHs5DNGQACdibOROQInyekjhHTqhhMwHjBu5zSLvD3K9FXQnUZMu
	3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=8JYXPHiGqYeeHYdSKCq/Qs/v7jc9xmVLLnwYJyAgBag=;
	b=p60b7tBX6Ug+XkeWOabsaUkW7i7zq+QFUVeW3exJ0/u4IbvJyzGG0Zbe7mUcqXVhBl
	0MTTq1BSHtL0wAeLkG5/8qaWn4t0FwwifskXA8VZeQd+Cplte+9rNMwVi3Nb0QAR6fz2
	jfZCq80KdPX1qNW0k7CNCL9MmPMcFbhdWZGpZOkjuCCgU2HpRMdmo+gTH2QXThiQLqIn
	xUeOS9MuzFwcZE3v13APVRK73ND+JdAio/SzNGQyIrNu8Gmjv9r9G8YGgTA9/VWk1qyd
	6QNikC2NT+iLqTkrCg0ZHjXbY1EeLqnRhnslaf/PH0R5/HBqV1UZoayh1qng/V0eQW+Z
	yelQ==
X-Gm-Message-State: AHYfb5hYzl7CUzZvhHG9pHrgQ0aWyzkDLT9TIoS9xKSFDq1q56wFuFGE
	1H9t93v+0WLVHn+iKYyBXut9UeP+7Q==
X-Received: by 10.28.209.131 with SMTP id i125mr1972105wmg.51.1504134865920;
	Wed, 30 Aug 2017 16:14:25 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.191.130 with HTTP; Wed, 30 Aug 2017 16:13:55 -0700 (PDT)
In-Reply-To: <20170830215523.25278-11-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-11-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 30 Aug 2017 16:13:55 -0700
X-Google-Sender-Auth: W2w7GZYQMsbVm_B5hMSeLqlaYw8
Message-ID: <CAKmqyKOmhv38V5_knG2uNpzQtwdm23oFkVUccF7dF8DTBdzphA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 10/17] MAINTAINERS: add
 missing SSI entries
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
X-List-Received-Date: Wed, 30 Aug 2017 23:14:28 -0000

On Wed, Aug 30, 2017 at 2:55 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Alistair Francis volunteered :)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbe1191883..0a3a50aa25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -986,10 +986,13 @@ F: hw/scsi/lsi53c895a.c
>
>  SSI
>  M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> +M: Alistair Francis <alistair.francis@xilinx.com>
>  S: Maintained
>  F: hw/ssi/*
>  F: hw/block/m25p80.c
> +F: include/hw/ssi/ssi.h
>  X: hw/ssi/xilinx_*
> +F: tests/m25p80-test.c
>
>  Xilinx SPI
>  M: Alistair Francis <alistair.francis@xilinx.com>
> --
> 2.14.1
>
>

