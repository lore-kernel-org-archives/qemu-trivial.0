Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1by476-0004mS-2U
	for mharc-qemu-trivial@gnu.org; Sat, 22 Oct 2016 17:46:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1by473-0004l9-EW
	for qemu-trivial@nongnu.org; Sat, 22 Oct 2016 17:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1by472-0004Ea-OQ
	for qemu-trivial@nongnu.org; Sat, 22 Oct 2016 17:45:57 -0400
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:34318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1by472-0004ET-Hg; Sat, 22 Oct 2016 17:45:56 -0400
Received: by mail-pf0-x236.google.com with SMTP id r16so76102294pfg.1;
	Sat, 22 Oct 2016 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BKpSz1NsaYYg+c+7FFG29tpF+nRqYPYntCXnoNDqCf0=;
	b=LyDQy/HxKNl40yKPP9o9OSY5gmp7T+Pqa1fVVhhFIiTfgDzNUaiHy1cTOk7owP5tGB
	VHOIgL9ATx9Vr2X43V1KjWgTneVETiX+S6twIDTkYZ3W46xXSxThATqJzmmBjZzNGZGa
	QjoGK2SrDUqlfqSfuOFEVUFueRvgyYFWx2J1U/oideTZZd5e/bhFUsJ3noxssKeatqcz
	RDks0Ro1U2nItmvACTcoIehGK8UjoX25BeyO921+OEsF/b9tVPZRgrsRl0mdnvI0kiYj
	UkUTOE9cY5ylo50fmqlHNMBJ21r+ITuxPxkOra4urkiXNfqeCwvbXGYwN+Dr/c/IQwhi
	qTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BKpSz1NsaYYg+c+7FFG29tpF+nRqYPYntCXnoNDqCf0=;
	b=MqS0+54W3RyzZhPmMJDwGt+PlBWoRbvhPycPyYXHqzZxPTCnzlagdccl6DgOSVU5HP
	/9G/qCQqGcitHvhr8qe+EM7p69Y1CXOfcxAZVBdR5ZG+FBwoql+MzIC8m58w+wjtrJ4K
	GrdzXa1p8oO5PsYkRBOR7LwWExloh2Me8xn4tWw0hA6LfLAPXwVZAxijbsE/IPDLwsEk
	aUeimPTxykKO6k5KO08hzl99IfBr25MEsR5D7OAO44iuKtRxjokITtJoUIPKxTOqBjna
	QLfGKJxgg0ch4R2uZru+G/iPeQ2Yc8IiUNEKlDUbiEDMAjGIF2Oc7a4wI1OjJAezk6/Z
	wlAQ==
X-Gm-Message-State: ABUngvfYUaYXWvgrZ1SVEBXL404dNrGEZSwIVfprfeizjDNQ4wfgQVJwP82Qen1xTAUa6Q==
X-Received: by 10.99.116.24 with SMTP id p24mr11856723pgc.167.1477172755253;
	Sat, 22 Oct 2016 14:45:55 -0700 (PDT)
Received: from bigtime.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	x1sm14376818pay.41.2016.10.22.14.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Oct 2016 14:45:54 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1477067922-26202-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <b9c76a1f-dc8a-3abd-58a5-46f1ff5af562@twiddle.net>
Date: Sat, 22 Oct 2016 14:45:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477067922-26202-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-trivial] [PATCH] tcg/tcg.h: Improve documentation of
 TCGv_i32 etc types
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
X-List-Received-Date: Sat, 22 Oct 2016 21:45:58 -0000

On 10/21/2016 09:38 AM, Peter Maydell wrote:
> The typedefs we use for the TCGv_i32, TCGv_i64 and TCGv_ptr
> types are somewhat confusing, because we define them as
> pointers to structs, but the structs themselves are never
> defined. Explain in the comments a bit more clearly why
> this is OK and what is going on under the hood.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This confused at least two people who cared enough to post to
> qemu-devel about it, so it seems worth rewriting and expanding
> the comment in an attempt to avoid having to explain it on the
> mailing list for a third time :-)

Applied, thanks.


r~

