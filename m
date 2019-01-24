Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmbIj-0004Nl-7u
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 04:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gmbIh-0004Jt-OW
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 04:27:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gmbD6-0002a3-Bp
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 04:22:09 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1gmbD6-0002Y8-5i
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 04:22:08 -0500
Received: by mail-wr1-f65.google.com with SMTP id s12so5624755wrt.4
	for <qemu-trivial@nongnu.org>; Thu, 24 Jan 2019 01:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SA924fYE8nn/MSZUkFF+w213CkyVLtdFR6SvbBo7GJM=;
	b=A2DE/P42y8n6hT+f4uRzhctnBvLVQG/BBTUQu8VdMEFTKn0YLVLcqJ7Wb763aFU8e1
	F8P8+xG0BMvYQFRK0WVocdoVUOeIo8kurQQXFNR9MvZbPMXv02mvp8gJXxv9FHg1wHM4
	o9U2EvpwiGNq3/xOjqR+JlBU6TvbPoliYl9xnQaPGE4nki9iNet09LqvYNLLVJXNId3l
	9jYZR12hQd12mbQFNtelep5vRpr+BuHdqSiLnuKkaQ0k9e/N0LtaOy5NhTWNj50pFJVM
	htQlPzjHW0JKz73143cUEUFYFy5L+ebxtFoqyYt0CgwTsGhqKEYCU8syCWIRHYVISj0W
	y3OA==
X-Gm-Message-State: AJcUukd6B5LctMFihlHaSn0vpPfU20V6+EHp4r/hxO2rVd6eyV3TeY/+
	AJnGlhKLBATBT7rFBiQOM/T1U2tlbTs=
X-Google-Smtp-Source: ALg8bN74LGUVNA3rjAbEA8Bc1UP3slUja+uQEuADRLSRFhAdUleA9r3VSetKY/3bArEYVBWkr7OPHg==
X-Received: by 2002:a5d:50c5:: with SMTP id f5mr6088357wrt.37.1548321727013;
	Thu, 24 Jan 2019 01:22:07 -0800 (PST)
Received: from steredhat (host29-26-dynamic.246-95-r.retail.telecomitalia.it.
	[95.246.26.29]) by smtp.gmail.com with ESMTPSA id
	w6sm58374147wme.46.2019.01.24.01.22.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 01:22:06 -0800 (PST)
Date: Thu, 24 Jan 2019 10:22:03 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	rth@twiddle.net
Message-ID: <20190124092203.kvp2tlr3oxyks2wx@steredhat>
References: <20190124073626.20534-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124073626.20534-1-richardw.yang@linux.intel.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/i386/pc.c: fix one typo
 in function name
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
X-List-Received-Date: Thu, 24 Jan 2019 09:27:56 -0000

CCing qemu-trivial@nongnu.org

On Thu, Jan 24, 2019 at 03:36:26PM +0800, Wei Yang wrote:
> Rename pc_get_hotpug_handler to pc_get_hotplug_handler.
> 
> No functional change.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  hw/i386/pc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

