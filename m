Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSwnx-0002eL-Tk
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 23:50:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fSwnt-0002cs-5m
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 23:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fSwns-00057D-Gi
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 23:50:37 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40959)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fSwno-00054G-3I; Tue, 12 Jun 2018 23:50:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5CADB21B73;
	Tue, 12 Jun 2018 23:50:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Tue, 12 Jun 2018 23:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=4mGfmAJieL7hO+mci78VJ4j8cX1qsCalvT2pnObEr8A=; b=JPFAf
	VJLYEytfFD9nwSCq4P0pIQfNchiM2D7XipEVV3F+KTIHlnFaaGBILJvs38+71+v7
	BFPcypYCFyw06mrKOTjBvMgnZslDJqJZ10ex3aikF7NMAWhoHgs8p1UnjBXrgoEf
	tZVfAb7RSrKq8PyuZDx0nPXx0YZ5i/jiusaPR4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=4mGfmAJieL7hO+mci78VJ4j8cX1qs
	CalvT2pnObEr8A=; b=aaRYKnDx/MKZPDHWEZTPMKVJThIrCGAilTCZi5/cjMfMP
	qS9hvRddPJDJJ7aCTvRjt+FcINzbbiinOWJvSdeS1jyjx3bt2rbBkKyuNyjcesqJ
	tgOweP1HBBteNFowklGEn1PXrqxl9Ao2fdTAREjWj6TgR563f+owmpXo5i4UwwKi
	rZrvbs8DC3WJushwhFVCmsRqsfGJuXC67e+6wyV9rB4oPM0u/dJ4v4LMazwJphPz
	wr4hJ7bcRhj7ld4Wz3vszcYiIA5tLA+s4Uz7xVqsS4wm1snge0Qmqp9VqIWSD9nC
	hm9itItTRvActTkHKK5/CIJ892faj6dIBPsjX/LGg==
X-ME-Proxy: <xmx:h5QgW-UKtWJ6gfTcTDA1KQk8klPdkzmRM8W-frwgwnVkDGmqdpSSng>
X-ME-Proxy: <xmx:h5QgW_--DeujgRpkIqm6Tq0D2HlyvcrvRuFHYD9WprRDnzz4M7WxUA>
X-ME-Proxy: <xmx:h5QgW-1uq3aDPIdkMluiCmvajdRcfguXy9cEZpcF7hsX5rQg7ipXZA>
X-ME-Proxy: <xmx:h5QgW6e6Y3kzyTQUWEISmDuKMWD0NoBEA2c1skCZrQQ9Vu_-SdM3xw>
X-ME-Proxy: <xmx:h5QgWwACPzwgBdfL99zfR6gFDi5WoKSpx3xq6ECSfEB0a2czOZ8YPA>
X-ME-Proxy: <xmx:h5QgWxasdJ2fSUXmm-RjyiJRlWccPsnsRPUsvVrC2doeisxG8xn4Rw>
X-ME-Sender: <xms:h5QgWyorTA_Ui7xidDAPU72KsxJekTAs2j4dH4or7MEt_K1ftx0QNQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id ED7B2102A2;
	Tue, 12 Jun 2018 23:50:30 -0400 (EDT)
Date: Tue, 12 Jun 2018 23:50:30 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
Cc: mjt@tls.msk.ru, laurent@vivier.eu, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Message-ID: <20180613035030.GB25430@flamenco>
References: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tracing.txt: add missing
 '-' for trace option
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
X-List-Received-Date: Wed, 13 Jun 2018 03:50:40 -0000

On Tue, Jun 12, 2018 at 23:15:49 -0400, Yaowei Bai wrote:
> Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
> ---
>  docs/devel/tracing.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
> index 07abbb3..6ab32cc 100644
> --- a/docs/devel/tracing.txt
> +++ b/docs/devel/tracing.txt
> @@ -18,7 +18,7 @@ for debugging, profiling, and observing execution.
>  
>  3. Run the virtual machine to produce a trace file:
>  
> -    qemu -trace events=/tmp/events ... # your normal QEMU invocation
> +    qemu --trace events=/tmp/events ... # your normal QEMU invocation

The second dash is not missing; both '-args' and '--args' work.

'-args' seems to be favoured though; see `qemu -h' or `qemu --h' :-)

		Emilio

