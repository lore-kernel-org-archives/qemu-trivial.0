Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCGjw-0004pG-3P
	for mharc-qemu-trivial@gnu.org; Tue, 19 Apr 2011 15:37:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCGju-0004nq-Ps
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 15:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCGjt-00021T-TL
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 15:37:34 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:34045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QCGjr-00020x-TS; Tue, 19 Apr 2011 15:37:32 -0400
Received: by vws17 with SMTP id 17so35059vws.4
	for <multiple recipients>; Tue, 19 Apr 2011 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cwjZ01k/Ei7pHsccKRJzXa/E3thJbLnmx9mKUVVHZY0=;
	b=MztT1Jv//TGBJRuyjuP30dbTcm2EJGsQVwiljj6MIhtSenxEVlVZCxn14ZygcyCKI5
	Fp3r8wcjD+SwgepjzRol74+FvYM2XyugcITTWaoPKolB9o6GpN3fjm4Ndf8ZxL0fksYs
	IndCZswsmnRQQmd/2BwTSOS65FuTcLZ4Xfr5Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=hFtc/jiFCv7zBzJdtTI0A44QdjeFKdEdok4/lVLi8EyVo1TOqLAv8zgLEGRdIyXE4t
	HQ5uUK1BPReST/poeR+F/8kZD7gD/6mQUs/2HMY2UV76xxDbYf1CZVeUPny9Pw1p9Pz9
	xgz2/Ey8MavX4JLm2K71lnEBPa9xBdHWcfSkI=
Received: by 10.52.0.110 with SMTP id 14mr3500349vdd.67.1303241851145; Tue, 19
	Apr 2011 12:37:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.115.103 with HTTP; Tue, 19 Apr 2011 12:37:11 -0700 (PDT)
In-Reply-To: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Tue, 19 Apr 2011 22:37:11 +0300
Message-ID: <BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Make
 epoll_create1 test work around SPARC glibc bug
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2011 19:37:35 -0000

On Tue, Apr 19, 2011 at 11:57 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> Work around a SPARC glibc bug which caused the epoll_create1 configure
> test to wrongly claim that the function was present. Some versions of
> SPARC glibc provided the function in the library but didn't declare
> it in the include file; the result is that gcc warns about an implicit
> declaration but a link succeeds. So we build the configure test with
> -Werror to avoid the test passing but then a -Werror qemu build
> failing.

But then epoll would not be used. How about checking for the buggy
glibc and doing something similar to how Solaris madvise() problem is
handled in osdep.c? Both this and madvise() hack could be configure
time checks, though.

