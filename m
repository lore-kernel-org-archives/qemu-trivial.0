Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL9Cr-0003ra-19
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 05:33:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9Co-0003nl-3J
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:33:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9Cm-00051s-P1
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:33:10 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:43787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UL9Cj-0004uj-IP; Thu, 28 Mar 2013 05:33:05 -0400
Received: by mail-wi0-f176.google.com with SMTP id hm14so3110639wib.9
	for <multiple recipients>; Thu, 28 Mar 2013 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=C6wWAvxHIYmQSaKrBY+ifBzorTyPPpFSySpRXCt9eOg=;
	b=kb8cCAaj821FOhbPj3P5+Xjg71RvQGpcYCxaTQ8EYH529n/6G7n5bMPB9OBMCwNV0C
	fVKdUpLTHShUJf2M5sD6c05MW/U/ZJ+t+rBPJi8ODXGYOW3mzIuBAUsA8QSk95SLw2Eh
	vdoYl2B4owmXEeNsopOTfqF44P+1TU3hmUM3KaBe4X1njhhewKSzRGJwQT5DW7q94cDB
	CkubtwAFi9RA8fRNrw2Mfy5fnYvn1cIMqDmNOLT7dlASa9YWI8geaA4FqKo9oT765uKF
	hK6ZAmlcIPjPU3/QOTs3pbyWbAq4dm/sr8hHscSDRWYQuswq1W812QcO+78wO2W1cOQB
	bxOg==
X-Received: by 10.194.10.129 with SMTP id i1mr24582211wjb.21.1364463184773;
	Thu, 28 Mar 2013 02:33:04 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id bq19sm13953129wib.7.2013.03.28.02.33.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 02:33:04 -0700 (PDT)
Date: Thu, 28 Mar 2013 10:33:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130328093302.GC24910@stefanha-thinkpad.redhat.com>
References: <1364301309-9414-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364301309-9414-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/tcx: Remove unused 'addr' field and
 the property that sets it
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
X-List-Received-Date: Thu, 28 Mar 2013 09:33:12 -0000

On Tue, Mar 26, 2013 at 12:35:09PM +0000, Peter Maydell wrote:
> Remove the 'addr' field from TCXState (since it is completely unused),
> also the qdev property which sets it. This seems to be a relic from
> many years past; devices don't need to know where they are mapped.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Random minor cleanup, but I'm hoping we might be able to get rid of
> the 'taddr' properties altogether; there aren't very many of them...
> 
>  hw/sparc/sun4m.c |    1 -
>  hw/tcx.c         |    2 --
>  2 files changed, 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

