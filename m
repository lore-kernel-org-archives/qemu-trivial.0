Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsadS-0005b8-0z
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 16:21:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsZjr-0000L7-6w
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 15:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsZjn-0004w1-8f
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 15:23:51 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:56670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsZjn-0004vL-17
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 15:23:47 -0400
Received: by mail-pf0-x229.google.com with SMTP id g65so170811pfe.13
	for <qemu-trivial@nongnu.org>; Thu, 14 Sep 2017 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VzdtIgc3CmpXZf4K8A6TN7mmLl5wnzxduXdnfY4PoDo=;
	b=Wcw57x1u/GGD8POAhMTG30lfaxSYeAMSPRiQJCjNppGiQHV8+Bl5TiOAqnqEkvQTw9
	r7wZtnqnmzVCWMs0B+fYr2BZjASKT6jzCT0Ibfkxldz2HFdYwnmI1ySnE2NZiGZKNNDo
	1nn5E6ynbcvbbfq1R5QQSBxNCJGY0riJ3TuzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VzdtIgc3CmpXZf4K8A6TN7mmLl5wnzxduXdnfY4PoDo=;
	b=huyg8/l6IglbJK5UcMg3K9vAcXO0gpevFyBwMPeg3H1ggcg4ibAGhQsu2iTSGm8IKl
	frG1hpM7oJDkj7E188deUbnGeLNXqZWi2ucopoUvjD0GbLxL42aNOE6iNHcU41Ar0rHR
	4e2RdZBpFumYMJWXkOL9eRWurAndg7mVvujFjUsLmWfKqkYkgi8g4rf7BF29yX4UFhJ4
	o7AQdGc2oF37PccKH9LMSt0gSxrEUP6JOtmTnJdja81RwIcTh/Min485YWnU1r0WMoTl
	Lvd5yRYRMszeHX8DVDVyzE52PImSLflH2pjfDoYcuAXMflNK+YU4bmw0coe46Ahb5vKB
	ruqQ==
X-Gm-Message-State: AHPjjUg8VaXGrSzCvMVjmhWn7eetwvxykY/zVMYELgQ+Vavvb2nxJju0
	F2RkOz1igiaLonP7
X-Google-Smtp-Source: ADKCNb6rK+7AEL47UAgm2CVIcZL10EiP2/jQE/1T63wpeaY+l+OV8HPK4RluppRnp/d0SBiVO+hUMA==
X-Received: by 10.84.245.16 with SMTP id i16mr25335847pll.373.1505417025955;
	Thu, 14 Sep 2017 12:23:45 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	e3sm32105483pga.80.2017.09.14.12.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 12:23:45 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, lersek@redhat.com,
	qemu-stable@nongnu.org, qemu-block@nongnu.org
References: <20170914134923.2479-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c45d5fc-c1a7-b65e-62c6-6e52a956b46f@linaro.org>
Date: Thu, 14 Sep 2017 12:23:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170914134923.2479-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
X-Mailman-Approved-At: Thu, 14 Sep 2017 16:21:17 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] osdep: Fix
 ROUND_UP(64-bit, 32-bit)
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
X-List-Received-Date: Thu, 14 Sep 2017 19:23:52 -0000

On 09/14/2017 06:49 AM, Eric Blake wrote:
> When using bit-wise operations that exploit the power-of-two
> nature of the second argument of ROUND_UP(), we still need to
> ensure that the mask is as wide as the first argument (done
> by using a ternary to force proper arithmetic promotion).
> Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512U) produces 0,
> instead of the intended 2TiB, because negation of an unsigned
> 32-bit quantity followed by widening to 64-bits does not
> sign-extend the mask.
> 
> Broken since its introduction in commit 292c8e50 (v1.5.0).
> Callers that passed the same width type to both macro parameters,
> or that had other code to ensure the first parameter's maximum
> runtime value did not exceed the second parameter's width, are
> unaffected, but I did not audit to see which (if any) existing
> clients of the macro could trigger incorrect behavior (I found
> the bug while adding a new use of the macro).
> 
> While preparing the patch, checkpatch complained about poor
> spacing, so I also fixed that here and in the nearby DIV_ROUND_UP.
> 
> CC: qemu-trivial@nongnu.org
> CC: qemu-stable@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> v2: use ternary instead of addition of 0 [Laszlo], improve commit message
> ---
>  include/qemu/osdep.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

