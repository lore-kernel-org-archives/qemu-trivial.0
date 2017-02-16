Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cePOc-000803-9D
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 11:59:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cePOV-0007tb-8M
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 11:59:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cePOQ-0000Eh-DU
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 11:58:59 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36625)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cePOQ-0000Ea-6x; Thu, 16 Feb 2017 11:58:54 -0500
Received: by mail-wm0-x241.google.com with SMTP id r18so4056270wmd.3;
	Thu, 16 Feb 2017 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sL9KOYKWXiUlrWxzL+K0pJsF0BBoUB6y7fZNP3U06EA=;
	b=dvfHYFS0VEi9oJz77gR/Pg5AvVI/bikvXE6AbASqikguY05XWg+dllj8QRPEgemlAV
	amfeCq6KeqCV0sI4wqwbuTkDh1yqYUkyCZzJEDzZhTx8azsi7HolYaZ7SThedFGJ+jL4
	xyk4SoK9lCt9GYDD2pdATzAjsp7Pml2ELQb25rORX/F3F+RasiZrvwfix8E/QpDTB0IZ
	Y1/pae3oxjyININ91sBOAMtKpOMQLjbwiE/hRyFVAbm9ZJ70jxq2q0SsHzoT88mXNGSN
	oY/t8ouCaPeu0t99S+AB+UszbcdDo+ZtEGzbvK+VWkXb3VMb2BHNPCBTD9gP6Dte7O/u
	QZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sL9KOYKWXiUlrWxzL+K0pJsF0BBoUB6y7fZNP3U06EA=;
	b=lLiggQtAYmsvYJfVpi9xXULBh8jzX/T/jSF2cErhFCkK2YtLmMcgno3jTL1C+LCGiD
	6tOjUK5SJXOwr5/NOKucxY+daZer7PmRLn0QYYhZTXU8zHx8eXj89HXq9UjQRcRbgqjT
	fxqFXs1w5lFgJXV+RLaKtH/QdSHqW58NU4yqUndAB1kwtgctN/04CqBAuOAuRtrJuvqx
	PKfs3Q6etvGNApQfaSsQO0nyj59dTqS2nqyGiym/be6LrKc7bcnll4URzyk982PyfHGd
	/LM528o9L8dGMfdmpgPCQPxeLPaG46L4QqGdyR3LR1ICsqB3CaJ7KzwUvlbOpsW1+WHt
	hiVQ==
X-Gm-Message-State: AMke39k8PNnsc1cGRY4gey+CSGN5/PGcp/PebXtVtMZAyt641r/mpNgIScy8avQ1RM09JA==
X-Received: by 10.28.181.145 with SMTP id e139mr12608779wmf.127.1487264332997; 
	Thu, 16 Feb 2017 08:58:52 -0800 (PST)
Received: from [192.168.10.165] (94-39-187-56.adsl-ull.clienti.tiscali.it.
	[94.39.187.56]) by smtp.googlemail.com with ESMTPSA id
	39sm9655474wrv.55.2017.02.16.08.58.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 08:58:51 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Chad Joan <chadjoan@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1933406e-2576-e687-3545-a72f3b999310@redhat.com>
Date: Thu, 16 Feb 2017 17:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] Fix build break during configuration on
 musl-libc based Linux systems.
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
X-List-Received-Date: Thu, 16 Feb 2017 16:59:05 -0000



On 16/02/2017 17:30, Chad Joan wrote:
> Hello,
> 
> This is a one-line patch to the configure script that will allow QEMU to be
> built on musl-libc based Linux systems.  This problem is only noticeable
> when QEMU is built with --enable-curses.
> 
> Detailed reading material if you want to know where this came from:
> https://bugs.gentoo.org/show_bug.cgi?id=609364

Hi,

can you explain exactly which function is missing without
-D_XOPEN_SOURCE=500?  If it is curses' wide-char functions, why does it
fail with musl but not with glibc?  Is _XOPEN_SOURCE always defined by
glibc if you have _D_GNU_SOURCE?

Paolo

