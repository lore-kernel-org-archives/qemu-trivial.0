Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e03Kp-0004xZ-Me
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 06:24:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e03Kn-0004wb-Lh
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 06:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e03Km-0001rS-Ne
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 06:24:53 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>)
	id 1e03Kk-0001kT-No; Thu, 05 Oct 2017 06:24:50 -0400
Received: by mail-lf0-x244.google.com with SMTP id h80so5592298lfe.1;
	Thu, 05 Oct 2017 03:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2zQ+uVsXG2FSwPBK/tusueYErUsOx/8hUokCooCmyzk=;
	b=ptwx9HXpxtOEBd3xgvf/0th3k5F0x0WRho4D+hY+Kg+1yiD9dmwbvWxX1s52ZgPXrU
	MFC5qolDRPaAVTv74RMSJSGxCFdkkG1GsZeaGVQOnf9MnNRGO66qSDPwB4bMUqC1hnjQ
	ijyQOVPJ8EU1Z2Cvslg/JkMhnrC4J4TNa8mXRIcWw6HWcCqC+TsMyvrwDe8dFo1lcboV
	67Ogjs/5u64vwOBlY0N91aj2vXAgmrhH7XEN8pCTsgxhX07pMC9CZXJwEc4iGpxlzNnb
	smOzTrENsOxj5yiQEGYgNEOr3NYScRKfgGMR+YaSXFbp9VTosfUk2XhomAdgBFg+p5Be
	7bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2zQ+uVsXG2FSwPBK/tusueYErUsOx/8hUokCooCmyzk=;
	b=s0qBpbc8UocAi4vDmLPXNCxkyY2++ck5AzlBWYrJW5SwEcT5i7PW6HgrK7cjlMQMdM
	z++q11p+ZoiD88KQgfUHohb32SWyeMFMvVCWkQE+Ug2RVgzKfFsXd3OAloccIhzn75FX
	yGHFs3qzeRHWzpHPqax36fe/MwGETKZ83B90z4v7YkKVYMaw/DhvTOQtfYX/M0Gg6IAK
	d5Jtk7Twr6e72g5eRWQOhi7te9/fCINeYX2AUDhD5o9HR6kD7bYiIYx6U+dFzWEQ5zHh
	9E1rKuabYNaH0VWY/j0XJADltCwemY+d8erg0u8i/wy58KvHC+SaJfVAlPwo8wifYqOy
	NaIQ==
X-Gm-Message-State: AMCzsaXS/kwDI4YNjEBqAuIT91Lxg9p5GJwdt54V6TgHXusXnharSfEV
	OotWroP+IJt13f0WE9l2QrOV0yrxeq5TqHbGcY8=
X-Google-Smtp-Source: AOwi7QBnFKsrNx7qTg/mWdJAaZ1etUIWPa25iiH0PSu7FoI6YbBM68mJe/slIsnZVSrMFL/KrlvxT6LsiflgX9KL7Co=
X-Received: by 10.46.95.198 with SMTP id x67mr40956lje.184.1507199089217; Thu,
	05 Oct 2017 03:24:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.40.193 with HTTP; Thu, 5 Oct 2017 03:24:48 -0700 (PDT)
In-Reply-To: <43071208-759c-6476-0cb0-c4e7e0daaf77@redhat.com>
References: <CAHpsRN-XzxjJZb=rb0iHMv4Afv=2H3N5U7p4+NNJFPkxgSLMXg@mail.gmail.com>
	<43071208-759c-6476-0cb0-c4e7e0daaf77@redhat.com>
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Thu, 5 Oct 2017 07:24:48 -0300
Message-ID: <CAHpsRN9s_qa_knpn0QRVu0UasFrx1c+nvy2rY6hHB7GvnRkCZg@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="001a114a4f60519623055aca2285"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add random ioctls
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
X-List-Received-Date: Thu, 05 Oct 2017 10:24:54 -0000

--001a114a4f60519623055aca2285
Content-Type: text/plain; charset="UTF-8"

>
> I doesn't look really trivial...
>
> To manage the buf field you must read buf_size and it cannot be done in
> a generic way: you must define a function to translate the buffer, use
> IOCTL_SPECIAL() with RNDADDENTROPY and RNDGETPOOL.
>
> You should send your patch using "git send-email" or "git publish"
> instead of adding it in you email client.
>

Thanks for your advices.

My use case only requires support for RNDGETENTCNT... Considering that
RNDADDENTROPY and RNDGETPOOL are non trivial, would a patch with only
RNDGETENTCNT, RNDADDTOENTCNT, RNDZAPENTCNT and RNDCLEARPOOL be accepted?

Note: I swapped the types of RNDADDTOENTCNT and RNDGETPOOL...

--001a114a4f60519623055aca2285
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><spa=
n class=3D"gmail-"></span><span class=3D"gmail-"></span><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-">
</span>I doesn&#39;t look really trivial...<br>
<br>
To manage the buf field you must read buf_size and it cannot be done in<br>
a generic way: you must define a function to translate the buffer, use<br>
IOCTL_SPECIAL() with RNDADDENTROPY and RNDGETPOOL.<br>
<br>
You should send your patch using &quot;git send-email&quot; or &quot;git pu=
blish&quot;<br>
instead of adding it in you email client.<br></blockquote><div><br>Thanks f=
or your advices. <br></div></div><br></div><div class=3D"gmail_extra">My us=
e case only requires support for RNDGETENTCNT... Considering that RNDADDENT=
ROPY and RNDGETPOOL are non trivial, would a patch with only RNDGETENTCNT, =
RNDADDTOENTCNT, RNDZAPENTCNT and RNDCLEARPOOL be accepted?<br><br></div><di=
v class=3D"gmail_extra">Note: I swapped the types of RNDADDTOENTCNT and RND=
GETPOOL...<br></div></div>

--001a114a4f60519623055aca2285--

