Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQgKT-0005Z7-Hb
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 15:14:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cQgKS-0005Xn-4S
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 15:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cQgKR-0001Lv-Ax
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 15:14:04 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cQgKM-0001L7-RI; Mon, 09 Jan 2017 15:13:58 -0500
Received: by mail-lf0-x241.google.com with SMTP id q89so6677111lfi.1;
	Mon, 09 Jan 2017 12:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hp1Q2hpx0i+2KOhhPOXrBmG1gT5M4lDOXUg3ktKuD54=;
	b=Gu9/LFadILo3T3LUxrDSU0bhvPFGhRJNkxGJnD2h55Rntbt2SH+2gSK+fIUIRYOQRH
	gavQAELFSPm7o3pHbMRUIx9JQQC2BaNA7rwxwa1w9SY3FraNiybuXwWfiOeh/jM9JEj6
	LHITObsLPEzzO9YHSVmQp2aUbARlMXvp9QOWsu/mthINLgQvxXe8FwlJnSA8xxHqiQ32
	Qq8UA80le+oKknuUAjJtz0BnIV2dPJSyZ/sWIUmxMIQMuuCA7Kby0lk3FXyOY5Hv25/3
	Jyg0oPXQzftDd6GP9z/TKTufM3di3602viXNbOcryz7terpn2fwik55iCLIthspT6qo2
	yyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hp1Q2hpx0i+2KOhhPOXrBmG1gT5M4lDOXUg3ktKuD54=;
	b=mRP9gWJ4/6czr9rydhn1aNQVY6RknEeMDUYdETbu9g3cltayFAlrDM1imSFlEoTeob
	yv+Qi5dbjpEHu8EhnFLMohzpRhuj8hHbon9VizAzJvOu0JWpPeDWVg6Y6nRs1GlmgWUi
	bL9N71DJTDzv8MCukWdrPuRqYov3LcpfVvBXe6dHEIRi4KSRY8EMO+DH+gEBbpV2FYC1
	Bb56wEbpEgOrtBUXDnlDxFcF/fKKrup8gqLspTvNKjtU1TCey3hP2T/NrGTdF89YxPxd
	hmC7yFlE2Pp28lDZKML4kfCECMVX5pkVkLh2V1eMMHI9+iVjMYbpq1ipm2GWPBUEOTRa
	aQGQ==
X-Gm-Message-State: AIkVDXInQUrNLhwrqtTX17jMFAHO8MEwZ0HVw1eLwKKVM3pmgfRRKz4K4FaedBqu3B3iVA==
X-Received: by 10.25.8.6 with SMTP id 6mr24676853lfi.48.1483992836075;
	Mon, 09 Jan 2017 12:13:56 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	z26sm21835527lja.49.2017.01.09.12.13.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jan 2017 12:13:55 -0800 (PST)
Date: Mon, 9 Jan 2017 21:13:54 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org
Message-ID: <20170109201354.GV9606@toto>
References: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [PATCH] disas/cris.c: Fix Coverity warning about
 unchecked NULL
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
X-List-Received-Date: Mon, 09 Jan 2017 20:14:05 -0000

On Mon, Jan 09, 2017 at 07:05:59PM +0000, Peter Maydell wrote:
> Coverity (CID 1005689) warns that we don't check that
> spec_reg_info() returned non-NULL before dereferencing.
> Add the check, though as the comment notes this is
> a can't-really-happen case because the earlier constraint
> matching should have ruled out the "unknown reg" case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  disas/cris.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/cris.c b/disas/cris.c
> index 08161d1..8a1daf9 100644
> --- a/disas/cris.c
> +++ b/disas/cris.c
> @@ -2490,7 +2490,7 @@ print_with_operands (const struct cris_opcode *opcodep,
>  	const struct cris_spec_reg *sregp
>  	  = spec_reg_info ((insn >> 12) & 15, disdata->distype);
>  
> -	if (sregp->name == NULL)
> +	if (sregp == NULL || sregp->name == NULL)
>  	  /* Should have been caught as a non-match earlier.  */
>  	  *tp++ = '?';
>  	else
> -- 
> 2.7.4
> 

