Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUBeQ-0006qK-ED
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 07:44:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bUBeO-0006nT-5x
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 07:44:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bUBeI-000616-8y
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 07:44:50 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bUBeI-00060y-2n; Mon, 01 Aug 2016 07:44:46 -0400
Received: by mail-wm0-x241.google.com with SMTP id x83so25759991wma.3;
	Mon, 01 Aug 2016 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hJfZbWdas15ylZ47/PN6rnyO5LYQaFxBBaQmFSgsxU8=;
	b=fnU4lQX9S71SiyO65t5aOklp9/sXw27EGKMFpIw+CPjYnzPJSqRNmjbXjjdIRAHGEF
	dbiskgvhbXhvfrYEOfDkPjKqYAzNIRhHzD2K/HEZotiQ/pWnPpoumw2HbH6whepvt0QO
	JnyZ+L+gSHRpykcnCZczG+ykY3fl74EfViSrtqmO1IWMwZnMNjC+lRn9U9QYdEaNuvYK
	2sBlcLVT9PEwLCCRqVzVBgBM08I3Yg9Lmz6xj4IhdVAlxDqJ8rxxSUIyBEYDi+UHGeri
	RNsXXS5unPfjMw3PTdiGX8ZJ42yc8atq17uf9bqle+QrSkyqAt65GestbPcW5FFq4Upr
	ntnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hJfZbWdas15ylZ47/PN6rnyO5LYQaFxBBaQmFSgsxU8=;
	b=Iozl6U3knY9+DVhxXyvC9uIgcyNilfl9hrOPq5f+oWSw9x4S7532BvzV7nyQodqVOm
	WOl2sijzaaZ4SYW+wjpAbS40looOykoeWMNEZ3T5WDLymhEVKHS0TsCA8QN/O+hQbtQR
	GorjyMKEdrYBor+ixssNAwO8x2TA96KqELC05XOzKh9q4h2wJry1bFIjtR4/pmoT8DsD
	RWNsThEzk1rLdCCmI+Zjz6i98LxHC2FcWzTQLoxo6j1Mf81eF+jFNie10QOroDDBuqxX
	eDZhalhTdXAMSLfJ3JX2DUbgDku9vNgzwhDYAgUVQZ44auuiGaR67DEcRwhCGYmpioy8
	qB5Q==
X-Gm-Message-State: AEkoouu6wgoFfVCdJ2yUJ2JJB5E3F8UsWz+J96ojcvRQOEEdRem8MycfcHwSWqUm25sJoQ==
X-Received: by 10.194.97.73 with SMTP id dy9mr51059762wjb.132.1470051885240;
	Mon, 01 Aug 2016 04:44:45 -0700 (PDT)
Received: from [10.201.49.221] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.googlemail.com with ESMTPSA id
	e10sm30184331wjc.21.2016.08.01.04.44.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Aug 2016 04:44:44 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <45e4afbd-e09a-c711-c4f3-5fe597234ea9@redhat.com>
Date: Mon, 1 Aug 2016 13:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [PATCH 0/3] trivial changes of timer & cpus
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
X-List-Received-Date: Mon, 01 Aug 2016 11:44:53 -0000



On 29/07/2016 13:05, Cao jin wrote:
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Richard Henderson <rth@twiddle.net>
> 
> Cao jin (3):
>   timer: update comments
>   cpus: rename local variable to meaningful one
>   cpus: update comments
> 
>  cpus.c               | 13 +++++++------
>  include/qemu/timer.h | 19 ++++++-------------
>  2 files changed, 13 insertions(+), 19 deletions(-)
> 

Thanks, these can go in 2.8.

Paolo

