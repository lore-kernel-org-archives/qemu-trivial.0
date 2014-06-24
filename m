Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzIB0-0004J3-5R
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 00:17:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WzIAt-0004AO-JH
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 00:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WzIAo-00010o-SK
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 00:17:39 -0400
Received: from mail-qc0-x22c.google.com ([2607:f8b0:400d:c01::22c]:35389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WzIAf-0000xd-7S; Tue, 24 Jun 2014 00:17:25 -0400
Received: by mail-qc0-f172.google.com with SMTP id o8so6927666qcw.17
	for <multiple recipients>; Mon, 23 Jun 2014 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1paRZQW88Dk5+WkVAo7p5SbmyLC983TfvQncFLxlyK0=;
	b=GWomdLjCqIhDP+HN37nIJbxx8FSeomxpsbenoTZlwYuIEnWYiBvdUl9UQjn7IgdCTn
	PkmFIyMK8tgQckzgxw24XzIMl2dAymdg6j6Y5Lz5JK4iH4lqvuT39ka1Lzz9Ex1tgd+Y
	s1FvHqREj1WrWJf8w9yK5Dm8Lk+pFbdCYtJybApTvazE4Je4sNcVe4fCj6kv162rQ21u
	5XJo/EZ2zuV8rPEVFeGZx4wq66NYvUa2ei6vFoA+mv11PLUr/4oGBhXj1FbLlntMQ568
	D+w3ZR35uI8fhp9MZsRK7Ao9Di/WTvYIURFMT1k3F6cylO5cKOGKb3+r/0OEEqv0eOtJ
	ZR9g==
X-Received: by 10.224.135.132 with SMTP id n4mr40349393qat.23.1403583444087;
	Mon, 23 Jun 2014 21:17:24 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id g81sm2282371qge.36.2014.06.23.21.17.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 21:17:23 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <53A8FBD0.601@twiddle.net>
Date: Mon, 23 Jun 2014 21:17:20 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1403564794-15881-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1403564794-15881-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22c
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] target-s390x: Remove unused ld_code6()
	function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jun 2014 04:17:44 -0000

On 06/23/2014 04:06 PM, Peter Maydell wrote:
> The ld_code6() function is unused; remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We could use this for loads of 6-byte insns, but that would
> imply a pointless reload of the first 2 bytes, which is
> presumably why this function isn't actually used.

Exactly so.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

