Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1XYk-0004vh-A9
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 09:30:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1h1XYe-0004ov-MN
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 09:30:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1h1XYd-000416-Vd
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 09:30:08 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41245)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
	id 1h1XYd-0003zt-Gq
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 09:30:07 -0500
Received: by mail-qt1-x832.google.com with SMTP id v10so12983287qtp.8
	for <qemu-trivial@nongnu.org>; Wed, 06 Mar 2019 06:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oberlin-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Owbys8KNDkSgdqTmZCSWi+rg7yyDQQRS9RMB4O1MZjA=;
	b=AJDKGaYwQAlfQp5BL96++SPUs/2KLo0PgP6ISZ6eCrkFs9UIxIfmEHB0xj+xo01vSf
	BJ7zc9hgvTD6CJadifgfPuVSR94aZ69meIiTig51VV5Gl49dOXwdrJDLAGLRJZKFTM3/
	U/Unf5y0eYaQxw/9BGkLnTdbnBufXFBxfTFg3uBopTYcAVevENSTkb7om+GxwAfj2RUy
	ukEg2cRRiH6RWYPMard6WszRB9uRyIQgbd8LmYUY19ISmUKroQ1p1gXolC75Kx2WXysa
	yUtMf3iD1GIThth2bzcIrX/P5B7pLJ+5cqKxmGTEIf5jwjtONCjAaQgfLhItPwgsy346
	WA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Owbys8KNDkSgdqTmZCSWi+rg7yyDQQRS9RMB4O1MZjA=;
	b=ijug8FrG48rSr5+xrD5ebWQP5PdfI4E6hAdIwj9EH31QBjhan1nh+hJv4fcKhlQpuj
	vgeeOx14DI8wb2ge2r+mlUV75vTC1SpIa+dZPS47lvow/nMshZd9LCc/uFTka6960AFG
	5TruuB3v8ZKml7FGFfOTPSv+s3KbMTVtojUFog59WwfaoNhKQGNr74VFubi3RA5C1/aL
	IqCNuOIORDNLTf9RaDtaKFALtiWyZ3oB8QduGX1dREOfNomFU1nnp2ngJL8xAhYd9QVa
	wD+17XXNw+0lbtc6QP8flmodWCl2bbQOKI0zBxZmlNzHsUE3diTIPlVybPwEBBSz0oYR
	xdmA==
X-Gm-Message-State: APjAAAXxcUck3f3ZvAhBoKXZ6ACKc00EwchDSLEB9pqyLRLhF2mTP5U0
	FjY4gu6bGPs7oDUSR0q0Qcq61w==
X-Google-Smtp-Source: APXvYqxl9zLNaFsi4nW2JWwNrg3q1kHk8ouGV1Z6vI7U5nwXo+hPD4LhR3NEUcmRiMXVQezBiWEosA==
X-Received: by 2002:ac8:25d1:: with SMTP id f17mr5659197qtf.38.1551882605908; 
	Wed, 06 Mar 2019 06:30:05 -0800 (PST)
Received: from [192.168.1.103] (ip-210-181.oberlin.net. [208.66.210.181])
	by smtp.gmail.com with ESMTPSA id e6sm875879qkb.77.2019.03.06.06.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 06:30:04 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <f08e6be0-68c5-a7fe-8877-7dad0eb5929d@vivier.eu>
Date: Wed, 6 Mar 2019 09:30:03 -0500
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Max Reitz <mreitz@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <290F879D-78DA-48B1-9246-4DB75DC3886D@oberlin.edu>
References: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
	<f08e6be0-68c5-a7fe-8877-7dad0eb5929d@vivier.eu>
To: Laurent Vivier <laurent@vivier.eu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::832
Subject: Re: [Qemu-trivial] [PATCH] block/pflash_cfi02: Fix memory leak and
 potential use-after-free
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
X-List-Received-Date: Wed, 06 Mar 2019 14:30:13 -0000



> On Mar 6, 2019, at 04:38, Laurent Vivier <laurent@vivier.eu> wrote:
> 
> Applied to my trivial-patches branch.

Great, thanks!

Cheers,

Steve

