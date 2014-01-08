Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0l7X-0003d3-0e
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2014 23:51:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1W0l7N-0003Nm-22
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 23:51:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1W0l7E-0006Cb-Ko
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 23:51:48 -0500
Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e]:35175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1W0l6u-0005q5-Oz; Tue, 07 Jan 2014 23:51:21 -0500
Received: by mail-ea0-f174.google.com with SMTP id b10so559846eae.33
	for <multiple recipients>; Tue, 07 Jan 2014 20:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V7lEC0FMI4Gq25bz6cD1We/5H8QjdjEYPHT4iwZf1MM=;
	b=SWJcbP1/MwoahwKxz/3sYR3aGkfBtvxb+dYWRfs8oFU+vxgWaU2dAyGGLqLXJ0Hpe9
	TLGCyeWAPW4nLSK2AL+QMTrBNuW/EipKIjIUOew3nXnV1H/Sqe5KZfRshgQzi7Urxkvk
	DU+Akqqb+we8OopsB3iJHYdaNJrirBy8FjYRTFc2nj/94BEM4sZduRnMdYGfWnQheLm5
	wIvefb6mflST/gduhEBuNhTwwQqrfYWBnZsHJ5z3s70F68N0arp1uFBu9vre652EpPg3
	2dYsblVY30TifAOpCmWBibD6Nkxx7z7ULLfkD5K4JbuOOA3MKjtvDR/dhkRX/nlUjCov
	w5cA==
X-Received: by 10.14.251.132 with SMTP id b4mr24883997ees.78.1389156677660;
	Tue, 07 Jan 2014 20:51:17 -0800 (PST)
Received: from localhost (1-64-176-197.static.netvigator.com. [1.64.176.197])
	by mx.google.com with ESMTPSA id
	m1sm185690689eeg.0.2014.01.07.20.51.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 20:51:16 -0800 (PST)
Date: Wed, 8 Jan 2014 12:51:05 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Namhyung Kim <namhyung@gmail.com>
Message-ID: <20140108045105.GH30570@stefanha-thinkpad.redhat.com>
References: <1389053065-7578-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389053065-7578-1-git-send-email-namhyung@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typo of tiemr in timer.h
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
X-List-Received-Date: Wed, 08 Jan 2014 04:51:57 -0000

On Tue, Jan 07, 2014 at 09:04:25AM +0900, Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> ---
>  include/qemu/timer.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

