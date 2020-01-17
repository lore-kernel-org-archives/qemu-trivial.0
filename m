Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isSPb-0007Gm-1d
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2020 09:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leif@nuviainc.com>) id 1isRVm-00039a-HO
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 08:18:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <leif@nuviainc.com>) id 1isRVl-00026f-8T
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 08:18:06 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <leif@nuviainc.com>) id 1isRVk-00024G-R8
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 08:18:05 -0500
Received: by mail-wm1-x342.google.com with SMTP id 20so7589180wmj.4
 for <qemu-trivial@nongnu.org>; Fri, 17 Jan 2020 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=KpZ3QLKUbQJ0Z3RVINWucb9Ndt3JDsMoblKjT9M/9xA=;
 b=S/mxOHEormBkphE4gQVdY3OX/KaVy/+i1P3gpd1rJKWGtxnz18jzsh4lIjEtadcZkn
 jZgwdL1xocWEfYj4B/ISgXwo7SBA0ZNW3mJRG33L84OoHQnOP85CJijBqGnr/1gmhwFC
 rY5rCiJpdhmRNip7fH+La69ZGwxRUfL6830ZYQM/nV1Hn5wV8XZsqvZptRyd34QArBPG
 tP7NW7/3+1jIOVnja7QtqBS7tw1RxC90IMccEmxp6h3inrbuBwR8te2If+KgNaoVox7W
 S8A/49I5lw61IdVxDzBnuQKpLf31QAhS1FvcTP17jV8ND3RdNANN4he8WqPbMJzGq2eH
 Pqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KpZ3QLKUbQJ0Z3RVINWucb9Ndt3JDsMoblKjT9M/9xA=;
 b=TFNGlCChjH/4Htdep52TfNyEZblYAWqd/t52k0dvf76UaIiOCbBQteRcpGPq/wjCFo
 7++sTD5XCSnA380o/koyzVZRzAWkGQLPaUqbczGjWFETfIBlZbxc6TSkJI+QOEvTSYs8
 bv56eVW62c/RPzVeKyzDywGW/SuKjiQWd05Bo0eDhgtmQzSFuxJUP9N77QKPINKEzNoC
 5eGBFL1uoBRXWFVrduyoax78vv+Qnq3kJeX0rh40+MDSBG0+PoHz0qgFD3+bZSyJijRc
 7Do6wMiayk0X25hd0+wQZpGT1kojqmW+DY6OojeC+QjblpG8oADe6wFKEPUo7ztjFjRO
 yX5w==
X-Gm-Message-State: APjAAAXFPi4AAUAuxBdmJnk8QG19RaGnxqVPCRi16mZMvxcKBYCVrBYW
 74ZVALIaJx/5umm/rfnC0JeTmw==
X-Google-Smtp-Source: APXvYqxP6ogyZEM4spiJJH3kHcGuQ5hKm2NpfgskB7SMQO7rdL0xqW/uPSzBtdoOjBV5V9vMVWAusA==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr4498500wmj.168.1579267083496; 
 Fri, 17 Jan 2020 05:18:03 -0800 (PST)
Received: from bivouac.eciton.net (bivouac.eciton.net.
 [2a00:1098:0:86:1000:23:0:2])
 by smtp.gmail.com with ESMTPSA id a9sm7986389wmm.15.2020.01.17.05.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 05:18:02 -0800 (PST)
Date: Fri, 17 Jan 2020 13:18:01 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [EXTERNAL] Re: [PATCH] MAINTAINERS: update Leif Lindholm's address
Message-ID: <20200117131801.GI15141@bivouac.eciton.net>
References: <20200116174226.4780-1-leif@nuviainc.com>
 <a2fc8a4f-0b56-7868-0e52-51c2abfd97f7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2fc8a4f-0b56-7868-0e52-51c2abfd97f7@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-Mailman-Approved-At: Fri, 17 Jan 2020 09:15:45 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2020 13:18:08 -0000

On Thu, Jan 16, 2020 at 19:25:52 +0100, Philippe Mathieu-Daudé wrote:
> On 1/16/20 6:42 PM, Leif Lindholm wrote:
> > Update address to reflect new employer.
> > 
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 483edfbc0b..3c8653f26f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -735,7 +735,7 @@ F: include/hw/ssi/imx_spi.h
> >   SBSA-REF
> >   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> >   M: Peter Maydell <peter.maydell@linaro.org>
> > -R: Leif Lindholm <leif.lindholm@linaro.org>
> > +R: Leif Lindholm <leif@nuviainc.com>
> >   L: qemu-arm@nongnu.org
> >   S: Maintained
> >   F: hw/arm/sbsa-ref.c
> > 
> 
> You might want to add yourself a .mailmap entry too:
> 
> -- >8 --
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..a521c17b44 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -44,6 +44,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com>
> <aleksandar.markovic@imgtec.com>
>  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori
> <aliguori@us.ibm.com>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> +Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> ---

If that use of .mailmap is common for QEMU, that sounds like a good
idea. And the comment for that section of the file indeed suggests so,
so thanks!

> 
> If you ack this snippet maybe a maintainer is willing to amend it to your
> patch :)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Leif Lindholm <leif@nuviainc.com>
(The other guy agrees.)

