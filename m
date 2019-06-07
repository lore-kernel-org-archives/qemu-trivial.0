Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZGZM-00078s-D7
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jun 2019 11:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55917)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1hZ5YT-0000aT-5t
 for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 23:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1hZ5YR-0004nE-T8
 for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 23:28:36 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42768)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lucienmp.qemu@gmail.com>)
 id 1hZ5YQ-0004ix-TK; Thu, 06 Jun 2019 23:28:35 -0400
Received: by mail-pg1-x544.google.com with SMTP id e6so379919pgd.9;
 Thu, 06 Jun 2019 20:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wvfTEi6MWh5ZptHrzsO5+RfC2vsLZDoHxbRpf2T/6Xw=;
 b=pUMDk1UXCLrorkTKF3MyTZlqXsyOPCvSyVQgYRPebUKn/mEN1qmMnyZB/BQ6WzLoXJ
 /uenrci0rP4Uz0ft1VnlHDXEwsIllkChnuTfkLXser1HIsKPmyfIWOKfWgL9DR4a1lcV
 6fxW1UdY7t8K1dVHc/mQGoYZM63LrxA6ZxEWGnX2yzt+NucXU4G5yApJMSU6cWsRIfPw
 lRjAGms7VLoXaXiYOfGW2TlQTSOB3KQJycJA5BV/daesyrWxecEjn/JJMTMrnkQTVnig
 xtwDkONEkTAJJyS+lqN2QgAEfyF5iv7VKiMv5IAegIZUSF6Zf7Kw+x3MP3kPFThGUWBs
 BbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wvfTEi6MWh5ZptHrzsO5+RfC2vsLZDoHxbRpf2T/6Xw=;
 b=rKbfJHInOHW6q2qcE85zRfZPTVjohhvyvngT30F4GGrDwNNiGDDh9xiWXMetWdBHG+
 GCotMmRDPCTW9V6jh4r2MBPjrvfHNPHxeySpD1DuzyXDTvasQ4/fZkexGY/4aOunDfnl
 jFZdx0FMoBh2bMkMx9YRh3z6D7r0j35RfrM4PCCPq6XwLogn25SDTnP9B7n/o1kBR6YA
 ueyBH7itPkEtnFnLQcWUX3yGeQTvKOJj55slOB3OZy9/gQStqzGGERNRTc5CRwejI49q
 7ZhFNcYREeMcv61DEUCeziLLrbclgbpbut0wBO95/KkMJrUG5BX69/6nOut73+TNO5bZ
 Dg0g==
X-Gm-Message-State: APjAAAXorKLsS/2CLOqw2a+vmPdS3iSwzHOWKFbKGOEWg+fR5TFDqAGe
 ua22QW6x8bqdPZg94x1TKwQ=
X-Google-Smtp-Source: APXvYqw45daic3sH9B1u63zNbhZYxqEb8CHP8ykypVeqG4TSatur1i0DqUcGBjEb8deAnBE35zZi+Q==
X-Received: by 2002:a62:2643:: with SMTP id m64mr54794350pfm.46.1559878113522; 
 Thu, 06 Jun 2019 20:28:33 -0700 (PDT)
Received: from localhost.localdomain (sp183-74-192-44.msb.spmode.ne.jp.
 [183.74.192.44])
 by smtp.gmail.com with ESMTPSA id s24sm548820pfh.133.2019.06.06.20.28.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 20:28:33 -0700 (PDT)
Date: Fri, 7 Jun 2019 12:28:26 +0900
From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Message-ID: <20190607032825.GA5123@localhost.localdomain>
References: <20190606234125.GA4830@localhost.localdomain>
 <CAL1e-=i7WfrHq7k266grEs1xyf_FKVG_4JcvCbrrSZt66c4ftQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL1e-=i7WfrHq7k266grEs1xyf_FKVG_4JcvCbrrSZt66c4ftQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-Mailman-Approved-At: Fri, 07 Jun 2019 11:14:15 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] m68k comments break
 patch submission due to being incorrectly formatted
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
X-List-Received-Date: Fri, 07 Jun 2019 03:28:38 -0000

On Fri, Jun 07, 2019 at 01:58:05AM +0200, Aleksandar Markovic wrote:
> On Jun 7, 2019 1:42 AM, "Lucien Murray-Pitts" <lucienmp.qemu@gmail.com>
> wrote:
> >
> > Altering all comments in target/m68k to match Qemu coding styles so that
> future
> > patches wont fail due to style breaches.
> >
> 
> Are you saying that patches fail checkpatch checks even if the new code has
> only correct comment format? (Or, in other words, that checkpatch detects
> comment-related errors in  unchanged code, and reports them as the
> errors/warnings in the patch in question?) I just want to understand what
> is the obstacle you are trying to remove.
> 
> Thanks, Aleksandar
> 
[SNIP of PATCH]

checkpatch is correctly identifying the wrong style in the changed code.
This changed code contains the original comments with ADDITIONAL edits
resulting in pachew/checkpatch complaining.

The m68k is, by my guess, older code and nearly all the comments are different
from the style guide.  Some are "/**" or "/*commment here...." and so on.

Since I had a patch AUTO-FLAGGED by patchew for this reason I thought I would
start with a cleanup of the comments to bring them into line with the style.

Cheers,
Luc



