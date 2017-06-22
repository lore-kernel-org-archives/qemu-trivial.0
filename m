Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO4kb-0003Yz-UR
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 12:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO4kZ-0003Yb-Gb
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO4kY-0007wS-Mk
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:14:31 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:34829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dO4kY-0007w6-FK
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:14:30 -0400
Received: by mail-wr0-x22a.google.com with SMTP id k67so29650843wrc.2
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 09:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X7bUUBqBhbN78R2sAeCM/J2nfyhTtS8q+KrPfQwP1Ew=;
	b=DLkSpQWl4oa6lCs+gE9aCAFLWMr5LUh5Ec4JCKcxUemeADk5KAnlOLZv0DgnJ7vdCo
	d8dqbSWB75qQH9pMQ5zQ2glkinnCRIQJCe4mD9b+jQlc/OdXzeisnjMsn9Zjf7IAU0ff
	8OCYj4OEBH9O75Y7qEpDnbGsb9EvObgezHcWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X7bUUBqBhbN78R2sAeCM/J2nfyhTtS8q+KrPfQwP1Ew=;
	b=DzDILRS4YRpRJjSJSFHUcvlHPeP0lAR8dF2DL1peq/rqVrcCmIwQ968loT4on1QsHa
	BjKJmPgNqHvXEJ0fWZVa86VXvJkQlvSyYoE+uQ5+3NSPhU7y500TSX9t7A8C68k3E667
	4z4MTvhEiz/WNsC5z55U3KlcmbeXSlVeJqatyocIUrQjOeVyWvnSQFe25TmpqrRdsk0A
	aTbW3Sl7DxNmq2Mop2M/SZJ15Xcu7U3IX/XJkG52fZhP+HUYGeVlYdSlIj3tj9F15ZV2
	7RFU9iTrasZ8ULCUvEBvHtAZZ/RFQkgN0zF69YgKY7F435y6+W9gN6JUEAccCVRab34u
	OBcw==
X-Gm-Message-State: AKS2vOytnVszcVSpDSrdtWwEDZL90iPhxdkH9tmmETWsWsbw1RoVNKiA
	5CWZ/CiJ0+n0hNiSEC/jQ65xiJwRithg
X-Received: by 10.223.150.163 with SMTP id u32mr2737876wrb.195.1498148069260; 
	Thu, 22 Jun 2017 09:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 22 Jun 2017 09:14:08 -0700 (PDT)
In-Reply-To: <149814756006.27338.8723356702388175951.stgit@bahia>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2017 17:14:08 +0100
Message-ID: <CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
To: Greg Kurz <groug@kaod.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Separate function types
 from opaque types in include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 22 Jun 2017 16:14:32 -0000

On 22 June 2017 at 17:06, Greg Kurz <groug@kaod.org> wrote:
> Function types cannot reside in the same sorted list as opaque types since
> they may depend on a type which would be defined later.
>
> Of course, the same problem could arise if a function type depends on
> another function type with greater alphabetical order. Hopefully we
> don't have that at this time.

The other approach would be to put function types somewhere
else and leave typedefs.h for the simple 'opaque types
for structures' that it was started as.

For instance we have include/qemu/fprintf-fn.h as a precedent.

thanks
-- PMM

