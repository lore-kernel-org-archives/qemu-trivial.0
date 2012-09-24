Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TGBl3-0004fi-KB
	for mharc-qemu-trivial@gnu.org; Mon, 24 Sep 2012 12:43:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TGBkv-0004Hf-Ux
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 12:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TGBkv-0000Gu-4Q
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 12:43:37 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:33166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TGBkr-0000GA-Iw; Mon, 24 Sep 2012 12:43:33 -0400
Received: by pbbrp2 with SMTP id rp2so1602397pbb.4
	for <multiple recipients>; Mon, 24 Sep 2012 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ePpeJblHjGYwWrcRA3+92TOPyPRbrtXaJwEKx5cQ0nE=;
	b=b7H6NBaPh9Q8UJ4N7+kSqm2d1GTzSdPJ1Fg0yOqiyHO7D9MKDgqOWdZGlet6zqUbLX
	YXLPbZiPlHBqXSrlsaYwhlPwI2EDZvQacc+Xl/bmWC85iLHuDiVd0m+vgwBF3QCKFN+V
	/JgQivDnsK7vYzC4hceToGwGQNalgZcfqDpviYO+cjMgud9hX62yKL6pzPcoH3WBSiEy
	woKXYp3sV+Ifi8Z9QQTyCqmf59Jc7cm+AdodnBuUZPNXgUoNuRwF2hExFbIkS/SaieRa
	9D3ckjHtpcrDfnI7gUIrfUK2EJ7Z5aRFsHZE+P8tcPAq3WUWYBHvGz6FPmb86WeYvvFc
	BM5Q==
Received: by 10.66.85.133 with SMTP id h5mr34047787paz.10.1348505012506;
	Mon, 24 Sep 2012 09:43:32 -0700 (PDT)
Received: from pebble.twiddle.home ([173.160.232.49])
	by mx.google.com with ESMTPS id kj10sm9865065pbc.72.2012.09.24.09.43.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 09:43:31 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <50608DBA.9090902@twiddle.net>
Date: Mon, 24 Sep 2012 09:43:38 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1348504115-13203-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1348504115-13203-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fpu/softfloat.c: Remove
 pointless shift of always-zero value
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
X-List-Received-Date: Mon, 24 Sep 2012 16:43:43 -0000

On 2012-09-24 09:28, Peter Maydell wrote:
> In float16_to_float32, when returning an infinity, just pass zero
> as the mantissa argument to packFloat32(), rather than shifting
> a value which we know must be zero.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

