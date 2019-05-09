Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOjjG-0007OP-1b
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 10:08:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOjj9-0007ML-IQ
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:08:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOjj5-0008Di-R9
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:08:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hOjj3-0008CZ-PI
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:08:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id r4so3235674wro.10
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 07:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oCgS1eH188Q5DGWyoi9EZ3m3kTi0+OF0meINDLHBpTc=;
	b=hzClZGoYpvQof43uI/+BEroruWywoFnHzIT7EY4gC28j4Oc+c8uTdSUZJrZ1qBqXbu
	VEKk6cbMCCdNT1pYJoaLRpVIZqsH5tsOCafSfvUI5Sfo9bttSSeKYVFi5GKqXJwndApz
	wD49DfuR/bytk4fEgD6VqZiSwpIxJK5n40/BOvA7f3StFSRCj32H9jY8IdQvZP2TQfMG
	toz2B+ZTzDzi7YVnKJx5ackfCZd6gLbvzQS3nW+uilRiqqxsl+EEy9e2qVC0UKGeyoyl
	DCw2YKFMeNfkh7plzq0lofWH02BGkoQmYwGvb96hchPFtmf1jyTkiTElUVS/AFC/Efog
	Ri5A==
X-Gm-Message-State: APjAAAWHjgSELkLLqpCbYz3JAHSZYv7zaJgtjzVG3IQtoNjxEqQugUIc
	Ng2mYGCtllUJ62wEagBY+Oinvg==
X-Google-Smtp-Source: APXvYqx4RJTB3Tuj/ipNQMGsAOU+ZEe4/1z67vMK7T6BUqA53Zjjphs6hOuJ7npOkWKCy/GkA7cl+g==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr3191860wrq.86.1557410923162;
	Thu, 09 May 2019 07:08:43 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	v23sm1427455wmj.43.2019.05.09.07.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 07:08:42 -0700 (PDT)
Date: Thu, 9 May 2019 16:08:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: sathnaga@linux.vnet.ibm.com
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	clg@kaod.org, david@gibson.dropbear.id.au
Message-ID: <20190509140840.oawbvmouw3x2wdok@steredhat>
References: <20190509080750.21999-1-sathnaga@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509080750.21999-1-sathnaga@linux.vnet.ibm.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typo on "info pic"
 monitor cmd output for xive
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
X-List-Received-Date: Thu, 09 May 2019 14:08:56 -0000

On Thu, May 09, 2019 at 01:37:50PM +0530, sathnaga@linux.vnet.ibm.com wrote:
> From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> 
> Instead of LISN i.e "Logical Interrupt Source Number" as per
> Xive PAPR document "info pic" prints as LSIN, let's fix it.
> 
> Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> ---
>  hw/intc/spapr_xive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

CCing qemu-trivial

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

