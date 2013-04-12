Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcHc-000826-9N
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:36:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcHY-0007xz-RV
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcHX-0003JR-2W
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:36:40 -0400
Received: from mail-wg0-f52.google.com ([74.125.82.52]:51857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcHR-000390-Qf; Fri, 12 Apr 2013 07:36:34 -0400
Received: by mail-wg0-f52.google.com with SMTP id n12so2598667wgh.19
	for <multiple recipients>; Fri, 12 Apr 2013 04:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Q4/8PvkMQs2KW9oCS+A94KXW9XZjpAk1LGGLRruzX4I=;
	b=cTNI4RFSuIAhSVQxvTyflWbYzc7Ij8bAeqgsSju7Sp6fJa1DA5mZwTVJr+JMZo7t3g
	EX8bWIjMLgstLNu3p9M2elzNqwW+8Kj4Q46nXfr4U/XGOefXgHo9CmCLUqP/11oJMMo3
	AkhWWJTqx1NX1lqOsmKF5GR9ssACFf2QCv8UlOPIx2ioay65KXrwq54XkkDzT50I4cHi
	CFDVXtIKxj2WeWDQcL06RVnIHIkuSEGBXmNZEeE1hjK533KpEGY287kCDJyxDGZDrLw2
	5AjDwCl9oX/PLitAmXvhDFgjPMXYEz4h7zcU7kqKu2Dg9crGNXjC3HwKyDTJs6Za43ne
	rb/w==
X-Received: by 10.194.88.138 with SMTP id bg10mr16998688wjb.13.1365766593031; 
	Fri, 12 Apr 2013 04:36:33 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id ej8sm2749819wib.9.2013.04.12.04.36.31
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:36:32 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:36:30 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Message-ID: <20130412113630.GE9747@stefanha-thinkpad.redhat.com>
References: <1365445570-112217-1-git-send-email-petar.jovanovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365445570-112217-1-git-send-email-petar.jovanovic@rt-rk.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.52
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] linux-user: pass correct host flags to
 eventfd2 call
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
X-List-Received-Date: Fri, 12 Apr 2013 11:36:42 -0000

On Mon, Apr 08, 2013 at 08:26:10PM +0200, Petar Jovanovic wrote:
> This change makes conversion of TARGET_O_NONBLOCK and TARGET_O_CLOEXEC flags
> to host flags before calling eventfd for TARGET_NR_eventfd2.
> 
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
> ---
>  linux-user/syscall.c |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

