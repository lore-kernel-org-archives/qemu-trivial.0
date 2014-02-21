Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGvUQ-0007Fu-Qt
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2014 14:10:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WGvUK-00077P-Fh
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 14:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WGvUE-00016E-UL
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 14:10:20 -0500
Received: from mail-qc0-x232.google.com ([2607:f8b0:400d:c01::232]:37079)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WGvUE-00015t-PR; Fri, 21 Feb 2014 14:10:14 -0500
Received: by mail-qc0-f178.google.com with SMTP id m20so6615832qcx.37
	for <multiple recipients>; Fri, 21 Feb 2014 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=STF784WwA6DgDxF57NL3AnxdpXl3rVXBFbDMJKbnTIU=;
	b=TReQu+7WluUYSWOR63Hk9fprfEBcCW7TYXFJsuTWQQJsVEo/azYV29luCC9m0fECbh
	3wxBv6L0kCoSB6dSY54m1PwOdBui+oE0tRvaOUsrfliVmi8Ql2JoBFGv7IgvoykobSfT
	R8w8XaCbZTG2yc5B5rC5hxpaPAl2L1wMXTdVlCS1128mGiqGYrNQ6Io7PXg91p/yR+ds
	yu+aNAid8Tx/NS6Om1h5PDb93WRUZaz1gbOUbXn1okdXw3BmYyi1AatDlpmYcENDudEA
	1nSrBAUAOzHFvypy/tGp0nt0QepYYL77cDaZLCz/3tSDApBzp+sw34pLpeX0ydFvT0lO
	HO2w==
X-Received: by 10.224.19.199 with SMTP id c7mr12324878qab.78.1393009813765;
	Fri, 21 Feb 2014 11:10:13 -0800 (PST)
Received: from pike.twiddle.home ([12.236.175.36])
	by mx.google.com with ESMTPSA id z18sm24242035qab.5.2014.02.21.11.10.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 11:10:11 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5307A48E.2030700@twiddle.net>
Date: Fri, 21 Feb 2014 13:10:06 -0600
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1393003115-9801-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1393003115-9801-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::232
Cc: Andrzej Zaborowski <balrogg@gmail.com>,
	Claudio Fontana <claudio.fontana@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg: Fix warning (1 bit signed bitfield
 entry) and replace int by bool
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
X-List-Received-Date: Fri, 21 Feb 2014 19:10:26 -0000

On 02/21/2014 11:18 AM, Stefan Weil wrote:
> Static code analyzers complain about signed bitfields with only a single
> bit. is_ld is used as a boolean value, so make it bool.
> 
> ppc64 already used bool for the 2nd argument is_ld of the local function
> add_qemu_ldst_label. Modify all other TCG targets to do follow this
> example.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tcg/aarch64/tcg-target.c |    6 +++---
>  tcg/arm/tcg-target.c     |    6 +++---
>  tcg/i386/tcg-target.c    |    6 +++---
>  tcg/ppc/tcg-target.c     |    6 +++---
>  tcg/tcg-be-ldst.h        |    2 +-
>  5 files changed, 13 insertions(+), 13 deletions(-)

Applied to a tcg-next tree.


r~

