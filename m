Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYZnk-0007vF-2r
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 11:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZnd-0007nJ-AC
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZnc-00009b-Cb
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:05 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYZnc-00008j-6i
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:04 -0400
Received: by mail-wm0-x22c.google.com with SMTP id w191so16989451wmw.1
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bub2VMQSYlILlKJKfQ2HRdf1D0c8j4jkcVHXjijjfBQ=;
	b=BHFdpFF/Q7blIdpvb/6JdxnRAborgtFCi0HFAidWmfsCjNA5mDQD3j5JSmzrKcgTvd
	9r0WAW5io29mwHaw2C/e54Po4mzKMti+so6FzZzdShUCJWdX7s2KdGfscmm371ROipsn
	QSc1p2OoE/Z/Lsy034uC5g32yEMhROOKHaRZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bub2VMQSYlILlKJKfQ2HRdf1D0c8j4jkcVHXjijjfBQ=;
	b=JRYBOuu8PGPn4flA59stjXfk3plUXi0rdrd/RkgiPJXSsja8DQ4W/pGzZ26lomxxZd
	sQ8umn9VdunEQTPvkmItHjE4ybrXy1VMFvpI9wtlu8EdQshiRvb9c4Jv8Jvs/UPB7yuW
	PmSptBppdBWsLOcgwf7hUm493SQ+PBer5MEOgrmdyFWkOk0uwA0EOZejCvwo3Obg9igx
	wzy6fBNm0lxyP78vOyGPB3AW1ZCGpJJftFhr5rT26Vs0zDBQI5spqvz2/kNg1isGl3pm
	2rqjluaTo9lLjj2s9IxY+KK4UW2sKmMpSBna/j+xj0ORqmrrqAyxKdCpdGexa/dYjwO/
	l3FA==
X-Gm-Message-State: AIVw111Wtt3Av8rlmVNCSYUWRk4iCM478U4iLoSFzv5hHFVAyPEwih3W
	4O9WhB89gO59/RtJxivpQn2NTRBNp5hM
X-Received: by 10.28.40.215 with SMTP id o206mr5274614wmo.74.1500650703181;
	Fri, 21 Jul 2017 08:25:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 08:24:42 -0700 (PDT)
In-Reply-To: <1499958932-23839-1-git-send-email-peter.maydell@linaro.org>
References: <1499958932-23839-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 16:24:42 +0100
Message-ID: <CAFEAcA_R4MpMCOX2F9-VgLsYFmqVebY1H27xkCNvfQJc61sUvQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: "patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Never use
 'uname' to identify target OS
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
X-List-Received-Date: Fri, 21 Jul 2017 15:25:11 -0000

On 13 July 2017 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> For a very long time we have used 'uname -s' as our fallback if
> we don't identify the target OS using a compiler #define. This
> obviously doesn't work for cross-compilation, and we've had
> a comment suggesting we fix this in configure for a long time.
> Since we now have an exhaustive list of which OSes we can run
> on (thanks to commit 898be3e0415 making an unrecognized OS
> be a fatal error), we know which ones we're missing.
>
> Add check_define tests for the remaining OSes we support.  The
> defines checked are based on ones we already use in the codebase for
> identifying the host OS (with the exception of GNU/kFreeBSD).
> We can now set bogus_os immediately rather than doing it later.
>
> We leave the comment about uname being bad untouched, since
> there is still a use of it for the fallback for unrecognized
> host CPU type.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Applied, thanks.

-- PMM

