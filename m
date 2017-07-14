Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVvi8-0006C0-0C
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvi5-0006A4-TU
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvi2-00054D-P5
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:12:25 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVvi2-000546-KI; Fri, 14 Jul 2017 04:12:22 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so11229463qki.1;
	Fri, 14 Jul 2017 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=O/N6sZ7TwtUKNSOxn21IxMSu5o4u08Y1MJkO73toMv8=;
	b=XFnIjKtY+BTXFVAourqjDib3b3JqW0kb3c0eMuZ4xqrWqyKTuPSrekzcDsxSaQXcez
	SzEH5To8j5o58qVAAyO+FLQNZ/fr9wsxYM2uNy63mj3hRJ+hRjx9Mosv06ANl5zwgDeM
	RFjtmLTM1U3qECGtA5i7y9MU3k6atzHFvd9vpiK5ugdCq1Fy2KmlE5lWYTHk0LJRRGS5
	GwQd2KQdU1ZsFu84DmRGMXFewp7Z04AENkinv2ajDRoetGSMUMmf23MGcJvMzfHKhUit
	bPLHtz7r9ZhjpTcMLTkx6REm6LTmh5xFmqhRJaL2ln2aZ4h4+diGFFf8DVqq0Vmip5KT
	JL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O/N6sZ7TwtUKNSOxn21IxMSu5o4u08Y1MJkO73toMv8=;
	b=kUOEIQE1Fa6bLsdyRagHE3zIit0MgpK2U6dMGrYfrgLlbIU+P4GwezX+dgwzZAxQsP
	+hxEUICdS4MBt4qNo+TOehK7XyiAy7gmrFY1WgOUURYVxXqdIRpcIe3rzpQG4jAxtXqJ
	TNK1tCEftCv71Z8yFAFgNZxCZwExJHsZUb9ll1KciVQl/eLwvvQ90VQNsMjyS/IRsDTO
	MWu1mFgYdgMRychBOM3KLPJaesCOT0fhRawvN430LYkWjTOSNyj0t9yg/MHdhms11qQT
	xqSFsDG5/WlE8XPS8PTU1A4v3hnRj3EBDYPhTtKpneYLpxNXbvPUdnfViTHTo0+z8osP
	66BQ==
X-Gm-Message-State: AIVw113NT4Sl2sLzAqIMhujWDaltpRoHOnHqAyLdodkZsBbY4DhUq+vQ
	7Dm76X/n5FTeOA==
X-Received: by 10.233.222.69 with SMTP id s66mr9672432qkf.30.1500019942275;
	Fri, 14 Jul 2017 01:12:22 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	x57sm6120754qtb.50.2017.07.14.01.12.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:12:21 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-5-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a39145bd-c89d-9722-affd-1888d0304d17@twiddle.net>
Date: Thu, 13 Jul 2017 22:12:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 04/29] vhost: use
 QEMU_ALIGN_DOWN
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
X-List-Received-Date: Fri, 14 Jul 2017 08:12:27 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> ---
>   hw/virtio/vhost.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


