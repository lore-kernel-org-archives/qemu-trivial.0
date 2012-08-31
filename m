Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7MRP-0007Wd-LB
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 04:18:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7MRN-0007WT-9w
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 04:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7MRH-00053x-GP
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 04:18:57 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:43227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7MRH-00053t-Bs
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 04:18:51 -0400
Received: by iakx26 with SMTP id x26so4452063iak.4
	for <qemu-trivial@nongnu.org>; Fri, 31 Aug 2012 01:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=k/EWEQD9AzIX0l36Oj4aLnP98ZPxADhlaJ5kQSHFMAQ=;
	b=LGdGIatgtqf+t1nx3fBbFsPs7EB3fm4/e3qKw+7XSxvtpe7S1ubCw2zuZvuuB0Es0N
	jd53RlmYktCh1rVZAvfYDHwp/OOreka/SGrvPo5rM7rvd7NgL9pTTEccZVSTihjk7/Lg
	rWu+QCaD2VTADdpWKQYr5q/MZK7U0jOYDhqp3F3cfow/xGyu9LNvCi7rIcpDQHRgIQmo
	U1dN8QOhkgEYXzZ43V6Httkrh+4ZQfNwQR5pKS4iUTb/kJBWHpCN7dSE7/ZvSrEETQTy
	IGQbx94mn4N6JjspZZ+6LSyxhD15d39Batn2IW5V2q8GvGsaw45BUWWz+UVeXXOPkFAK
	7DYA==
MIME-Version: 1.0
Received: by 10.42.157.5 with SMTP id b5mr7658673icx.37.1346401130037; Fri, 31
	Aug 2012 01:18:50 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Fri, 31 Aug 2012 01:18:49 -0700 (PDT)
In-Reply-To: <20120831064931.GA6425@stefanha-thinkpad.localdomain>
References: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
	<20120831064931.GA6425@stefanha-thinkpad.localdomain>
Date: Fri, 31 Aug 2012 09:18:49 +0100
Message-ID: <CAFEAcA8ahSGNEWvLpY+HrQsA6cxBjw+NjBTb7-R3RyOpi5-O7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlM/xSF+Sp6I7XD4Qp3UkJR78226ZW2cQHTKDysMpfMX7pjttKTPNlMMTdMn2uSdF+n8m8D
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Qemu-trivial] [PATCH 0/2 v2] Fix static linking for cURL and
	SDL
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
X-List-Received-Date: Fri, 31 Aug 2012 08:18:58 -0000

On 31 August 2012 07:49, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Tue, Aug 28, 2012 at 01:01:32AM +0200, Yann E. MORIN wrote:
>> Currently, configure checks for cURL and SDL with either pkg-config (the
>> default), or with {curl,sdl}-config (as a fallback).

> Patch 2's commit message still references "curl" instead of "sdl".
>
> I'd like for one more person to review this and then it can be merged
> into qemu.git, rather than through qemu-trivial.

...this patch doesn't seem to have been sent to qemu-devel?

-- PMM

