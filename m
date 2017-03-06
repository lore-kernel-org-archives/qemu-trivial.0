Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckq5i-0005Be-CQ
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 05:42:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckq5g-0005AH-5q
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:42:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckq5a-0002tB-OP
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:42:08 -0500
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:36299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckq5a-0002su-HY
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:42:02 -0500
Received: by mail-wr0-x232.google.com with SMTP id u108so113241959wrb.3
	for <qemu-trivial@nongnu.org>; Mon, 06 Mar 2017 02:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eTPnnWXfam1yKhs2smoro6JNdj3OivMkejW+d5ik9r0=;
	b=Hn2ImyNQlKYiZONP/CcrOXvuq3xXZuerUKnHbi5jHpEhOUacOrm2vuGXu9fyFb0DxA
	0q+YOpDo8uqFk12NHxJldq68X1JjyQB46MQksyo+gitZU3c3jQNpBXpdI31fZD+4a9nM
	3FbDfueR38oljVd0CF07/hmScW9wvz05N+azI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eTPnnWXfam1yKhs2smoro6JNdj3OivMkejW+d5ik9r0=;
	b=rOORNdwzM1HK4eFZt/WYttwNsmBk2FUSUZ7cAyZtv8e5Qp8+U4KY3LMQuXkCwUukzQ
	V4XwKHvZJnfih5MT5nraORyfdrrpVB9CrtEb2ed2SKMPpdTZRdCFMdl9Y3YsfODiuM3m
	7mm/0UCe++PfrKq5PZxEp3yFulMcoYEDMEyUjIpX15UP47cdogtlFvP4wgELsF59pF5o
	7LBl322KxEXha/wj+wOURSbK+iTzxnz9N80eFyUPhGyvhvbEEEEaJB5g6fkFQffCjDOs
	s1YmRiQIRBAINxrVqbP/PGfhUvhRLoInKPWb04ZXI/GlPrv2SOA/9jsTJpw6vsbx88hU
	wV+A==
X-Gm-Message-State: AMke39mzthLWQCSoYRQrNADHgXM6A3mu4JQGiggW/hzaR/t8YTNF0uJF3h2zlVcwDQTXZWhT0Pc06SOSCJMlwnDO
X-Received: by 10.223.169.45 with SMTP id u42mr13204575wrc.187.1488796921482; 
	Mon, 06 Mar 2017 02:42:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 02:41:41 -0800 (PST)
In-Reply-To: <7b7fb9380fb7189f1aeb1f6264a4451d066a7afe.1488665935.git.balaton@eik.bme.hu>
References: <cover.1488665935.git.balaton@eik.bme.hu>
	<7b7fb9380fb7189f1aeb1f6264a4451d066a7afe.1488665935.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 10:41:41 +0000
Message-ID: <CAFEAcA8+dVxeFNYU00PJna+fyAPwSdjKfwPSx769J+Bv6FOxpA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-trivial] [PATCH v4 08/13] sm501: Fix hardware cursor
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
X-List-Received-Date: Mon, 06 Mar 2017 10:42:09 -0000

On 4 December 2016 at 18:01, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Rework HWC handling to simplify it and fix cursor not updating on
> screen as needed. Previously cursor was not updated because checking
> for changes in a line overrode the update flag set for the cursor but
> fixing this is not enough because the cursor should also be updated if
> its shape or location changes. Introduce hwc_invalidate() function to
> handle that similar to other display controller models.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

